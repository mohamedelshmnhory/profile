import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/location.dart';
import '../repositories/user_profile_repository.dart';


@injectable
class GetCurrentLocation implements UseCase<Location, NoParams> {
  final UserProfileRepository repository;

  const GetCurrentLocation(this.repository);

  @override
  Future<Either<Failure, Location>> call(NoParams params) async {
    return repository.getCurrentLocation();
  }
}
