class Person {
  String name;
  int age;
  String gender;
  
  Person(String name, int age, String gender) {
    this.name = name;
    this.age = age;
    this.gender = gender;
  }
  
  void showName() {
    println("Naam: " + name);
  }
  
  void showAge() {
    println("Leeftijd: " + age);
  }
}

void setup() {
  Person person1 = new Person("IK", 17, "M");
  Person person2 = new Person("NIET IK", 22, "V");
  
  println("Persoon 1:");
  person1.showName();
  person1.showAge();
  println("\nPersoon 2:");
  person2.showName();
  person2.showAge();
}
