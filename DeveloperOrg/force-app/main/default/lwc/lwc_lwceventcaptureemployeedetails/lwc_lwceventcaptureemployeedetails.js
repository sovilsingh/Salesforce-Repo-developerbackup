import { LightningElement } from 'lwc';

export default class Lwc_lwceventcaptureemployeedetails extends LightningElement 
{

    name;
    phone;
    city;

    empname(event)
    {
      this.name = event.target.value;
    }

    empphone(event)
    {
        this.phone = event.target.value;
    }

    empcity(event)
    {
        this.city = event.target.value;
    }

    empevent(event)
    {
        this.dispatchEvent( new CustomEvent('employeedetails',{detail:{enm:this.name, eph:this.phone, ecty: this.city}} ));
    }
}