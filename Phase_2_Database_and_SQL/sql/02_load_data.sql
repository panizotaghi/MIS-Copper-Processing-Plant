/* Load the CSV files in ../data into the tables created by 01_schema.sql.
   Replace @path with the folder that contains the CSV files (SQL Server 2017+). */

DECLARE @path NVARCHAR(260) = N'C:\MIS_Project\Phase_2_Database_and_SQL\data\';
DECLARE @tables TABLE (seq INT, name SYSNAME);
INSERT INTO @tables VALUES
    (1, 'ProcessUnit'), (2, 'MaterialFlow'), (3, 'ShiftReport'), (4, 'ProductFlow'),
    (5, 'EnergyUsage'), (6, 'ChemicalAnalysis'), (7, 'RecoveryIndicators'),
    (8, 'WarehouseStock'), (9, 'ShiftStaff'), (10, 'Shipment');   -- parent tables first

DECLARE @name SYSNAME, @sql NVARCHAR(MAX);
DECLARE c CURSOR FOR SELECT name FROM @tables ORDER BY seq;
OPEN c;
FETCH NEXT FROM c INTO @name;
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @sql = N'BULK INSERT dbo.' + QUOTENAME(@name) + N' FROM ''' + @path + @name + N'.csv'''
             + N' WITH (FORMAT = ''CSV'', FIRSTROW = 2, CODEPAGE = ''65001'');';
    EXEC sp_executesql @sql;
    FETCH NEXT FROM c INTO @name;
END
CLOSE c;
DEALLOCATE c;
