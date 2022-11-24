import { LightningElement } from 'lwc';

export default class Lwc_lwceventhandleemployeedetails extends LightningElement 
{

    empname;
    empphone;
    empcity;

    handleevent(event)
    {
        this.empname = event.detail.enm;
        this.empphone = event.detail.eph;
        this.empcity = event.detail.ecty;
    }

}