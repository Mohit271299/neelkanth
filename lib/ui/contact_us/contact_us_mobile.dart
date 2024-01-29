import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/scheduler.dart';
import 'package:neelkanth/framework/controller/contact_us/contact_us_controller.dart';

class ContactUsMobile extends ConsumerStatefulWidget {
  const ContactUsMobile({Key? key}) : super(key: key);

  @override
  ConsumerState<ContactUsMobile> createState() => _ContactUsMobileState();
}

class _ContactUsMobileState extends ConsumerState<ContactUsMobile> {

  ///Init Override
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final contactUsWatch = ref.read(contactUsController);
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
    return Container();
  }


}
