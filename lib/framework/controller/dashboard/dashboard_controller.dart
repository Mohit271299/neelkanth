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

  // int initialPage = 0;

  WidgetString initialPage = WidgetString(pageName: AppStrings.keyHome, page: const Home(),index: 0);

  List<WidgetString> listPages = [
    WidgetString(pageName: AppStrings.keyHome, page: const Home(),index: 0),
    WidgetString(pageName: AppStrings.keyProduct, page: const Products(),index: 1),
    WidgetString(pageName: AppStrings.keyBrand, page: const Brand(),index: 2),
    WidgetString(pageName: AppStrings.keyContactUs, page: const ContactUs(),index: 3),
  ];

  void updatePageIndex(WidgetString value) {
    initialPage = value;
    print(initialPage);
    notifyListeners();
  }
}

class WidgetString {
  String pageName;
  Widget page;
  int index;

  WidgetString({required this.pageName, required this.page,required this.index});
}
