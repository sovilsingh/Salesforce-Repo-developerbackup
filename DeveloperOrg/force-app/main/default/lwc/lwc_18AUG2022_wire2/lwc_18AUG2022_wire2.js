import { LightningElement, track, wire } from 'lwc';
import findcontacts from '@salesforce/apex/CL_18AUG2022_Wire2.findcontacts';

export default class Lwc_18AUG2022_wire2 extends LightningElement
{
    
    @track searchkey;
    @wire(findcontacts,{searchText:'$searchkey'}) contact;

    handleonchnage(event)
    {
        this.searchkey = event.target.value;
    }
}