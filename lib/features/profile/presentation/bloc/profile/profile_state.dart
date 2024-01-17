part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoaded extends ProfileState {
  final UserProfile user;
  const ProfileLoaded({required this.user});

  @override
  List<Object?> get props => [user];
}



class ProfileSaved extends ProfileState {
  final UserProfile user;
  const ProfileSaved({required this.user});

  @override
  List<Object?> get props => [user];
}

class ProfileError extends ProfileState {
  final String message;
  const ProfileError({required this.message});

  @override
  List<Object?> get props => [message];
}


class LocationLoaded extends ProfileState {
  final Location location;
  const LocationLoaded({required this.location});

  @override
  List<Object?> get props => [location];
}
