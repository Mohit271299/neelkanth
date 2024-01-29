import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import '../../dependency_injection/inject.dart';


final homeController = ChangeNotifierProvider(
      (ref) => getIt<HomeController>(),
);

@injectable
class HomeController extends ChangeNotifier {


  ///Dispose Controller
  void disposeController({bool isNotify = false}) {
    // homeState.isLoading = false;
    if (isNotify) {
      notifyListeners();
    }
  }

  // var homeState = UIState();

  /// update loading
  void updateLoadingStatus(value) {
    // homeState.isLoading = value;
    notifyListeners();
  }


}
