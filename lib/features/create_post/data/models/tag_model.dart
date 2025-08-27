class TagModel {
  final int id;
  final String name;

  TagModel({required this.id, required this.name});
  
  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
