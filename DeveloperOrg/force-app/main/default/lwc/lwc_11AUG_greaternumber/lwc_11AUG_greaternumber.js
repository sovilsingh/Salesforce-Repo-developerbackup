import { LightningElement, track} from 'lwc';

export default class Lwc_11AUG_greaternumber extends LightningElement 
{
     
    @track Num1;
    @track Num2;
    @track Num3;
     Result;

    
     firstnum(event)
     {
       this.Num1 = event.target.value;
     }

     secondnum(event)
     {
        this.Num2 = event.target.value;
     }

     thirdnum(event)
     {
        this.Num3 = event.target.value;
     }

     captureData(event)
     {
        const fl = event.target.name;
        if(fl=='aval')
        {
            this.Num1 = event.target.value;
        }
        else if(Wh=='bval')
        {
            this.Num2 = event.target.value;
        }
        else
        {
            this.Num2 = event.target.value;
        }
     }
  

     calculateme(event)
     {
       const a = parseInt(this.Num1);
       const b = parseInt(this.Num2);
       const c = parseInt(this.Num3);

        if(a>b && a>c)
        {
            alert('the greater number is '+a);
        }
        else if ( b>a && b>c)
        {
            alert('the greater number is '+b);
        }
        else{
            alert('the greater number is '+c);
        }
     }

     clearme(event)
     {
        this.Num1 = '';
        this.Num2 = '';
        this.Num3 = '';
     }

}