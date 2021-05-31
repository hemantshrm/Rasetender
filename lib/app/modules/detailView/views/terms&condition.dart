import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrap_bid/app/data/constants.dart';

class TermsAndConditon extends StatelessWidget {
  const TermsAndConditon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppConstants.APP_THEME_COLOR,
        title: Text('Terms & Conditions'),
      ),
      body: ListView(
        controller:
            ScrollController(initialScrollOffset: 0.0, keepScrollOffset: false),
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: Get.width,
            child: AutoSizeText(
              "1. Payment terms in 100% advance.\n\n2. Price will be valid from 03-03-2021 to 31-03-2021\n\n3. All taxes (GST/VAT)  applicable in regards to loading/transportaion of Scrap and other related material mentioned above will be buyers scope.\n\n4.  Scrap loading time will be up to 16:30 PM and vehicle departure time up to 17:30 pm, Buyer must ensure that all financial transactions should be completed before that. Sale of Scrap on weekends will be at SMI-Amtek management discretion.\n\n5. The company's responsibility end once the material leaves company premises.\n\n6. Scrap vendor should ensure that after intimation for scarp clearance the material should leave the company premises within 48 hours of intimation. In case there is delay in response time            of more than 48 hours than SMI Amtek holds the rights to call H2 vendor for scrap clearance If any type query then please let me know.\n\n7. All generated Scrap Should be clear in this month if it not clear then your firm will be black listed for future.\n\n",
              maxLines: 80,
              textAlign: TextAlign.justify,
              maxFontSize: 20,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: AutoSizeText(
              'Kindly Submit your GST detail, pan card and cancel cheque. ',
              maxLines: 2,
              textAlign: TextAlign.left,
              maxFontSize: 20,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
