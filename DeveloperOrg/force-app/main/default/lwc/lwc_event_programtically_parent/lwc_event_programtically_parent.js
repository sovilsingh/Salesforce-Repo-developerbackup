import { LightningElement } from 'lwc';

export default class Lwc_event_programtically_parent extends LightningElement 
{
    constructor()
    {
        super();
        this.template.addEventListener('pevent',this.handleme);
    }

    handleme(event)
    {
      alert('This is Parent and I heard the event the msg was'+event.detail);
    }
}