import 'package:flutter/material.dart';
import 'package:neelkanth/ui/product/products_mobile.dart';
import 'package:neelkanth/ui/product/products_web.dart';
import 'package:neelkanth/ui/utils/helper/base_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Products extends StatelessWidget with BaseStatelessWidget {
  const Products({Key? key}) : super(key: key);

  ///Build Override
  @override
  Widget buildPage(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (BuildContext context) {
          return const ProductsMobile();
        },
        desktop: (BuildContext context) {
          return const ProductsWeb();
        }
    );
  }
}

