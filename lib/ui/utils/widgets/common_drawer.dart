import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neelkanth/framework/controller/dashboard/dashboard_controller.dart';
import 'package:neelkanth/framework/utility/extension/extension.dart';
import 'package:neelkanth/ui/utils/theme/theme.dart';
import 'package:neelkanth/ui/utils/widgets/common_svg.dart';

class CommonDrawer extends ConsumerWidget{



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardWatch = ref.watch(dashboardController);
    return Drawer(
      child: Column(
        children: [
          CommonSVG(
            strIcon: AppAssets.bacKLogoSvg,
            boxFit: BoxFit.scaleDown,
            height: 200.h,width: 100.w,
          ).paddingOnly(left: 20.h),

          ...List.generate(
              dashboardWatch.listPageString.length,
                  (index) => InkWell(
                onTap: () {
                  dashboardWatch.updatePageIndex(index);
                },
                child: Text(
                  dashboardWatch.listPageString[index],
                  style: TextStyles.medium
                      .copyWith(fontSize: 16, color: AppColors.black),
                ).paddingAll(20.w),
              ))

        ],
      ),
    );
  }

}