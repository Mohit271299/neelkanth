import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:neelkanth/framework/controller/product/products_controller.dart';
import 'package:neelkanth/framework/utility/extension/extension.dart';
import 'package:neelkanth/ui/utils/theme/theme.dart';
import 'package:neelkanth/ui/utils/widgets/common_button.dart';
import 'package:neelkanth/ui/utils/widgets/common_svg.dart';

class ProductsWeb extends ConsumerStatefulWidget {
  const ProductsWeb({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductsWeb> createState() => _ProductsWebState();
}

class _ProductsWebState extends ConsumerState<ProductsWeb> {
  ///Init Override
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final productsWatch = ref.watch(productsController);
      //productsWatch.disposeController(isNotify : true);
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
    final productWatch = ref.watch(productsController);
    return Container(
      height: 612.h,
      width: MediaQuery.sizeOf(context).width,
      child: FlutterCarousel(
        options: CarouselOptions(
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 10),
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            slideIndicator: CircularWaveSlideIndicator(
                indicatorBackgroundColor: AppColors.black616161,
                currentIndicatorColor: AppColors.primary),
            floatingIndicator: false,
            showIndicator: true),
        items: [
          ...List.generate(
            productWatch.productList.length,
            (index) => Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: GridView.custom(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 4,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        repeatPattern: QuiltedGridRepeatPattern.same,
                        pattern: [
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 2),
                        ],
                      ),
                      childrenDelegate: SliverChildBuilderDelegate(
                        (context, index) => Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.primary,width: 0.5)
                            ),
                            child: CommonSVG(strIcon: AppAssets.bacKLogoSvg)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productWatch.productList[index].title,
                          textAlign: TextAlign.justify,
                          style: TextStyles.semiBold.copyWith(
                              fontSize: 26.sp,
                              color: AppColors.black,
                              fontWeight: TextStyles.fwRegular,
                              fontFamily: TextStyles.poppinsFontFamily),
                        ).paddingOnly(bottom: 25.h),
                        Text(
                          productWatch.productList[index].subtitle,
                          textAlign: TextAlign.justify,
                          style: TextStyles.semiBold.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                              fontWeight: TextStyles.fwRegular,
                              fontFamily: TextStyles.poppinsFontFamily),
                        ).paddingOnly(bottom: 25.h),
                        CommonButton(
                          buttonText: AppStrings.productDetails,
                          backgroundColor: AppColors.blueEBF0F3,
                          buttonTextStyle: TextStyles.bold.copyWith(
                              fontFamily: TextStyles.secondaryFontFamily,
                              color: AppColors.black),
                          width: 300.w,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ).paddingOnly(top: 50.h),
          )
        ],
      ),
    );
  }
}
