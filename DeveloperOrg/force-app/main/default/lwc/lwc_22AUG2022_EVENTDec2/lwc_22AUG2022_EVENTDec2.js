import { LightningElement } from 'lwc';

export default class Lwc_22AUG2022_EVENTDec2 extends LightningElement 
{
    vol = 0;

    handleVolIncrease(event)
    {
        if(this.vol < 101)
        {
            this.vol = this.vol + 1;
        }
        
    }


    handleVoldecrease(event)
    {
        if(this.vol > 0)
        {
            this.vol = this.vol - 1;
        }
    }
}