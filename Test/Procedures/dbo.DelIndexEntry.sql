SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.DelIndexEntry 
                    @varnodeid     int
                  AS
                     DELETE FROM INDEXTABLE
                          WHERE nodeid=@varnodeid
GO
