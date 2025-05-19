// Static Method Example
class Coach {
  static String? teamAdvice;

  static void setTeamAdvice(String advice) {
    teamAdvice = advice;
  }

  static String getTeamAdvice() {
    return teamAdvice ?? "No advice yet.";
  }
}

// A class to represent Players
class Player {
  String? _name;

  void set name(String name) => _name = name;
  String get name => _name!;

  // Basic player skill
  void showSkills() {
    print("$name is showing great skills!");
  }
}

// A mixin that adds defensive skills to the player
mixin DefensiveSkills on Player {
  void performDefense() {
    print("$name is playing defense!");
  }
}

// A mixin that adds attacking skills to the player
mixin AttackingSkills on Player {
  void performAttack() {
    print("$name is attacking the opponent!");
  }
}

// A class for a Team that can add players
class Team {
  String teamName;
  List<Player> players = [];

  Team(this.teamName);

  void addPlayer(Player player) {
    players.add(player);
  }

  void listPlayers() {
    print("Players in $teamName:");
    for (var player in players) {
      print(player.name);
    }
  }
}

// A player that can be both offensive and defensive
class AllRoundPlayer extends Player with DefensiveSkills, AttackingSkills {
  AllRoundPlayer(String name) {
    this.name = name;
  }
}

void main() {
  // Setting static method in Coach class
  Coach.setTeamAdvice("Focus on teamwork and communication!");

  // Getting static advice from the Coach
  print("Coach's advice: ${Coach.getTeamAdvice()}");

  // Creating Players
  AllRoundPlayer p1 = AllRoundPlayer("John");
  AllRoundPlayer p2 = AllRoundPlayer("Alice");

  p1.showSkills(); // Skill method from Player
  p1.performDefense();  // Defense method from DefensiveSkills
  p1.performAttack();   // Attack method from AttackingSkills

  // Creating Team and adding players
  Team team = Team("Dream Team");
  team.addPlayer(p1);
  team.addPlayer(p2);

  // Listing players in the team
  team.listPlayers();
}
