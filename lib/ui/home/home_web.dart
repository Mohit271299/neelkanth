import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/scheduler.dart';
import 'package:neelkanth/framework/controller/home/home_controller.dart';
import 'package:neelkanth/framework/utility/extension/extension.dart';
import 'package:neelkanth/ui/utils/theme/theme.dart';
import 'package:neelkanth/ui/utils/widgets/common_appbar.dart';
import 'package:neelkanth/ui/utils/widgets/common_button.dart';
import 'package:neelkanth/ui/utils/widgets/common_svg.dart';

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
    final homeWatch = ref.watch(homeController);

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
                      fit: BoxFit.fill,
                    ),
                    Container(
                      color: AppColors.black.withOpacity(0.5),
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
                        SizedBox(
                          height: 20.h,
                        ),
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
            ),

            ///services listing design
            _productPanel(homeWatch),

            ///product introduction panel
            _productIntroductionPanel(homeWatch),

            _contactUsPanel()
          ],
        ),
      ),
    ));
  }

  _productPanel(HomeController homeWatch) {
    return Container(
      color: AppColors.white,
      // height: 612.h,
      child: Column(
        children: [
          SizedBox(
            height: 80.h,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width / 1.5,
            child: Text(
              AppStrings.homeSlogan,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold.copyWith(
                  fontSize: 26.sp,
                  color: AppColors.black,
                  fontWeight: TextStyles.fwRegular,
                  fontFamily: TextStyles.poppinsFontFamily),
            ),
          ).paddingSymmetric(vertical: 50.h),
          Container(
            width: MediaQuery.sizeOf(context).width / 1.5,
            child: Text(
              AppStrings.homeSloganMSG,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.black616161,
                  fontWeight: TextStyles.fwRegular,
                  fontFamily: TextStyles.poppinsFontFamily),
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                    homeWatch.servicesList.length,
                    (index) => Flexible(
                          child: Container(
                            // width: MediaQuery.sizeOf(context).width / 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CommonSVG(
                                  strIcon:
                                      homeWatch.servicesList[index].assetString,
                                  height: 100,
                                  width: 100,
                                ).paddingOnly(bottom: 30.h),
                                Text(
                                  homeWatch.servicesList[index].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyles.semiBold.copyWith(
                                      fontSize: 18.sp,
                                      color: AppColors.black,
                                      fontWeight: TextStyles.fwRegular,
                                      fontFamily: TextStyles.poppinsFontFamily),
                                ).paddingOnly(bottom: 20.h),
                                Text(
                                  homeWatch.servicesList[index].subtitle,
                                  textAlign: TextAlign.center,
                                  style: TextStyles.semiBold.copyWith(
                                      fontSize: 14.sp,
                                      color: AppColors.black616161,
                                      fontWeight: TextStyles.fwRegular,
                                      fontFamily: TextStyles.poppinsFontFamily),
                                ),
                              ],
                            ),
                          ).paddingSymmetric(horizontal: 20.w, vertical: 40.h),
                        ))
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }

  _productIntroductionPanel(HomeController homeWatch) {
    return Container(
      color: AppColors.blueEBF0F3,
      height: 612.h,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.productIntroductionSlogan,
                  textAlign: TextAlign.left,
                  style: TextStyles.semiBold.copyWith(
                      fontSize: 26.sp,
                      color: AppColors.black,
                      fontWeight: TextStyles.fwRegular,
                      fontFamily: TextStyles.poppinsFontFamily),
                ).paddingOnly(bottom: 20.h),
                CommonButton(
                  buttonText: AppStrings.productIntroductionSlogan2,
                  backgroundColor: AppColors.black,
                  buttonTextStyle: TextStyles.medium.copyWith(
                      fontFamily: TextStyles.secondaryFontFamily,
                      color: AppColors.white),
                  width: 300.w,
                ),
              ],
            ).paddingOnly(left: 20.w),
          ),
          Expanded(flex: 2, child: CommonSVG(strIcon: AppAssets.bacKLogoSvg))
        ],
      ),
    );
  }

  _contactUsPanel() {
    return Container(
      height: 80.h,
    );
  }
}
