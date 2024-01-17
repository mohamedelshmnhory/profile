// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import '../language/bloc/language_cubit.dart' as _i15;
import '../language/repository/langauge_repository.dart' as _i6;
import '../../features/profile/data/datasources/local_data_source.dart' as _i7;
import '../../features/profile/data/repositories/user_profile_repository_imp.dart'
    as _i10;
import '../../features/profile/domain/repositories/user_profile_repository.dart'
    as _i9;
import '../../features/profile/domain/usecases/fetch_user_profile.dart' as _i13;
import '../../features/profile/domain/usecases/get_current_location.dart'
    as _i14;
import '../../features/profile/domain/usecases/save_user_profile.dart' as _i16;
import '../../features/profile/presentation/bloc/profile/profile_bloc.dart'
    as _i18;
import '../network/remote/api_service.dart' as _i3;
import '../utils/location_service.dart' as _i8;
import 'register_module.dart' as _i19;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.ApiService>(_i3.ApiService());
  gh.singleton<_i6.LanguageRepository>(_i6.LanguageRepository());
  gh.factory<_i7.LocalDataSource>(() => _i7.LocalDataSource());
  gh.factory<_i8.LocationService>(() => _i8.LocationService());
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.lazySingleton<_i9.UserProfileRepository>(
      () => _i10.UserProfileRepositoryImp(
            gh<_i7.LocalDataSource>(),
            gh<_i8.LocationService>(),
          ));
  gh.lazySingleton<_i12.Dio>(
      () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
  gh.factory<_i13.FetchUserProfile>(
      () => _i13.FetchUserProfile(gh<_i9.UserProfileRepository>()));
  gh.factory<_i14.GetCurrentLocation>(
      () => _i14.GetCurrentLocation(gh<_i9.UserProfileRepository>()));
  gh.singleton<_i15.LanguageCubit>(
      _i15.LanguageCubit(gh<_i6.LanguageRepository>()));
  gh.factory<_i16.SaveUserProfile>(
      () => _i16.SaveUserProfile(gh<_i9.UserProfileRepository>()));



  gh.singleton<_i18.ProfileBloc>(_i18.ProfileBloc(
    fetchUserProfile: gh<_i13.FetchUserProfile>(),
    saveUserProfile: gh<_i16.SaveUserProfile>(),
    getCurrentLocation: gh<_i14.GetCurrentLocation>(),
  ));
  return getIt;
}

class _$RegisterModule extends _i19.RegisterModule {}
