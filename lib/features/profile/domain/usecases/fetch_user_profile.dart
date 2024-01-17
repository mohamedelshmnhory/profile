import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/user_profile.dart';
import '../repositories/user_profile_repository.dart';


@injectable
class FetchUserProfile implements UseCase<UserProfile, NoParams> {
  final UserProfileRepository repository;

  const FetchUserProfile(this.repository);

  @override
  Future<Either<Failure, UserProfile>> call(NoParams params) async {
    return repository.getUserProfile();
  }
}
