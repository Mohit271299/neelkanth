import 'package:flutter/material.dart';
import 'package:neelkanth/ui/contact_us/contact_us_mobile.dart';
import 'package:neelkanth/ui/contact_us/contact_us_web.dart';
import 'package:neelkanth/ui/utils/helper/base_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContactUs extends StatelessWidget with BaseStatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  ///Build Override
  @override
  Widget buildPage(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (BuildContext context) {
          return const ContactUsMobile();
        },
        desktop: (BuildContext context) {
          return const ContactUsWeb();
        }
    );
  }
}

