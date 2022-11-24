public class CL_INT_JSON_ATTCH_26July2022 
{
    
    
public void JSONAttachment_Dser()
{
    //Step 1 - pull/ Retrive the attachment
    Document doc = [Select Id, Name, body from Document where name='SF-Admin-Logo.png'];
    //****************Seralize the attachment*************//
    String jdoc = JSON.serialize(doc); // Simple or standard Serialization
    System.debug(jdoc);
    
    System.JSONGenerator jcomplexDoc = JSON.createGenerator(true); //Complex/Dynamic Serialization
    jcomplexDoc.writeStartObject();
    
    jcomplexDoc.writeBlobField('Attachment', doc.body);
    
    jcomplexDoc.writeEndObject();
    String Jsdoc = jcomplexDoc.getAsString();
    System.debug(Jsdoc);
    
    //************Deseralize the Attachment ************//
   // Blob Jd = (Blob) JSON.deserialize(jdoc, blob.class);
   // System.debug(Jd);
    
    //Complex Deserialization
    
    System.JSONParser jsp = JSON.createParser(Jsdoc);
    while(jsp.nextToken()!=null)
    {
        if(jsp.getText()=='Attachment')
        {
            jsp.nextToken(); 
            blob jsondes = (blob) Jsp.getBlobValue();
            System.debug(jsondes);
            //Write a program to save the above deserialized attachment/blob file
            Document docsave = new Document();
            docsave.Name = 'newfile.png';
            docsave.Body = jsondes;
            docsave.FolderId = UserInfo.getUserId();
            Insert docsave;
        }
    }
 }
    
}