//DESAFIO : toda vez que criar uma nova conta, com o campo Propriedade = Private, você deve criar uma tarefa para o proprietário da conta, dizendo para verificar os dados cadastrais da mesma.
trigger AccountTrigger on Account (after insert) {

    if(Trigger.isInsert && Trigger.isAfter){
        List<Task> taskList = new List<Task>();        
        for(Account aTemp : Trigger.New){
            if(aTemp.Ownership == 'Private'){
                Task taskObj = new Task();
                taskObj.Subject = 'Verifique os dados cadastrais da sua conta!';
                taskObj.ActivityDate = System.Today();
                taskObj.WhatId = aTemp.Id;
                taskObj.OwnerId = aTemp.OwnerId;
                taskList.add(taskObj);
            }
        }
        
        if(taskList.size()>0){
            insert taskList;    
        }
    }
}