#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#
function check_and_insert {
  TEAM=$1
  TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM'")"
  if [[ -z $TEAM_ID ]]
  then
    # need to insert team
    INSERT_RESULT="$($PSQL "INSERT INTO teams (name) VALUES ('$TEAM')")"
    if [[ $INSERT_RESULT == "INSERT 0 1" ]]
    then
      TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM'")"
      echo Inserted team $TEAM with id: $TEAM_ID
    fi
  fi
  return $TEAM_ID
}

echo "$($PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY")"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR == year ]]
  then
    continue
  fi
  # get team id first
  check_and_insert "$WINNER"
  WINNER_ID=$?
  check_and_insert "$OPPONENT"
  OPPONENT_ID=$?
  # insert current game
  INSERT_RESULT="$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")"
  if [[ $INSERT_RESULT == "INSERT 0 1" ]]
  then
    echo "Inserted [$YEAR $ROUND $WINNER($WINNER_ID) $WINNER_GOALS : $OPPONENT_GOALS $OPPONENT($OPPONENT_ID)]"
  fi
done