class Meat {
  String name;
  String image;
  String description;

  Meat({required this.name, required this.image, required this.description});

  factory Meat.fromJson(Map<String, dynamic> json) {
    return Meat(
        name: json['name'],
        image: json['image'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
    };
  }
}

class MeatOperation {
  static final MeatOperation _meatOperation = MeatOperation._internal();
  factory MeatOperation() {
    return _meatOperation;
  }
  MeatOperation._internal();
  var meatList = [];

  void addMeat(Meat meat) {
    meatList.add(meat);
  }

  void removeMeat(Meat meat) {
    meatList.remove(meat);
  }

  void editMeat(Meat meat, int index) {
    meatList[index] = meat;
  }

  List getMeat() {
    return meatList;
  }
}
