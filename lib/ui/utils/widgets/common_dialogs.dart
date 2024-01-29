import 'package:neelkanth/framework/utility/extension/extension.dart';
import 'package:neelkanth/framework/utility/session.dart';
import 'package:neelkanth/routing/navigation_stack_item.dart';
import 'package:neelkanth/routing/stack.dart';
import 'package:neelkanth/ui/utils/widgets/common_button.dart';
import 'package:neelkanth/ui/utils/theme/theme.dart';
import 'package:neelkanth/ui/utils/widgets/common_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Confirmation dialog  message
showConfirmationDialog(
    BuildContext context,
    String title,
    String message,
    String negativeButtonTitle,
    String positiveButtonTitle,
    Function(bool isPositive) didTakeAction) {
  return showDialog(
    barrierDismissible: true,
    context: context,
    // barrierColor: AppColors.black.withOpacity(0.6),
    builder: (context) => Dialog(
      backgroundColor: AppColors.white,
      insetPadding: EdgeInsets.all(20.sp),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(10.r),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: 40.w, right: 40.w, top: 30.h, bottom: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyles.medium
                          .copyWith(color: AppColors.black, fontSize: 20.sp),
                    ),
                  ),
                if (title.isNotEmpty)
                  SizedBox(
                    height: 20.h,
                  ),
                if (message.isNotEmpty)
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyles.medium
                        .copyWith(color: AppColors.black, fontSize: 16.sp),
                  ).paddingOnly(bottom: 16.h),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CommonButton(
                          borderRadius: BorderRadius.circular(5.r),
                          buttonText: negativeButtonTitle,
                          onTap: () {
                            Navigator.pop(context);
                            didTakeAction(false);
                                },
                                borderColor: AppColors.primary,
                                borderWidth: 1.w,
                          backgroundColor: AppColors.white,
                          buttonTextColor: AppColors.black),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: CommonButton(
                          buttonText: positiveButtonTitle,
                          borderRadius: BorderRadius.circular(5.r),
                          onTap: () {
                            Navigator.pop(context);
                            didTakeAction(true);
                                },
                                backgroundColor: AppColors.primary,
                                borderWidth: 1.w,
                          buttonTextColor: AppColors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

/// Message Sent Dialog
showMessageSentDialog(BuildContext context, String title, String message,
    String buttonText, Function()? didDismiss) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Dialog(
      insetPadding: EdgeInsets.all(16.sp),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(10.r),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonSVG(
                    strIcon: AppAssets.svgSuccess,
                    height: 44.h,
                    width: 44.w,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyles.medium
                        .copyWith(color: AppColors.black, fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyles.medium
                        .copyWith(color: AppColors.darkGrey, fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CommonButton(
                    width: 170.w,
                    buttonText: buttonText,
                    onTap: () {
                      Navigator.pop(context);
                      if (didDismiss != null) {
                        Future.delayed(const Duration(milliseconds: 80), () {
                          didDismiss();
                        });
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CommonSVG(
                strIcon: AppAssets.svgClose,
                height: 30.h,
                width: 30.w,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


/// Message Dialog
showMessageDialog(BuildContext context, String message, Function()? didDismiss) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: AppColors.greyLight.withOpacity(0.3),
      builder: (context) => Dialog(
            backgroundColor: AppColors.white,
            insetPadding: EdgeInsets.all(16.sp),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(10.r),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            message,
                            textAlign: TextAlign.center,
                            style: TextStyles.medium.copyWith(
                                color: AppColors.black, fontSize: 16.sp),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        CommonButton(
                          buttonTextColor: AppColors.black,
                          backgroundColor: AppColors.primary,
                          borderColor: AppColors.primary,
                          width: 150.w,
                          buttonText: "Okay",
                          onTap: () {
                            Navigator.pop(context);
                            if (didDismiss != null) {
                              Future.delayed(const Duration(milliseconds: 80),
                                  () {
                                didDismiss();
                              });
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));
}



/// Widget Dialog
showWidgetDialog(BuildContext context, Widget? widget, Function()? didDismiss,
    {bool isDismissDialog = false, int autoDismissTimer = 0}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: AppColors.greyLight.withOpacity(0.3),
      builder: (context) => Dialog(
            backgroundColor: AppColors.white,
            insetPadding: EdgeInsets.all(16.sp),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(10.r),
              ),
            ),
            child: Wrap(
              children: [
                widget!,
              ],
            ),
          ));

  if (autoDismissTimer > 0) {
    Future.delayed(Duration(seconds: autoDismissTimer), () {
      if (didDismiss != null) {
        didDismiss();
      }
    });
  } else {
    if (isDismissDialog) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        didDismiss!();
      });
    }
  }
}

/// Common Success Dialog
showCommonSuccessDialog(BuildContext context, String? svgImage, String? title,
    Function()? didDismiss,
    {bool isDismissDialog = false}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    barrierColor: AppColors.greyLight.withOpacity(0.3),
    builder: (context) => Dialog(
      backgroundColor: AppColors.white,
      insetPadding: EdgeInsets.all(16.sp),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(10.r),
        ),
      ),
      child: InkWell(
        onTap: () {
          if (didDismiss != null) {
            Future.delayed(const Duration(milliseconds: 80), () {
              didDismiss();
            });
          }
        },
        child: Wrap(
          children: [
            Center(
              child: CommonSVG(
                strIcon: svgImage!,
                height: 120.h,
                width: 120.h,
              ),
            ).paddingOnly(top: 73.h),
            Text(
              title!,
              style: TextStyles.bold
                  .copyWith(color: AppColors.black, fontSize: 20.sp),
              textAlign: TextAlign.center,
            ).paddingOnly(left: 62.w, top: 39.h, right: 61.w, bottom: 40.h)
          ],
        ),
      ),
    ),
  );
}
