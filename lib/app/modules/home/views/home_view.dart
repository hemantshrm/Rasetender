import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: GoogleFonts.montserrat(fontSize: 20)),
        centerTitle: true,
        backgroundColor: AppConstants.APP_THEME_COLOR,
      ),
      body: ListView.separated(
          physics: BouncingScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) => Divider(
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Get.toNamed(Routes.DETAIL_VIEW);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: 20,
                            children: [
                              Text(
                                "Auction",
                                style: AppConstants.dashboardStyle.copyWith(
                                    color: AppConstants.APP_THEME_COLOR,
                                    fontSize: 23),
                              ),
                              Text("Lorem Ipsum",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nis pulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus.
                          Donec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex,""",
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: AppConstants.dashboardStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Wrap(
                            spacing: 10,
                            children: [
                              Text(
                                "End Date :",
                                style: AppConstants.dashboardStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: AppConstants.APP_THEME_COLOR),
                              ),
                              Text(
                                "10/12/2020",
                                style: AppConstants.dashboardStyle.copyWith(
                                    fontWeight: FontWeight.w700, fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppConstants.APP_THEME_COLOR,
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
