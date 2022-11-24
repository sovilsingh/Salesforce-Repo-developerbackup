import { LightningElement, track} from 'lwc';

export default class Lwc_event_programtically_parent_empdetails extends LightningElement 
{
  @track employeename;
  @track employeeage;
  @track employeephone;

    constructor()
    {
     super();
     this.template.addEventListener('evtemp',this.readme.bind(this));
    }

    readme(event)
    {
            this.employeename = event.detail.empname;
            this.employeeage = event.detail.empage;
            this.employeephone = event.detail.empphone;
    }
}