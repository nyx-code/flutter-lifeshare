import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lifeshare/bloc/dashboard/dashboard_cubit.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/model/dashboard_model/donor_data_model.dart';
import 'package:lifeshare/screens/dashboard_screens/widgets/PostCard.dart';
import 'package:lifeshare/screens/profile/DonorProfile.dart';
import 'package:lifeshare/widgets/loading.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<DonorDataModel> _model;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardCubit>(context).getDonors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: nearlyWhite,
        body: BlocConsumer<DashboardCubit, DashboardState>(
            listener: (context, state) {
          if (state is GetDonorsData) {
            _model = state.model;
          }
        }, builder: (context, state) {
          if (_model != null)
            return ListView.builder(
                itemCount: _model.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DonorProfile(
                            model: _model[index],
                          ),
                        ),
                      );
                    },
                    child: PostCard(
                      name: _model[index].donorId.name,
                      avatar: _model[index].donorId.avatar,
                      location: _model[index].donorId.address.city,
                      bloodtype: _model[index].donorId.bloodGroup,
                      phonenumber: "+91${_model[index].donorId.mobile}",
                    ),
                  );
                });
          else
            return Center(
              child: SmallLoading(),
            );
        }));
  }
}
