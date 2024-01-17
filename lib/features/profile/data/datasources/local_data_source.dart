import 'package:injectable/injectable.dart';
import 'package:profile/core/utils/db.dart';

import '../../../../core/enums/db_boxes.dart';
import '../models/user_profile.dart';

@injectable
class LocalDataSource {
  late DbManager dbManager;

  Future<void> _openBox() async {
    dbManager = await DbManager.init(HiveBoxes.profile);
  }

  Future<UserProfile?> getUserProfile() async {
    await _openBox();

    try {
      final list = await dbManager.getAll();
      if (list.isNotEmpty) {
        return UserProfile.fromJson(list.last);
      }
    } catch (e) {
      throw Exception('Error getting user profile: $e');
    }

    return null;
  }

  Future<int> saveUserProfile(UserProfile profile) async {
    await _openBox();

    try {
      return await dbManager.add(profile.toJson());
    } catch (e) {
      throw Exception('Error saving user profile: $e');
    }
  }
}
