import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

abstract class BaseView extends GetView {
  BaseView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  // S get appLocalization => S.of(Get.context!);

  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  // You can Override it
  bool safeArea() {
    return true;
  }

  // You can Override it
  bool resizeToAvoidBottomInset() {
    return false;
  }

  Widget body(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [annotatedRegion(context),  Container()],
    );
  }

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        //Status bar color for android
        statusBarColor: statusBarColor(),
        statusBarIconBrightness: Brightness.light,
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context),
      ),
    );
  }

  Widget pageScaffold(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //sets ios status bar color
        backgroundColor: pageBackgroundColor(),
        key: globalKey,
        appBar: appBar(context),
        floatingActionButton: floatingActionButton(),
        floatingActionButtonLocation: floatingActionButtonLocation(),
        body: pageContent(context),
        bottomNavigationBar: bottomNavigationBar(),
        drawer: drawer(),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
      ),
    );
  }

  Widget pageContent(BuildContext context) {
    return safeArea()
        ? SafeArea(
            child: body(context),
          )
        : body(context);
  }

  Widget showErrorSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    });

    return Container();
  }

  Color pageBackgroundColor() {
    return Colors.white;
  }

  Color statusBarColor() {
    return Colors.transparent;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  FloatingActionButtonLocation? floatingActionButtonLocation() {
    return FloatingActionButtonLocation.endFloat;
  }
}
