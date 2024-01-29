import 'package:flutter/material.dart';
import 'package:neelkanth/ui/home/home_mobile.dart';
import 'package:neelkanth/ui/home/home_web.dart';
import 'package:neelkanth/ui/utils/helper/base_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Home extends StatelessWidget with BaseStatelessWidget {
  const Home({Key? key}) : super(key: key);

  ///Build Override
  @override
  Widget buildPage(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (BuildContext context) {
          return const HomeMobile();
        },
        desktop: (BuildContext context) {
          return const HomeWeb();
        }
    );
  }
}

