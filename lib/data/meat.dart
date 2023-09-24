class Meat {
  String? name;
  String? image;
  String? description;

  Meat(this.name, this.image, this.description);
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
