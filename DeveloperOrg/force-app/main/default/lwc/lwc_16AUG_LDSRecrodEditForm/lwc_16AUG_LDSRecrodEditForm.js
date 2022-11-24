import { LightningElement, api} from 'lwc';

export default class Lwc_16AUG_LDSRecrodEditForm extends LightningElement 
{

    @api recordId

    cancelme(event)
    {
        const inputfields = this.template.querySelectorAll('lightning-input-field');
        inputfields.forEach(field=> {field.reset();});
    }
}