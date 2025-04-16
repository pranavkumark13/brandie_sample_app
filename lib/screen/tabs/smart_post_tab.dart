import 'package:brandie_sample/viewmodel/smart_post_viewmodel.dart';
import 'package:brandie_sample/widgets/post_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SmartPostTab extends StatefulWidget {
  const SmartPostTab({super.key});

  @override
  State<SmartPostTab> createState() => _SmartPostTabState();
}

class _SmartPostTabState extends State<SmartPostTab> {
  late SmartPostViewmodel _viewmodel;

  @override
  void initState() {
    super.initState();
    _viewmodel = Provider.of<SmartPostViewmodel>(context, listen: false);
    _viewmodel.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SmartPostViewmodel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: viewModel.smartPosts.length,
          itemBuilder: (context, index) {
            return Container(
                margin: index != 0 && index != viewModel.smartPosts.length
                    ? const EdgeInsets.only(top: 20)
                    : const EdgeInsets.only(top: 0),
                child: PostListItem(post: viewModel.smartPosts[index]));
          },
        );
      },
    );
  }
}
