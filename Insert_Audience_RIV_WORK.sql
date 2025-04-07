INSERT INTO audience_riv_work_20250407_1
SELECT 
    STRUCT(
        hashedEmail AS hashed_email_id,

        STRUCT(
        1 AS is_in_segment,
        current_timestamp AS segment_created_datetime
    ) AS riv_work_segment) AS _belgiantrain
FROM (


-- Read query

SELECT
    hashedEmail
FROM
    (
        SELECT
            _belgiantrain.Identification.hashed_email_id AS hashedEmail,
            timestamp
        FROM
            sales_information_dataset
        WHERE
            timestamp >= '2025-03-01'
            AND (
                (_belgiantrain."Source" IN ('API', 'PPSE')
                 AND _belgiantrain.ValidFrm BETWEEN DATE('2025-04-05') AND DATE('2025-04-20'))
                OR (
                    _belgiantrain.ValidTo >= '2025-03-06'
                    AND _belgiantrain.ValidPeriod IS NOT NULL
                    AND _belgiantrain.ValidPeriod <> ''
                    AND TRIM(_belgiantrain.ValidPeriod) <> ''
                    AND _belgiantrain.ProductId NOT IN ('ABO', 'CON', 'I0X', 'LUX', 'NCL', 'VIP')
                )
            )
            AND (
                -- Segment1
                ((_belgiantrain.DepStationId = '008895505'
                  AND _belgiantrain.DestinationStationId IN ('008892601', '008892692', '008892734', '008895232', '008895422', '008895430', '008895448', '008895455', '008896008', '008896230'))
                 OR (_belgiantrain.DepStationId IN ('008892601', '008892692', '008892734', '008895232', '008895422', '008895430', '008895448', '008895455', '008896008', '008896230')
                     AND _belgiantrain.DestinationStationId = '008895505'))
                OR
                -- Segment2
                ((_belgiantrain.DepStationId = '008895208'
                  AND _belgiantrain.DestinationStationId IN ('008811940', '008812005', '008813003', '008814001', '008895711', '008895729', '008895737', '008895745', '008895752', '008895760', '008895778', '008895802', '008895836', '008895844'))
                 OR (_belgiantrain.DepStationId IN ('008811940', '008812005', '008813003', '008814001', '008895711', '008895729', '008895737', '008895745', '008895752', '008895760', '008895778', '008895802', '008895836', '008895844')
                     AND _belgiantrain.DestinationStationId = '008895208'))
                OR
                -- Segment3
                (_belgiantrain.DepStationId IN ('008895877', '008895869', '008895851')
                 OR _belgiantrain.DestinationStationId IN ('008895877', '008895869', '008895851'))
                OR
                -- Segment4
                ((_belgiantrain.DepStationId IN ('008896008', '008896230', '008892734', '008892601', '008892692', '008895232', '008895422', '008895430', '008895448', '008895455')
                  AND _belgiantrain.DestinationStationId IN ('008895802', '008895844', '008895778', '008895760', '008895752', '008895745', '008895737', '008895729', '008895711', '008895836', '008811940', '008814001', '008813003', '008812005'))
                 OR (_belgiantrain.DepStationId IN ('008895802', '008895844', '008895778', '008895760', '008895752', '008895745', '008895737', '008895729', '008895711', '008895836', '008811940', '008814001', '008813003', '008812005')
                     AND _belgiantrain.DestinationStationId IN ('008896008', '008896230', '008892734', '008892601', '008892692', '008895232', '008895422', '008895430', '008895448', '008895455')))
            )
        ORDER BY
            timestamp DESC
    ) AS subquery
GROUP BY
    hashedEmail


        
);
