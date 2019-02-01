/**
* @name: MultipleRecordInsertionFormController.js
* @description: MultipleRecordInsertionForm js controller
* @author: Ignacio Sarmiento Losada
* @date: 31/01/2019
*/
({
 	showTheForm: function (component, event, helper)
    {
        helper.showTheForm(component);
    },
    
    onSubmit: function(component, event, helper)
    {
        helper.onSubmitHelper(component, event);
    },
    
    onSuccess: function(component, event, helper)
    {
        helper.onSuccessHelper(component, event);
    },
})