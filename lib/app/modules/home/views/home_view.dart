import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
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
        floatingActionButton: FabCircularMenu(
            alignment: Alignment.bottomRight,
            fabOpenIcon: Icon(
              Icons.filter_alt_outlined,
              color: Colors.white,
            ),
            fabCloseIcon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            animationCurve: Curves.bounceInOut,
            ringDiameter: 300,
            ringColor: AppConstants.APP_THEME_COLOR,
            fabColor: AppConstants.APP_THEME_COLOR,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    tooltip: 'Bids Pending',
                    icon: Icon(
                      Icons.access_time,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      controller.fetchProducts(controller.userData.value.id,
                          bidstatus: 1);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    tooltip: 'Bids Won',
                    icon: FaIcon(
                      FontAwesomeIcons.trophy,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      controller.fetchProducts(controller.userData.value.id,
                          bidstatus: 2);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    tooltip: 'Bids Lost',
                    icon: FaIcon(
                      FontAwesomeIcons.thumbsDown,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      controller.fetchProducts(controller.userData.value.id,
                          bidstatus: 3);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    tooltip: 'Clear Filter',
                    icon: Icon(
                      Icons.clear_all,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      controller.fetchProducts(controller.userData.value.id);
                    }),
              ),
            ]),
        appBar: AppBar(
          title: controller.obx((state) => Text(controller.header.value,
              style: GoogleFonts.montserrat(fontSize: 20))),
          centerTitle: true,
          backgroundColor: AppConstants.APP_THEME_COLOR,
        ),
        drawer: HomeDrawer(),
        body: controller.obx(
          (state) => Container(
            child: controller.apiData.value.length == 0
                ? Center(
                    child: Text(
                    "No Result Found",
                    style: GoogleFonts.montserrat(fontSize: 18),
                  ))
                : ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                    itemCount: controller.apiData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          print(controller.apiData[index].id);
                          Get.toNamed(Routes.DETAIL_VIEW,
                              arguments: controller.apiData[index].id);
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Wrap(
                                        spacing: 20,
                                        children: [
                                          Container(
                                            height: 20,
                                            child: Text(
                                                '${controller.apiData.value[index].materialCode}',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: AppConstants
                                                        .APP_THEME_COLOR,
                                                    fontWeight:
                                                        FontWeight.w500)),
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
                                        style: AppConstants.dashboardStyle
                                            .copyWith(
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
                                                    color: AppConstants
                                                        .APP_THEME_COLOR),
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
          ),
          onLoading: Center(child: CircularProgressIndicator()),
          onEmpty: Text('No data found'),
          onError: (error) => Text(error),
        ),
      ),
    );
  }
}

class HomeDrawer extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: AppConstants.APP_THEME_COLOR),
            accountName: controller.userData.value != null
                ? Text(controller.userData.value.fullname,
                    style: GoogleFonts.montserrat(fontSize: 16))
                : Text("Login Please"),
            accountEmail: controller.userData.value != null
                ? Text(controller.userData.value.email,
                    style: GoogleFonts.montserrat(fontSize: 16))
                : Text("Login Please"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? AppConstants.APP_THEME_COLOR
                  : Colors.white,
              child: Text(
                "${controller.userData.value.fullname[0]}",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
              title: TileText('Auction List'),
              leading: Icon(Icons.list, color: AppConstants.APP_THEME_COLOR),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                controller.fetchProducts(controller.userData.value.id);
                Get.back();
              }),
          ListTile(
              title: TileText('Bids Won'),
              leading: Icon(FontAwesomeIcons.trophy,
                  color: AppConstants.APP_THEME_COLOR),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                controller.fetchProducts(controller.userData.value.id,
                    bidstatus: 2);
                Get.back();
              }),
          ListTile(
              title: TileText('Result Awaited'),
              leading:
                  Icon(Icons.access_time, color: AppConstants.APP_THEME_COLOR),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                controller.fetchProducts(controller.userData.value.id,
                    bidstatus: 1);
                Get.back();
              }),
          ListTile(
              title: TileText('Bids Lost'),
              leading: Icon(FontAwesomeIcons.thumbsDown,
                  color: AppConstants.APP_THEME_COLOR),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                controller.fetchProducts(controller.userData.value.id,
                    bidstatus: 3);
                Get.back();
              }),
          ListTile(
            title: TileText('Logout'),
            leading: Icon(Icons.logout, color: AppConstants.APP_THEME_COLOR),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () async {
              await controller.clearPrefs();
              Get.offAllNamed(Routes.LOGIN);
            },
          ),
        ],
      ),
    );
  }
}

class TileText extends StatelessWidget {
  const TileText(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: GoogleFonts.montserrat(fontSize: 16));
  }
}
