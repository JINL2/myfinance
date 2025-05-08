import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_schedule2_widget.dart' show EditSchedule2Widget;
import 'package:flutter/material.dart';

class EditSchedule2Model extends FlutterFlowModel<EditSchedule2Widget> {
  ///  Local state fields for this component.

  bool? islate;

  ShiftsStruct? shifts2;
  void updateShifts2Struct(Function(ShiftsStruct) updateFn) {
    updateFn(shifts2 ??= ShiftsStruct());
  }

  String? realStartTime2;

  String? realEndTime2;

  DateTime? adjustedStartTime;

  DateTime? adjustedEndTime;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in editSchedule2 widget.
  List<VShiftRequestRow>? query22;
  // State field(s) for LateSwitch widget.
  bool? lateSwitchValue;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for incentiveTextField widget.
  FocusNode? incentiveTextFieldFocusNode;
  TextEditingController? incentiveTextFieldTextController;
  String? Function(BuildContext, String?)?
      incentiveTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    incentiveTextFieldFocusNode?.dispose();
    incentiveTextFieldTextController?.dispose();
  }
}
