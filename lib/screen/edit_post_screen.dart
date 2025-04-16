import 'package:brandie_sample/model/post.dart';
import 'package:brandie_sample/viewmodel/smart_post_viewmodel.dart';
import 'package:brandie_sample/widgets/custom_button.dart';
import 'package:brandie_sample/widgets/text_view.dart';
import 'package:brandie_sample/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPostScreen extends StatefulWidget {
  Post post;
  EditPostScreen({super.key, required this.post});

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  final TextEditingController _captionController = TextEditingController();
  late SmartPostViewmodel _viewmodel;
  late String _originalCaption;
  bool _hasChanged = false;

  @override
  void initState() {
    super.initState();
    _viewmodel = Provider.of<SmartPostViewmodel>(context, listen: false);
    _originalCaption = widget.post.caption ?? "";
    _captionController.text = _originalCaption;

    _captionController.addListener(() {
      final currentCaption = _captionController.text;
      final changed = currentCaption != _originalCaption;
      if (changed != _hasChanged) {
        setState(() {
          _hasChanged = changed;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _captionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        title: TextView(
          text: "Edit Caption",
          textColor: const Color(0xff2D2D2D),
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CustomButton(
              title: 'Save',
              onTap: _hasChanged
                  ? () {
                      _editPost(widget.post.id, _captionController.text);
                    }
                  : null, // Disables if no changes
              isDisabled: !_hasChanged, // Disable if no changes are made
            ),
          ),
        ],
      ),
      body: TextField(
        maxLines: 100,
        controller: _captionController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  void _editPost(int id, String newCaption) {
    if (newCaption.isEmpty) {
      showToast("Caption cannot be empty while editing");
    } else {
      bool res = _viewmodel.editPost(id, newCaption);
      if (res) {
        Navigator.pop(context);
      } else {
        showToast("Unable to edit caption. Try again.");
      }
    }
  }
}
