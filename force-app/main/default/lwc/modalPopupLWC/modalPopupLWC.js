import { LightningElement,track } from 'lwc'; 
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ModalPopupLWC extends LightningElement {
    //Boolean tracked variable to indicate if modal is open or not default value is false as modal is closed when page is loaded 
    @track isModalOpen = false;
    clickedButtonLabel;
    messageId = "";
    openModal() {
        // to open modal set isModalOpen tarck value as true
        this.isModalOpen = true; 
    }
    closeModal() {
        // to close modal set isModalOpen tarck value as false
        this.isModalOpen = false;
        this.messageId = ""
    }
    submitDetails() {
        // to close modal set isModalOpen tarck value as false
        //Add your code to call apex method or do some processing
        this.isModalOpen = false;
        this.messageId = ""
    }

    generateOTPClick(event) {
        this.clickedButtonLabel = event.target.label;
        
        const evt = new ShowToastEvent({
            title: 'Toast Success',
            message: 'OTP Generated Succssfully with Message ID:345234 ',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
        this.messageId = "Message1234";
    }
    verifyClick(){
        const evt = new ShowToastEvent({
            title: 'Toast Success',
            message: 'OTP Validate Succssfully with Message ID:345234 ',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }
}