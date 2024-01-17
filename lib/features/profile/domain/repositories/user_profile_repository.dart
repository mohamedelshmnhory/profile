import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/location.dart';
import '../../data/models/user_profile.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, UserProfile>> getUserProfile();
  Future<Either<Failure, int>> saveUserProfile(UserProfile profile);
  Future<Either<Failure, Location>> getCurrentLocation();
}
