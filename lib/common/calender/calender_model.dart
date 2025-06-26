import '/common/calender_day_text/calender_day_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'calender_widget.dart' show CalenderWidget;
import 'package:flutter/material.dart';

class CalenderModel extends FlutterFlowModel<CalenderWidget> {
  ///  Local state fields for this component.

  DateTime? inputDate;

  DateTime? selectedDate;

  List<String> selectedShift = [];
  void addToSelectedShift(String item) => selectedShift.add(item);
  void removeFromSelectedShift(String item) => selectedShift.remove(item);
  void removeAtIndexFromSelectedShift(int index) =>
      selectedShift.removeAt(index);
  void insertAtIndexInSelectedShift(int index, String item) =>
      selectedShift.insert(index, item);
  void updateSelectedShiftAtIndex(int index, Function(String) updateFn) =>
      selectedShift[index] = updateFn(selectedShift[index]);

  ///  State fields for stateful widgets in this component.

  // Model for CalenderDayText component.
  late CalenderDayTextModel calenderDayTextModel1;
  // Model for CalenderDayText component.
  late CalenderDayTextModel calenderDayTextModel2;
  // Model for CalenderDayText component.
  late CalenderDayTextModel calenderDayTextModel3;
  // Model for CalenderDayText component.
  late CalenderDayTextModel calenderDayTextModel4;
  // Model for CalenderDayText component.
  late CalenderDayTextModel calenderDayTextModel5;
  // Model for CalenderDayText component.
  late CalenderDayTextModel calenderDayTextModel6;
  // Model for CalenderDayText component.
  late CalenderDayTextModel calenderDayTextModel7;

  @override
  void initState(BuildContext context) {
    calenderDayTextModel1 = createModel(context, () => CalenderDayTextModel());
    calenderDayTextModel2 = createModel(context, () => CalenderDayTextModel());
    calenderDayTextModel3 = createModel(context, () => CalenderDayTextModel());
    calenderDayTextModel4 = createModel(context, () => CalenderDayTextModel());
    calenderDayTextModel5 = createModel(context, () => CalenderDayTextModel());
    calenderDayTextModel6 = createModel(context, () => CalenderDayTextModel());
    calenderDayTextModel7 = createModel(context, () => CalenderDayTextModel());
  }

  @override
  void dispose() {
    calenderDayTextModel1.dispose();
    calenderDayTextModel2.dispose();
    calenderDayTextModel3.dispose();
    calenderDayTextModel4.dispose();
    calenderDayTextModel5.dispose();
    calenderDayTextModel6.dispose();
    calenderDayTextModel7.dispose();
  }
}
