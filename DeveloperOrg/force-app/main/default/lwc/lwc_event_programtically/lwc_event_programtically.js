import { LightningElement } from 'lwc';

export default class Lwc_event_programtically extends LightningElement 
{
   fireme(event)
   {
     this.dispatchEvent(new CustomEvent('pevent',{detail:'Hi Sovil Singh', bubbles:true, composed:true}))
   }
}