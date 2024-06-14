DECLARE @COPYPJP VARCHAR(4) = 'AA01'  --copy from PJP here

-- Declare variables to store data fetched from the cursor
DECLARE @FetchedPJP VARCHAR(4)

-- Declare the cursor
DECLARE PjpCursor CURSOR FOR
SELECT pjp
FROM PJP_HEAD

-- Open the cursor
OPEN PjpCursor

-- Fetch the first row into the variable
FETCH NEXT FROM PjpCursor INTO @FetchedPJP

-- Loop through the cursor
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Insert into PJP_DETAIL for each PJP fetched from the cursor
    INSERT INTO PJP_DETAIL
    (COMPANY, DISTRIBUTOR, pjp, SELL_CATEGORY, SECTION, WEEK_NO, SAT, SUN, MON, TUE, WED, THU, FRI, REF_PJP)
    SELECT COMPANY, DISTRIBUTOR, @PJP, '001', SECTION, WEEK_NO, SAT, SUN, MON, TUE, WED, THU, FRI, @fetchedPJP
    FROM PJP_DETAIL
    WHERE pjp = @COPYPJP

    -- Fetch the next row into the variable
    FETCH NEXT FROM PjpCursor INTO @FetchedPJP
END

-- Close and deallocate the cursor
CLOSE PjpCursor
DEALLOCATE PjpCursor
