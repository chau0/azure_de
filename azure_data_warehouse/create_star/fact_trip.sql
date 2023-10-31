--Create fact_trip table
IF OBJECT_ID('dbo.fact_trip') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE dbo.fact_trip;
END

CREATE EXTERNAL TABLE dbo.fact_trip 
WITH
( 
    LOCATION = 'fact_trip',
    DATA_SOURCE = [syanpse_udadls_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
)
AS
SELECT 
    st.trip_id,
    st.rider_id,
    st.rideable_type
    st.start_station_id, 
    st.end_station_id, 
    st.start_at 
    st.ended_a
    st.rideable_type,
    DATEDIFF(hour, st.start_at, st.ended_at) AS duration,
    DATEDIFF(year, sr.birthday, st.start_at) AS rider_age
FROM 
    staging_trip st
JOIN staging_rider sr ON sr.rider_id = st.rider_id;

SELECT TOP 10 * FROM dbo.fact_trip;