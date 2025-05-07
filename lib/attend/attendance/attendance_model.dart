import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/isloading_widget.dart';
import '/components/menu_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'attendance_widget.dart' show AttendanceWidget;
import 'package:flutter/material.dart';

class AttendanceModel extends FlutterFlowModel<AttendanceWidget> {
  ///  Local state fields for this page.

  LatLng? userLocation;

  String? selectedRequestId;

  bool? blockSelect;

  String? selectedStoreId;

  List<String> finishShiftRequestId = [];
  void addToFinishShiftRequestId(String item) => finishShiftRequestId.add(item);
  void removeFromFinishShiftRequestId(String item) =>
      finishShiftRequestId.remove(item);
  void removeAtIndexFromFinishShiftRequestId(int index) =>
      finishShiftRequestId.removeAt(index);
  void insertAtIndexInFinishShiftRequestId(int index, String item) =>
      finishShiftRequestId.insert(index, item);
  void updateFinishShiftRequestIdAtIndex(
          int index, Function(String) updateFn) =>
      finishShiftRequestId[index] = updateFn(finishShiftRequestId[index]);

  ///  State fields for stateful widgets in this page.

  // Model for menuBar component.
  late MenuBarModel menuBarModel;
  // Stores action output result for [Backend Call - API (getshiftmetadata)] action in Button widget.
  ApiCallResponse? meta1;
  // Stores action output result for [Custom Action - mergeAndRemoveDuplicatesShiftMeta] action in Button widget.
  List<ShiftMetaDataStruct>? meta11;
  // Stores action output result for [Backend Call - API (getUserShiftStatus)] action in Button widget.
  ApiCallResponse? shiftstatus1;
  // Stores action output result for [Custom Action - mergeAndRemoveDuplicatesShiftStatus] action in Button widget.
  List<ShiftStatusStruct>? shiftstatus11;
  // State field(s) for CheckboxListTile widget.
  Map<ShiftStatusStruct, bool> checkboxListTileValueMap = {};
  List<ShiftStatusStruct> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  var scanQR = '';
  // Stores action output result for [Backend Call - API (getshiftmetadata)] action in scanQR widget.
  ApiCallResponse? getShiftMeta1;
  // Stores action output result for [Custom Action - mergeAndRemoveDuplicatesShiftMeta] action in scanQR widget.
  List<ShiftMetaDataStruct>? getShiftMeta11;
  // Stores action output result for [Backend Call - API (getUserShiftStatus)] action in scanQR widget.
  ApiCallResponse? getUserShiftStatus1;
  // Stores action output result for [Custom Action - mergeAndRemoveDuplicatesShiftStatus] action in scanQR widget.
  List<ShiftStatusStruct>? getUserShiftStatus11;
  // Stores action output result for [Backend Call - Query Rows] action in Attend widget.
  List<ShiftRequestsRow>? getQuery1;
  // Stores action output result for [Backend Call - Update Row(s)] action in Attend widget.
  List<ShiftRequestsRow>? end;
  // Stores action output result for [Backend Call - Update Row(s)] action in Attend widget.
  List<ShiftRequestsRow>? start;
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
