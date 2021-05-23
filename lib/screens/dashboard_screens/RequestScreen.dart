import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lifeshare/bloc/dashboard/dashboard_cubit.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/model/dashboard_model/donor_data_model.dart';
import 'package:lifeshare/model/dashboard_model/request_data.model.dart';
import 'package:lifeshare/screens/dashboard_screens/widgets/PostCard.dart';
import 'package:lifeshare/widgets/loading.dart';

class RequestScreen extends StatefulWidget {
  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  List<RequestDataModel> _model;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardCubit>(context).getRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: nearlyWhite,
        body: BlocConsumer<DashboardCubit, DashboardState>(
            listener: (context, state) {
          if (state is GetRequestData) {
            _model = state.model;
          }
        }, builder: (context, state) {
          if (_model != null)
            return ListView.builder(
                itemCount: _model.length,
                itemBuilder: (context, index) {
                  return PostCard(
                    name: _model[index].receiverId.name,
                    avatar: _model[index].receiverId.avatar,
                    location: _model[index].receiverId.address.city,
                    bloodtype: _model[index].receiverId.bloodGroup ?? 'o',
                    phonenumber: "+91${_model[index].receiverId.mobile}",
                  );
                });
          else
            return Center(
              child: SmallLoading(),
            );
        }));
  }
}
