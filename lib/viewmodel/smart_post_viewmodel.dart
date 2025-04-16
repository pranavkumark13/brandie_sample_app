import 'package:brandie_sample/model/post.dart';
import 'package:brandie_sample/service/smart_post_service.dart';
import 'package:flutter/material.dart';

class SmartPostViewmodel extends ChangeNotifier {
  List<Post> smartPosts = [];
  bool isLoading = false;

  Future<void> getPosts() async {
    isLoading = true;
    List<Post> posts = await SmartPostService().getSmartPosts();
    smartPosts.addAll(posts);
    isLoading = false;
    notifyListeners();
  }

  void expandPost(Post post) {
    post.isPostExpanded = !post.isPostExpanded;
    notifyListeners();
  }

  void setCurrentPage(Post post, int index) {
    post.currentPhoto = index;
    notifyListeners();
  }

  bool editPost(int id, String caption) {
    int index = smartPosts.indexWhere((post) => post.id == id);
    if (index != -1) {
      smartPosts[index].caption = caption;
      notifyListeners();
      return true;
    }
    return false;
  }
}
