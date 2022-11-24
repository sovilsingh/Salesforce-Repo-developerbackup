import { LightningElement } from 'lwc';
import pubsub from 'c/pubsub'

export default class Lwc_pubsubpublisher extends LightningElement 
{
        pubme(event)
        {
            let messagee = {
                      "message": "Hi everyone this is pubsub and also called as Singleton",
                      "name": "Sovil Singh",
                      "phone": "9826963823"
                          };

                   pubsub.fire('pubsbevent',messagee);       
        }
}