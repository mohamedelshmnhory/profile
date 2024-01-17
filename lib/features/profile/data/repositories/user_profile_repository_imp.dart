import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/location_service.dart';
import '../../domain/repositories/user_profile_repository.dart';
import '../datasources/local_data_source.dart';
import '../models/location.dart';
import '../models/user_profile.dart';

@LazySingleton(as: UserProfileRepository)
class UserProfileRepositoryImp implements UserProfileRepository {
  final LocalDataSource _localDataSource;
  final LocationService _locationService;

  UserProfileRepositoryImp(this._localDataSource, this._locationService);

  @override
  Future<Either<Failure, UserProfile>> getUserProfile() async {
    final userProfile = await _localDataSource.getUserProfile();
    if (userProfile != null) {
      return Right(userProfile);
    }
    return Left(CacheFailure());
  }

  @override
  Future<Either<Failure, int>> saveUserProfile(UserProfile profile) async {
    try {
      final id = await _localDataSource.saveUserProfile(profile);
      return Right(id);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Location>> getCurrentLocation() async {
    final location = await _locationService.getCurrentLocation();
    if (location != null) {
      return Right(location);
    } else {
      return Left(ServerFailure());
    }
  }
}
