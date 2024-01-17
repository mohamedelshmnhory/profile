import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:profile/features/profile/data/models/user_profile.dart';
import 'package:profile/features/profile/domain/usecases/get_current_location.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../data/models/location.dart';
import '../../../domain/usecases/fetch_user_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/save_user_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@Singleton()
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FetchUserProfile fetchUserProfile;
  final SaveUserProfile saveUserProfile;
  final GetCurrentLocation getCurrentLocation;

  ProfileBloc({required this.fetchUserProfile, required this.saveUserProfile, required this.getCurrentLocation})
      : super(ProfileInitial()) {
    on<FetchUserProfileEvent>(_onFetchUserProfileEvent);
    on<SaveUserProfileEvent>(_onSaveUserProfileEvent);
    on<GetCurrentLocationEvent>(_onGetCurrentLocationEvent);
  }

  void _onFetchUserProfileEvent(
    FetchUserProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final failureOrProfile = await fetchUserProfile(NoParams());
    failureOrProfile.fold(
      (failure) => emit(const ProfileError(message: 'Failed to fetch user profile')),
      (profile) => emit(ProfileLoaded(user: profile)),
    );
  }

  void _onSaveUserProfileEvent(
    SaveUserProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final failureOrProfile = await saveUserProfile(SaveUserParams(profile: event.profile));
    failureOrProfile.fold(
      (failure) => emit(const ProfileError(message: 'Failed to save user profile')),
      (profile) => emit(ProfileSaved(user: event.profile)),
    );
  }

  void _onGetCurrentLocationEvent(
    GetCurrentLocationEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final failureOrLocation = await getCurrentLocation(NoParams());
    failureOrLocation.fold(
      (failure) => emit(const ProfileError(message: 'Failed to fetch current location')),
      (location) => emit(LocationLoaded(location: location)),
    );
  }
}
