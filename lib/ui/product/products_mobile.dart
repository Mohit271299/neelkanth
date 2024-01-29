import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/scheduler.dart';
import 'package:neelkanth/framework/controller/product/products_controller.dart';

class ProductsMobile extends ConsumerStatefulWidget {
  const ProductsMobile({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductsMobile> createState() => _ProductsMobileState();
}

class _ProductsMobileState extends ConsumerState<ProductsMobile> {

  ///Init Override
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final productsWatch = ref.read(productsController);
      //productsWatch.disposeController(isNotify : true);
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
    return Scaffold(
      body: _bodyWidget(),
    );
  }

  ///Body Widget
  Widget _bodyWidget() {
    return Container();
  }


}
