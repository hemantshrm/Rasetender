import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  Future<bool> _onWillPop() {
    return Get.defaultDialog(
          radius: 5,
          title: 'Are you sure?',
          content: Text('Do you want to exit an App'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Get.back(),
              child: Text('No'),
            ),
            FlatButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text('Yes'),
            ),
          ],
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title:
                Text('Auctions', style: GoogleFonts.montserrat(fontSize: 20)),
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: AppConstants.APP_THEME_COLOR,
            actions: [Icon(Icons.notification_important),SizedBox(width: 20,)],
          ),
          body: controller.obx(
            (state) => ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) => Divider(
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                itemCount: controller.apiData.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.DETAIL_VIEW);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),

                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Wrap(
                                    spacing: 20,
                                    children: [
                                      // Container(
                                      //   height: 20,
                                      //   child: Text(
                                      //     "Auction",
                                      //     textAlign: TextAlign.center,
                                      //     style: AppConstants.dashboardStyle
                                      //         .copyWith(
                                      //             color:
                                      //                Colors.black,
                                      //             fontSize: 20),
                                      //   ),
                                      // ),
                                      Container(
                                        height: 20,
                                        child: Text(
                                            '${controller.apiData.value[index].materialCode}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color:   AppConstants.APP_THEME_COLOR,
                                              fontWeight: FontWeight.w500
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${controller.apiData.value[index].materialDescription}',
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
                                        style: AppConstants.dashboardStyle
                                            .copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                                color:
                                                    AppConstants.APP_THEME_COLOR),
                                      ),
                                      Text(
                                        '${controller.apiData.value[index].auctionCloseDate}',
                                        style: AppConstants.dashboardStyle
                                            .copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16),
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
                    ),
                  );
                }),

            // here you can put your custom loading indicator, but
            // by default would be Center(child:CircularProgressIndicator())
            onLoading: Center(child: CircularProgressIndicator()),
            onEmpty: Text('No data found'),

            // here also you can set your own error widget, but by
            // default will be an Center(child:Text(error))
            onError: (error) => Text(error),
          ),
        ));
  }
}
