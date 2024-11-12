#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  INPUT="$1"
  if [[ $INPUT =~ ^[0-9]+$ ]]
  then
    NUMBER="$INPUT"
  elif [[ $INPUT =~ ^[A-Z][a-z]?$ ]]
  then
    NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$INPUT'")
  else
    NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$INPUT'")
  fi
  SELECT_RESULT=$($PSQL "SELECT name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties LEFT JOIN elements USING (atomic_number) LEFT JOIN types USING (type_id) WHERE atomic_number=$NUMBER")
  if [[ -z $SELECT_RESULT ]]
  then
    echo "I could not find that element in the database."
  else
    IFS="|" read NAME SYMBOL TYPE MASS MELTING BOILING <<< $SELECT_RESULT
    echo  "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  fi
fi
