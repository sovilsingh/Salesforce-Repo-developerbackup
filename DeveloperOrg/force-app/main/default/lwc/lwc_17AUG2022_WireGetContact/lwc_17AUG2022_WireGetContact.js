import { LightningElement, wire, track } from 'lwc';
import GetContactList from '@salesforce/apex/CL_17AUG2022_GetContactWireRecords.GetContactList';
import { updateRecord } from 'lightning/uiRecordApi';
import First_Name_FIELD from '@salesforce/schema/Contact.FirstName';
import Last_Name_FIELD from '@salesforce/schema/Contact.LastName';
import Id_FIELD from '@salesforce/schema/Contact.Id';
import Phone_FIELD from '@salesforce/schema/Contact.Phone';
import Email_FIELD from '@salesforce/schema/Contact.Email';
import {refreshApex} from '@salesforce/apex';

const colm = [
               {label:'First Name', fieldName:'FirstName', type:'text', editable:true },
               {label:'Last Name', fieldName:'LastName', type:'text', editable:true },
               {label:'Phone', fieldName:'Phone', type:'phone', editable:true},
               {label:'Email', fieldName:'Email', type:'email', editable:true },
            ];

export default class Lwc_17AUG2022_WireGetContact extends LightningElement 
{
   @track col = colm;
   @track draftvales=[];
   @wire(GetContactList) listdata;

   handlesave(event)
   {
      const fields = {};
      fields[Id_FIELD.fieldApiName] = event.detail.draftValues[0].Id;
      fields[First_Name_FIELD.fieldApiName] = event.detail.draftValues[0].FirstName;
      fields[Last_Name_FIELD.fieldApiName] = event.detail.draftValues[0].LastName;
      fields[Phone_FIELD.fieldApiName] = event.detail.draftValues[0].Phone;
      fields[Email_FIELD.fieldApiName] = event.detail.draftValues[0].Email;

      const recordInput = {fields};

      updateRecord(recordInput).then(response=>{
      
         alert('record updated succesfully')
         this.draftvales=[];
         return refreshApex(this.listdata);
      }).catch(error=>{
          alert('An Error has encountered during refresh '+error.body.message);
      });
   }
}