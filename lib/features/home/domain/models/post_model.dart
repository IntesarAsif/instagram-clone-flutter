class PostModel {
  const PostModel({
    required this.name,
    required this.posterImage,
    required this.postImages,
    required this.likes,
    required this.comments,
    required this.reposts,
    required this.shares,
  });

  final String name;
  final String posterImage;
  final List<String> postImages;
  final String likes;
  final String comments;
  final String reposts;
  final String shares;
}
