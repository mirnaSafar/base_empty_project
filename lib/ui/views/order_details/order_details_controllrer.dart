import 'package:flutter_templete/core/data/models/product_model.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class OrderDetailsController extends BaseController {
  RxInt selectedValue = (-1).obs;
  RxInt selectedIntegredientValue = (-1).obs;
  OrderDetailsController(ProductModel productModel) {
    model = productModel;
    calcTotal(model);
  }

  ProductModel model = ProductModel();
  RxInt count = 1.obs;
  RxDouble total = 0.0.obs;

  void changeCount(bool incress) {
    if (incress) {
      count++;
    } else {
      if (count > 1) count--;
    }
  }

  double calcTotal(ProductModel model1) {
    model = model1;
    total.value = (count.value * model.price!);
    return total.toDouble();
  }

  double addToTotal(ProductModel model1, double plus) {
    total.value = calcTotal(model1);
    model = model1;
    total.value = total.value + plus.toDouble();
    return total.toDouble();
  }

  void addToCart(ProductModel model1) {
    model = model1;

    cartService.addToCart(
        model: model,
        count: count.value,
        afterAdd: () {
          Get.to(() => const MainView());
        });
  }
}
