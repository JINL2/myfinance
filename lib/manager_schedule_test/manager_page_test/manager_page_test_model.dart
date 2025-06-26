import '/backend/schema/structs/index.dart';
import '/components/isloading_widget.dart';
import '/components/menu_bar_widget.dart';
import '/employee_schedule_test/date/date_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'manager_page_test_widget.dart' show ManagerPageTestWidget;
import 'package:flutter/material.dart';

class ManagerPageTestModel extends FlutterFlowModel<ManagerPageTestWidget> {
  ///  Local state fields for this page.

  GetTodayPlusMinusStruct? clickedDate;
  void updateClickedDateStruct(Function(GetTodayPlusMinusStruct) updateFn) {
    updateFn(clickedDate ??= GetTodayPlusMinusStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Model for menuBar component.
  late MenuBarModel menuBarModel;
  // Model for M2.
  late DateModel m2Model;
  // Model for M1.
  late DateModel m1Model;
  // Model for D0.
  late DateModel d0Model;
  // Model for DP1.
  late DateModel dp1Model;
  // Model for DP2.
  late DateModel dp2Model;
  // Model for isloading component.
  late IsloadingModel isloadingModel;

  @override
  void initState(BuildContext context) {
    menuBarModel = createModel(context, () => MenuBarModel());
    m2Model = createModel(context, () => DateModel());
    m1Model = createModel(context, () => DateModel());
    d0Model = createModel(context, () => DateModel());
    dp1Model = createModel(context, () => DateModel());
    dp2Model = createModel(context, () => DateModel());
    isloadingModel = createModel(context, () => IsloadingModel());
  }

  @override
  void dispose() {
    menuBarModel.dispose();
    m2Model.dispose();
    m1Model.dispose();
    d0Model.dispose();
    dp1Model.dispose();
    dp2Model.dispose();
    isloadingModel.dispose();
  }
}
