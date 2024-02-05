import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:neelkanth/framework/utility/ui_state.dart';
import 'package:neelkanth/ui/utils/theme/app_strings.dart';
import 'package:neelkanth/ui/utils/theme/theme.dart';
import '../../dependency_injection/inject.dart';


final homeController = ChangeNotifierProvider(
      (ref) => getIt<HomeController>(),
);

@injectable
class HomeController extends ChangeNotifier {


  ///Dispose Controller
  void disposeController({bool isNotify = false}) {
    homeState.isLoading = false;
    if (isNotify) {
      notifyListeners();
    }
  }

  var homeState = UIState();

  /// update loading
  void updateLoadingStatus(value) {
    homeState.isLoading = value;
    notifyListeners();
  }


  List<ServicesList> servicesList = [
    ServicesList(title: AppStrings.services1Title, subtitle: AppStrings.service1Subtitle, assetString: AppAssets.bacKLogoSvg),
    ServicesList(title: AppStrings.services2Title, subtitle: AppStrings.service2Subtitle, assetString: AppAssets.bacKLogoSvg),
    ServicesList(title: AppStrings.services3Title, subtitle: AppStrings.service3Subtitle, assetString: AppAssets.bacKLogoSvg),
    ServicesList(title: AppStrings.services4Title, subtitle: AppStrings.service4Subtitle, assetString: AppAssets.bacKLogoSvg),
  ];

  void updateHover (bool value,int index){
    socialMedia[index].hovering = value;
    notifyListeners();
  }

  List<SocialMedia> socialMedia = [
    SocialMedia(className: "Facebook", hovering: false),
    SocialMedia(className: "Instagram", hovering: false),
    SocialMedia(className: "Twitter", hovering: false),
    SocialMedia(className: "LinkedIn", hovering: false),
  ];

}

class ServicesList{
  String assetString;
  String title;
  String subtitle;

  ServicesList({required this.title,required this.subtitle,required this.assetString});

}

class SocialMedia{
  String className;
  bool hovering;
  SocialMedia({required this.className,required this.hovering});

}
