#! /bin/bash

# This script generates password.

echo "I can generate Password for you"
echo "-------------------------------------"
read -p "Enter number of characters" LENGTH

#now generate the passwords

for i in $(seq 1 5)
do
	PASSWORD=$(< /dev/urandom tr -dc 'A-Za-z0-9_@#!$%*^' | head -c "$LENGTH" )
	#PASSWORD=$( openssl rand -base64 48 | head -c "$LENGTH")
	echo "$PASSWORD"
done

