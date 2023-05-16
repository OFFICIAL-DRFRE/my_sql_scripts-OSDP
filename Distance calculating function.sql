--DROP FUNCTION DISTANCE
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.distance') AND type = N'FN')
BEGIN
    EXEC('
		CREATE FUNCTION dbo.distance (
			@lat1 FLOAT,
			@lon1 FLOAT,
			@lat2 FLOAT,
			@lon2 FLOAT
		)
		RETURNS FLOAT
		AS
		BEGIN
			DECLARE @R FLOAT = 6371000; -- Earth''s radius in meters
			DECLARE @dLat FLOAT = RADIANS(@lat2 - @lat1);
			DECLARE @dLon FLOAT = RADIANS(@lon2 - @lon1);
			DECLARE @a FLOAT, @c FLOAT, @d FLOAT;

			SET @a = SIN(@dLat / 2) * SIN(@dLat / 2) +
						COS(RADIANS(@lat1)) * COS(RADIANS(@lat2)) *
						SIN(@dLon / 2) * SIN(@dLon / 2);

			SET @c = 2 * ATN2(SQRT(@a), SQRT(1 - @a));
			SET @d = @R * @c;

			RETURN @d
		END
    ');
	PRINT CHAR(10)+' --------------------------------------------------'+CHAR(10)
				  +'|  THE DISTANCE FUNCTION IS CREATED SUCCESSFULLY   |'+CHAR(10)
		          +' ---------------------------------------------------'
END
ELSE 
BEGIN
	PRINT CHAR(10)	+' --------------------------------------------'+CHAR(10)
					+'|    THE DISTANCE FUNCTION ALREADY EXISTS!  |'+CHAR(10)
					+' --------------------------------------------'
END
