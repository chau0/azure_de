

IF OBJECT_ID('dbo.dim_rider') IS NOT NULL
BEGIN
     DROP EXTERNAL TABLE dbo.fact_payment;
END
-- Create dim_rider table
CREATE EXTERNAL TABLE dbo.dim_rider 
WITH
( 
	LOCATION = 'dim_rider',
    DATA_SOURCE = [syanpse_udadls_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
)
AS
SELECT 
    [rider_id]
    ,[first]
    ,[last]
    ,[address]
    ,[birthday]
    ,[account_start_date]
    ,[account_end_date]
    ,[is_member]
FROM staging_rider;

-- Verify the output
SELECT TOP 10 * FROM dbo.dim_rider;
