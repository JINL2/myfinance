import '/common/calender/calender_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'calender_bottom_sheet_widget.dart' show CalenderBottomSheetWidget;
import 'package:flutter/material.dart';

class CalenderBottomSheetModel
    extends FlutterFlowModel<CalenderBottomSheetWidget> {
  ///  Local state fields for this component.

  DateTime? selectedDate;

  DateTime? initialDate;

  ///  State fields for stateful widgets in this component.

  // Model for Calender component.
  late CalenderModel calenderModel;

  @override
  void initState(BuildContext context) {
    calenderModel = createModel(context, () => CalenderModel());
  }

  @override
  void dispose() {
    calenderModel.dispose();
  }
}
