import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/isloading_widget.dart';
import '/components/menu_bar_widget.dart';
import '/employee_schedule_test/date/date_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/manager/calnder_comp/calnder_comp_widget.dart';
import 'timetable_managetest_widget.dart' show TimetableManagetestWidget;
import 'package:flutter/material.dart';

class TimetableManagetestModel
    extends FlutterFlowModel<TimetableManagetestWidget> {
  ///  Local state fields for this page.

  GetTodayPlusMinusStruct? selectedDate;
  void updateSelectedDateStruct(Function(GetTodayPlusMinusStruct) updateFn) {
    updateFn(selectedDate ??= GetTodayPlusMinusStruct());
  }

  List<String> selectedShiftRequestId = [];
  void addToSelectedShiftRequestId(String item) =>
      selectedShiftRequestId.add(item);
  void removeFromSelectedShiftRequestId(String item) =>
      selectedShiftRequestId.remove(item);
  void removeAtIndexFromSelectedShiftRequestId(int index) =>
      selectedShiftRequestId.removeAt(index);
  void insertAtIndexInSelectedShiftRequestId(int index, String item) =>
      selectedShiftRequestId.insert(index, item);
  void updateSelectedShiftRequestIdAtIndex(
          int index, Function(String) updateFn) =>
      selectedShiftRequestId[index] = updateFn(selectedShiftRequestId[index]);

  String? selectedStoreId;

  List<dynamic> dailySummary = [];
  void addToDailySummary(dynamic item) => dailySummary.add(item);
  void removeFromDailySummary(dynamic item) => dailySummary.remove(item);
  void removeAtIndexFromDailySummary(int index) => dailySummary.removeAt(index);
  void insertAtIndexInDailySummary(int index, dynamic item) =>
      dailySummary.insert(index, item);
  void updateDailySummaryAtIndex(int index, Function(dynamic) updateFn) =>
      dailySummary[index] = updateFn(dailySummary[index]);

  dynamic overview;

  List<dynamic> montlystat = [];
  void addToMontlystat(dynamic item) => montlystat.add(item);
  void removeFromMontlystat(dynamic item) => montlystat.remove(item);
  void removeAtIndexFromMontlystat(int index) => montlystat.removeAt(index);
  void insertAtIndexInMontlystat(int index, dynamic item) =>
      montlystat.insert(index, item);
  void updateMontlystatAtIndex(int index, Function(dynamic) updateFn) =>
      montlystat[index] = updateFn(montlystat[index]);

  String? clickedMonthStatus;

  List<dynamic> storesData = [];
  void addToStoresData(dynamic item) => storesData.add(item);
  void removeFromStoresData(dynamic item) => storesData.remove(item);
  void removeAtIndexFromStoresData(int index) => storesData.removeAt(index);
  void insertAtIndexInStoresData(int index, dynamic item) =>
      storesData.insert(index, item);
  void updateStoresDataAtIndex(int index, Function(dynamic) updateFn) =>
      storesData[index] = updateFn(storesData[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getshiftmetadata)] action in timetableManagetest widget.
  ApiCallResponse? goalMeta1;
  // Stores action output result for [Custom Action - mergeAndRemoveDuplicatesShiftMeta] action in timetableManagetest widget.
  List<ShiftMetaDataStruct>? goalMeta1Finish;
  // Stores action output result for [Backend Call - API (GetManagerShift)] action in timetableManagetest widget.
  ApiCallResponse? goalManager1;
  // Stores action output result for [Custom Action - mergeAndRemoveDuplicatesManagerShift] action in timetableManagetest widget.
  List<ManagerShiftDetailStruct>? goalManagerFinish1;
  // Stores action output result for [Backend Call - API (managershiftgetoverview)] action in timetableManagetest widget.
  ApiCallResponse? oPLOverview;
  // Stores action output result for [Backend Call - API (managershiftgetcards)] action in timetableManagetest widget.
  ApiCallResponse? oPLManagerCard;
  // Model for menuBar component.
  late MenuBarModel menuBarModel;
  // Stores action output result for [Backend Call - API (getshiftmetadata)] action in Container widget.
  ApiCallResponse? storeMetaData;
  // Stores action output result for [Custom Action - mergeAndRemoveDuplicatesShiftMeta] action in Container widget.
  List<ShiftMetaDataStruct>? storeMetaData2;
  // Stores action output result for [Backend Call - API (GetManagerShift)] action in Container widget.
  ApiCallResponse? storeManager;
  // Stores action output result for [Custom Action - mergeAndRemoveDuplicatesManagerShift] action in Container widget.
  List<ManagerShiftDetailStruct>? storeManager2;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - API (GetManagerShift)] action in Icon widget.
  ApiCallResponse? getManagerShiftRefresh1;
  // Model for CalnderComp component.
  late CalnderCompModel calnderCompModel;
  // State field(s) for Checkbox widget.
  Map<PendingEmployeesStruct, bool> checkboxValueMap = {};
  List<PendingEmployeesStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Backend Call - API (toggleshiftapproval)] action in Button widget.
  ApiCallResponse? changeSupaBaseApprove1;
  // Stores action output result for [Custom Action - changeManagerShiftList] action in Button widget.
  List<ManagerShiftDetailStruct>? newShiftDetail1;
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
    calnderCompModel = createModel(context, () => CalnderCompModel());
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
    tabBarController?.dispose();
    calnderCompModel.dispose();
    m2Model.dispose();
    m1Model.dispose();
    d0Model.dispose();
    dp1Model.dispose();
    dp2Model.dispose();
    isloadingModel.dispose();
  }
}
