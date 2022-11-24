import { LightningElement, track } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';

export default class Lwc_17AUG_IMPSCreate extends LightningElement 
{

    @track name;
    @track phone;
    @track industry;
    @track rating;

    callnm(event)
    {
         this.name = event.target.value;
    }

    callph(event)
    {
        this.phone = event.target.value;
    }

    callind(event)
    {
        this.industry = event.target.value;
    }
    callrt(event)
    {
        this.rating = event.target.value;
    }

    callme(event)
    {
        //step 1 ==> Create Field List
        const fields = {'Name': this.name, 'Phone':this.phone, 'Rating': this.rating, 'Industry': this.Industry};
        //step 2 ==> create API Records with Fields
        const recordData={apiName:'Account',fields};
        //step 3 ==> call imperation
        ///createRecord(recordData).then().catch();
        createRecord(recordData).then(response=>{
          alert('Account was Created With Account Id :'+response.id);
        }).catch(error=>{
            alert('Record Creation is failed with the following error :'+error.body.message);
        }
        );
    }
}