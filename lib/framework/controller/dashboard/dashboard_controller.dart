import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:neelkanth/ui/brand/brand.dart';
import 'package:neelkanth/ui/contact_us/contact_us.dart';
import 'package:neelkanth/ui/home/home.dart';
import 'package:neelkanth/ui/product/products.dart';
import 'package:neelkanth/ui/utils/theme/app_strings.dart';
import '../../dependency_injection/inject.dart';


final dashboardController = ChangeNotifierProvider(
      (ref) => getIt<DashboardController>(),
);

@injectable
class DashboardController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> key = GlobalKey();

  ///Dispose Controller
  void disposeController({bool isNotify = false}) {
    // dashboardState.isLoading = false;
    if (isNotify) {
      notifyListeners();
    }
  }

  // var dashboardState = UIState();

  /// update loading
  void updateLoadingStatus(value) {
    // dashboardState.isLoading = value;
    notifyListeners();
  }

  int initialPage = 0;

  List<String> listPageString= [
    AppStrings.keyHome,
    AppStrings.keyProduct,
    AppStrings.keyBrand,
    AppStrings.keyContactUs,
  ];

  List<Widget> listPages= [
    const Home(),
    const Products(),
    const Brand(),
    const ContactUs(),
  ];

  void updatePageIndex(int value){
    initialPage = value;
    print(initialPage);
    notifyListeners();
  }
}
