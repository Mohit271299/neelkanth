import 'package:flutter/material.dart';
import 'package:neelkanth/ui/dashboard/dashboard_mobile.dart';
import 'package:neelkanth/ui/dashboard/dashboard_web.dart';
import 'package:neelkanth/ui/utils/helper/base_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Dashboard extends StatelessWidget with BaseStatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  ///Build Override
  @override
  Widget buildPage(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (BuildContext context) {
          return const DashboardMobile();
        },
        desktop: (BuildContext context) {
          return const DashboardWeb();
        }
    );
  }
}

