SELECT
    _belgiantrain.Identification.hashed_email_id,
    _belgiantrain."Source",
    _belgiantrain.ValidFrm,
    _belgiantrain.ProductId,
    _belgiantrain.ValidTo,
    _belgiantrain.ValidPeriod,
    _belgiantrain.DepStationId,
    _belgiantrain.DestinationStationId
    
FROM
    sales_information_dataset
WHERE
    _belgiantrain.Identification.hashed_email_id = '4b4F5dQsP2SSgM2caTcC8UBmDciPR4jWXgyHJ+AGHbw='
    AND timestamp >= '2025-03-01'
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
