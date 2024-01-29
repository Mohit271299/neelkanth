import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/scheduler.dart';
import 'package:neelkanth/framework/controller/dashboard/dashboard_controller.dart';
import 'package:neelkanth/framework/utility/extension/extension.dart';
import 'package:neelkanth/ui/utils/theme/app_assets.dart';
import 'package:neelkanth/ui/utils/theme/theme.dart';
import 'package:neelkanth/ui/utils/widgets/common_appbar.dart';

class DashboardWeb extends ConsumerStatefulWidget {
  const DashboardWeb({Key? key}) : super(key: key);

  @override
  ConsumerState<DashboardWeb> createState() => _DashboardWebState();
}

class _DashboardWebState extends ConsumerState<DashboardWeb> {
  ///Init Override
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final dashboardWatch = ref.watch(dashboardController);
      //dashboardWatch.disposeController(isNotify : true);
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
    final dashboardWatch = ref.watch(dashboardController);
    return Scaffold(
      appBar: CommonAppBar(
        isLeadingEnable: true,
        backgroundColor: AppColors.greyEEEEEE,
        leftImage: AppAssets.bacKLogoSvg,
        centerWidget: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
        actions: [
          Container(
            child: Icon(
              Icons.notifications_none,
              color: AppColors.black,
              size: 25.sp,
            ),
          ).paddingOnly(right: 20.w),
          Container(
            child: Icon(
              Icons.person,
              color: AppColors.black,
              size: 25.sp,
            ),
          ).paddingOnly(right: 20.w),
        ],
      ),
      body: _bodyWidget(),
    );
  }

  ///Body Widget
  Widget _bodyWidget() {
    final dashboardWatch = ref.watch(dashboardController);
    return Container(
      child: dashboardWatch.listPages[dashboardWatch.initialPage],
    );
  }
}
