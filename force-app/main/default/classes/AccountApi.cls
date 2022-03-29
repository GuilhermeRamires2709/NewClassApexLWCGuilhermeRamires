@RestResource(urlMapping='/AulaDeApex/Accounts/*')

global with sharing class AccountApi {
    @HttpGet
    global static List<Account> getAccount(){
        List<Account> accountList = new List<Account>();
        
        String asParamStr = RestContext.request.requestURI.substring(RestContext.request.requestURI.lastIndexOf('/')+1);

        String nomeConta=String.IsNotBlank(asParamStr) ? RestContext.request.params.get('nome') : '';

        if(String.isNotBlank(nomeConta)){
            String likeValue = '%'+nomeConta+'%';
            accountList = [SELECT Id, Name FROM Account WHERE Name LIKE :likeValue];
        } else{
            system.debug('nome Conta: '+nomeConta);
        }

        return accountList;


    }

    @HttpPost

    global static List<String> createAccount(List<Account> accountList){

        List<String> returnList = new List<String>{'Ok'};
        List<Account> insertList = new List<Account>();


        for(Account cTemp : accountList){
            Account acctObj = new Account();
            acctObj.Name = cTemp.Name;


            insertList.add(acctObj);
        }

        if(insertList.size()>0){
            insert insertList;
        }

        return returnList;



    }

    
}
