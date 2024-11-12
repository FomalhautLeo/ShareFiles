#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RANDOM_NUMBER=$(( (RANDOM % 1000) + 1 ))

echo "Enter your username:"
read NAME

SELECT_RESULT=$($PSQL "SELECT times, best FROM users WHERE name='$NAME'")

if [[ -z $SELECT_RESULT ]]
then
  echo "Welcome, $NAME! It looks like this is your first time here."
  TIMES=0
  BEST=999999
else
  IFS="|" read TIMES BEST <<< "$SELECT_RESULT"
  echo "Welcome back, $NAME! You have played $TIMES games, and your best game took $BEST guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read INPUT

ROUND=1
while [[ $INPUT != $RANDOM_NUMBER ]]
do
  if [[ ! $INPUT =~ [0-9]+ ]]
  then
    echo "That is not an integer, guess again:"
  else
    let ROUND++
    if [[ $INPUT -lt $RANDOM_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $INPUT -gt $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    fi
  fi
  read INPUT
done
echo "You guessed it in $ROUND tries. The secret number was $RANDOM_NUMBER. Nice job!"

let TIMES++
if [[ $ROUND -lt $BEST ]]
then
  BEST=$ROUND
fi

RESULT=$($PSQL "INSERT INTO users (name) VALUES ('$NAME')")
RESULT=$($PSQL "UPDATE users SET times=$TIMES, best=$BEST")