import { LightningElement, api, track} from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';

export default class Lwc_17AUG_LDSDelete extends NavigationMixin(LightningElement)
{

    @api recordId; 
    @api objectApiName;
    @track error;

    deleteme(event)
    {
     deleteRecord(this.recordId).then(()=>{
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Record deleted',
                variant: 'success'
            })
        );

        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'home',
            },
        });
       
     }).catch(error=>{});
    }

}