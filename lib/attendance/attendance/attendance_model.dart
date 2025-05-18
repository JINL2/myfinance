import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/isloading_widget.dart';
import '/components/menu_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'attendance_widget.dart' show AttendanceWidget;
import 'package:flutter/material.dart';

class AttendanceModel extends FlutterFlowModel<AttendanceWidget> {
  ///  Local state fields for this page.

  LatLng? userLocation;

  String? selectedRequestId;

  bool? blockSelect;

  String? selectedStoreId;

  bool? clicked;

  ///  State fields for stateful widgets in this page.

  // Model for menuBar component.
  late MenuBarModel menuBarModel;
  // State field(s) for SelectStoreDropDown widget.
  String? selectStoreDropDownValue;
  FormFieldController<String>? selectStoreDropDownValueController;
  // Stores action output result for [Backend Call - API (getUserShiftStatus)] action in Button widget.
  ApiCallResponse? shiftStatus1;
  // Stores action output result for [Backend Call - API (getshiftmetadata)] action in Button widget.
  ApiCallResponse? metaData;
  // State field(s) for Checkbox widget.
  Map<ShiftStatusStruct, bool> checkboxValueMap = {};
  List<ShiftStatusStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ShiftRequestsRow>? callShiftStatus;
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
