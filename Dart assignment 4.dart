import 'dart:io';
abstract class Printable {
  void printInfo();
}
class Animal {
  String name;

  Animal(this.name);

  void makeSound() {
    print("Animal sound");
  }
class Dog extends Animal implements Printable {
  String breed;

  Dog(String name, this.breed) : super(name);

  @override
  void makeSound() {
    print("Woof!");
  }

  @override
  void printInfo() {
    print("Name: $name, Breed: $breed");
  }
}
List<Dog> initializeDogsFromFile(String filePath) {
  List<Dog> dogs = [];
  File file = File(filePath);
  List<String> lines = file.readAsLinesSync();

  for (String line in lines) {
    List<String> data = line.split(',');
    String name = data[0];
    String breed = data[1];
    dogs.add(Dog(name, breed));
  }

  return dogs;
}
void printDogInfo(List<Dog> dogs) {
  for (Dog dog in dogs) {
    dog.printInfo();
  }
}

void main() {
    List<Dog> dogs = initializeDogsFromFile("dogs.txt");

  printDogInfo(dogs);
}
