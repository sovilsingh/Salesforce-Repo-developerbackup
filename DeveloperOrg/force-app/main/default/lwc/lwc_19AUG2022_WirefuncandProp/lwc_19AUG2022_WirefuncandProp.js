import { LightningElement, track, wire } from 'lwc';
import findcontacts from '@salesforce/apex/CL_18AUG2022_Wire2.findcontacts';   //First Step import wire

export default class Lwc_19AUG2022_WirefuncandProp extends LightningElement 
{
    
    @track searchkey;
    handleonchnage(event)
    {
        this.searchkey = event.target.value;
    }
    //*********Wire a propery *********// 
    @wire(findcontacts,{searchText:'$searchkey'}) contact;
    //*********Wire a function *********//
    

}