// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import 'bloc/auth/auth_cubit.dart' as _i8;
import 'bloc/dashboard/dashboard_cubit.dart' as _i15;
import 'bloc/login/login_cubit.dart' as _i14;
import 'model/dynamic_data/user_dynamic_details.dart' as _i5;
import 'services/api/dashboard_api.dart' as _i13;
import 'services/api/login_api.dart' as _i11;
import 'services/api/user_api.dart' as _i7;
import 'services/core/base_url.dart' as _i3;
import 'services/core/register_module.dart' as _i16;
import 'services/repo/dashboard_repo.dart' as _i12;
import 'services/repo/login_repo.dart' as _i10;
import 'services/repo/user_repo.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i5.UserDynamicData>(() => _i5.UserDynamicData());
  gh.factory<_i6.UserRepo>(
      () => _i7.UserApi(preferences: get<_i4.SharedPreferences>()));
  gh.factory<_i8.AuthCubit>(() => _i8.AuthCubit(userRepo: get<_i6.UserRepo>()));
  gh.lazySingleton<_i9.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i10.LoginRepo>(() => _i11.LoginApi(
      preferences: get<_i4.SharedPreferences>(), dio: get<_i9.Dio>()));
  gh.factory<_i12.DashboardRepo>(() => _i13.DashboardApi(
      dio: get<_i9.Dio>(), preferences: get<_i4.SharedPreferences>()));
  gh.factory<_i14.LoginCubit>(
      () => _i14.LoginCubit(loginRepo: get<_i10.LoginRepo>()));
  gh.factory<_i15.DashboardCubit>(() => _i15.DashboardCubit(
      dashboardRepo: get<_i12.DashboardRepo>(),
      loginRepo: get<_i10.LoginRepo>()));
  return get;
}

class _$RegisterModule extends _i16.RegisterModule {}
