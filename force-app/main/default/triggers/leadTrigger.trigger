trigger leadTrigger on Lead (after insert) {

    //Temos que incluir uma tarefa e associar ao lead
    if(Trigger.isInsert && Trigger.isAfter){
        List<Task> taskList = new List<Task>();
        for(Lead vTemp: Trigger.New){
            Task taskObj = new Task();
            taskObj.Subject = 'Entrar em contato com o Lead';
            taskObj.ActivityDate = System.Today();
            taskObj.WhoId;
        }
        if(taskList.size()>0){
            insert taskList;    
        }
    }
    
    


}