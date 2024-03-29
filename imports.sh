

for entry in ./*.sql
do
  db=${entry%1900.sql*} # text befor 1900.sql
  db=${db##*-}		# text after last dash
  mysql --defaults-extra-file=./config.cnf -e "CREATE DATABASE backup_$db"
  mysql --defaults-extra-file=./config.cnf backup_$db < $entry
done
