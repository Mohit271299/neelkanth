import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neelkanth/routing/navigation_stack_item.dart';
import 'package:neelkanth/routing/stack.dart';
import 'package:neelkanth/ui/utils/theme/app_colors.dart';
import 'package:neelkanth/ui/utils/theme/text_style.dart';

class SplashWeb extends ConsumerStatefulWidget {
  const SplashWeb({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashWeb> createState() => _SplashWebState();
}

class _SplashWebState extends ConsumerState<SplashWeb> {

  ///Init
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 100), () {
        ref.read(navigationStackController).pushRemove(const NavigationStackItem.dashboard());
      });
    });
  }

  ///Dispose
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  ///Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to our application',
          style: TextStyles.semiBold.copyWith(fontSize: 20.sp,color: AppColors.black),
        ),
      ),
    );
  }
}
