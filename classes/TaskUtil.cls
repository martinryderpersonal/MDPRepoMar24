public class TaskUtil {
    public static String getTaskPriority(String leadState) {
        // Validate input
        if (String.isBlank(leadState) || leadState.length() > 2) {
            return null;
        }
        //Set the task priority
        String taskPriority;
        if (leadState == 'CA') {
             taskPriority = 'High';
        } else {
             taskPriority = 'Normal';
        }
        return taskPriority;
    }
}