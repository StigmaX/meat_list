class Meat {
  String? name;
  String? image;
  String? description;

  Meat(this.name, this.image, this.description);
}

setMeat() {
  var meatList = [];
  meatList.add(Meat('Chicken', 'chicken.jpg', 'Soft Chicken Meat'));
  meatList.add(Meat('Beef', './images/meat.jpg', 'Soft Cow Meat'));
  return meatList;
}

getMeat() {
  var meatList = setMeat();
  return meatList;
}
