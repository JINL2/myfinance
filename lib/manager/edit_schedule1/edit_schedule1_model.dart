import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_schedule1_widget.dart' show EditSchedule1Widget;
import 'package:flutter/material.dart';

class EditSchedule1Model extends FlutterFlowModel<EditSchedule1Widget> {
  ///  Local state fields for this component.

  String? shiftId;

  String? realStartTime;

  String? realEndTime;

  bool? isLateBoolean;

  bool? showWidgetBuilder;

  String? overtimeAmount;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in editSchedule1 widget.
  List<VShiftRequestRow>? query;
  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
