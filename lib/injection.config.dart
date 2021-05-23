// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import 'bloc/auth/auth_cubit.dart' as _i7;
import 'bloc/login/login_cubit.dart' as _i11;
import 'services/api/login_api.dart' as _i10;
import 'services/api/user_api.dart' as _i6;
import 'services/core/base_url.dart' as _i3;
import 'services/core/register_module.dart' as _i12;
import 'services/repo/login_repo.dart' as _i9;
import 'services/repo/user_repo.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.BaseUrl>(() => _i3.BaseUrl());
  await gh.factoryAsync<_i4.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.factory<String>(() => registerModule.baseUrl, instanceName: 'BaseUrl');
  gh.factory<_i5.UserRepo>(
      () => _i6.UserApi(preferences: get<_i4.SharedPreferences>()));
  gh.factory<_i7.AuthCubit>(() => _i7.AuthCubit(userRepo: get<_i5.UserRepo>()));
  gh.lazySingleton<_i8.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i9.LoginRepo>(() => _i10.LoginApi(
      preferences: get<_i4.SharedPreferences>(), dio: get<_i8.Dio>()));
  gh.factory<_i11.LoginCubit>(
      () => _i11.LoginCubit(loginRepo: get<_i9.LoginRepo>()));
  return get;
}

class _$RegisterModule extends _i12.RegisterModule {}
