SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFullDN] 
  @parentid  int, 
  @contextid int, 
  @rdn varbinary(255), 
  @fulldn varbinary(2048) OUTPUT 
As 
SET @fulldn=@rdn  
WHILE(@parentid != @contextid) 
BEGIN  
SELECT @contextid=contextid,@parentid=parentid,@rdn=rdn from KEYTABLE where nodeid = @parentid 
SET @fulldn=SUBSTRING(@rdn,1,DATALENGTH(@rdn)-2) + CONVERT (binary(2),0x2F00) + SUBSTRING(@fulldn,1,DATALENGTH(@fulldn)) 
END 
GO
