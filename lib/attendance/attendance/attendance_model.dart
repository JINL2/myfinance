import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/isloading_widget.dart';
import '/components/menu_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
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

  bool? clicked;

  ///  State fields for stateful widgets in this page.

  // Model for menuBar component.
  late MenuBarModel menuBarModel;
  // State field(s) for SelectStore widget.
  String? selectStoreValue;
  FormFieldController<String>? selectStoreValueController;
  // Stores action output result for [Backend Call - API (getshiftmetadata)] action in scanQR widget.
  ApiCallResponse? getShiftMeta1;
  // Stores action output result for [Custom Action - mergeAndRemoveDuplicatesShiftMeta] action in scanQR widget.
  List<ShiftMetaDataStruct>? getShiftMeta11;
  // Stores action output result for [Backend Call - API (getUserShiftStatus)] action in scanQR widget.
  ApiCallResponse? getUserShiftStatus1;
  // Stores action output result for [Custom Action - mergeAndRemoveDuplicatesShiftStatus] action in scanQR widget.
  List<ShiftStatusStruct>? getUserShiftStatus11;
  // State field(s) for CheckboxListTile widget.
  Map<ShiftStatusStruct, bool> checkboxListTileValueMap = {};
  List<ShiftStatusStruct> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Backend Call - Query Rows] action in Attend widget.
  List<ShiftRequestsRow>? getQuery1;
  // Stores action output result for [Backend Call - Update Row(s)] action in Attend widget.
  List<ShiftRequestsRow>? end;
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
