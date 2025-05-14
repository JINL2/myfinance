import '/backend/supabase/supabase.dart';
import '/components/isloading_widget.dart';
import '/components/menu_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cash_movement_widget.dart' show CashMovementWidget;
import 'package:flutter/material.dart';

class CashMovementModel extends FlutterFlowModel<CashMovementWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in cashMovement widget.
  List<CounterpartiesRow>? callCounterParty;
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
