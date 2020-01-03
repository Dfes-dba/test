SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.JoinIndexSearch2
  @contextid int,
  @parentid  int,
  @attrnameid int,
  @attrvalue varchar(255)
AS
SELECT KEYTABLE.imalock, KEYTABLE.nodeid, 
       KEYTABLE.uidhost,KEYTABLE.uidtype,KEYTABLE.uidid, 
       KEYTABLE.contextid, 
       KEYTABLE.rdn,KEYTABLE.data 
FROM INDEXTABLE 
INNER JOIN	KEYTABLE ON (KEYTABLE.nodeid = INDEXTABLE.nodeid)
WHERE INDEXTABLE.contextid=@contextid AND INDEXTABLE.parentid=@parentid 
    AND INDEXTABLE.attrnameid=@attrnameid AND INDEXTABLE.attrvalue=@attrvalue
GO
