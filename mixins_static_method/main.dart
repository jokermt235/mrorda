//  Static method to display user info
class UserInfo {
  static void displayInfo(String name, int age) {
    print("User: $name, Age: $age");
  }
}

// Mixin to show job details
mixin JobDetails {
  void showJobDetails(String job) {
    print("Job: $job");
  }
}

// Mixin to show hobby details
mixin HobbyDetails {
  void showHobbyDetails(String hobby) {
    print("Hobby: $hobby");
  }
}

// Class that uses both mixins
class Person with JobDetails, HobbyDetails {
  String name;

  Person(this.name);

  void showDetails(String job, String hobby) {
    print("Details of $name:");
    showJobDetails(job);
    showHobbyDetails(hobby);
  }
}

// creating user info
void main() {
  
  var person = Person("Aichurok");

  
  person.showDetails("Teacher", "Korean language");

  // Static method 
  UserInfo.displayInfo("Aichurok", 20); 
  
   var person2 = Person("Milana");

  
  person2.showDetails("Philology ", "Sleeping");

  // Static method
  UserInfo.displayInfo("Milana", 19); 
}