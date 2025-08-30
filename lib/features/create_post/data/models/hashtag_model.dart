class HashtagModel {
  final List<int> hashId;        // 🔹 مصفوفة IDs
  final List<String> newHashtags; // 🔹 مصفوفة أسماء الهاشتاغات الجديدة

  HashtagModel({
    required this.hashId,
    required this.newHashtags,
  });

  factory HashtagModel.fromJson(Map<String, dynamic> json) {
    return HashtagModel(
      hashId: List<int>.from(json['hash_ids'] ?? []),
      newHashtags: List<String>.from(json['new_hashtags'] ?? []),
    );
  }
}
