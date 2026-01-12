import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/features/home/controllers/home_controller.dart';
import 'package:instagram_clone/util/dimensions.dart';

class StorySection extends StatefulWidget {

  final double? containerHeight;
  final double? containerWidth;
  final double? imageHeight;
  final double? imageWidth;
  final double? listHeight;
  final bool includeAddNew;
  final String addNewLabel;
  const StorySection({
    super.key,
    this.containerHeight = 90,
    this.containerWidth = 90,
    this.imageHeight = 85,
    this.imageWidth = 85,
    this.listHeight = 150,
    this.includeAddNew = false,
    this.addNewLabel = 'New',
  });

  @override
  State<StorySection> createState() => _StorySectionState();
}

class _StorySectionState extends State<StorySection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SizedBox(
          height: widget.listHeight,
          child: ListView.builder(
            padding: EdgeInsets.only(left: Dimensions.paddingSizeSmall),
            scrollDirection: Axis.horizontal,
            itemCount: controller.images.length + (widget.includeAddNew ? 1 : 0),
            itemBuilder: (context, index) {
              if (widget.includeAddNew && index == 0) {
                return Container(
                  margin: const EdgeInsets.only(right: Dimensions.paddingSizeDefault),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
                    Container(
                      width: widget.containerWidth,
                      height: widget.containerHeight,
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                      child: const Center(child: Icon(Icons.add, color: Colors.white, size: 30)),
                    ),
                    SizedBox(height: Dimensions.paddingSizeExtraSmall),

                    Text(widget.addNewLabel, style: const TextStyle(color: Colors.white, fontSize: 12)),
                  ]),
                );
              }

              final int imageIndex = widget.includeAddNew ? index - 1 : index;
              final item = controller.images[imageIndex];

              return Container(
                margin: const EdgeInsets.only(right: Dimensions.paddingSizeDefault),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [

                  Stack(alignment: Alignment.center, children: [

                    Container(
                      width: widget.containerWidth,
                      height: widget.containerHeight,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFFFEDA75), Color(0xFFFA7E1E), Color(0xFFD62976), Color(0xFF962FBF), Color(0xFF4F5BD5)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),

                    Container(
                      width: widget.imageWidth,
                      height: widget.imageHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage(item.imagePath), fit: BoxFit.cover),
                      ),
                    ),
                  ]),
                  SizedBox(height: Dimensions.paddingSizeExtraSmall),

                  Text(item.name, style: const TextStyle(color: Colors.white, fontSize: 12)),

                ]),
              );
            },
          ),
        );
      },
    );
  }
}
