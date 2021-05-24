part of 'dashboard_cubit.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardSuccess extends DashboardState {}

class DashboardFailed extends DashboardState {
  final String msg;

  DashboardFailed(this.msg);
}

class GetUserData extends DashboardState {
  final LoginDataModel model;

  GetUserData({@required this.model});
}

class GetProfileData extends DashboardState {
  final ProfileDataModel model;

  GetProfileData({@required this.model});
}

class GetRecevieProfileData extends DashboardState {
  final ProfileDataModel model;

  GetRecevieProfileData({@required this.model});
}

class GetDonorsData extends DashboardState {
  final List<DonorDataModel> model;

  GetDonorsData({@required this.model});
}

class GetStoryData extends DashboardState {
  final List<DonorDataModel> model;

  GetStoryData({@required this.model});
}

class GetRequestData extends DashboardState {
  final List<RequestDataModel> model;

  GetRequestData({@required this.model});
}
