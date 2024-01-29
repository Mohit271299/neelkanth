import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/scheduler.dart';
import 'package:neelkanth/framework/controller/brand/brand_controller.dart';

class BrandMobile extends ConsumerStatefulWidget {
  const BrandMobile({Key? key}) : super(key: key);

  @override
  ConsumerState<BrandMobile> createState() => _BrandMobileState();
}

class _BrandMobileState extends ConsumerState<BrandMobile> {

  ///Init Override
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final brandWatch = ref.read(brandController);
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
    return Container();
  }


}
