import 'package:instagram_clone/features/profile/domain/models/profile_model.dart';
import 'package:instagram_clone/util/images.dart';

class ProfileRepository {
  ProfileModel getProfile() {
    return const ProfileModel(
      tabIcons: [
        Images.grid,
        Images.reels,
        Images.repost,
        Images.tagged,
      ],
      gridImages: [
        Images.post1,
        Images.post2,
        Images.post3,
        Images.post5,
        Images.post6,
        Images.post7,
        Images.post8,
        Images.post9,
        Images.post10,
        Images.post11,
        Images.post12,
        Images.post13,
      ],
    );
  }
}
