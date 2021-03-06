﻿/* Log Parser Studio Query for Incident Response */
/* Report of all RDP connects in the TSC Local Session Event logs */
/* Tested on Windows Server 2008 R2*/
/* Logon = 21 */
/* Disconnect = 24*/
/* Logoff = 23*/
/* Reconnect = 25*/
	    
	    SELECT 
timegenerated, 
      RESOLVE_SID(EXTRACT_TOKEN(Strings,0,'|')) AS User, 
      EXTRACT_TOKEN(Strings,1,'|') AS Session,
      EXTRACT_TOKEN(Strings,4,'|') AS ClientHostname,
      EXTRACT_TOKEN(Strings,2,'|') AS IP,
      EventID,
      EventTypeName
FROM '*.evtx'
WHERE EventID=24 or EventID=25 or EventID=23 or EventID=21
ORDER BY timegenerated 
