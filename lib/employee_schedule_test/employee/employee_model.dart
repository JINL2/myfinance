import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/isloading_widget.dart';
import '/components/menu_bar_widget.dart';
import '/employee_schedule_test/date/date_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'employee_widget.dart' show EmployeeWidget;
import 'package:flutter/material.dart';

class EmployeeModel extends FlutterFlowModel<EmployeeWidget> {
  ///  Local state fields for this page.

  GetTodayPlusMinusStruct? clickedDate;
  void updateClickedDateStruct(Function(GetTodayPlusMinusStruct) updateFn) {
    updateFn(clickedDate ??= GetTodayPlusMinusStruct());
  }

  String? scanedStoreId;

  List<UserShiftQuantityStruct> userShiftQuantity = [];
  void addToUserShiftQuantity(UserShiftQuantityStruct item) =>
      userShiftQuantity.add(item);
  void removeFromUserShiftQuantity(UserShiftQuantityStruct item) =>
      userShiftQuantity.remove(item);
  void removeAtIndexFromUserShiftQuantity(int index) =>
      userShiftQuantity.removeAt(index);
  void insertAtIndexInUserShiftQuantity(
          int index, UserShiftQuantityStruct item) =>
      userShiftQuantity.insert(index, item);
  void updateUserShiftQuantityAtIndex(
          int index, Function(UserShiftQuantityStruct) updateFn) =>
      userShiftQuantity[index] = updateFn(userShiftQuantity[index]);

  List<VShiftRequestMonthStruct> vshiftRequestMonth = [];
  void addToVshiftRequestMonth(VShiftRequestMonthStruct item) =>
      vshiftRequestMonth.add(item);
  void removeFromVshiftRequestMonth(VShiftRequestMonthStruct item) =>
      vshiftRequestMonth.remove(item);
  void removeAtIndexFromVshiftRequestMonth(int index) =>
      vshiftRequestMonth.removeAt(index);
  void insertAtIndexInVshiftRequestMonth(
          int index, VShiftRequestMonthStruct item) =>
      vshiftRequestMonth.insert(index, item);
  void updateVshiftRequestMonthAtIndex(
          int index, Function(VShiftRequestMonthStruct) updateFn) =>
      vshiftRequestMonth[index] = updateFn(vshiftRequestMonth[index]);

  List<VSalaryIndividualStruct> vsalaryIndividual = [];
  void addToVsalaryIndividual(VSalaryIndividualStruct item) =>
      vsalaryIndividual.add(item);
  void removeFromVsalaryIndividual(VSalaryIndividualStruct item) =>
      vsalaryIndividual.remove(item);
  void removeAtIndexFromVsalaryIndividual(int index) =>
      vsalaryIndividual.removeAt(index);
  void insertAtIndexInVsalaryIndividual(
          int index, VSalaryIndividualStruct item) =>
      vsalaryIndividual.insert(index, item);
  void updateVsalaryIndividualAtIndex(
          int index, Function(VSalaryIndividualStruct) updateFn) =>
      vsalaryIndividual[index] = updateFn(vsalaryIndividual[index]);

  List<dynamic> overView = [];
  void addToOverView(dynamic item) => overView.add(item);
  void removeFromOverView(dynamic item) => overView.remove(item);
  void removeAtIndexFromOverView(int index) => overView.removeAt(index);
  void insertAtIndexInOverView(int index, dynamic item) =>
      overView.insert(index, item);
  void updateOverViewAtIndex(int index, Function(dynamic) updateFn) =>
      overView[index] = updateFn(overView[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in employee widget.
  List<CurrencyTypesRow>? oPLCurrencyType;
  // Stores action output result for [Backend Call - API (usershiftmonthlysummary)] action in employee widget.
  ApiCallResponse? oPLOverView;
  // Stores action output result for [Backend Call - API (getusersalaryindividual)] action in employee widget.
  ApiCallResponse? oPLgetusersalaryindividual;
  // Stores action output result for [Backend Call - API (getshiftrequestmonthly)] action in employee widget.
  ApiCallResponse? oPLShiftRequestMonthly;
  // Stores action output result for [Backend Call - API (getshiftmetadata)] action in employee widget.
  ApiCallResponse? oPLshiftMetaData;
  // Stores action output result for [Backend Call - API (getUserShiftStatus)] action in employee widget.
  ApiCallResponse? oPLUserShiftStatus;
  // Stores action output result for [Backend Call - API (getUserShiftQuantity)] action in employee widget.
  ApiCallResponse? oPLGetUserShiftQuantity;
  // Model for menuBar component.
  late MenuBarModel menuBarModel;
  // Stores action output result for [Backend Call - API (usershiftmonthlysummary)] action in Container widget.
  ApiCallResponse? callbackoverviewAPI;
  // Stores action output result for [Backend Call - API (usershiftmonthlysummary)] action in Icon widget.
  ApiCallResponse? dateBack;
  // Stores action output result for [Backend Call - API (usershiftmonthlysummary)] action in Icon widget.
  ApiCallResponse? datefoward;
  // Model for DayBeforeYesterday.
  late DateModel dayBeforeYesterdayModel;
  // Stores action output result for [Backend Call - API (usershiftmonthlysummary)] action in DayBeforeYesterday widget.
  ApiCallResponse? dateM2;
  // Model for yesterday.
  late DateModel yesterdayModel;
  // Stores action output result for [Backend Call - API (usershiftmonthlysummary)] action in yesterday widget.
  ApiCallResponse? dateM1;
  // Model for Today.
  late DateModel todayModel;
  // Model for Tmw.
  late DateModel tmwModel;
  // Stores action output result for [Backend Call - API (usershiftmonthlysummary)] action in Tmw widget.
  ApiCallResponse? dateTmw;
  // Model for DayAfterTmw.
  late DateModel dayAfterTmwModel;
  // Stores action output result for [Backend Call - API (usershiftmonthlysummary)] action in DayAfterTmw widget.
  ApiCallResponse? datetmw2;
  // State field(s) for filteredApprove widget.
  bool? filteredApproveValue;
  var scanQR = '';
  // Stores action output result for [Backend Call - API (updateShiftRequests)] action in calanderDataTest widget.
  ApiCallResponse? clickFinish;
  // Stores action output result for [Backend Call - API (updateShiftRequests)] action in calanderDataTest widget.
  ApiCallResponse? clickAttend;
  // Model for isloading component.
  late IsloadingModel isloadingModel;

  @override
  void initState(BuildContext context) {
    menuBarModel = createModel(context, () => MenuBarModel());
    dayBeforeYesterdayModel = createModel(context, () => DateModel());
    yesterdayModel = createModel(context, () => DateModel());
    todayModel = createModel(context, () => DateModel());
    tmwModel = createModel(context, () => DateModel());
    dayAfterTmwModel = createModel(context, () => DateModel());
    isloadingModel = createModel(context, () => IsloadingModel());
  }

  @override
  void dispose() {
    menuBarModel.dispose();
    dayBeforeYesterdayModel.dispose();
    yesterdayModel.dispose();
    todayModel.dispose();
    tmwModel.dispose();
    dayAfterTmwModel.dispose();
    isloadingModel.dispose();
  }
}
