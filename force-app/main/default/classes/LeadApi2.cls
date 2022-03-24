@RestResource(urlMapping = '/AulaDeApex/Leads/*')

    global with sharing class LeadApi2{

        @HttpGet
        global static void getLead(){

        String asParamStr = RestContext.request.requestURi.substring(RestContext.request.requestURI.lastIndexOf('/')+1);
        String Sobrenome = String.IsNotBlank(asParamStr) ? RestContext.request.params.get('Sobrenome') : '';    
        RestResponse resultRest = RestContext.response;
        
        
        List<Lead> leadsList = new List<Lead>();
        if(String.IsNotBlank(sobrenome)){
            leadsList = [SELECT Id, LastName FROM Lead WHERE LastName = :sobrenome];
        }else{
            leadsList = [SELECT Id, LastName FROM Lead];
        }

        //List<Lead> leadsList = new List<Lead>([SELECT Id, LastName FROM Lead]);

        resultRest.responseBody = Blob.valueOf(JSON.serializePretty(leadsList));
        resultRest.StatusCode = 200;

    }

    @HttpPost
    global static void insertLeads(List<LeadApiWrapper> leadList){
        
        List<Lead> leadInsertList = new List<Lead>();

        //Aqui eu vou ler minha lista (json) de entrada (leadList), e vou criar os leads e adiciona lista leadsInsertList para posteriormente fazer o insert

        for(LeadApiWrapper vTemp : leadList){
            Lead leadObj = new Lead(
            LastName = vTemp.sobrenome, 
            Company = vTemp.nome_empresa, 
            Status = vTemp.status_do_lead, 
            Email = vTemp.email);

            leadInsertList.add(leadObj);
        }
        RestResponse resultRest = RestContext.response;
        List<String> idsLeadsList = new List<String>();


        if(leadInsertList.size()>0){

            DataBase.UpsertResult[] results = DataBase.upsert(leadInsertList);

            for(Integer p=0; p<results.size(); p++){
                if(results[p].isSuccess()){
                    Id idDFor = results[p].Id;
                } else{
                    idsLeadsList.add('Erro');
                }
            }

        }
        resultRest.responseBody = Blob.valueOf(JSON.serializePretty(leadList));
        resultRest.StatusCode = 200;    

    }

     
}