import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:neelkanth/framework/utility/ui_state.dart';
import '../../dependency_injection/inject.dart';


final productsController = ChangeNotifierProvider(
      (ref) => getIt<ProductsController>(),
);

@injectable
class ProductsController extends ChangeNotifier {

  ///Dispose Controller
  void disposeController({bool isNotify = false}) {
    productsState.isLoading = false;
    if (isNotify) {
      notifyListeners();
    }
  }

  var productsState = UIState();

  /// update loading
  void updateLoadingStatus(value) {
    productsState.isLoading = value;
    notifyListeners();
  }


}
