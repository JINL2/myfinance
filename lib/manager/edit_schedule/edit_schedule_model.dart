import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_schedule_widget.dart' show EditScheduleWidget;
import 'package:flutter/material.dart';

class EditScheduleModel extends FlutterFlowModel<EditScheduleWidget> {
  ///  Local state fields for this component.

  ShiftsStruct? shifts;
  void updateShiftsStruct(Function(ShiftsStruct) updateFn) {
    updateFn(shifts ??= ShiftsStruct());
  }

  String? changedUserId;

  String? changedUsername;

  String? shiftId;

  String? realStartTime;

  String? realEndTime;

  bool? islate;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in editSchedule widget.
  List<ShiftRequestsRow>? query;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Custom Action - deleteUserIdByShiftRequestId] action in Icon widget.
  List<ManagerShiftDetailStruct>? newShiftRequestAfterDelete;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
