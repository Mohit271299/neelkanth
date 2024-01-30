import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/scheduler.dart';
import 'package:neelkanth/framework/controller/home/home_controller.dart';
import 'package:neelkanth/framework/utility/extension/extension.dart';
import 'package:neelkanth/ui/utils/theme/theme.dart';
import 'package:neelkanth/ui/utils/widgets/common_button.dart';
import 'package:neelkanth/ui/utils/widgets/common_svg.dart';

class HomeMobile extends ConsumerStatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends ConsumerState<HomeMobile> {
  ///Init Override
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final homeWatch = ref.read(homeController);
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
                AspectRatio(
                  aspectRatio: 16/9,
                  child: Stack(
                    children: [
                      Image.asset(
                        AppAssets.homeBg,
                        // height: 400.h,
                        width: MediaQuery.sizeOf(context).width,
                        fit: BoxFit.fill,
                      ),
                      Container(
                        color: AppColors.black.withOpacity(0.5),
                        // height: constraints.maxHeight / 2,
                        // width: MediaQuery.sizeOf(context).width,
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 0.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.homeTitle,
                        maxLines: 2,
                        style: TextStyles.semiBold.copyWith(
                            fontSize: 18.sp,
                            color: AppColors.white,
                            fontFamily: TextStyles.groverFontFamily),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        AppStrings.homeTitleMSG,
                        maxLines: 2,
                        style: TextStyles.semiBold.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.white,
                            fontFamily: TextStyles.groverFontFamily),
                      ),
                    ],
                  ).paddingOnly(left: 20.w),
                ),
              ],
            ),

            SizedBox(height: 20.h,),
            Divider().paddingSymmetric(horizontal: 20.w),

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
            height: 0.h,
          ),
          Container(
            // width: MediaQuery.sizeOf(context).width / 1.5,
            child: Text(
              AppStrings.homeSlogan,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.black,
                  fontWeight: TextStyles.fwRegular,
                  fontFamily: TextStyles.poppinsFontFamily),
            ),
          ).paddingSymmetric(vertical: 25.h,horizontal: 20.w),
          Container(
            width: MediaQuery.sizeOf(context).width / 1.5,
            child: Text(
              AppStrings.homeSloganMSG,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.black616161,
                  fontWeight: TextStyles.fwRegular,
                  fontFamily: TextStyles.poppinsFontFamily),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20.h,),
                Divider().paddingSymmetric(horizontal: 20.w),
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
                                      fontSize: 12.sp,
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
      child: Column(
        children: [
          Expanded(flex: 2, child: Center(child: CommonSVG(strIcon: AppAssets.bacKLogoSvg))),
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
                      fontSize: 18.sp,
                      color: AppColors.black,
                      fontWeight: TextStyles.fwRegular,
                      fontFamily: TextStyles.poppinsFontFamily),
                ).paddingOnly(bottom: 20.h),
                CommonButton(
                  buttonText: AppStrings.productIntroductionSlogan2,
                  backgroundColor: AppColors.black,
                  buttonTextStyle: TextStyles.medium.copyWith(
                      fontFamily: TextStyles.secondaryFontFamily,
                      fontSize: 12.sp,
                      color: AppColors.white),
                  width: 200.w,
                ),
              ],
            ).paddingOnly(left: 20.w),
          ),
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
