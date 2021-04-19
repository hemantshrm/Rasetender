import 'package:get/get.dart';
import 'package:scrap_bid/app/modules/home/auction_list_model.dart';
import 'package:scrap_bid/app/modules/home/providers/auction_list_provider.dart';

class DataController extends GetxController with StateMixin<List<AuctionList>> {
  var isLoading = true.obs;
  var apiData = <AuctionList>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      await AuctionListProvider.fetchData().then((resp) {
        change(resp, status: RxStatus.success());
        if (resp != null) {
          apiData.addAll(resp);
        }
      }, onError: (err) {
        change(
          null,
          status: RxStatus.error(err.toString()),
        );
      });
    } finally {
      isLoading(false);
    }
  }
}
