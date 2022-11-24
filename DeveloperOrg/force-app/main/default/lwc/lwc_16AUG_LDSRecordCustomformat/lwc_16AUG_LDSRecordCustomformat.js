import { LightningElement, api} from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import FAX_FIELD from '@salesforce/schema/Account.Fax';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import RATING_FIELD from '@salesforce/schema/Account.Rating';

export default class Lwc_16AUG_LDSRecordCustomformat extends LightningElement 
{
  @api recordId;
  @api objectApiName;
  //@api objectnm = ACCOUNT_OBJECT;
  //@api objectnm = objectApiName;
  @api myfields = [  NAME_FIELD, PHONE_FIELD, INDUSTRY_FIELD, RATING_FIELD, FAX_FIELD  ];

}