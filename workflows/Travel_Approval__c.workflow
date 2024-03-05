<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Out_of_State_False</fullName>
        <field>Out_of_State__c</field>
        <literalValue>0</literalValue>
        <name>Out of State False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Out_of_State_True</fullName>
        <field>Out_of_State__c</field>
        <literalValue>1</literalValue>
        <name>Out of State True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Out of State Off</fullName>
        <actions>
            <name>Out_of_State_False</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Destination_State__c = &quot;TX&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Out of State On</fullName>
        <actions>
            <name>Out_of_State_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Destination_State__c &lt;&gt; &quot;TX&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
