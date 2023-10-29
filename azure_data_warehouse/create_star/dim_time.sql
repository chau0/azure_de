IF OBJECT_ID('dbo.dim_time') IS NOT NULL
BEGIN
     DROP EXTERNAL TABLE dbo.dim_time;
END
GO

CREATE EXTERNAL TABLE dbo.dim_date (
        [date_key] int,
        [date_value] DATE NOT NULL,
        [day_of_week] int,
        [day_of_month] int,
        [week_of_year] int,
        [quarter] int,
        [month] int,
        [year] int
    )
    WITH (
        LOCATION='/path/to/your/folder/',
        DATA_SOURCE=MyAzureStorage,
        FILE_FORMAT=TEXTFILE
    );
GO

-- Populate the external table
DECLARE @StartDate DATE = '2000-01-01';
DECLARE @EndDate DATE = '2050-12-31';

WHILE @StartDate <= @EndDate
BEGIN
    INSERT intO dbo.dim_date (date_key, date_value, day_of_week, day_of_month, week_of_year, quarter, month, year)
    VALUES (
        CONVERT(int, REPLACE(CONVERT(VARCHAR, @StartDate, 112), '-', '')), -- YYYYMMDD format
        @StartDate,
        DATEPART(WEEKDAY, @StartDate),
        DATEPART(DAY, @StartDate),
        DATEPART(WEEK, @StartDate),
        DATEPART(QUARTER, @StartDate),
        DATEPART(MONTH, @StartDate),
        DATEPART(YEAR, @StartDate)
    );

    SET @StartDate = DATEADD(day, 1, @StartDate);
END
GO