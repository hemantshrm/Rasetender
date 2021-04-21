import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: Get.width,
                height: 250,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppConstants.APP_THEME_COLOR,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),

                child: controller.apiData.value.auctionDetail.materialImage !=
                        null
                    ? CachedNetworkImage(
                        imageUrl:
                            "${controller.apiData.value.auctionDetail.materialImage}",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.red, BlendMode.colorBurn)),
                          ),
                        ),
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.image_not_supported_sharp,
                              size: 50,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("No Image Available"),
                          )
                        ],
                      ),
                // Carousel(
                //   images: [
                //
                //   ],
                // )
              ),
            ),
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
                Obx(
                  () => Details(
                    heading: "Title :",
                    title:
                        "${controller.apiData.value.auctionDetail.materialCode}",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Details(
                      heading: "Description :",
                      title:
                          "${controller.apiData.value.auctionDetail.materialDescription}"),
                ),
                SizedBox(
                  height: 30,
                ),
                Obx(
                  () => Date(
                    heading: "Start Date :",
                    title:
                        "${controller.apiData.value.auctionDetail.auctionStartDate}",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Date(
                    heading: "End Date   :",
                    title:
                        "${controller.apiData.value.auctionDetail.auctionStartDate}",
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: MainButton(
              title: "I am Interested",
              onPress: () {
                controller.bidSubmit();
                // Get.to(SubmitBidScreen());
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
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          width: Get.width,
          child: AutoSizeText(
            title,
            maxLines: 10,
            maxFontSize: 20,
            style: AppConstants.dashboardStyle.copyWith(fontSize: 18),
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
          style:
              AppConstants.dashboardStyle.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 10,
        ),
        AutoSizeText(
          title,
          maxLines: 10,
          maxFontSize: 20,
          style: AppConstants.dashboardStyle.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
