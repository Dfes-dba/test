SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddIndexEntry]
                     @varnodeid     int,
					   @varcontextid  int,
					   @varparentid   int,
					   @varattrnameid int, 
					   @varattrvalue  varchar(255)
				  AS 
						INSERT INTO INDEXTABLE(
							 nodeid,
							 contextid,
							 parentid,
							 attrnameid,
							 attrvalue
							 )
						VALUES(
						     @varnodeid,
							 @varcontextid,
							 @varparentid,
							 @varattrnameid,
							 @varattrvalue
							 )
GO
