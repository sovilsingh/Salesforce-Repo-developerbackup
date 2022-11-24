import { LightningElement } from 'lwc';

export default class Lwc_eventdeclarativechild extends LightningElement 
{
    dechandler(event)
    {
       //Step 1 and 2 ---> create Event, Dispatch the event / with data
       this.dispatchEvent(new CustomEvent('decrease', {detail:'Vol Control descrease'}));    
     
    }

    inchandler(event)
    {
       //Step 1 ---> create Event / with data
       const inc = new CustomEvent('increase', { detail: 'Vol Control  increase'});

       //step 2 --> Dispatch the event / with data
       this.dispatchEvent(inc);
    }
}