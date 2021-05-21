import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrap_bid/app/modules/detailView/controllers/detail_view_controller.dart';

class FullScreenView extends GetView<DetailViewController> {
  const FullScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: Hero(
          tag: 'pic',
          child: CachedNetworkImage(
            imageUrl: "${controller.apiData.value.baseUrl}" +
                "${controller.apiData.value.materialImage}",
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
              ),
            ),
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        )),
      ),
    );
  }
}
