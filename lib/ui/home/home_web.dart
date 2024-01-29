import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/scheduler.dart';
import 'package:neelkanth/framework/controller/home/home_controller.dart';
import 'package:neelkanth/framework/utility/extension/extension.dart';
import 'package:neelkanth/ui/utils/theme/theme.dart';
import 'package:neelkanth/ui/utils/widgets/common_appbar.dart';

class HomeWeb extends ConsumerStatefulWidget {
  const HomeWeb({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends ConsumerState<HomeWeb> {
  ///Init Override
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final homeWatch = ref.watch(homeController);
      //homeWatch.disposeController(isNotify : true);
    });
  }

  ///Dispose Override
  @override
  void dispose() {
    super.dispose();
  }

  ///Build Override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
    );
  }

  ///Body Widget
  Widget _bodyWidget() {
    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      AppAssets.homeBg,
                      height: 712.h,
                      width: MediaQuery.sizeOf(context).width,
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                      color: AppColors.black.withOpacity(0.4),
                      height: 712.h,
                      width: MediaQuery.sizeOf(context).width,
                    )
                  ],
                ),
                Positioned(
                  left: 0.0,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.homeTitle,
                          style: TextStyles.semiBold.copyWith(
                              fontSize: 40.sp,
                              color: AppColors.white,
                              fontFamily: TextStyles.groverFontFamily),
                        ),
                        SizedBox(height: 20.h,),
                        Text(
                          AppStrings.homeTitleMSG,
                          style: TextStyles.semiBold.copyWith(
                              fontSize: 25.sp,
                              color: AppColors.black,
                              fontFamily: TextStyles.groverFontFamily),
                        ),
                      ],
                    ).paddingOnly(left: 20.w),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
