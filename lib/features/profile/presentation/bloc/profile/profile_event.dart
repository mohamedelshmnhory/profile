part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class FetchUserProfileEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}


class SaveUserProfileEvent extends ProfileEvent {
  final UserProfile profile;

  const SaveUserProfileEvent(this.profile);

  @override
  List<Object> get props => [profile];
}

class GetCurrentLocationEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}