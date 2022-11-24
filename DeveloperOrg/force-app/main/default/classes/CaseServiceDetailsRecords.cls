@RestResource(URLMapping='/CaseRecordService/*')
global class CaseServiceDetailsRecords 
{      @HttpGet
       Global static Case GetCaseDetailsByID()
    {
        Map<String,String> mapInputs =  RestContext.request.Params;
        
        Case csRecord = [Select id, caseNumber, status, priority, origin, reason, subject, description
                              from Case
                                Where id =: mapInputs.Get('Id')];
        
        return csRecord;
    }
}