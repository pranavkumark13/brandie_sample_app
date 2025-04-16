import 'package:brandie_sample/model/post.dart';

class SmartPostService {
  Future<List<Post>> getSmartPosts() async {
    List<String> images = [
      "./assets/images/post_1.png",
      "./assets/images/post_2.png",
      "./assets/images/post_3.png"
    ];
    String profileImage = "./assets/images/user.png";
    String trackName = "Unstoppable";
    String sungBy = "Sia";
    String caption =
        "✨ Experience the elegance of Eclat Amour—a fragrance that captures the essence of romance and sophistication. Let every spritz wrap you in timeless charm and effortless allure. 💕 #EclatAmour #TimelessElegance\nUse my referral code: UK-AMANDA3012\nUse my referral link: www.oriflame.com/giordani/amada3012";
    List<Post> posts = [
      Post(
          id: 1,
          images: images,
          profileImage: profileImage,
          trackName: trackName,
          sungBy: sungBy,
          caption: caption),
      Post(id: 2, images: images, profileImage: profileImage, caption: caption),
      Post(id: 3, images: images, trackName: trackName, sungBy: sungBy),
      Post(
          id: 4,
          images: images,
          profileImage: profileImage,
          trackName: trackName,
          sungBy: sungBy,
          caption: caption),
      Post(
          id: 5,
          images: images,
          profileImage: profileImage,
          trackName: trackName,
          sungBy: sungBy,
          caption: caption),
      Post(
          id: 6,
          images: images,
          profileImage: profileImage,
          trackName: trackName,
          sungBy: sungBy,
          caption: caption),
      Post(
          id: 7,
          images: images,
          profileImage: profileImage,
          trackName: trackName,
          sungBy: sungBy,
          caption: caption),
      Post(
          id: 8,
          images: images,
          profileImage: profileImage,
          trackName: trackName,
          sungBy: sungBy,
          caption: caption),
      Post(
          id: 9,
          images: images,
          profileImage: profileImage,
          trackName: trackName,
          sungBy: sungBy,
          caption: caption),
      Post(
          id: 10,
          images: images,
          profileImage: profileImage,
          trackName: trackName,
          sungBy: sungBy,
          caption: caption),
    ];

    return posts;
  }
}
