import '/components/isloading_widget.dart';
import '/components/menu_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_widget.dart' show TestWidget;
import 'package:flutter/material.dart';

class TestModel extends FlutterFlowModel<TestWidget> {
  ///  Local state fields for this page.

  String? scanedStoreId;

  bool? isScanned = false;

  int? todayShiftCount;

  int? todayWorkStatus;

  double? qrLocationLat;

  double? qrLocationLng;

  LatLng? locaiton;

  ///  State fields for stateful widgets in this page.

  // Model for menuBar component.
  late MenuBarModel menuBarModel;
  // Model for isloading component.
  late IsloadingModel isloadingModel;

  @override
  void initState(BuildContext context) {
    menuBarModel = createModel(context, () => MenuBarModel());
    isloadingModel = createModel(context, () => IsloadingModel());
  }

  @override
  void dispose() {
    menuBarModel.dispose();
    isloadingModel.dispose();
  }
}
