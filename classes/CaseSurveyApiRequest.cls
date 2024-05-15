/**
 * @Company     : Splunk Inc.
 * @Description :
 * ****************************************************************************************
 * This is a Request structure class for sending case survey API To Qualtrics 
 * via mulesoft from SFDC
 * Test class - CaseSurveyService_Tests gets the coverage for this class
 * ****************************************************************************************
 * @History     : Refer to the Git/BitBucket repository.
 */
global with sharing class CaseSurveyApiRequest {
    global CaseSurveyDetailsWrapper survey;
    global List<CaseContactDetailsWrapper> contacts;
    
    /**
     * ****************************************************************************************
     * constructor
     * ****************************************************************************************
     */
    global CaseSurveyApiRequest(CaseSurveyDetailsWrapper survey,List<CaseContactDetailsWrapper> contacts){
        this.survey = survey;
        this.contacts = contacts;
    }
    /**
     * ****************************************************************************************
     * Wrapper class for providing field API to value wrapper
     * ****************************************************************************************
     */
    global class AdditionalInfoWrapper{
        global String type;
        global String value;

        global AdditionalInfoWrapper(String type,String value){
            this.type = type;
            this.value = value;
        }
    }
    /**
     * ****************************************************************************************
     * Wrapper class for Case contact details
     * ****************************************************************************************
     */
    global class CaseContactDetailsWrapper{
        global String email;
        global String firstName;
        global String lastName;
        global String externalReferenceId;
        global List<AdditionalInfoWrapper> additionalInfo; 

        global CaseContactDetailsWrapper(String email,String firstName,String lastName,String externalReferenceId,List<AdditionalInfoWrapper> additionalInfo){
            this.email = email;
            this.firstName = firstName;
            this.lastName = lastName;
            this.externalReferenceId = externalReferenceId;
            this.additionalInfo = additionalInfo;
        }
    }
    /**
     * ****************************************************************************************
     * Wrapper class for Case survey details
     * ****************************************************************************************
     */
    global class CaseSurveyDetailsWrapper{
        global String surveyId;
        global String surveyType;
        global String sourceSystemRecordType;
        global String sourceSystemRecordId;
        global List<AdditionalInfoWrapper> additionalInfo;

        global CaseSurveyDetailsWrapper(String surveyId,String surveyType,String sourceSystemRecordType,String sourceSystemRecordId,
        List<AdditionalInfoWrapper> additionalInfo){
            this.surveyId = surveyId;
            this.surveyType = surveyType;
            this.sourceSystemRecordType = sourceSystemRecordType;
            this.sourceSystemRecordId = sourceSystemRecordId;
            this.additionalInfo = additionalInfo;
            system.debug('US2 - Potential Conflicts'+ additionalInfo);
            system.debug('US3 - Potential Conflicts'+ additionalInfo);
        }
    }
}