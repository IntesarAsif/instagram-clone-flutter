import 'package:get/get.dart';
import 'package:instagram_clone/features/home/domain/models/home_image_model.dart';
import 'package:instagram_clone/features/home/domain/models/post_model.dart';
import 'package:instagram_clone/features/home/domain/repositories/home_repository.dart';

class HomeController extends GetxController {
  HomeController({required HomeRepository homeRepository}) : _homeRepository = homeRepository;

  final HomeRepository _homeRepository;

  List<HomeImageModel> images = [];
  List<PostModel> posts = [];

  @override
  void onInit() {
    super.onInit();
    loadImages();
    loadPosts();
  }

  void loadImages() {
    images = _homeRepository.getImages();
    update();
  }

  void loadPosts() {
    posts = _homeRepository.getPosts();
    update();
  }
}
