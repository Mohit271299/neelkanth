import 'dart:io';

import 'package:neelkanth/framework/controller/dashboard/dashboard_controller.dart';
import 'package:neelkanth/framework/controller/home/home_controller.dart';
import 'package:neelkanth/routing/stack.dart';
import 'package:neelkanth/ui/utils/widgets/common_dialogs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neelkanth/framework/utility/extension/extension.dart';
import 'package:neelkanth/ui/utils/theme/theme.dart';
import 'package:neelkanth/ui/utils/widgets/common_svg.dart';

class CommonAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final bool isLeadingEnable;
  final bool isDrawerEnable;
  final GestureTapCallback? onLeadingPress;
  final GestureTapCallback? onDrawerPress;
  final String title;
  final String? leftImage;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final TextStyle? titleStyle;
  final Widget? centerWidget;
  final double bottomCornerRadius;
  final double elevation;

  const CommonAppBar({
    Key? key,
    this.isLeadingEnable = true,
    this.isDrawerEnable = false,
    this.onLeadingPress,
    this.leftImage,
    this.title = '',
    this.backgroundColor,
    this.titleStyle,
    this.actions,
    this.onDrawerPress,
    this.centerWidget,
    this.bottomCornerRadius = 0,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      centerTitle: false,
      leading: (isLeadingEnable)
          ? ((isDrawerEnable)
              ? Consumer(builder: (context, ref, child) {
                  return InkWell(
                    onTap: onDrawerPress ??
                        () {
                          final dashboardWatch = ref.watch(dashboardController);
                          dashboardWatch.key.currentState!.openDrawer();
                        },
                    child: const CommonSVG(
                      strIcon: AppAssets.svgDrawerMenu,
                      boxFit: BoxFit.scaleDown,
                    ).paddingAll(8.h),
                  );
                })
              : InkWell(
                  onTap: onLeadingPress ??
                      () {
                    if(ref.read(navigationStackController).items.length > 1){
                      ref.read(navigationStackController).pop();
                    }
                    else{
                      showConfirmationDialog(
                          context,
                          'Quit',
                          'Are you sure want to exit from app?',
                          'Cancel',
                          'Exit', (isPositive) {
                        if(isPositive){
                          exit(0);
                        }
                      });
                    }
                      },
                  child: CommonSVG(
                    strIcon: leftImage ?? AppAssets.svgBackArrow,
                    boxFit: BoxFit.scaleDown,

                    height: 200.h,width: 100.w,
                  ).paddingOnly(left: 20.h)))
          : const Offstage(),
      elevation: elevation,
      actions: actions,
      backgroundColor: backgroundColor ?? AppColors.scaffoldBGByTheme(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(bottomCornerRadius),
        ),
      ),
      title: centerWidget ??
          Text(title,
              textAlign: TextAlign.center,
              style: titleStyle ??
                  TextStyles.medium.copyWith(
                      fontSize: 16,
                      color: AppColors.black,
                      fontFamily: TextStyles.poppinsFontFamily)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height.h);
}

/*
Widget Usage
const CommonAppBar(
        title: "Home",
      ),
* */
