mixin Notifiable {
  List<String> notifications = [];

  void sendNotification(String message) {
    notifications.add(message);
    print("Notification: $message");
  }

  void displayNotifications() {
    print("Notifications:");
    notifications.forEach(print);
  }
}

mixin Searchable {
  bool matchesSearch(String query, List<String> searchTerms) {
    return searchTerms.any((term) => term.toLowerCase().contains(query.toLowerCase()));
  }
}

mixin TaskStatus {
  String status = "Pending";

  void setStatus(String newStatus) {
    status = newStatus;
    print("Task status changed to: $newStatus");
  }
}

mixin Prioritizable {
  String priority = "Medium";

  void setPriority(String newPriority) {
    priority = newPriority;
    print("Priority changed to: $newPriority");
  }
}

class Project with Notifiable, Searchable, Prioritizable {
  String name;
  String team;
  String dueDate;

  Project(this.name, this.team, this.dueDate);

  bool search(String query) {
    return matchesSearch(query, [name, team, dueDate]);
  }
}

class Task with Notifiable, Searchable, TaskStatus, Prioritizable {
  String title;
  String assignedTo;

  Task(this.title, this.assignedTo);

  bool search(String query) {
    return matchesSearch(query, [title, assignedTo, status, priority]);
  }
}

class Member with Searchable {
  String name;
  String role;

  Member(this.name, this.role);

  bool search(String query) {
    return matchesSearch(query, [name, role]);
  }
}

void main() {
  Project project = Project("SwiftHub Redesign", "Design Team", "2024-12-31");
  Task task = Task("Create UI Mockups", "Alexander Pierce");
  Member member = Member("Alexander Pierce", "UI Designer");

  project.sendNotification("Project deadline approaching!");
  task.setStatus("In Progress");
  task.setPriority("High");

  if (project.search("Redesign")) {
    print("Project found!");
  }

  if (task.search("UI")) {
    print("Task found!");
  }

  if (member.search("Pierce")) {
    print("Member found!");
  }

  project.displayNotifications();
}