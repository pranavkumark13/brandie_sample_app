class Post {
  int id;
  List<String> images;
  String? profileImage;
  String? trackName;
  String? sungBy;
  String? caption;
  bool isPostExpanded;
  int currentPhoto;

  Post({
    required this.id,
    required this.images,
    this.profileImage,
    this.trackName,
    this.sungBy,
    this.caption,
    this.isPostExpanded = false,
    this.currentPhoto = 1,
  });
}
