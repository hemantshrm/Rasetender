import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/modules/login/views/login_view.dart';

import '../controllers/detail_view_controller.dart';

class DetailViewView extends GetView<DetailViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail View'),
        centerTitle: true,
        backgroundColor: AppConstants.APP_THEME_COLOR,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            width: Get.width,
            height: 250,
            child: Image.network(
                "https://www.worleybrotherssalvage.com/wp-content/uploads/2018/05/WorleyBrothers_519134010.jpg"),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Details(
                  heading: "Title :",
                  title: "Scrap Metal",
                ),
                SizedBox(
                  height: 20,
                ),
                Details(
                  heading: "Description :",
                  title:
                      """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nis pulvinar facilisis justo mollis, auctor consequat ur Donec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex""",
                ),
                SizedBox(
                  height: 40,
                ),
                Date(
                  heading: "Start Date :",
                  title: "10/09/2020",
                ),
                SizedBox(
                  height: 20,
                ),
                Date(
                  heading: "End Date   :",
                  title: "10/09/2020",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: MainButton(
              title: "I am Interested",
              onPress: () {
                Get.back();
              },
            ),
          )
        ],
      ),
    );
  }
}

class Details extends StatelessWidget {
  Details({this.heading, this.title});

  final String heading, title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            heading,
            style: AppConstants.dashboardStyle
                .copyWith(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          width: Get.width,
          child: AutoSizeText(
            title,
            maxLines: 10,
            maxFontSize: 20,
            style: AppConstants.dashboardStyle.copyWith(fontSize: 25),
          ),
        ),
      ],
    );
  }
}

class Date extends StatelessWidget {
  Date({this.heading, this.title});

  final String heading, title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          heading,
          style: AppConstants.dashboardStyle
              .copyWith(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 10,
        ),
        AutoSizeText(
          title,
          maxLines: 10,
          maxFontSize: 20,
          style: AppConstants.dashboardStyle.copyWith(fontSize: 25),
        ),
      ],
    );
  }
}
