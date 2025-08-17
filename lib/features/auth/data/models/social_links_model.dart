class SocialLinksModel {
  final int id;
  final String name;
  final String link;

  SocialLinksModel({required this.id, required this.name, required this.link});
  
  Map<String, dynamic> toJson() {
    return {
    'id':id,
    'name':name,
    'link':link,
    };
  }
}
