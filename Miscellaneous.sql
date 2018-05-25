--Check the size of MySql Database Size

SELECT 
      table_schema                                            "DB Name", 
      ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) "DB Size in MB" 
FROM   
      information_schema.tables 
GROUP  BY 
      table_schema;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--Temporarly Disable all FK
Disable:-
SET FOREIGN_KEY_CHECKS=0;

Enable:-
SET FOREIGN_KEY_CHECKS=1;

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PERFORMANCE  Tuning:

https://www.youtube.com/watch?v=TPFibi2G_oo&t=20s

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
provide privilege in mysql 

GRANT ALL PRIVILEGES ON ccms.* TO 'ccms'@'%' identified by 'ccms@shangrila';

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

date format:
DATE_FORMAT(STR_TO_DATE(issue_date, '%d/%m/%Y'), '%Y-%m-%d')

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT 
SUBSTRING_INDEX(account_holder_name,' ',1) first_name,
SUBSTRING_INDEX(SUBSTRING_INDEX(account_holder_name,' ',2),' ',-1) middle_name,
SUBSTRING_INDEX(account_holder_name,' ',-1) last_name
FROM ccms_nmb.tbl_customer 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
xml backup of mysql:
mysqldump --xml --no-data -h localhost -u ccms_global -p  ccms_global > /root/ccmsTest

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--Restore MySql Database from Command Prompt

C:\Program Files\MySQL\MySQL Server 5.7\bin>mysql -u root -p ccms_global < d:\ccms_global.sql
Enter
Enter password: **********

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- restore mysql database

# mysql -u [username] –p[password] [database_name] < [dump_file.sql]


-- backup mysql database 
# mysqldump -u [username] –p[password] [database_name] > [dump_file.sql]
