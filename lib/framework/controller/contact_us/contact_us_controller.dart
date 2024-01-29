import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:neelkanth/framework/utility/ui_state.dart';
import '../../dependency_injection/inject.dart';


final contactUsController = ChangeNotifierProvider(
      (ref) => getIt<ContactUsController>(),
);

@injectable
class ContactUsController extends ChangeNotifier {

  ///Dispose Controller
  void disposeController({bool isNotify = false}) {
    contactusState.isLoading = false;
    if (isNotify) {
      notifyListeners();
    }
  }

  var contactusState = UIState();

  /// update loading
  void updateLoadingStatus(value) {
    contactusState.isLoading = value;
    notifyListeners();
  }


}
