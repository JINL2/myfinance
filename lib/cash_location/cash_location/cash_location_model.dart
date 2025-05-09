import '/components/menu_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/jeong_work/add/add_widget.dart';
import 'cash_location_widget.dart' show CashLocationWidget;
import 'package:flutter/material.dart';

class CashLocationModel extends FlutterFlowModel<CashLocationWidget> {
  ///  Local state fields for this page.

  String? choosenStore;

  ///  State fields for stateful widgets in this page.

  // Model for menuBar component.
  late MenuBarModel menuBarModel;
  // Model for add component.
  late AddModel addModel;

  @override
  void initState(BuildContext context) {
    menuBarModel = createModel(context, () => MenuBarModel());
    addModel = createModel(context, () => AddModel());
  }

  @override
  void dispose() {
    menuBarModel.dispose();
    addModel.dispose();
  }
}
