import 'package:instagram_clone/features/home/domain/models/home_image_model.dart';
import 'package:instagram_clone/features/home/domain/models/post_model.dart';
import 'package:instagram_clone/util/images.dart';

class HomeRepository {
  List<HomeImageModel> getImages() {
    return const [
      HomeImageModel(name: 'Abdul', imagePath: Images.dp1),
      HomeImageModel(name: 'Karim', imagePath: Images.dp2),
      HomeImageModel(name: 'Rahim', imagePath: Images.dp3),
      HomeImageModel(name: 'Hasan', imagePath: Images.dp4),
      HomeImageModel(name: 'Rakib', imagePath: Images.dp5),
    ];
  }

  List<PostModel> getPosts() {
    return const [
      PostModel(
        name: 'Abdul',
        posterImage: Images.dp1,
        postImages: [Images.post1, Images.post2, Images.post3],
        likes: '35.2K',
        comments: '120',
        reposts: '98',
        shares: '577',
      ),
      PostModel(
        name: 'Karim',
        posterImage: Images.dp2,
        postImages: [Images.post5],
        likes: '12.4K',
        comments: '45',
        reposts: '12',
        shares: '210',
      ),
      PostModel(
        name: 'Rahim',
        posterImage: Images.dp3,
        postImages: [Images.post6, Images.post7, Images.post8, Images.post9],
        likes: '9.8K',
        comments: '87',
        reposts: '33',
        shares: '146',
      ),
      PostModel(
        name: 'Hasan',
        posterImage: Images.dp4,
        postImages: [Images.post10, Images.post11],
        likes: '42.1K',
        comments: '301',
        reposts: '210',
        shares: '802',
      ),
      PostModel(
        name: 'Rakib',
        posterImage: Images.dp5,
        postImages: [Images.post12, Images.post13],
        likes: '18.7K',
        comments: '76',
        reposts: '54',
        shares: '390',
      ),
    ];
  }
}
