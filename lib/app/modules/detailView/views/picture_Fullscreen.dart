import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/modules/detailView/controllers/detail_view_controller.dart';

class FullScreenView extends GetView<DetailViewController> {
  const FullScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.APP_THEME_COLOR,
          actions: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close))
          ],
        ),
        body: Align(
          alignment: Alignment.center,
          child: Container(
            width: Get.width,
            height: 500,
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppConstants.APP_THEME_COLOR,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: "${controller.apiData.value.baseUrl}" +
                        "${controller.getImagesfromarray()}" !=
                    null
                ? controller.apiData.value.materialImage != null
                    ? CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          scrollDirection: Axis.vertical,
                          viewportFraction: 1,
                          enableInfiniteScroll: false,
                          height: Get.height,
                          enlargeCenterPage: true,
                        ),
                        items:
                            controller.apiData.value.materialImage.map((item) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: Get.width,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${controller.apiData.value.baseUrl}" +
                                          "${item}",
                                  imageBuilder: (context, imageProvider) =>
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
                                  errorWidget: (context, url, error) => Center(
                                    child: Text(
                                      'Please wait..',
                                      style: GoogleFonts.ubuntu(fontSize: 20),
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
    );
  }
}
