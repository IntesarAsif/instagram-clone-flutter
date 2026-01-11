import 'package:get/get.dart';
import 'package:instagram_clone/features/profile/domain/models/profile_model.dart';
import 'package:instagram_clone/features/profile/domain/repositories/profile_repository.dart';

class ProfileController extends GetxController {
  ProfileController({required ProfileRepository profileRepository}) : _profileRepository = profileRepository;

  final ProfileRepository _profileRepository;

  ProfileModel profile = const ProfileModel(tabIcons: [], gridImages: []);

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  void loadProfile() {
    profile = _profileRepository.getProfile();
    update();
  }
}
