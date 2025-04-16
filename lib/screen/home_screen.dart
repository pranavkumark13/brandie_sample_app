import 'package:brandie_sample/screen/tabs/smart_post_tab.dart';
import 'package:brandie_sample/widgets/custom_icon_button.dart';
import 'package:brandie_sample/widgets/local_image.dart';
import 'package:brandie_sample/widgets/text_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 5,
                    top: 0,
                    bottom: 0,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        CustomIconButton(
                          label: 'Your Assistant',
                          icon: "./assets/images/ai.png",
                        ),
                        Positioned(
                          top: 10,
                          right: 4,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextView(
                              text: 'AI',
                              textColor: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: LocalImage(
                      path: "./assets/images/logo.png",
                      width: 150,
                      height: 100,
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 0,
                    bottom: 0,
                    child: CustomIconButton(
                      label: 'Camera',
                      icon: Icons.camera_alt,
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              unselectedLabelColor: const Color(0xff595959),
              labelColor: Colors.green,
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              tabs: _getTabs(),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  SmartPostTab(),
                  Center(child: Text('Content for Tab 2')),
                  Center(child: Text('Content for Tab 3')),
                  Center(child: Text('Content for Tab 4')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Tab> _getTabs() {
    List<Tab> tabs = [];
    List<String> features = [
      'Smart Post',
      'Library',
      'Communities',
      'Share&Win'
    ];
    for (var feature in features) {
      tabs.add(Tab(
        child: Text(
          feature,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ));
    }

    return tabs;
  }
}
