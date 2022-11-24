import { LightningElement } from 'lwc';

export default class Lwc_22AUG2022_eventdec extends LightningElement 
{
    dechandler(event)
    {
       //Step 1 and 2 ---> create Event, Dispatch the event
       this.dispatchEvent(new CustomEvent('decrease'));    
     
    }

    inchandler(event)
    {
       //Step 1 ---> create Event 
       const inc = new CustomEvent('increase');

       //step 2 --> Dispatch the event
       this.dispatchEvent(inc);
    }
}