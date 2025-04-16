import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brandie_sample/model/post.dart';
import 'package:brandie_sample/viewmodel/smart_post_viewmodel.dart';
import 'package:brandie_sample/widgets/local_image.dart';
import 'package:brandie_sample/widgets/post_header_widget.dart';
import 'package:brandie_sample/widgets/social_icon.dart';
import 'package:brandie_sample/widgets/text_view.dart';
import 'package:brandie_sample/screen/edit_post_screen.dart';

class PostListItem extends StatefulWidget {
  final Post post;
  const PostListItem({super.key, required this.post});

  @override
  State<PostListItem> createState() => _PostListItemState();
}

class _PostListItemState extends State<PostListItem> {
  List<String> quickShareOptions = [
    "./assets/images/instagram.png",
    "./assets/images/instagram_story.png",
    "./assets/images/facebook.png",
    "./assets/images/facebook_story.png",
    "./assets/images/messenger.png",
    "./assets/images/tiktok.png",
    "./assets/images/whatsapp.png",
    "./assets/images/whatsapp_business.png",
    "./assets/images/telegram.png",
    "./assets/images/email.png",
    "./assets/images/telegram_2.png"
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Consumer<SmartPostViewmodel>(
      builder: (context, viewModel, child) {
        return SizedBox(
          height: height / 1.4,
          child: Stack(
            children: [
              PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.post.images.length,
                onPageChanged: (index) {
                  viewModel.setCurrentPage(widget.post, index + 1);
                },
                itemBuilder: (context, index) {
                  return LocalImage(
                    path: widget.post.images[index],
                    width: MediaQuery.of(context).size.width,
                    height: height,
                    boxFit: BoxFit.fill,
                  );
                },
              ),
              Positioned(
                top: 120,
                right: 10,
                child: Column(
                  children: List.generate(
                    widget.post.images.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 3),
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        color: widget.post.currentPhoto - 1 == index
                            ? Colors.white
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: PostHeaderWidget(post: widget.post),
              ),
              Positioned(
                bottom: 20,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.post.trackName != null)
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.music_note, color: Colors.white),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Wrap(
                                children: [
                                  const Text("Recommended: ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                  Text(
                                    widget.post.trackName!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    " by ${widget.post.sungBy ?? ""}",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 8),
                    if (widget.post.caption != null)
                      GestureDetector(
                        onTap: () {
                          viewModel.expandPost(widget.post);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: !widget.post.isPostExpanded
                                    ? (widget.post.caption!.length > 100
                                        ? '${widget.post.caption!.substring(0, 100)}...'
                                        : widget.post.caption!)
                                    : widget.post.caption!,
                                textColor: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                              if (widget.post.isPostExpanded)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditPostScreen(post: widget.post),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        const Icon(Icons.edit,
                                            color: Colors.white, size: 18),
                                        const SizedBox(width: 5),
                                        TextView(
                                          text: "Edit Caption",
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        TextView(
                          text: "Quick Share to: ",
                          textColor: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: quickShareOptions.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: SocialIcon(
                                    path: quickShareOptions[index],
                                    width: 30,
                                    height: 30,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
