# kill all mysql connections from user

mysql> select concat('KILL ',id,';') from information_schema.processlist where user='<user>' and time > 5 into outfile '/tmp/kill.sql';
mysql> source /tmp/webdev.sql;
