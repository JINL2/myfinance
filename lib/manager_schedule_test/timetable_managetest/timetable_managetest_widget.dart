import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/common/calender_bottom_sheet/calender_bottom_sheet_widget.dart';
import '/components/isloading_widget.dart';
import '/components/menu_bar_widget.dart';
import '/employee_schedule_test/date/date_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/manager/calnder_comp/calnder_comp_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'timetable_managetest_model.dart';
export 'timetable_managetest_model.dart';

class TimetableManagetestWidget extends StatefulWidget {
  const TimetableManagetestWidget({super.key});

  static String routeName = 'timetableManagetest';
  static String routePath = '/timetableManagetest';

  @override
  State<TimetableManagetestWidget> createState() =>
      _TimetableManagetestWidgetState();
}

class _TimetableManagetestWidgetState extends State<TimetableManagetestWidget>
    with TickerProviderStateMixin {
  late TimetableManagetestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimetableManagetestModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().shiftMetaData = [];
      FFAppState().managerShiftDetail = [];
      FFAppState().isLoading1 = false;
      FFAppState().isLoading2 = false;
      FFAppState().isLoading3 = false;
      safeSetState(() {});
      _model.selectedDate = functions.getTodayPlusMinus(getCurrentTimestamp, 0);
      _model.selectedStoreId = FFAppState().storeChoosen;
      _model.clickedMonthStatus = 'total_requests';
      safeSetState(() {});
      if (FFAppState().isLoading1 == false) {
        FFAppState().isLoading1 = true;
        safeSetState(() {});
        _model.goalMeta1 = await GetshiftmetadataCall.call(
          pStoreId: FFAppState().storeChoosen,
        );

        if ((_model.goalMeta1?.succeeded ?? true)) {
          _model.goalMeta1Finish =
              await actions.mergeAndRemoveDuplicatesShiftMeta(
            FFAppState().shiftMetaData.toList(),
            ((_model.goalMeta1?.jsonBody ?? '')
                    .toList()
                    .map<ShiftMetaDataStruct?>(ShiftMetaDataStruct.maybeFromMap)
                    .toList() as Iterable<ShiftMetaDataStruct?>)
                .withoutNulls
                .toList(),
          );
          FFAppState().shiftMetaData =
              _model.goalMeta1Finish!.toList().cast<ShiftMetaDataStruct>();
          safeSetState(() {});
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Error'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
          FFAppState().isLoading1 = false;
          safeSetState(() {});
        }

        _model.goalManager1 = await GetManagerShiftCall.call(
          pStoreId: FFAppState().storeChoosen,
          pRequestDate:
              dateTimeFormat("yyyy-MM-dd", _model.selectedDate?.date0),
        );

        if ((_model.goalManager1?.succeeded ?? true)) {
          _model.goalManagerFinish1 =
              await actions.mergeAndRemoveDuplicatesManagerShift(
            FFAppState().managerShiftDetail.toList(),
            ((_model.goalManager1?.jsonBody ?? '')
                    .toList()
                    .map<ManagerShiftDetailStruct?>(
                        ManagerShiftDetailStruct.maybeFromMap)
                    .toList() as Iterable<ManagerShiftDetailStruct?>)
                .withoutNulls
                .toList(),
          );
          FFAppState().managerShiftDetail = _model.goalManagerFinish1!
              .toList()
              .cast<ManagerShiftDetailStruct>();
          safeSetState(() {});
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Error2'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
          FFAppState().isLoading1 = false;
          safeSetState(() {});
        }

        FFAppState().isLoading1 = false;
        FFAppState().isLoading2 = false;
        FFAppState().isLoading3 = false;
        safeSetState(() {});
        _model.oPLOverview =
            await ManagerShiftGroup.managershiftgetoverviewCall.call(
          pStartDate: functions
              .getMonthFirstLast(
                  dateTimeFormat("yyyy-MM-dd", getCurrentTimestamp), true)
              ?.toString(),
          pEndDate: functions
              .getMonthFirstLast(
                  dateTimeFormat("yyyy-MM-dd", getCurrentTimestamp), false)
              ?.toString(),
          pStoreId: _model.selectedStoreId,
          pCompanyId: FFAppState().companyChoosen,
        );

        if ((_model.oPLOverview?.succeeded ?? true)) {
          _model.overview = (_model.oPLOverview?.jsonBody ?? '');
          _model.addToMontlystat(getJsonField(
            (_model.oPLOverview?.jsonBody ?? ''),
            r'''$.monthly_stats''',
          ));
          safeSetState(() {});
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Fail Overview API'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
        }

        _model.oPLManagerCard =
            await ManagerShiftGroup.managershiftgetcardsCall.call(
          pStartDate: functions
              .getMonthFirstLast(
                  dateTimeFormat("yyyy-MM-dd", getCurrentTimestamp), true)
              ?.toString(),
          pEndDate: functions
              .getMonthFirstLast(
                  dateTimeFormat("yyyy-MM-dd", getCurrentTimestamp), false)
              ?.toString(),
          pStoreId: _model.selectedStoreId,
          pCompanyId: FFAppState().companyChoosen,
        );

        if ((_model.oPLManagerCard?.succeeded ?? true)) {
          _model.storesData = getJsonField(
            (_model.oPLManagerCard?.jsonBody ?? ''),
            r'''$.stores''',
            true,
          )!
              .toList()
              .cast<dynamic>();
          safeSetState(() {});
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Fail Card API'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        FFAppState().isLoading1 = false;
        FFAppState().isLoading2 = false;
        FFAppState().isLoading3 = false;
        safeSetState(() {});
      }

      FFAppState().isLoading1 = false;
      FFAppState().isLoading2 = false;
      FFAppState().isLoading3 = false;
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  wrapWithModel(
                    model: _model.menuBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: MenuBarWidget(
                      menuName: 'Time Table Management',
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final storeList = FFAppState()
                                      .user
                                      .companies
                                      .where((e) =>
                                          e.companyId ==
                                          FFAppState().companyChoosen)
                                      .toList()
                                      .firstOrNull
                                      ?.stores
                                      .toList() ??
                                  [];

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(storeList.length,
                                      (storeListIndex) {
                                    final storeListItem =
                                        storeList[storeListIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.selectedStoreId =
                                            storeListItem.storeId;
                                        safeSetState(() {});
                                        if (FFAppState().isLoading2 == false) {
                                          FFAppState().isLoading2 = true;
                                          safeSetState(() {});
                                          if (functions.isListHaveDatatypeList(
                                              storeListItem.storeId,
                                              FFAppState()
                                                  .shiftMetaData
                                                  .toList())!) {
                                            FFAppState().isLoading2 = false;
                                            safeSetState(() {});
                                          } else {
                                            _model.storeMetaData =
                                                await GetshiftmetadataCall.call(
                                              pStoreId: storeListItem.storeId,
                                            );

                                            if ((_model
                                                    .storeMetaData?.succeeded ??
                                                true)) {
                                              _model.storeMetaData2 = await actions
                                                  .mergeAndRemoveDuplicatesShiftMeta(
                                                FFAppState()
                                                    .shiftMetaData
                                                    .toList(),
                                                ((_model.storeMetaData
                                                                    ?.jsonBody ??
                                                                '')
                                                            .toList()
                                                            .map<ShiftMetaDataStruct?>(
                                                                ShiftMetaDataStruct
                                                                    .maybeFromMap)
                                                            .toList()
                                                        as Iterable<
                                                            ShiftMetaDataStruct?>)
                                                    .withoutNulls
                                                    .toList(),
                                              );
                                              FFAppState().shiftMetaData = _model
                                                  .storeMetaData2!
                                                  .toList()
                                                  .cast<ShiftMetaDataStruct>();
                                              safeSetState(() {});
                                            } else {
                                              FFAppState().isLoading2 = false;
                                              safeSetState(() {});
                                            }

                                            _model.storeManager =
                                                await GetManagerShiftCall.call(
                                              pStoreId: storeListItem.storeId,
                                              pRequestDate: dateTimeFormat(
                                                  "yyyy-MM-dd",
                                                  _model.selectedDate?.date0),
                                            );

                                            if ((_model
                                                    .storeManager?.succeeded ??
                                                true)) {
                                              _model.storeManager2 = await actions
                                                  .mergeAndRemoveDuplicatesManagerShift(
                                                FFAppState()
                                                    .managerShiftDetail
                                                    .toList(),
                                                ((_model.storeManager
                                                                    ?.jsonBody ??
                                                                '')
                                                            .toList()
                                                            .map<ManagerShiftDetailStruct?>(
                                                                ManagerShiftDetailStruct
                                                                    .maybeFromMap)
                                                            .toList()
                                                        as Iterable<
                                                            ManagerShiftDetailStruct?>)
                                                    .withoutNulls
                                                    .toList(),
                                              );
                                              FFAppState().managerShiftDetail =
                                                  _model.storeManager2!
                                                      .toList()
                                                      .cast<
                                                          ManagerShiftDetailStruct>();
                                              safeSetState(() {});
                                            } else {
                                              FFAppState().isLoading2 = false;
                                              safeSetState(() {});
                                            }

                                            FFAppState().isLoading2 = false;
                                            safeSetState(() {});
                                          }
                                        } else {
                                          FFAppState().isLoading2 = false;
                                          safeSetState(() {});
                                        }

                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            storeListItem.storeId ==
                                                    _model.selectedStoreId
                                                ? Color(0xFF3B82F6)
                                                : Color(0xFFF3F4F6),
                                            Color(0xFFF3F4F6),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 16.0, 8.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              functions.getStoreNameByIdFromList(
                                                  FFAppState()
                                                      .user
                                                      .companies
                                                      .where((e) =>
                                                          e.companyId ==
                                                          FFAppState()
                                                              .companyChoosen)
                                                      .toList()
                                                      .firstOrNull
                                                      ?.stores
                                                      .toList(),
                                                  storeListItem.storeId),
                                              'store',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.notoSansJp(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: storeListItem
                                                              .storeId ==
                                                          _model.selectedStoreId
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).divide(SizedBox(width: 8.0)),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.notoSansJp(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.notoSansJp(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                            indicatorColor:
                                FlutterFlowTheme.of(context).primary,
                            tabs: [
                              Tab(
                                text: 'Show',
                              ),
                              Tab(
                                text: 'Manage',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (FFAppState()
                                                            .isLoading3 ==
                                                        false) {
                                                      FFAppState().isLoading3 =
                                                          true;
                                                      safeSetState(() {});
                                                      _model.getManagerShiftRefresh1 =
                                                          await GetManagerShiftCall
                                                              .call(
                                                        pStoreId: _model
                                                            .selectedStoreId,
                                                        pRequestDate:
                                                            dateTimeFormat(
                                                                "yyyy-MM-dd",
                                                                _model
                                                                    .selectedDate
                                                                    ?.date0),
                                                      );

                                                      if ((_model
                                                              .getManagerShiftRefresh1
                                                              ?.succeeded ??
                                                          true)) {
                                                        FFAppState()
                                                            .managerShiftDetail = ((_model
                                                                        .getManagerShiftRefresh1
                                                                        ?.jsonBody ??
                                                                    '')
                                                                .toList()
                                                                .map<ManagerShiftDetailStruct?>(
                                                                    ManagerShiftDetailStruct
                                                                        .maybeFromMap)
                                                                .toList() as Iterable<ManagerShiftDetailStruct?>)
                                                            .withoutNulls
                                                            .toList()
                                                            .cast<ManagerShiftDetailStruct>();
                                                        safeSetState(() {});
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Error2'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        FFAppState()
                                                            .isLoading3 = false;
                                                        safeSetState(() {});
                                                      }

                                                      FFAppState().isLoading1 =
                                                          false;
                                                      FFAppState().isLoading2 =
                                                          false;
                                                      FFAppState().isLoading3 =
                                                          false;
                                                      safeSetState(() {});
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.refresh_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                            wrapWithModel(
                                              model: _model.calnderCompModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CalnderCompWidget(
                                                inputDateComPara:
                                                    getCurrentTimestamp,
                                                initialSelectedDate:
                                                    getCurrentTimestamp,
                                                storeId: _model.selectedStoreId,
                                                onSelectDateAction:
                                                    (selectedDate) async {
                                                  _model.selectedDate =
                                                      functions
                                                          .getTodayPlusMinus(
                                                              selectedDate, 0);
                                                  safeSetState(() {});
                                                },
                                                selectedShift:
                                                    (selectedShift) async {
                                                  _model.selectedShiftRequestId =
                                                      selectedShift
                                                          .toList()
                                                          .cast<String>();
                                                  safeSetState(() {});
                                                },
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final managerInfo = FFAppState()
                                                        .managerShiftDetail
                                                        .where((e) =>
                                                            (_model.selectedStoreId ==
                                                                e.storeId) &&
                                                            (dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .selectedDate
                                                                        ?.date0) ==
                                                                e.requestDate))
                                                        .toList()
                                                        .firstOrNull
                                                        ?.shifts
                                                        .toList() ??
                                                    [];

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: managerInfo.length,
                                                  itemBuilder: (context,
                                                      managerInfoIndex) {
                                                    final managerInfoItem =
                                                        managerInfo[
                                                            managerInfoIndex];
                                                    return Visibility(
                                                      visible: managerInfoItem
                                                              .pendingCount !=
                                                          0,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            managerInfoItem.shiftName,
                                                                            'Shift Name',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          maxLines:
                                                                              1,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .override(
                                                                                font: GoogleFonts.notoSansJp(
                                                                                  fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 20.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                final pendding =
                                                                    managerInfoItem
                                                                        .pendingEmployees
                                                                        .toList();

                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      pendding
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          penddingIndex) {
                                                                    final penddingItem =
                                                                        pendding[
                                                                            penddingIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                            flex:
                                                                                9,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      penddingItem.userName,
                                                                                      'userName',
                                                                                    ),
                                                                                    maxLines: 1,
                                                                                    style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          font: GoogleFonts.notoSansJp(
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Theme(
                                                                              data: ThemeData(
                                                                                checkboxTheme: CheckboxThemeData(
                                                                                  visualDensity: VisualDensity.compact,
                                                                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                              ),
                                                                              child: Checkbox(
                                                                                value: _model.checkboxValueMap[penddingItem] ??= false,
                                                                                onChanged: (newValue) async {
                                                                                  safeSetState(() => _model.checkboxValueMap[penddingItem] = newValue!);
                                                                                  if (newValue!) {
                                                                                    _model.addToSelectedShiftRequestId(penddingItem.shiftRequestId);
                                                                                    safeSetState(() {});
                                                                                  } else {
                                                                                    _model.removeFromSelectedShiftRequestId(penddingItem.shiftRequestId);
                                                                                    safeSetState(() {});
                                                                                  }
                                                                                },
                                                                                side: (FlutterFlowTheme.of(context).alternate != null)
                                                                                    ? BorderSide(
                                                                                        width: 2,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      )
                                                                                    : null,
                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                checkColor: FlutterFlowTheme.of(context).info,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            FFButtonWidget(
                                              onPressed: (_model
                                                              .selectedShiftRequestId
                                                              .firstOrNull ==
                                                          null ||
                                                      _model.selectedShiftRequestId
                                                              .firstOrNull ==
                                                          '')
                                                  ? null
                                                  : () async {
                                                      if (FFAppState()
                                                              .isLoading2 ==
                                                          false) {
                                                        FFAppState()
                                                            .isLoading2 = true;
                                                        safeSetState(() {});
                                                        _model.changeSupaBaseApprove1 =
                                                            await ToggleshiftapprovalCall
                                                                .call(
                                                          pShiftRequestIdsList:
                                                              _model
                                                                  .selectedShiftRequestId,
                                                          pUserId: FFAppState()
                                                              .user
                                                              .userId,
                                                        );

                                                        if ((_model
                                                                .changeSupaBaseApprove1
                                                                ?.succeeded ??
                                                            true)) {
                                                          _model.newShiftDetail1 =
                                                              await actions
                                                                  .changeManagerShiftList(
                                                            _model
                                                                .selectedShiftRequestId
                                                                .toList(),
                                                            FFAppState()
                                                                .managerShiftDetail
                                                                .toList(),
                                                          );
                                                          FFAppState()
                                                                  .managerShiftDetail =
                                                              _model
                                                                  .newShiftDetail1!
                                                                  .toList()
                                                                  .cast<
                                                                      ManagerShiftDetailStruct>();
                                                          safeSetState(() {});
                                                        } else {
                                                          FFAppState()
                                                                  .isLoading2 =
                                                              false;
                                                          safeSetState(() {});
                                                        }

                                                        FFAppState()
                                                            .isLoading2 = false;
                                                        safeSetState(() {});
                                                        _model.selectedShiftRequestId =
                                                            [];
                                                        safeSetState(() {});
                                                      } else {
                                                        FFAppState()
                                                            .isLoading2 = false;
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                              text: 'Confirm',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: _model
                                                        .selectedShiftRequestId
                                                        .isNotEmpty
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansJp(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 12.0))
                                              .addToStart(
                                                  SizedBox(height: 16.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        '${valueOrDefault<String>(
                                                          dateTimeFormat(
                                                              "yyyy-MM",
                                                              _model
                                                                  .selectedDate
                                                                  ?.date0),
                                                          '2025-06 Status',
                                                        )} Status',
                                                        'yyyy-MM Status',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansJp(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(12.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.clickedMonthStatus =
                                                                          'total_requests';
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.clickedMonthStatus == 'total_requests'
                                                                              ? FlutterFlowTheme.of(context).primary
                                                                              : Color(0xFFF8F9FC),
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(16.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                getJsonField(
                                                                                  _model.montlystat
                                                                                      .where((e) =>
                                                                                          getJsonField(
                                                                                            e,
                                                                                            r'''$.month''',
                                                                                          ) ==
                                                                                          functions.convertStringToJson(dateTimeFormat("yyyy-MM", _model.selectedDate?.date0)))
                                                                                      .toList()
                                                                                      .firstOrNull,
                                                                                  r'''$[0].total_requests''',
                                                                                )?.toString(),
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                    font: GoogleFonts.notoSansJp(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault<Color>(
                                                                                      _model.clickedMonthStatus == 'total_requests' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryText,
                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                    fontSize: 24.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              'Total Request',
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    font: GoogleFonts.notoSansJp(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault<Color>(
                                                                                      _model.clickedMonthStatus == 'total_requests' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryText,
                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 4.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.clickedMonthStatus =
                                                                          'total_problems';
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.clickedMonthStatus == 'total_problems'
                                                                              ? FlutterFlowTheme.of(context).primary
                                                                              : Color(0xFFF8F9FC),
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(16.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                getJsonField(
                                                                                  _model.montlystat
                                                                                      .where((e) =>
                                                                                          getJsonField(
                                                                                            e,
                                                                                            r'''$.month''',
                                                                                          ) ==
                                                                                          functions.convertStringToJson(dateTimeFormat("yyyy-MM", _model.selectedDate?.date0)))
                                                                                      .toList()
                                                                                      .firstOrNull,
                                                                                  r'''$[0].total_problems''',
                                                                                )?.toString(),
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                    font: GoogleFonts.notoSansJp(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault<Color>(
                                                                                      _model.clickedMonthStatus == 'total_problems' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryText,
                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                    fontSize: 24.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              'Problem',
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    font: GoogleFonts.notoSansJp(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault<Color>(
                                                                                      _model.clickedMonthStatus == 'total_problems' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryText,
                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 4.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.clickedMonthStatus =
                                                                          'total_approved';
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.clickedMonthStatus == 'total_approved'
                                                                              ? FlutterFlowTheme.of(context).primary
                                                                              : Color(0xFFF8F9FC),
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(16.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                getJsonField(
                                                                                  _model.montlystat
                                                                                      .where((e) =>
                                                                                          getJsonField(
                                                                                            e,
                                                                                            r'''$.month''',
                                                                                          ) ==
                                                                                          functions.convertStringToJson(dateTimeFormat("yyyy-MM", _model.selectedDate?.date0)))
                                                                                      .toList()
                                                                                      .firstOrNull,
                                                                                  r'''$[0].total_approved''',
                                                                                )?.toString(),
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                    font: GoogleFonts.notoSansJp(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault<Color>(
                                                                                      _model.clickedMonthStatus == 'total_approved' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryText,
                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                    fontSize: 24.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              'Total Approved',
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    font: GoogleFonts.notoSansJp(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault<Color>(
                                                                                      _model.clickedMonthStatus == 'total_approved' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryText,
                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 4.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.clickedMonthStatus =
                                                                          'total_pending';
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.clickedMonthStatus == 'total_pending'
                                                                              ? FlutterFlowTheme.of(context).primary
                                                                              : Color(0xFFF8F9FC),
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(16.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                getJsonField(
                                                                                  _model.montlystat
                                                                                      .where((e) =>
                                                                                          getJsonField(
                                                                                            e,
                                                                                            r'''$.month''',
                                                                                          ) ==
                                                                                          functions.convertStringToJson(dateTimeFormat("yyyy-MM", _model.selectedDate?.date0)))
                                                                                      .toList()
                                                                                      .firstOrNull,
                                                                                  r'''$[0].total_pending''',
                                                                                )?.toString(),
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                    font: GoogleFonts.notoSansJp(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault<Color>(
                                                                                      _model.clickedMonthStatus == 'total_pending' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryText,
                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                    fontSize: 24.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              'Pending',
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    font: GoogleFonts.notoSansJp(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault<Color>(
                                                                                      _model.clickedMonthStatus == 'total_pending' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryText,
                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 4.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 8.0)),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                24.0,
                                                                12.0,
                                                                24.0,
                                                                12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.selectedDate =
                                                                functions.getTodayPlusMinus(
                                                                    _model
                                                                        .selectedDate
                                                                        ?.date0,
                                                                    -1);
                                                            safeSetState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .arrow_back_ios,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 36.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                                "yyyy-MM-dd",
                                                                _model
                                                                    .selectedDate
                                                                    ?.date0),
                                                            'yyyy-MM-dd',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansJp(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF111827),
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.8,
                                                                        child:
                                                                            CalenderBottomSheetWidget(
                                                                          inputDateComPara: _model
                                                                              .selectedDate
                                                                              ?.date0,
                                                                          initialSelectedDate: _model
                                                                              .selectedDate
                                                                              ?.date0,
                                                                          onSelectDateAction:
                                                                              (selectedDate) async {
                                                                            _model.selectedDate =
                                                                                functions.getTodayPlusMinus(selectedDate, 0);
                                                                            safeSetState(() {});
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        8.0,
                                                                        16.0,
                                                                        8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .calendar_month,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.selectedDate =
                                                                functions.getTodayPlusMinus(
                                                                    _model
                                                                        .selectedDate
                                                                        ?.date0,
                                                                    1);
                                                            safeSetState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 36.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.selectedDate =
                                                                functions.getTodayPlusMinus(
                                                                    _model
                                                                        .selectedDate
                                                                        ?.date0,
                                                                    -2);
                                                            safeSetState(() {});
                                                          },
                                                          child: wrapWithModel(
                                                            model:
                                                                _model.m2Model,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child: DateWidget(
                                                              day: _model
                                                                  .selectedDate
                                                                  ?.dayM2,
                                                              clickedDate: dateTimeFormat(
                                                                  "yyyy-MM-dd",
                                                                  _model
                                                                      .selectedDate
                                                                      ?.date0),
                                                              colorTrueFalse:
                                                                  false,
                                                              date: _model
                                                                  .selectedDate
                                                                  ?.dateM2,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.selectedDate =
                                                                functions.getTodayPlusMinus(
                                                                    _model
                                                                        .selectedDate
                                                                        ?.date0,
                                                                    -1);
                                                            safeSetState(() {});
                                                          },
                                                          child: wrapWithModel(
                                                            model:
                                                                _model.m1Model,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child: DateWidget(
                                                              day: _model
                                                                  .selectedDate
                                                                  ?.dayM1,
                                                              clickedDate: dateTimeFormat(
                                                                  "yyyy-MM-dd",
                                                                  _model
                                                                      .selectedDate
                                                                      ?.date0),
                                                              colorTrueFalse:
                                                                  false,
                                                              date: _model
                                                                  .selectedDate
                                                                  ?.dateM1,
                                                            ),
                                                          ),
                                                        ),
                                                        wrapWithModel(
                                                          model: _model.d0Model,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child: DateWidget(
                                                            day: _model
                                                                .selectedDate
                                                                ?.day0,
                                                            clickedDate:
                                                                dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .selectedDate
                                                                        ?.date0),
                                                            colorTrueFalse:
                                                                false,
                                                            date: _model
                                                                .selectedDate
                                                                ?.date0,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.selectedDate =
                                                                functions.getTodayPlusMinus(
                                                                    _model
                                                                        .selectedDate
                                                                        ?.date0,
                                                                    1);
                                                            safeSetState(() {});
                                                          },
                                                          child: wrapWithModel(
                                                            model:
                                                                _model.dp1Model,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child: DateWidget(
                                                              day: _model
                                                                  .selectedDate
                                                                  ?.daytmw,
                                                              clickedDate: dateTimeFormat(
                                                                  "yyyy-MM-dd",
                                                                  _model
                                                                      .selectedDate
                                                                      ?.date0),
                                                              colorTrueFalse:
                                                                  false,
                                                              date: _model
                                                                  .selectedDate
                                                                  ?.datetmw,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.selectedDate =
                                                                functions.getTodayPlusMinus(
                                                                    _model
                                                                        .selectedDate
                                                                        ?.date0,
                                                                    2);
                                                            safeSetState(() {});
                                                          },
                                                          child: wrapWithModel(
                                                            model:
                                                                _model.dp2Model,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child: DateWidget(
                                                              day: _model
                                                                  .selectedDate
                                                                  ?.daytmw2,
                                                              clickedDate: dateTimeFormat(
                                                                  "yyyy-MM-dd",
                                                                  _model
                                                                      .selectedDate
                                                                      ?.date0),
                                                              colorTrueFalse:
                                                                  false,
                                                              date: _model
                                                                  .selectedDate
                                                                  ?.datetmw2,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  height: 32.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 6.0,
                                                                12.0, 6.0),
                                                    child: Text(
                                                      'All',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansJp(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 32.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF3F4F6),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 6.0,
                                                                12.0, 6.0),
                                                    child: Text(
                                                      'Late 6',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansJp(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Total Employee (87)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansJp(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final managerCardStoresListView = _model
                                                        .storesData
                                                        .where((e) =>
                                                            functions
                                                                .convertJsonToString(
                                                                    getJsonField(
                                                              e,
                                                              r'''$.store_id''',
                                                            )) ==
                                                            _model
                                                                .selectedStoreId)
                                                        .toList();

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          managerCardStoresListView
                                                              .length,
                                                      separatorBuilder:
                                                          (_, __) => SizedBox(
                                                              height: 16.0),
                                                      itemBuilder: (context,
                                                          managerCardStoresListViewIndex) {
                                                        final managerCardStoresListViewItem =
                                                            managerCardStoresListView[
                                                                managerCardStoresListViewIndex];
                                                        return Builder(
                                                          builder: (context) {
                                                            final cards =
                                                                getJsonField(
                                                              managerCardStoresListViewItem,
                                                              r'''$.cards''',
                                                            ).toList();

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  cards.length,
                                                              itemBuilder:
                                                                  (context,
                                                                      cardsIndex) {
                                                                final cardsItem =
                                                                    cards[
                                                                        cardsIndex];
                                                                return Visibility(
                                                                  visible: (functions.convertJsonToString(
                                                                              getJsonField(
                                                                            cardsItem,
                                                                            r'''$.request_date''',
                                                                          )) ==
                                                                          dateTimeFormat(
                                                                              "yyyy-MM-dd",
                                                                              _model
                                                                                  .selectedDate?.date0)) &&
                                                                      (_model.clickedMonthStatus ==
                                                                              'total_approved'
                                                                          ? (functions.convertJsonToString(getJsonField(
                                                                                cardsItem,
                                                                                r'''$.is_approved''',
                                                                              )) ==
                                                                              'true')
                                                                          : (_model.clickedMonthStatus == 'total_pending'
                                                                              ? (functions.convertJsonToString(getJsonField(
                                                                                    cardsItem,
                                                                                    r'''$.is_approved''',
                                                                                  )) ==
                                                                                  'false')
                                                                              : (_model.clickedMonthStatus == 'total_problems'
                                                                                  ? (functions.convertJsonToString(getJsonField(
                                                                                        cardsItem,
                                                                                        r'''$.is_problem_solved''',
                                                                                      )) ==
                                                                                      'true')
                                                                                  : (_model.clickedMonthStatus == 'total_requests' ? true : false)))),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFF3F4F6),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          16.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: 40.0,
                                                                                height: 40.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(8.0),
                                                                                    child: Text(
                                                                                      '김',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.notoSansJp(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      getJsonField(
                                                                                        cardsItem,
                                                                                        r'''$.user_name''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.notoSansJp(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      getJsonField(
                                                                                        cardsItem,
                                                                                        r'''$.shift_name''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            font: GoogleFonts.notoSansJp(
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 4.0)),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                height: 24.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                  child: Text(
                                                                                    'Late',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          font: GoogleFonts.notoSansJp(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          fontSize: 10.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 12.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children:
                                                                                [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    'Working Time',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          font: GoogleFonts.notoSansJp(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      cardsItem,
                                                                                      r'''$.shift_time''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.notoSansJp(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 4.0)),
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    'Actual Start Time',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          font: GoogleFonts.notoSansJp(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        cardsItem,
                                                                                        r'''$.actual_start''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.notoSansJp(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 4.0)),
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    'Actual End Time',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          font: GoogleFonts.notoSansJp(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      cardsItem,
                                                                                      r'''$.actual_end''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.notoSansJp(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 4.0)),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                height: 28.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  borderRadius: BorderRadius.circular(14.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      cardsItem,
                                                                                      r'''$.notice_tag''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          font: GoogleFonts.notoSansJp(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          fontSize: 10.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ].divide(SizedBox(height: 12.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                          ].divide(SizedBox(height: 20.0)),
                                        ),
                                      ),
                                    ),
                                  ].addToStart(SizedBox(height: 20.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (FFAppState().isLoading1 ||
                  FFAppState().isLoading2 ||
                  FFAppState().isLoading3)
                wrapWithModel(
                  model: _model.isloadingModel,
                  updateCallback: () => safeSetState(() {}),
                  child: IsloadingWidget(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
