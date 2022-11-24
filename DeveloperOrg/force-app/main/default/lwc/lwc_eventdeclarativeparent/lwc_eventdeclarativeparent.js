import { LightningElement } from 'lwc';

export default class Lwc_eventdeclarativeparent extends LightningElement
{
    vol = 0;
    con = 'Awaiting Control Please CLick to Activate'

    handleVolIncrease(event)
    {
        this.con = event.detail;
        if(this.vol < 101)
        {   
            this.vol = this.vol + 1;
        }
        
    }


    handleVolDecrease(event)
    {
        this.con = event.detail;
        if(this.vol > 0)
        {
            this.vol = this.vol - 1;
        }
    }
}