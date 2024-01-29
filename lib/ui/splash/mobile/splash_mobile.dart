import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neelkanth/ui/utils/theme/app_colors.dart';
import 'package:neelkanth/ui/utils/theme/theme_style.dart';

class SplashMobile extends ConsumerStatefulWidget {
  const SplashMobile({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashMobile> createState() => _SplashMobileState();
}

class _SplashMobileState extends ConsumerState<SplashMobile> {
  ///Init
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ThemeStyle.setLightStatusBarIcons();
      Future.delayed(const Duration(milliseconds: 3000), () async {});
    });
  }

  ///Dispose
  @override
  void dispose() {
    super.dispose();
  }

  ///Build
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.splashBlue,
      body: Center(),
    );
  }
}
