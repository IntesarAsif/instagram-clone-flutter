import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/common/widgets/custom_app_bar.dart';
import 'package:instagram_clone/features/home/widgets/story_widgets.dart';
import 'package:instagram_clone/features/profile/controllers/profile_controller.dart';
import 'package:instagram_clone/features/profile/widgets/profile_stats.dart';
import 'package:instagram_clone/util/dimensions.dart';
import 'package:instagram_clone/util/images.dart';
import 'package:instagram_clone/util/styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        if (controller.profile.tabIcons.isEmpty) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(child: CircularProgressIndicator(color: Colors.white)),
          );
        }

        return DefaultTabController(
          length: controller.profile.tabIcons.length,
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: CustomAppBar(
              backgroundColor: Colors.black,
              leading: const Icon(Icons.add, color: Colors.white, size: 30),
              centerTitle: true,
              title: Row(mainAxisSize: MainAxisSize.min, children: [
                Text('abdurrahman', style: robotoBold.copyWith(fontSize: 20, color: Colors.white)),
                const SizedBox(width: 4),
                const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white),
              ]),
              actions: [
                Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(children: [
                    Image.asset(Images.threads, width: 20),
                    SizedBox(width: Dimensions.paddingSizeDefault),
                    const Icon(Icons.menu_sharp, color: Colors.white, size: 28),
                  ]),
                ),
              ],
            ),

            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: Column(children: [

                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: Dimensions.paddingSizeDefault),
                      child: Column(children: [
                        ProfileStats(),
                        SizedBox(height: Dimensions.paddingSizeSmall),

                        Align(alignment: AlignmentDirectional.topStart,
                          child: Text(
                            'Action breeds confidence and courage. \nInaction breeds doubt and fear. \n#inspiration #motivation – Dale Carnegie',
                            style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: Dimensions.paddingSizeSmall),

                        Row(children: [
                          Image.asset(Images.threads, height: 14,),
                          SizedBox(width: Dimensions.paddingSizeExtraSmall),
                          Text('abdurrahman', style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault, color: Colors.white),)
                        ]),
                        SizedBox(height: Dimensions.paddingSizeSmall),

                        Row(children: [
                          Expanded(flex: 9, child: CustomButtonWidget(text: 'Edit Profile')),
                          SizedBox(width: Dimensions.paddingSizeSmall),

                          Expanded(flex: 9, child: CustomButtonWidget(text: 'Share Profile')),
                          SizedBox(width: Dimensions.paddingSizeExtraSmall),

                          Expanded(flex: 2, child: CustomButtonWidget(icon: Images.addPeople, isIconOnly: true)),
                        ]),

                      ])
                    ),
                    SizedBox(height: Dimensions.paddingSizeSmall),

                    StoryWidgets(
                      containerHeight: 70,
                      containerWidth: 70,
                      imageWidth: 73,
                      imageHeight: 73,
                      listHeight: 110,
                      includeAddNew: true,
                    ),
                    SizedBox(height: Dimensions.paddingSizeSmall),
                  ]),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: TabBarHeader(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                    tabBar: TabBar(
                      indicator: const BoxDecoration(),
                      padding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.zero,
                      indicatorPadding: EdgeInsets.zero,
                      tabs: controller.profile.tabIcons.map((icon) => Tab(icon: Image.asset(icon, width: 22, height: 22, color: Colors.white))).toList(),
                    ),
                  ),
                ),
              ],
              body: TabBarView(
                children: [
                  buildGrid(controller.profile.gridImages),
                  buildGrid(controller.profile.gridImages),
                  buildGrid(controller.profile.gridImages),
                  buildGrid(controller.profile.gridImages),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildGrid(List<String> images) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 180,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        final imagePath = images[index % images.length];
        return Image.asset(imagePath, fit: BoxFit.cover);
      },
    );
  }
}

class TabBarHeader extends SliverPersistentHeaderDelegate {
  TabBarHeader({required this.tabBar, required this.padding});

  final TabBar tabBar;
  final EdgeInsets padding;

  @override
  double get minExtent => tabBar.preferredSize.height + padding.vertical;

  @override
  double get maxExtent => tabBar.preferredSize.height + padding.vertical;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.black, padding: padding, child: tabBar);
  }

  @override
  bool shouldRebuild(covariant TabBarHeader oldDelegate) {
    return oldDelegate.tabBar != tabBar || oldDelegate.padding != padding;
  }
}



class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final String? icon;
  final bool isIconOnly;

  const CustomButtonWidget({super.key, this.text = '', this.onTap, this.backgroundColor, this.textColor, this.fontSize, this.icon, this.isIconOnly = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: backgroundColor ?? const Color(0xFF2b3036), borderRadius: BorderRadius.circular(7)),
        padding: isIconOnly
            ? EdgeInsets.all(Dimensions.paddingSizeExtraSmall)
            : EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraOverLarge, vertical: Dimensions.paddingSizeExtraSmall),
        child: Center(child: isIconOnly && icon != null
              ? Image.asset(icon!, height: 16)
              : Text(text, textAlign: TextAlign.center, style: robotoMedium.copyWith(fontSize: fontSize ?? Dimensions.fontSizeDefault, color: textColor ?? Colors.white)),
        ),
      ),
    );
  }
}
