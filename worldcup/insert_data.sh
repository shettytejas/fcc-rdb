#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

echo "$($PSQL "TRUNCATE games, teams")"

tail -n +2 "./games.csv" | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")"

  if [[ -z $WINNER_ID ]]; then
    SAVED="$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")"

    if [[ $SAVED = 'INSERT 0 1' ]]; then
      WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")"
    fi
  fi

  OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")"

  if [[ -z $OPPONENT_ID ]]; then
    SAVED="$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")"

    if [[ $SAVED = 'INSERT 0 1' ]]; then
      OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")"
    fi
  fi

  SAVED="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")"
done
