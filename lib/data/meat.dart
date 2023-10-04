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
