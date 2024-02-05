import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:neelkanth/framework/controller/home/home_controller.dart';
import 'package:neelkanth/framework/utility/ui_state.dart';
import 'package:neelkanth/ui/utils/theme/app_assets.dart';
import 'package:neelkanth/ui/utils/theme/app_strings.dart';
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


  List<ProductList> productList = [
    ProductList(title: AppStrings.productTitle1, subtitle: AppStrings.productSubtitle1, assetString: [AppAssets.bacKLogoSvg]),
    ProductList(title: AppStrings.productTitle2, subtitle: AppStrings.productSubtitle1, assetString: [AppAssets.bacKLogoSvg]),
    ProductList(title: AppStrings.productTitle3, subtitle: AppStrings.productSubtitle1, assetString: [AppAssets.bacKLogoSvg]),
    ProductList(title: AppStrings.productTitle4, subtitle: AppStrings.productSubtitle1, assetString: [AppAssets.bacKLogoSvg]),
    ProductList(title: AppStrings.productTitle5, subtitle: AppStrings.productSubtitle1, assetString: [AppAssets.bacKLogoSvg]),
    ProductList(title: AppStrings.productTitle6, subtitle: AppStrings.productSubtitle1, assetString: [AppAssets.bacKLogoSvg]),
    ProductList(title: AppStrings.productTitle7, subtitle: AppStrings.productSubtitle1, assetString: [AppAssets.bacKLogoSvg]),
  ];

}



class ProductList{
  List assetString;
  String title;
  String subtitle;

  ProductList({required this.title,required this.subtitle,required this.assetString});

}