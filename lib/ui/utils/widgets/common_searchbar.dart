import 'package:flutter/services.dart';

import 'package:neelkanth/ui/utils/theme/theme.dart';
import 'package:neelkanth/ui/utils/widgets/common_svg.dart';

class CommonSearchBar extends StatelessWidget {
  final double? height;
  final double? width;
  final String rightIcon;
  final Function()? onTap;
  final ValueChanged<String>? onChanged;
  final double? elevation;
  final double? circularValue;
  final Color? clrSplash;
  final Color? clrSearchIcon;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final double? borderRadius;
  final String placeholder;
  final String leftIcon;
  final Function()? onClearSearch;
  final Color? borderColor;
  final Color? bgColor;
  final double? borderWidth;
  final bool? readOnly;


  const CommonSearchBar({
    Key? key,
    required this.controller,
    this.onTap,
    this.onClearSearch,
    this.height,
    this.width,
    this.rightIcon = '',
    this.leftIcon = '',
    this.onChanged,
    this.elevation,
    this.circularValue,
    this.clrSplash,
    this.clrSearchIcon,
    this.borderRadius,
    this.focusNode,
    this.placeholder = '',
    this.bgColor,
    this.borderColor,
    this.borderWidth,
    this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return isHomeSearch ?? false
    //     ? InkWell(
    //         onTap: onTap,
    //         child: Container(
    //           height: height ?? 40.h,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(10.r),
    //             border: Border.all(color: AppColors.darkGrey),
    //           ),
    //           child: Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
    //             child: Row(
    //               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Image.asset(
    //                   icSearchIcon,
    //                   height: 18.h,
    //                   width: 18.w,
    //                   color: AppColors.primary,
    //                 ),
    //                 SizedBox(
    //                   width: 20.w,
    //                 ),
    //                 Text(label ?? 'Key_searchHere'.localized,
    //                     style: TextStyle(
    //                         fontWeight: TextStyles.fwRegular,
    //                         fontSize: 12.sp,
    //                         color: AppColors.black)),
    //               ],
    //             ),
    //           ),
    //         ),
    //       )
    //     :
    return Container(
            decoration: BoxDecoration(
                color: bgColor ?? AppColors.greySearchBarBg,
                borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
                border: Border.all(color: borderColor ?? AppColors.transparent, width: (borderWidth ?? 0.5).w)
            ),
            width: width ?? double.infinity,
            height: height ?? 40.h,
            child: Center(
              child: TextFormField(
                readOnly: readOnly ?? false,
                enabled: true,
                onTap: onTap,
                controller: controller,
                focusNode: focusNode,
                cursorColor: AppColors.black,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyles.regular.copyWith(color: AppColors.black, fontSize: 14.sp),
                textInputAction: TextInputAction.search,
                onChanged: onChanged,
                maxLines: 1,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(100),
                ],
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    border: InputBorder.none,
                    hintStyle: TextStyles.regular.copyWith(color: AppColors.placeholder, fontSize: 12.sp),
                    prefixIcon: (leftIcon.isNotEmpty) ? Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h, right: 9.w, left: 20.w),
                      child: (leftIcon.contains('.svg')) ? CommonSVG(
                          strIcon: leftIcon,
                      ) : Image.asset(
                        leftIcon,
                        height: 18.h,
                        width: 18.w,
                        color: clrSearchIcon ?? AppColors.primary,
                      ),
                    ) : const Offstage(),
                    prefixIconConstraints: BoxConstraints(minHeight: 10.h, minWidth: 20.w),
                    hintText: placeholder,
                  suffixIcon: (rightIcon.isNotEmpty) ? Padding(
                    padding: EdgeInsets.only(top: 10.h, bottom: 10.h, right: 16.w),
                    child: (rightIcon.contains('.svg')) ? CommonSVG(
                      strIcon: rightIcon,
                    ) : Image.asset(
                      rightIcon,
                      height: 18.h,
                      width: 18.w,
                      color: clrSearchIcon ?? AppColors.primary,
                    ),
                  ) : const Offstage(),
                ),
              ),
            ),
          );
  }
}


/*  Widget Usage
*
CommonSearchBar(leftIcon: AppAssets.svgDrawerMenu, controller: txtSearch)
* */
