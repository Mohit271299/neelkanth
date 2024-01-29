import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/scheduler.dart';
import 'package:neelkanth/framework/controller/home/home_controller.dart';
import 'package:neelkanth/ui/utils/theme/theme.dart';

class HomeMobile extends ConsumerStatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends ConsumerState<HomeMobile> {

  ///Init Override
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final homeWatch = ref.read(homeController);
      //homeWatch.disposeController(isNotify : true);
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
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              AppAssets.homeBg,
              // height: 800.h,
              height: MediaQuery.sizeOf(context).height,
              fit: BoxFit.fitHeight,
            )
          ],
        ),
      ),
    );
  }


}
