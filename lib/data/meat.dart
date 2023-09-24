class _Meat {
  String? name;
  String? image;
  String? description;

  _Meat(this.name, this.image, this.description);
}

setMeat() {
  var meatList = [];
  meatList.add(_Meat('Chicken', 'chicken.jpg', 'Soft Chicken Meat'));
  meatList.add(_Meat('Beef', 'beef.jpg', 'Soft Cow Meat'));
  return meatList;
}

getMeat() {
  var meatList = setMeat();
  return meatList;
}
