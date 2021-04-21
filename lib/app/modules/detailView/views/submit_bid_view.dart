import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:scrap_bid/app/modules/detailView/controllers/detail_view_controller.dart';

class SubmitBidScreen extends GetView<DetailViewController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Submit Bid"),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }

}