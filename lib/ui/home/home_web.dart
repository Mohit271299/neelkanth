import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive/hive.dart';
import 'package:neelkanth/framework/controller/dashboard/dashboard_controller.dart';
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

            ///product details panel
            _productDetailsPanel(homeWatch),

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
    final dashboardWatch = ref.watch(dashboardController);
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
                  onTap: (){
                    dashboardWatch.updatePageIndex(WidgetString(
                        pageName: dashboardWatch.listPages[1].pageName,
                        page: dashboardWatch.listPages[1].page,
                        index: 1));
                  },
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

  _productDetailsPanel(HomeController homeWatch) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          SizedBox(
            height: 80.h,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.productCatalogue,
                  textAlign: TextAlign.center,
                  style: TextStyles.semiBold.copyWith(
                      fontSize: 26.sp,
                      color: AppColors.black,
                      fontWeight: TextStyles.fwRegular,
                      fontFamily: TextStyles.groverFontFamily),
                ).paddingOnly(right: 30.w),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.grey9F9F9F, width: 1.0.sp),
                      borderRadius: BorderRadius.circular(100.r)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.share_rounded,
                        color: AppColors.grey9F9F9F,
                      ).paddingOnly(right: 10.w),
                      Text(
                        'Share',
                        textAlign: TextAlign.center,
                        style: TextStyles.semiBold.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.black,
                            fontWeight: TextStyles.fwRegular,
                            fontFamily: TextStyles.poppinsFontFamily),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 8.0, vertical: 5.0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Divider().paddingSymmetric(horizontal: 200.w),
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width / 1.3,
            child: Text(
              AppStrings.productCatalogueSlogan,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.black616161,
                  fontWeight: TextStyles.fwRegular,
                  fontFamily: TextStyles.poppinsFontFamily),
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
        ],
      ),
    );
  }

  _contactUsPanel() {
    final homeWatch = ref.watch(homeController);
    return Container(
      color: AppColors.blueEBF0F3,
      height: 312.h,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              ...List.generate(
                  10,
                  (index) => Container(
                        child: Text(
                          AppStrings.keyBrand,
                          textAlign: TextAlign.center,
                          style: TextStyles.semiBold.copyWith(
                              fontSize: 18.sp,
                              color: AppColors.black616161,
                              fontWeight: TextStyles.fwRegular,
                              fontFamily: TextStyles.poppinsFontFamily),
                        ).paddingAll(20),
                      ))
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CommonSVG(
                  strIcon: AppAssets.bacKLogoSvg,
                  height: 50.h,
                  width: 50.w,
                ).paddingOnly(bottom: 30.h),
                SizedBox(
                  width: 50.w,
                ),
                ...List.generate(
                    homeWatch.socialMedia.length,
                    (index) => MouseRegion(
                          onEnter: (event) {
                            print("hovering Enter");
                            homeWatch.updateHover(true, index);
                          },
                          onExit: (event) {
                            print("hovering");
                            homeWatch.updateHover(false, index);
                          },
                          onHover: (hovering) {
                            // print("hovering");
                            // homeWatch.updateHover(hovering);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease,
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0.h, horizontal: 8.0.w),
                            decoration: BoxDecoration(
                              color: homeWatch.socialMedia[index].hovering
                                  ? AppColors.black
                                  : Colors.transparent,
                              border: Border.all(
                                  color: homeWatch.socialMedia[index].hovering
                                      ? AppColors.white
                                      : Colors.transparent,
                                  width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              homeWatch.socialMedia[index].className,
                              textAlign: TextAlign.center,
                              style: TextStyles.semiBold.copyWith(
                                  fontSize: 18.sp,
                                  color: homeWatch.socialMedia[index].hovering
                                      ? AppColors.white
                                      : AppColors.black616161,
                                  fontWeight: TextStyles.fwRegular,
                                  fontFamily: TextStyles.secondaryFontFamily),
                            ).paddingSymmetric(horizontal: 10),
                          ).paddingOnly(right: 20.w),
                        )),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          )
        ],
      ).paddingSymmetric(horizontal: 20.w),
    );
  }
}
