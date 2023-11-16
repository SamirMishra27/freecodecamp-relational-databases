#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=freecodecamp --dbname=worldcuptest -t --no-align -c"
  # PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Script to insert data from games into the worldcup database

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Ignore first line of csv

  if [[ $YEAR == year ]]
  then
    continue
  else
    # Get winner team id from teams table
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")

    # If team id not found then create this team's data
    if [[ -z $WINNER_ID ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER');")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER

        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
      fi
    fi

    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")

    # If team id not found then create this team's data
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT');")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT

        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
      fi
    fi

    INSERT_MATCHES_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")
    if [[ $INSERT_MATCHES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into games match of $WINNER vs $OPPONENT
    fi
  fi
done
# End of script