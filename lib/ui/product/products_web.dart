import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/scheduler.dart';
import 'package:neelkanth/framework/controller/product/products_controller.dart';
import 'package:neelkanth/ui/utils/theme/theme.dart';

class ProductsWeb extends ConsumerStatefulWidget {
  const ProductsWeb({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductsWeb> createState() => _ProductsWebState();
}

class _ProductsWebState extends ConsumerState<ProductsWeb> {

  ///Init Override
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final productsWatch = ref.watch(productsController);
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
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to Neelkanth Product',
          style: TextStyles.semiBold.copyWith(fontSize: 20.sp,color: AppColors.black),
        ),
      ),
    );
  }


}
