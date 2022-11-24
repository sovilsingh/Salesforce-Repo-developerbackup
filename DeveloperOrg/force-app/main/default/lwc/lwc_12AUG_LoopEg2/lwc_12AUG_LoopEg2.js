import { LightningElement, track } from 'lwc';

export default class Lwc_12AUG_LoopEg2 extends LightningElement 
{
    evnnum = [2,8,10,18,4,12,6,14,20,16];
    Student = {'Name':'Sovil Singh','Age': 28, 'City':'Jabalpur', 'Salary': 72000.250};
    @track Students = [

        {'Name':'Sovil Singh','Age': 28, 'City':'Jabalpur', 'Salary': 72000.250},
        {'Name':'Mukesh Singh','Age': 57, 'City':'Jabalpur', 'Salary':15000.250},
        {'Name':'Rekha Singh','Age': 50, 'City':'Jabalpur', 'Salary': 50000.250},
        {'Name':'Sagar Singh','Age': 23, 'City':'Jabalpur', 'Salary': 15000.250},
        {'Name':'Sahil Singh','Age': 23, 'City':'Jabalpur', 'Salary': 9000.250}
            ]
}