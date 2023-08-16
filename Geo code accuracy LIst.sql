USE centegy_sndpro_uet

DECLARE @datefr date = '20230601'
DECLARE @dateto date = '20230630'
DECLARE @pjp varchar(4) = 'A006'
Declare @accuracy_radius int = 20

;WITH tio AS (
    SELECT DISTINCT 
        vs.RouteCode,
        ph.ldesc AS PJP_desc,
        c.CustomerCode,
        c.CustomerName,
        vs.SyncKey,
        jp.SequenceNumber AS 'Pseq',
        VisitSequence AS 'Aseq',
        VisitStartDateTime AS 'Start time',
        VisitEndDateTime AS 'end time',
        RIGHT(CONVERT(varchar(3),  DATEDIFF(SECOND, VisitStartDateTime, VisitEndDateTime) / 60), 2) + ' m ' +
            RIGHT('0' + CONVERT(varchar(2),  DATEDIFF(SECOND, VisitStartDateTime, VisitEndDateTime) % 60), 2) + ' s' AS 'TIO mm:ss',
        c.geocodeY AS 'Master Lat',
        c.GeoCodeX AS 'Master Long', 
        vs.StartGeoCodeY AS 'Act lat',
        vs.StartGeoCodeX AS 'Act long',
        ROUND(dbo.distance(vs.StartGeoCodeY, vs.StartGeoCodeX, c.GeoCodey, c.GeoCodeX), 0) AS 'distance(m)'
    FROM
        IG_O_VisitSummary vs
        INNER JOIN IG_I_Customer c ON c.CustomerCode = vs.CustomerCode
        INNER JOIN IG_I_JourneyPlan jp ON jp.JourneyPlanCode = vs.RouteCode AND vs.CustomerCode = jp.CustomerCode
        INNER JOIN PJP_HEAD ph ON ph.pjp = vs.RouteCode
    WHERE
        vs.ETL_DateTime BETWEEN @datefr AND DATEADD(d, 1, @dateto)
        --AND vs.RouteCode = @pjp    -- To filter by PJP uncomment this line
        AND vs.StartGeoCodeX IS NOT NULL
)
,diff AS (
    SELECT
        d.CustomerCode AS POP_CODE,
        MAX(d.[TIO mm:ss]) AS Max_TIO_mm_ss,
        ROUND(
            dbo.distance(
                MAX(d.[Master Lat]),
                MAX(d.[Master Long]),
                MAX(d.[Act lat]),
                MAX(d.[act long])
            ),
            2
        ) AS accuracy
    FROM
        tio d
    GROUP BY
        d.CustomerCode
)
SELECT
   PJP_desc, CustomerCode, t.CustomerName, SyncKey, [Act lat], [Act long], accuracy
FROM
    tio t
    INNER JOIN diff d ON d.POP_CODE = t.CustomerCode and t.[TIO mm:ss]=Max_TIO_mm_ss
where accuracy > @accuracy_radius
order by accuracy desc
