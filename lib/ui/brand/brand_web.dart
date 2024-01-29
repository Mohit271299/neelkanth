import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/scheduler.dart';
import 'package:neelkanth/framework/controller/brand/brand_controller.dart';
import 'package:neelkanth/ui/utils/theme/theme.dart';

class BrandWeb extends ConsumerStatefulWidget {
  const BrandWeb({Key? key}) : super(key: key);

  @override
  ConsumerState<BrandWeb> createState() => _BrandWebState();
}

class _BrandWebState extends ConsumerState<BrandWeb> {

  ///Init Override
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final brandWatch = ref.watch(brandController);
      //brandWatch.disposeController(isNotify : true);
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
          'Welcome to Neelkanth Brand',
          style: TextStyles.semiBold.copyWith(fontSize: 20.sp,color: AppColors.black),
        ),
      ),
    );
  }


}
