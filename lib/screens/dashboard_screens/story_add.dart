import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifeshare/bloc/dashboard/dashboard_cubit.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/model/dynamic_data/user_dynamic_details.dart';
import 'package:lifeshare/screens/main_screen/main_screen.dart';
import 'package:lifeshare/widgets/CustomAppBar.dart';
import 'package:lifeshare/widgets/CustomButton.dart';
import 'package:lifeshare/widgets/TextFields/DefaultTextField.dart';
import 'package:lifeshare/widgets/loading.dart';

import '../../injection.dart';

class CreateStoryScreen extends StatefulWidget {
  @override
  _CreateStoryScreenState createState() => _CreateStoryScreenState();
}

class _CreateStoryScreenState extends State<CreateStoryScreen> {
  final TextEditingController _story = TextEditingController();

  _onPress() {
    final _data = getIt<UserDynamicData>().getLoginModel;
    BlocProvider.of<DashboardCubit>(context)
        .addStory(token: _data.accessToken, data: _story.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {
        if (state is AddSuccess) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MainScreen()),
              (Route<dynamic> route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(title: "Create New Story"),
          body: Stack(
            children: [
              Container(
                color: nearlyWhite,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: spaceM * 2,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: paddingM),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: paddingL,
                            vertical: paddingM,
                          ),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              DefaultTextField(
                                controller: _story,
                                hintText:
                                    "Tell something about how you fight COVID-19...",
                                maxLine: 5,
                                type: TextInputType.multiline,
                              ),
                              SizedBox(height: spaceS),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: paddingM),
                                child: CustomButton(
                                  title: 'SHARE STORY',
                                  onPressed: _onPress,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: spaceM,
                      ),
                    ],
                  ),
                ),
              ),
              if (state is DashboardLoading) Loading()
            ],
          ),
        );
      },
    );
  }
}
