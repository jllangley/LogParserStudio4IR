﻿/*  Password change attempt  */
select  
timegenerated, 
      
      EXTRACT_TOKEN(Strings,0,'|') AS Target_User,
      EXTRACT_TOKEN(Strings,1,'|') AS TargetDomain,
      EXTRACT_TOKEN(Strings,4,'|') AS Admin,
      EXTRACT_TOKEN(Strings,5,'|') AS Domain,
      EventID,
      ComputerName,
      SourceName

FROM '*.evtx'
WHERE EventID = '4724'

