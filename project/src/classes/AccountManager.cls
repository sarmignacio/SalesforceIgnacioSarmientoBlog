/* Trailhead Apex Web Services  holi2*/
@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager{
//Prueba
    @HttpGet
    global static Account getAccount() {
        
        //result
        Account result = new Account();
        
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String AccountId = request.requestURI.substringBetween('Accounts/', '/contacts');
        result =  [SELECT Id, Name,
                   (SELECT Id, Name FROM Contacts)
                        FROM Account
                        WHERE Id = :AccountId ];
                        
                        
        return result;
        
    }


}