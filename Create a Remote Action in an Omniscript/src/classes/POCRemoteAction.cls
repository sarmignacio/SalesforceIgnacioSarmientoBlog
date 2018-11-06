/*
* @name: POCRemoteAction
* @description: Test Remote Action to insert an account
* @author: Ignacio Sarmiento Losada
* @date: 05/11/2018
* @modifiedBy:
*/
global with sharing class POCRemoteAction implements vlocity_ins.VlocityOpenInterface {
    //Options
	private static final String ACCOUNT_NAME_OPTION = 'accountName';
	//Outputs
	private static final String ERROR_MESSAGE_KEY_OUTPUT = 'ErrorMessage';
	//Methods
	private static final String UPDATE_ACCOUNT_METHOD = 'insertAccount';
	//Variables
	private static String methodName;
	private static String accountName;
    
    global Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        Boolean result = false;
        try {
            setVariables(methodName, options);
            if(isInsertAccountMethod())
                insertAccount();
            result = true;
        }catch(Exception e) {
            system.debug('The error is ' + e.getMessage());
        }
        return result;
    }
    
    private static void setVariables(String methodNameParam, Map<String,Object> options){
		methodName = methodNameParam;
		for(String optionKey: options.keySet()){
			if(isAccountNameOption(optionKey))
				accountName = String.valueOf(options.get(optionKey));
		}
	}

    private static Boolean isAccountNameOption(String optionKey){
        return optionKey == ACCOUNT_NAME_OPTION;
    }
	
	private static Boolean isInsertAccountMethod(){
		return methodName == UPDATE_ACCOUNT_METHOD;
	}
	
	private static void insertAccount(){
		Account accountToInsert = new Account(
			Name = accountName
		);
		insert accountToInsert;
	}
	
	private static void setErrorMessage(Map<String,Object> outMap, Exception e){
		outMap.put(ERROR_MESSAGE_KEY_OUTPUT, e);
	}
}