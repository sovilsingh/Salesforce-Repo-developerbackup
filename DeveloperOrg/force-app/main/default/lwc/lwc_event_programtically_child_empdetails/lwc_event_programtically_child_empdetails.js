import { LightningElement } from 'lwc';

export default class Lwc_event_programtically_child_empdetails extends LightningElement 
{
    nme;
    phone;
    age;

    ename(event)
    {
        this.nme = event.target.value;
        
    }


    eage(event)
    {
        this.age = event.target.value;
    }

    ephone(event)
    {
        this.phone = event.target.value;
    }


    callme(event)
    {
        
       const selectevent = new CustomEvent('evtemp',{detail:{empname:this.nme, empphone:this.phone, empage:this.age},bubbles:true, composed:true});
        this.dispatchEvent(selectevent);
    }
}