SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER dbo.OnKeyTableDelete  
on KEYTABLE  
for DELETE   
NOT FOR REPLICATION 
AS  
DECLARE @nodeid int 
DECLARE @contextid int 
DECLARE @imalock int 
DECLARE @fulldn varbinary(2048) 
DECLARE @parentid int 
DECLARE @rdn varbinary(255) 
IF @@ROWCOUNT = 0 
     RETURN  
SELECT       
       @nodeid = nodeid,       
       @contextid = contextid, 
       @imalock = imalock,     
       @parentid = parentid,   
       @rdn = rdn              
FROM deleted                   
EXECUTE dbo.GetFullDN @parentid, @contextid, @rdn, @fulldn OUTPUT 
INSERT into DELETETRACKER 
      (               
       nodeid,        
       contextid,     
       imalock,       
       changestamp,    
       fulldn         
      )               
VALUES ( 
       @nodeid,                            
       @contextid,                         
       @imalock,                           
       GETUTCDATE(),                       
       @fulldn )                           
GO
