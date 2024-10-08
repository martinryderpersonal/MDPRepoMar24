public class TaskUtil {
    public static String getTaskPriority(String leadState) {
        // Validate input
        if (String.isBlank(leadState) || leadState.length() > 2) {
        // Return null
            return null;
        }
        //Set the task priority
        String taskPriority;
        if (leadState == 'CA') {
             taskPriority = 'High';
             //Comment 
        } else {
             taskPriority = 'Normal';
        }
        return taskPriority;
    }
}