import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neelkanth/ui/splash/mobile/splash_mobile.dart';
import 'package:neelkanth/ui/splash/web/splash_web.dart';
import 'package:neelkanth/ui/utils/helper/base_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Splash extends ConsumerStatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  ConsumerState<Splash> createState() => _SplashState();
}

class _SplashState extends ConsumerState<Splash> with BaseStatefulWidget {
  ///Init
  @override
  void initState() {
    super.initState();
  }

  ///Dispose
  @override
  void dispose() {
    super.dispose();
  }

  ///Build
  @override
  Widget buildPage(BuildContext context) {
    return ScreenTypeLayout.builder(mobile: (BuildContext context) {
      return const SplashMobile();
    }, desktop: (BuildContext context) {
      return const SplashWeb();
    });
  }
}
