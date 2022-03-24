//nome da classe
public with sharing class ClasseDemonstraEstrutura {//inicio da classe
    
    //metodo da classe, uma classe pode ter varios metodos
    public static boolean nomeDoMetodo(){//inicio do método

        //TIPO VARIAVEL | NOME VARIAVEL | VALOR VARIAVEL
        Boolean bTrue = true;
        Boolean bFalse = false;
        Boolean bExemple;
        String exemploString = 'texto 123456';
        Integer exemploInteiro = 1;
        Decimal exemploDecimal = 1.02;
        Double exemploDouble = 1.0255464454546;

        //coleções
        List<String> exemploLista = new List<String>();
        //[0] - Edgar
        //[1] - João Paulo
        //[2] - Arnaldo
        //[3] - Guilherme
        exemploLista.add('Edgar');
        exemploLista.add('João Paulo');
        exemploLista.add('Arnaldo');
        exemploLista.add('Guilherme');
        exemploLista.add('Guilherme');
        exemploLista.add('Guilherme');
        exemploLista.add('Guilherme');
        system.debug('exemploLista = '+exemploLista);
        system.debug('exemploLista posição 2 = '+exemploLista.get(2));
        system.debug('exemploLista tamanho = '+exemploLista.size());

        List<Integer> exemploListaInteger = new List<Integer>();
        exemploListaInteger.add(null);
        exemploListaInteger.add(1);
        exemploListaInteger.add(2);
        exemploListaInteger.add(3);
        system.debug('exemploListaInteger = '+exemploListaInteger);

        //coleção set
        Set<String> exemploSet = new Set<String>();
        exemploSet.add('Edgar');
        exemploSet.add('João Paulo');
        exemploSet.add('Arnaldo');
        exemploSet.add('Guilherme');
        exemploSet.add('Guilherme');
        exemploSet.add('Guilherme');
        exemploSet.add('Guilherme');
        system.debug('exemploSet = '+exemploSet);
        system.debug('exemploSet tamalho = '+exemploSet.size());

        List<Opportunity> opportunityList =  new List<Opportunity>([SELECT Id, Name FROM Opportunity]);
        system.debug('opportunityList = '+opportunityList);
        system.debug('opportunityList posição 2 = '+opportunityList.get(2));
        system.debug('opportunityList nome posição 2 = '+opportunityList.get(2).Name);
        /*
        (
              Opportunity:{Id=0068c00000pMREmAAO, Name=Edge Emergency Generator}
            , Opportunity:{Id=0068c00000pMREtAAO, Name=Edge Installation}
            , Opportunity:{Id=0068c00000pMREuAAO, Name=Edge SLA}
            , Opportunity:{Id=0068c00000pMRF8AAO, Name=Edge Emergency Generator}
            , Opportunity:{Id=0068c00000pMRF1AAO, Name=Burlington Textiles Weaving Plant Generator}
            , Opportunity:{Id=0068c00000pMREoAAO, Name=Pyramid Emergency Generators}
            , Opportunity:{Id=0068c00000pMREeAAO, Name=Dickenson Mobile Generators}
        )
        */

        return bFalse;
    }//fim do método
    
    public static void helloName(String name){
        system.debug('Olá '+name);

    }
    //Execução DML CRUD

    public static Account dmlAccount(String name){
        Account accountObj = new Account();
        accountObj.Name = name;
        insert accountObj;

        return accountObj;
        
    }
    public static Account dmlAccountUpdate(String Name, String Id){
        List<Account> accountList = new List<Account> ([SELECT Id, Name FROM ACCount WHERE Id = :Id]); //Search Positions
        Account accountObj = accountList.get(0); //get Object
        accountObj.Name = name;
        update accountObj;

        return accountObj;
    }
    public static Id idDoLead(String lastName, String company){
        Lead newLead = new Lead();
        newlead.LastName = lastName;
        newLead.Company = company;
        insert newLead;
        
        return newLead.Id;
    }
    //DESAFIO
    //Construir um método que receba dois parâmetros do tipo Inteiro e retorne o a soma destes dois parâmetros
    //Se o parâmetro 1 for maior do 5 deve somar mais dois neste resultado

    public static Integer comparative(Integer value1 , Integer value2){
        Integer soma;
        if(value1>5){
            soma = (value1+value2)+2;
        } else{
            soma= (value1+value2);
        }
        system.debug(soma);
        return soma;
    }
    //Aula3
    //Estrutura de repetição
    public static Decimal getOpportunitiesTotal(){
        Decimal total= 0;
        for(Opportunity vTemp : [SELECT Amount FROM Opportunity]){
            total += vTemp.Amount; 
        }
        system.debug('A soma é: ' + total);
        return total;
    }

    //Desafios
    //1 - Buscar e retornar o valor total das oportunidades que as fases não sejam "Close Won" e "Close Lost"
    //2- Criar 10 contas com o nome 'Conta 1', 'Conta 2' e assim por diante. Sem retorno.
    
    public static Decimal getOpportunities(){
        Decimal total= 0;
        for(Opportunity vTemp : [SELECT Amount FROM Opportunity WHERE StageName !='Closed Lost' AND StageName != 'Closed Won']){
            total = total + vTemp.Amount; 
        }
        system.debug('A soma é:' + total);
        return total;
    }
    public static void createAccount(){  
        List<Account> newListAccount = new List<Account>();
        for(Integer i=1; i<=10; i++){
            Account accountObj = new Account();
            accountObj.Name = 'Conta:: ' +i;
            newListAccount.add(accountObj);
        }
        system.debug(newListAccount);
        insert newListAccount;
    }
    //Desafio 
    //Receber um inteiro em parametro e criar as contas conforme o número passado

    public static void insertAccount(Integer value){
        List<Account> newListAccount = new List<Account>();
        for(Integer i=1; i<=value; i++){
            Account accountObj = new Account();
            accountObj.Name = 'Contas Desafio ' +i;
            newListAccount.add(accountObj);
        }
        system.debug(newListAccount);
        insert newListAccount;
    }
}//fim da classe
