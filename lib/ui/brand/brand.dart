import 'package:flutter/material.dart';
import 'package:neelkanth/ui/brand/brand_mobile.dart';
import 'package:neelkanth/ui/brand/brand_web.dart';
import 'package:neelkanth/ui/utils/helper/base_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Brand extends StatelessWidget with BaseStatelessWidget {
  const Brand({Key? key}) : super(key: key);

  ///Build Override
  @override
  Widget buildPage(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (BuildContext context) {
          return const BrandMobile();
        },
        desktop: (BuildContext context) {
          return const BrandWeb();
        }
    );
  }
}

