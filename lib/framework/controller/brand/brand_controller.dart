import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:neelkanth/framework/utility/ui_state.dart';
import '../../dependency_injection/inject.dart';


final brandController = ChangeNotifierProvider(
      (ref) => getIt<BrandController>(),
);

@injectable
class BrandController extends ChangeNotifier {

  ///Dispose Controller
  void disposeController({bool isNotify = false}) {
    brandState.isLoading = false;
    if (isNotify) {
      notifyListeners();
    }
  }

  var brandState = UIState();

  /// update loading
  void updateLoadingStatus(value) {
    brandState.isLoading = value;
    notifyListeners();
  }


}
