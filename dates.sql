-- postgres uses ISO-8601 for dates
-- YYYY-MM-DDTHH:MM:SS
--2017-08-17T12:47:16+02:00
--! Not giving timezone for somthing it will assume it is in UTC
ALTER USER postgres SET timezone= 'UTC';

SHOW timezone;

CREATE TABLE timezones (
    ts TIMESTAMP WITHOUT TIME ZONE,
    tz TIMESTAMP WITH TIME ZONE
);

INSERT INTO timezones VALUES (
    TIMESTAMP WITHOUT TIME ZONE '2020-01-01 10:00:00-05',
    TIMESTAMP WITH TIME ZONE '2020-01-01 10:00:00-05'
);

SELECT CURRENT_DATE;
--CASTING date
SELECT to_char(CURRENT_DATE, 'dd/mm/yyyy' )

-- we must make sure that we cast to date
SELECT AGE(date '1800-01-01')

SELECT EXTRACT (DAY FROM date '1996-05-31') AS DAY -- 31

SELECT DATE_TRUNC('year', date '1999/5/31')

-- when you want to do mainuplation with date towards future ir the past , use interval
SELECT *
FROM orders 
WHERE orderdate <= now() - INTERVAL '30 days'

SELECT 
        EXTRACT (
            YEAR
            FROM 
                    INTERVAL '5 years 20 months'
        ); -- 6 