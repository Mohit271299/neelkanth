import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/scheduler.dart';
import 'package:neelkanth/framework/controller/contact_us/contact_us_controller.dart';
import 'package:neelkanth/ui/utils/theme/theme.dart';

class ContactUsWeb extends ConsumerStatefulWidget {
  const ContactUsWeb({Key? key}) : super(key: key);

  @override
  ConsumerState<ContactUsWeb> createState() => _ContactUsWebState();
}

class _ContactUsWebState extends ConsumerState<ContactUsWeb> {

  ///Init Override
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final contactUsWatch = ref.watch(contactUsController);
      //contactUsWatch.disposeController(isNotify : true);
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
          'Welcome to Neelkanth Contact',
          style: TextStyles.semiBold.copyWith(fontSize: 20.sp,color: AppColors.black),
        ),
      ),
    );
  }


}
