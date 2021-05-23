import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifeshare/bloc/dashboard/dashboard_cubit.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/model/dashboard_model/donor_data_model.dart';
import 'package:lifeshare/model/dashboard_model/request_data.model.dart';
import 'package:lifeshare/screens/dashboard_screens/widgets/InformationCard.dart';
import 'package:lifeshare/screens/dashboard_screens/widgets/PostItem.dart';
import 'package:lifeshare/screens/dashboard_screens/widgets/StoryItem.dart';
import 'package:lifeshare/screens/profile/DonorProfile.dart';
import 'package:lifeshare/widgets/loading.dart';

import '../ViewStory.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DonorDataModel> _donorDataModel, _storyDataModel;
  List<RequestDataModel> _requestDataModel;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardCubit>(context).getDonors();
    BlocProvider.of<DashboardCubit>(context).getStory();
    BlocProvider.of<DashboardCubit>(context).getRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nearlyWhite,
      body: BlocListener<DashboardCubit, DashboardState>(
          listener: (context, state) {
            if (state is GetDonorsData) {
              setState(() {
                _donorDataModel = state.model;
              });
            } else if (state is GetStoryData) {
              setState(() {
                _storyDataModel = state.model;
              });
            } else if (state is GetRequestData) {
              setState(() {
                _requestDataModel = state.model;
              });
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingM),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: spaceM * 2,
                          ),
                          child: Row(
                            children: [
                              InformationCard(
                                text:
                                    "Keep Social Distance when you are outside.",
                              ),
                              InformationCard(
                                text:
                                    "Use hand sanatizer, mask and gloves to protect yourself.",
                              ),
                              InformationCard(
                                text:
                                    "Keep Social Distance when you are outside.",
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: spaceM,
                      ),
                      Text(
                        "Recent Donors",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: spaceS,
                      ),
                      if (_donorDataModel != null)
                        Container(
                            padding: EdgeInsets.symmetric(
                              vertical: spaceM,
                            ),
                            height: 260,
                            child: ListView.builder(
                                itemCount: _donorDataModel.length > 5
                                    ? 5
                                    : _donorDataModel.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (contxt, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => DonorProfile(
                                            model: _donorDataModel[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: PostItem(
                                      name: _donorDataModel[index].donorId.name,
                                      avatar:
                                          _donorDataModel[index].donorId.avatar,
                                      location: _donorDataModel[index]
                                          .donorId
                                          .address
                                          .city,
                                      bloodtype: _donorDataModel[index]
                                          .donorId
                                          .bloodGroup,
                                      phonenumber:
                                          "+91${_donorDataModel[index].donorId.mobile}",
                                    ),
                                  );
                                }))
                      else
                        Center(
                          child: SmallLoading(),
                        ),
                      SizedBox(
                        height: spaceM,
                      ),
                      Text(
                        "Recent Request",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: spaceS,
                      ),
                      if (_requestDataModel != null)
                        Container(
                            padding: EdgeInsets.symmetric(
                              vertical: spaceM,
                            ),
                            height: 260,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _requestDataModel.length,
                                itemBuilder: (context, index) {
                                  return PostItem(
                                    name: _requestDataModel[index]
                                        .receiverId
                                        .name,
                                    avatar: _requestDataModel[index]
                                        .receiverId
                                        .avatar,
                                    location: _requestDataModel[index]
                                        .receiverId
                                        .address
                                        .city,
                                    bloodtype: _requestDataModel[index]
                                            .receiverId
                                            .bloodGroup ??
                                        'o',
                                    phonenumber:
                                        "+91${_requestDataModel[index].receiverId.mobile}",
                                  );
                                }))
                      else
                        Center(child: SmallLoading()),
                      SizedBox(
                        height: spaceM,
                      ),
                      Text(
                        "Stories shared by Covid Fighters",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: spaceS,
                      ),
                      if (_storyDataModel != null)
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: spaceM,
                          ),
                          height: 260,
                          child: ListView.builder(
                            itemCount: _storyDataModel.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ViewStory(
                                          model: _storyDataModel[index])));
                                },
                                child: StoryItem(
                                  name: _storyDataModel[index].donorId.name,
                                  avatar: _storyDataModel[index].donorId.avatar,
                                  text: _storyDataModel[index].storyData,
                                ),
                              );
                            },
                          ),
                        )
                      else
                        Center(child: SmallLoading())
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
