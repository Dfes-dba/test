SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.AddEntryNoIndex2               
	@imalock int,   
	@ParentId int,
	@highhash int,
	@lowhash  int,
	@uidhost  int,
	@uidtype  int,
	@uidid	  int,
    @ContextId int,
	@rdn      varbinary(255),
	@entrydata varbinary(MAX)
AS
	DECLARE @nodeid int
	INSERT INTO KEYTABLE(
		imalock,             
        		parentid,        
		 highhash,                   
	       	 lowhash,                    
	              uidhost,               
                           uidtype,     
                           uidid,      
                           contextid,   
                           rdn, 
                           data   
	) 
	VALUES(
		@imalock,
		@ParentId,
		@highhash,
		@lowhash,
		@uidhost,
		@uidtype,
		@uidid,
		@ContextId,
		@rdn,
		@entrydata
	)
if @@error <> 0
  return 0
set @nodeid = SCOPE_IDENTITY()

	return @nodeid
GO
