/**
* @name: MultipleRecordInsertionFormHelper.js
* @description: MultipleRecordInsertionForm helper
* @author: Ignacio Sarmiento Losada
* @date: 31/01/2019
*/
({
	onSubmitHelper : function(component, event) 
    {
		this.submitFields(component);
	},
    
    submitFields: function(component)
    {
    	component.find("recordForm").submit();
	},

 	hideTheForm: function(component)
	{
        component.set('v.isShowedTheForm', false);        
    },
    
    showTheForm: function(component)
	{
        component.set('v.isShowedTheForm', true);        
    },
    
    onSuccessHelper: function(component, event)
    {
        this.hideTheForm(component);
    },
})