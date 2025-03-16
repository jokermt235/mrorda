import 'dart:async';

Future<List<int>> getCompletedTasks(String projectId) async {
  await Future.delayed(Duration(seconds: 1));
  List<int> completedTasks = [1, 0, 1, 1, 0, 1]; 
  return completedTasks;
}

Future<int> calculateCompletedTaskCount(List<int> tasks) async {
  int count = tasks.fold(0, (sum, task) => sum + task);
  return count;
}

void main() async {
  String projectId = "SwiftHub Redesign";
  print("Calculating completed tasks for $projectId...");
  List<int> completedTasks = await getCompletedTasks(projectId);
  int completedTaskCount = await calculateCompletedTaskCount(completedTasks);
  print("Completed tasks for $projectId: $completedTaskCount");
}
