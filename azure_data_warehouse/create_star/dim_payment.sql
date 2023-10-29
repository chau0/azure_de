--Create dim_payment table
IF OBJECT_ID('dbo.fact_payment') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE dbo.fact_payment;
END

CREATE EXTERNAL TABLE [dbo].[dim_payment] WITH(
    LOCATION = 'dim_payment',
    DATA_SOURCE = [syanpse_udadls_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
        [payment_id],    
        [rider_id],
        [amount],
        [date]
    FROM 
	    [dbo].[staging_payment]
);

Go
SELECT
    TOP 10*
FROM 
    [dbo].[dim_payment];
