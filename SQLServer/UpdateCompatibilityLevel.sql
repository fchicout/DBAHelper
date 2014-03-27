
DECLARE @NEWEST_VERSION INT
DECLARE @CURRENT_VERSION INT

SET @NEWEST_VERSION=(SELECT d.compatibility_level FROM sys.databases d
WHERE d.name = 'master');

SET @CURRENT_VERSION=(SELECT d.compatibility_level FROM sys.databases d
WHERE d.name = 'bossDataBase');

IF @CURRENT_VERSION < @NEWEST_VERSION 
BEGIN
	ALTER DATABASE bossDataBase SET SINGLE_USER
	ALTER DATABASE bossDataBase SET COMPATIBILITY_LEVEL=CONVERT(INT, @NEWEST_VERSION)
	ALTER DATABASE bossDataBase SET MULTI_USER
	PRINT 'Procedimento Realizado.';
END
ELSE
BEGIN
	PRINT 'Procedimento não realizado. Base de dados já atualizada'
END