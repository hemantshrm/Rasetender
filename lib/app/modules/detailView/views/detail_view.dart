import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_bid/app/Util/loader.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/modules/detailView/views/picture_Fullscreen.dart';
import 'package:scrap_bid/app/modules/detailView/views/terms&condition.dart';
import 'package:scrap_bid/app/modules/login/views/login_view.dart';

import '../controllers/detail_view_controller.dart';

class DetailViewView extends StatelessWidget {
  final DetailViewController controller =
      Get.put(DetailViewController(), permanent: true);

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
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => FullScreenView(),
                  );
                },
                child: Container(
                  width: Get.width,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppConstants.APP_THEME_COLOR,
                    ),
                  ),
                  child: "${controller.apiData.value.baseUrl}" +
                              "${controller.getImagesfromarray()}" !=
                          null
                      ? controller.apiData.value.materialImage != null
                          ? CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                viewportFraction: 1,
                                enableInfiniteScroll: false,
                                height: 250.0,
                                enlargeCenterPage: true,
                              ),
                              items: controller.apiData.value.materialImage
                                  .map((item) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: Get.width,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "${controller.apiData.value.baseUrl}" +
                                                "${item}",
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Center(
                                          child: Text(
                                            'Please wait..',
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            )
                          : SizedBox()
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
                              child: Text(
                                "No Image Available",
                                style: GoogleFonts.ubuntu(),
                              ),
                            )
                          ],
                        ),
                ),
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
                    title: "${controller.apiData.value.materialCode}",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Details(
                      heading: "Description :",
                      title: "${controller.apiData.value.materialDescription}"),
                ),
                SizedBox(
                  height: 30,
                ),
                Obx(
                  () => Date(
                    heading: "Start Date :",
                    title: "${controller.apiData.value.auctionStartDate}",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Date(
                    heading: "End Date   :",
                    title: "${controller.apiData.value.auctionCloseDate}",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() => (controller.apiData.value.bidsubmitted != null &&
                        controller.apiData.value.bidsubmitted != 1 &&
                        controller.apiData.value.bidsubmitted != 2 &&
                        controller.apiData.value.bidsubmitted != 3)
                    ? Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Enter Bid Amount  :',
                            style: AppConstants.dashboardStyle
                                .copyWith(fontWeight: FontWeight.w600),
                          )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                child: LoginFields(
                                  textEditingController: controller.bidAmount,
                                  hintText: "Enter Bid Amount",
                                  keyboard: TextInputType.number,
                                  suffixTEXT: "Rate/KG",
                                ),
                              )),
                        ],
                      )
                    : Text('')),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => (controller.apiData.value.bidsubmitted != null &&
                          controller.apiData.value.bidsubmitted != 1 &&
                          controller.apiData.value.bidsubmitted != 2 &&
                          controller.apiData.value.bidsubmitted != 3)
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              ObxValue(
                                (data) => Checkbox(
                                    fillColor: MaterialStateProperty.all(
                                        AppConstants.APP_THEME_COLOR),
                                    value: data.value,
                                    onChanged: (flag) {
                                      data.value = flag;
                                      controller.check.value = data.value;
                                      print(controller.check.value);
                                    }),
                                false.obs,
                              ),
                              AutoSizeText('I have read and accept ',
                                  style: AppConstants.dashboardStyle
                                      .copyWith(fontSize: 10)),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => TermsAndConditon(),
                                      transition: Transition.zoom,
                                      curve: Curves.easeInCirc);
                                },
                                child: AutoSizeText('terms and conditions',
                                    style: AppConstants.dashboardStyle.copyWith(
                                        fontSize: 10,
                                        color: Colors.orange,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ])
                      : Text(''),
                )
              ],
            ),
          ),
          Obx(
            () => controller.check.value
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Obx(
                      () => (controller.apiData.value.bidsubmitted != null &&
                              controller.apiData.value.bidsubmitted != 1 &&
                              controller.apiData.value.bidsubmitted != 2 &&
                              controller.apiData.value.bidsubmitted != 3)
                          ? MainButton(
                              title:
                                  controller.apiData.value.bidsubmitted != null
                                      ? controller.handleBtnText(
                                          controller.apiData.value.bidsubmitted)
                                      : '',
                              onPress: () {
                                controller.apiData.value.bidsubmitted == 0
                                    ? controller.bidSubmit(
                                        context, controller.apiData.value.id)
                                    : null;
                              },
                            )
                          : controller.apiData.value.bidsubmitted != null
                              ? Center(
                                  child: Text(
                                    controller.handleBtnText(
                                        controller.apiData.value.bidsubmitted),
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 20,
                                        color: AppConstants.APP_THEME_COLOR),
                                  ),
                                )
                              : SizedBox(),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: MainButton(
                      onPress: null,
                      title: controller.apiData.value.bidsubmitted != null
                          ? controller.handleBtnText(
                              controller.apiData.value.bidsubmitted)
                          : '',
                    ),
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
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          width: Get.width,
          child: AutoSizeText(
            title,
            maxLines: 20,
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
              AppConstants.dashboardStyle.copyWith(fontWeight: FontWeight.w600),
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
