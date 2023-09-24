class Meat {
  String? name;
  String? image;
  String? description;

  Meat(this.name, this.image, this.description);
}

class MeatOperation {
  var meatList = [];
  void setMeat() {
    meatList.add(Meat('Chicken', 'chicken.jpg', 'Soft Chicken Meat'));
    meatList.add(Meat('Beef', './images/meat.jpg', 'Soft Cow Meat'));
    meatList.add(Meat('Beef', './images/meat.jpg', 'Soft Cow Meat'));
    meatList.add(Meat('Ribs', './images/meat.jpg', 'Soft Cow Meat'));
  }

  void addMeat(name, image, desc) {
    meatList.add(Meat(name, image, desc));
  }

  List getMeat() {
    return meatList;
  }
}
