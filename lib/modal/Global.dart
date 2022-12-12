import 'dart:typed_data';

class Globle {
  static List Animals = [
    {
      "name": "Lion",
      "image":
          "https://images.unsplash.com/photo-1546182990-dffeafbe841d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
      "des":
          "Lions have strong, compact bodies and powerful forelegs, teeth and jaws for pulling down and killing prey. Their coats are yellow-gold, and adult males have shaggy manes that range in color from blond to reddish-brown to black. The length and color of a lion's mane is likely determined by age, genetics and hormones.",
    },
    {
      "name": "Elephant",
      "image":
          "https://images.unsplash.com/photo-1505148230895-d9a785a555fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZWxlcGhhbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60",
      "des":
          "Elephants are the largest existing land animals. Three living species are currently recognised: the African bush elephant, the African forest elephant, and the Asian elephant. They are the only surviving members of the family Elephantidae and the order Proboscidea."
    },
    {
      "name": "Rabbit",
      "image":
          "https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cmFiYml0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60",
      "des":
          "Rabbits are small, furry mammals with long ears, short fluffy tails, and strong, large hind legs. They have 2 pairs of sharp incisors (front teeth), one pair on top and one pair on the bottom. They also have 2 peg teeth behind the top incisors."
    },
    {
      "name": "Horse",
      "image":
          "https://images.unsplash.com/photo-1594069033313-8920df9150b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aG91cnNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60",
      "des":
          "Horses have oval-shaped hooves, long tails, short hair, long slender legs, muscular and deep torso build, long thick necks, and large elongated heads. The mane is a region of coarse hairs, which extends along the dorsal side of the neck in both domestic and wild species.",
    },
    {
      "name": "Bear",
      "image":
          "https://plus.unsplash.com/premium_photo-1664302930577-bfa333b6ae86?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmVhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
      "des":
          "Bears are mammals that belong to the family Ursidae. They can be as small as four feet long and about 60 pounds (the sun bear) to as big as eight feet long and more than a thousand pounds (the polar bear). They're found throughout North America, South America, Europe, and Asia.",
    },
    {
      "name": "Snake",
      "image":
          "https://plus.unsplash.com/premium_photo-1661897154120-5b27cd6a0bd5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c25ha2V8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60",
      "des":
          "snake, Any member of about 19 reptile families (suborder Serpentes, order Squamata) that has no limbs, voice, external ears, or eyelids, only one functional lung, and a long, slender body. About 2,900 snake species are known to exist, most living in the tropics. Their skin is covered with scales.",
    },
  ];
  static String animalDataTableName = "lion";
  static String animalDesc =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exer ?";
}

class AnimalDB {
  final String name;
  final String desc;
  final Uint8List image;

  AnimalDB({
    required this.name,
    required this.desc,
    required this.image,
  });

  factory AnimalDB.fromData(Map data) {
    return AnimalDB(
        name: data['name'], desc: data['description'], image: data['image']);
  }
}
