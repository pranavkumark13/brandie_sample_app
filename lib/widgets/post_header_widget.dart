import 'package:brandie_sample/model/post.dart';
import 'package:brandie_sample/viewmodel/smart_post_viewmodel.dart';
import 'package:brandie_sample/widgets/circular_local_image.dart';
import 'package:brandie_sample/widgets/local_image.dart';
import 'package:brandie_sample/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostHeaderWidget extends StatefulWidget {
  Post post;
  PostHeaderWidget({super.key, required this.post});

  @override
  State<PostHeaderWidget> createState() => _PostHeaderWidgetState();
}

class _PostHeaderWidgetState extends State<PostHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SmartPostViewmodel>(
      builder: (context, viewModel, child) {
        return Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, top: 20),
              child: CircularLocalImage(
                path: widget.post.profileImage ?? Icons.account_circle,
                width: 55,
                height: 55,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 4, bottom: 4),
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.pink[100]!,
                        Colors.pink[500]!,
                        Colors.pink[100]!,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      LocalImage(
                        path: './assets/images/ready_icon.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextView(
                        text: "Ready to share",
                        textColor: Colors.white,
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
                TextView(
                  text: "High-converting in Oriflame Community",
                  textColor: Colors.white,
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                )
              ],
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextView(
                text:
                    '${widget.post.currentPhoto} of ${widget.post.images.length}',
                textColor: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 10,
              ),
            ),
          ],
        );
      },
    );
  }
}
