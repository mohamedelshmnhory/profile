import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/user_profile.dart';
import '../repositories/user_profile_repository.dart';


@injectable
class SaveUserProfile implements UseCase<int, SaveUserParams> {
  final UserProfileRepository repository;

  const SaveUserProfile(this.repository);

  @override
  Future<Either<Failure, int>> call(SaveUserParams params) async {
    return repository.saveUserProfile(params.profile);
  }
}

class SaveUserParams extends Equatable {
  final UserProfile profile;

  const SaveUserParams({required this.profile});

  @override
  List<Object> get props => [profile];
}
