SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.AddIndexEntryBlock  
	    @NodeId   int,
        @ContextId int,
	    @ParentId int,
	    @AttrNameId int,
	    @ValueBlock TEXT
    AS
	    DECLARE @len int
	    DECLARE @len1 int
	    DECLARE @attrvalue varchar(255)
	    DECLARE @leftlen int
	    DECLARE @dm varchar(15)
	    DECLARE @tempblock varchar(255)
	    DECLARE @flag int
	    DECLARE @usepatindex int
	    DECLARE @testpatindex varchar(15)
	    DECLARE @binstr varbinary(255)
	    DECLARE @binchar varbinary(1)

	    SET @dm = '%' + CHAR(0) + '%'	
	    SET @leftlen = DATALENGTH(@ValueBlock)
	    SET @len1 = 0

	    SET @testpatindex = 'test' + CHAR(0) + 'abc'
	    SET @usepatindex = 0
	    IF(PATINDEX(@dm,@testpatindex) = 5) 
          BEGIN
	            SET @usepatindex = 1
          END

	    WHILE( (@leftlen - @len1) > 0)
		    BEGIN
			    IF ((@leftlen - @len1) >= 255 )
				    BEGIN
					    SET @tempblock = SUBSTRING(@ValueBlock,@len1+1, 255)
				    END
			    ELSE
				    BEGIN
					    SET @tempblock = SUBSTRING(@ValueBlock,@len1+1, @leftlen - @len1)

				    END			
      IF(@usepatindex = 1 )
          BEGIN
              SET @len = PATINDEX(@dm, @tempblock)
          END
       ELSE
         BEGIN
          	SET @binchar = 1
          	SET @binstr = CAST(@tempblock AS VARBINARY(255))
          	SET @len  = 0
          	WHILE(@binchar != 0 )
          	    BEGIN 
          	        SET @binchar = SUBSTRING(@binstr, @len+1, 1)
          	        SET @len =@len+1
          	    END
           END
			    SET @attrvalue = SUBSTRING(@ValueBlock,@len1+1, @len-1)
			    SET @len1 = @len1 + @len		
			    
	    
			    INSERT INTO INDEXTABLE (nodeid,contextid,parentid,attrnameid,attrvalue)
				    VALUES(@NodeId,@ContextId,@ParentId,@AttrNameId,@attrvalue)

       END
GO
