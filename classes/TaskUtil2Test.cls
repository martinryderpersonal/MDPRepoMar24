@isTest
private class TaskUtil2Test {
    @isTest static void testTaskPriority() {
        String pri = TaskUtil2.getTaskPriority('NY');
        System.assertEquals('Normal', pri);
    }
    @isTest static void testTaskHighPriority() {
        String pri = TaskUtil2.getTaskPriority('CA');
        System.assertEquals('High', pri);
    }
    @isTest static void testTaskPriorityInvalid() {
        String pri = TaskUtil2.getTaskPriority('Montana');
        System.assertEquals(null, pri);
    }
}