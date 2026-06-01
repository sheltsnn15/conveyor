USE master;
-- If database already exists, force-close connections
IF DB_ID('AdventureWorks2022') IS NOT NULL BEGIN ALTER DATABASE AdventureWorks2022
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
END;
-- Restore the database
RESTORE DATABASE AdventureWorks2022
FROM DISK = '/var/opt/mssql/backup/AdventureWorks2022.bak' WITH MOVE 'AdventureWorks2022' TO '/var/opt/mssql/data/AdventureWorks2022.mdf',
	MOVE 'AdventureWorks2022_log' TO '/var/opt/mssql/data/AdventureWorks2022_log.ldf',
	REPLACE,
	STATS = 5;
-- Set database back to multi-user mode
ALTER DATABASE AdventureWorks2022
SET MULTI_USER;
