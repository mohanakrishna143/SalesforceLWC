import { LightningElement,track } from 'lwc'; 
import { ShowToastEvent } from 'lightning/platformShowToastEvent'; 

export default class ModalPopupLWC extends LightningElement {
    //Boolean tracked variable to indicate if modal is open or not default value is false as modal is closed when page is loaded 
    @track isModalOpen = false;
    @track validate = false;
    @track myValue ;
    @track allowItems=5;
    @track  disableFlag= false;
    clickedButtonLabel;
    messageId = "";
   /* render(){
        return this.validate === false?ModalPopupLWC:ChildComponent
        } */
    openModal() {
        // to open modal set isModalOpen tarck value as true
        this.isModalOpen = true; 
    }
    closeModal() {
        // to close modal set isModalOpen tarck value as false
        this.isModalOpen = false;
        this.messageId = "";
        this.myValue = "";
        console.log("--allowitems----",this.allowItems,"++++___ ",this.disableFlag);
        this.disableFlag== false?false:true;
        //this.allowItems= 5;
    }
    submitDetails() {
        // to close modal set isModalOpen tarck value as false
        //Add your code to call apex method or do some processing
        this.isModalOpen = false;
        this.messageId = "";
    }

    generateOTPClick(event) { 
        this.clickedButtonLabel = event.target.label;
        this.allowItems =  this.allowItems-1;
        console.log("--this.allowites--",this.allowItems); 
        if(this.allowItems>=0){
            const evt = new ShowToastEvent({
                title: 'Toast Success',
                message: 'OTP Generated Succssfully with Message ID:345234 ',
                variant: 'success',
                mode: 'dismissable'
            });
            this.dispatchEvent(evt);
            this.messageId = "Message1234 -"+this.allowItems;
        }else{
            this.disableFlag= true;
            const evt = new ShowToastEvent({
                title: 'Toast Error',
                message: 'You had finised your limit Generate OTP',
                variant: 'error',
                mode: 'dismissable'
            });
            this.dispatchEvent(evt);  
        }
        
       
    }
    handleChange(evt) {
        this.myValue = evt.target.value;
        console.log('Currentue of the input: ', evt.target.value);
    }
    verifyClick(){
        console.log("--this.myvalue---",this.myValue);
        if(this.myValue == "12345"){
            const evt = new ShowToastEvent({
                title: 'Toast Success',
                message: 'OTP Validate Succssfully with Message ID:345234 ',
                variant: 'success',
                mode: 'dismissable'
            });
            this.dispatchEvent(evt);
        } else{ 
                const evt = new ShowToastEvent({
                    title: 'Toast Error',
                    message: 'OTP Validate Failed with Message ID:345234',
                    variant: 'error',
                    mode: 'dismissable'
                });
                this.dispatchEvent(evt); 
                this.myValue = "";
        }
        
       
    }
}