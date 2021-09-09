import { LightningElement } from 'lwc';

export default class Paginator extends LightningElement {

    handleNext(){
        // Create the custom Event
        //  To create an event, use the CustomEvent() constructor.
        // To dispatch an event, call the EventTarget.dispatchEvent() method.
        const testMessage = 'this is test value';
        const nextEvent = new CustomEvent('next',{
            detail: testMessage
        });
        // Fire the Event
        this.dispatchEvent(nextEvent);
    }

    handlePrev(){
        const testMessage = 'this is test previous value';
        const prevEvent = new CustomEvent('previous',{
            detail: testMessage
        });
        this.dispatchEvent(prevEvent);
    }
}