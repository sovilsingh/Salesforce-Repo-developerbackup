import { LightningElement } from 'lwc';
import pubsub from 'c/pubsub'
export default class Lwc_pubsubsuscriber extends LightningElement 
{

    mymessage;

    connectedCallback()
    {
        this.register();
    }

    register()
    {
        pubsub.register('pubsbevent', this.callme.bind(this));
    }

    callme(messageFromEvt)
    {
              this.mymessage = messageFromEvt ? JSON.stringify(messageFromEvt,null, '\t') : 'no Message is Publish';
              
    }

}