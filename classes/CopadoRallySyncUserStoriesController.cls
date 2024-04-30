/**
 * Controller for retrieving External Rally User Stories from the Project.
 * 
 * package CopadoRallyIntegration
 * @author Ajay Sahu
 * @version 1.0
 */
public with sharing class CopadoRallySyncUserStoriesController {

    public copado__Project__c project { get; set; }
    Copado_Rally_Integration__c integration { get; set; }
    Boolean includSprint = false;

    public CopadoRallySyncUserStoriesController() {

        String projectId = ApexPages.currentPage().getParameters().get('pid');
        System.debug('projectId '+ projectId);

        if (projectId != null) {
            // Retrieve Project and its related IntegrationParam records in a single query
            project = [SELECT Id, Name, External_Id__c, Workspace_Id__c,Copado_Rally_Integration_Setting__r.Name, Copado_Rally_Integration_Setting__r.Named_Credential__c, Copado_Rally_Integration_Setting__r.Is_Rally_Sync_Running__c, Copado_Rally_Integration_Setting__r.Last_Sync_Time__c
                        FROM copado__Project__c 
                       WHERE Id = :projectId WITH USER_MODE LIMIT 1];
            
            integration = project.Copado_Rally_Integration_Setting__r;
        }
        System.debug('project '+ project);

    }

    public String errorMessage { get; set; }
    
    public void scheduleFetchOperationAndReturn() {
        if(this.integration.Is_Rally_Sync_Running__c == true){
            errorMessage = 'The Job is already running!';
        }else{
            try {
                this.includSprint = Boolean.valueOf(ApexPages.currentPage().getParameters().get('includIterations'));
                System.debug('includIterations '+ includSprint);
                            
                CopadoScheduleRallyUserStoriesSync scheduledJob = new CopadoScheduleRallyUserStoriesSync(project.Id, includSprint);
                String jobName = 'Schedule Rally User Stories Fetch ' + DateTime.now() +  '.' + Math.mod(DateTime.now().getTime(), 1000);
                String cronExpression = Datetime.now().addSeconds(5).format('s m H d M ? yyyy'); //'0 40 16 2 5 ? 2023';
                System.schedule(jobName, cronExpression, scheduledJob);
                
    
            } catch (Exception e) {
                errorMessage = e.getMessage();
            }
        }
        
    }

}