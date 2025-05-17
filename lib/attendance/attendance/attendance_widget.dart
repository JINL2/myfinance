import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/isloading_widget.dart';
import '/components/menu_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'attendance_model.dart';
export 'attendance_model.dart';

class AttendanceWidget extends StatefulWidget {
  const AttendanceWidget({super.key});

  static String routeName = 'attendance';
  static String routePath = '/attendance';

  @override
  State<AttendanceWidget> createState() => _AttendanceWidgetState();
}

class _AttendanceWidgetState extends State<AttendanceWidget> {
  late AttendanceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AttendanceModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      _model.userLocation = currentUserLocationValue;
      _model.selectedRequestId = null;
      _model.finishShiftRequestId = [];
      _model.selectedStoreId = FFAppState().storeChoosen;
      _model.blockSelect = false;
      _model.clicked = false;
      safeSetState(() {});
      FFAppState().shiftMetaData = [];
      safeSetState(() {});
    });
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
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.menuBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: MenuBarWidget(
                      menuName: 'Attend',
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.clicked == false)
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 4.0),
                                    child: Text(
                                      'Selected Store : ${functions.getStoreNameByIdFromList(FFAppState().user.companies.where((e) => FFAppState().companyChoosen == e.companyId).toList().firstOrNull?.stores.toList(), _model.selectedStoreId)}',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.notoSansJp(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      'Select Store',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.notoSansJp(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40.0, 0.0, 40.0, 0.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.selectStoreValueController ??=
                                              FormFieldController<String>(
                                        _model.selectStoreValue ??= FFAppState()
                                            .user
                                            .companies
                                            .where((e) =>
                                                FFAppState().companyChoosen ==
                                                e.companyId)
                                            .toList()
                                            .firstOrNull
                                            ?.stores
                                            .firstOrNull
                                            ?.storeId,
                                      ),
                                      options: List<String>.from(FFAppState()
                                          .user
                                          .companies
                                          .where((e) =>
                                              FFAppState().companyChoosen ==
                                              e.companyId)
                                          .toList()
                                          .firstOrNull!
                                          .stores
                                          .map((e) => e.storeId)
                                          .toList()),
                                      optionLabels: FFAppState()
                                          .user
                                          .companies
                                          .where((e) =>
                                              FFAppState().companyChoosen ==
                                              e.companyId)
                                          .toList()
                                          .firstOrNull!
                                          .stores
                                          .map((e) => e.storeName)
                                          .toList(),
                                      onChanged: (val) async {
                                        safeSetState(() =>
                                            _model.selectStoreValue = val);
                                        _model.selectedStoreId =
                                            _model.selectStoreValue;
                                        safeSetState(() {});
                                      },
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansJp(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'Select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2.0,
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderWidth: 1.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.selectedStoreId =
                                            _model.selectedStoreId;
                                        safeSetState(() {});
                                        if (FFAppState().isLoading2 == false) {
                                          FFAppState().isLoading2 = true;
                                          safeSetState(() {});
                                          _model.getShiftMeta1 =
                                              await GetshiftmetadataCall.call(
                                            pStoreId: _model.selectedStoreId,
                                          );

                                          if ((_model
                                                  .getShiftMeta1?.succeeded ??
                                              true)) {
                                            _model.getShiftMeta11 = await actions
                                                .mergeAndRemoveDuplicatesShiftMeta(
                                              FFAppState()
                                                  .shiftMetaData
                                                  .toList(),
                                              ((_model.getShiftMeta1
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
                                                .getShiftMeta11!
                                                .toList()
                                                .cast<ShiftMetaDataStruct>();
                                            safeSetState(() {});
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Fail1'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }

                                          _model.getUserShiftStatus1 =
                                              await GetUserShiftStatusCall.call(
                                            pUserId: FFAppState().user.userId,
                                            pStoreId: _model.selectedStoreId,
                                            pRequestDate:
                                                getCurrentTimestamp.toString(),
                                          );

                                          if ((_model.getUserShiftStatus1
                                                  ?.succeeded ??
                                              true)) {
                                            _model.getUserShiftStatus11 =
                                                await actions
                                                    .mergeAndRemoveDuplicatesShiftStatus(
                                              FFAppState().shiftStatus.toList(),
                                              ((_model.getUserShiftStatus1
                                                                  ?.jsonBody ??
                                                              '')
                                                          .toList()
                                                          .map<ShiftStatusStruct?>(
                                                              ShiftStatusStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          ShiftStatusStruct?>)
                                                  .withoutNulls
                                                  .toList(),
                                            );
                                            FFAppState().shiftStatus = _model
                                                .getUserShiftStatus11!
                                                .toList()
                                                .cast<ShiftStatusStruct>();
                                            safeSetState(() {});
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Fail2'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }

                                          FFAppState().isLoading2 = false;
                                          safeSetState(() {});
                                        } else {
                                          FFAppState().isLoading2 = false;
                                          safeSetState(() {});
                                        }

                                        _model.clicked = true;
                                        safeSetState(() {});

                                        safeSetState(() {});
                                      },
                                      text: 'Confirm Select Store',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.notoSansJp(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            if (_model.clicked == true)
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        'Store: ${valueOrDefault<String>(
                                          functions.getStoreNameByIdFromList(
                                              FFAppState()
                                                  .user
                                                  .companies
                                                  .where((e) =>
                                                      FFAppState()
                                                          .companyChoosen ==
                                                      e.companyId)
                                                  .toList()
                                                  .firstOrNull
                                                  ?.stores
                                                  .toList(),
                                              _model.selectedStoreId),
                                          'Please Choose Store',
                                        )}',
                                        'Store Name',
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .displayMedium
                                          .override(
                                            font: GoogleFonts.notoSansJp(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .displayMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .displayMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .displayMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .displayMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final userShiftStatus = FFAppState()
                                          .shiftStatus
                                          .where((e) =>
                                              (e.isApproved == true) &&
                                              (e.requestDate ==
                                                  dateTimeFormat("yyyy-MM-dd",
                                                      getCurrentTimestamp)))
                                          .toList();

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: userShiftStatus.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 16.0),
                                        itemBuilder:
                                            (context, userShiftStatusIndex) {
                                          final userShiftStatusItem =
                                              userShiftStatus[
                                                  userShiftStatusIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      userShiftStatusItem
                                                          .requestDate,
                                                      'Date',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansJp(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Material(
                                                  color: Colors.transparent,
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                    child: CheckboxListTile(
                                                      value: _model
                                                              .checkboxListTileValueMap[
                                                          userShiftStatusItem] ??= false,
                                                      onChanged: _model
                                                              .blockSelect!
                                                          ? null
                                                          : (newValue) async {
                                                              safeSetState(() =>
                                                                  _model.checkboxListTileValueMap[
                                                                          userShiftStatusItem] =
                                                                      newValue!);
                                                              if (newValue!) {
                                                                _model.selectedRequestId =
                                                                    userShiftStatusItem
                                                                        .shiftRequestId;
                                                                _model.blockSelect =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                      title: Text(
                                                        valueOrDefault<String>(
                                                          FFAppState()
                                                              .shiftMetaData
                                                              .where((e) =>
                                                                  userShiftStatusItem
                                                                      .shiftId ==
                                                                  e.shiftId)
                                                              .toList()
                                                              .firstOrNull
                                                              ?.shiftName,
                                                          'Shift Name',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansJp(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      tileColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor: _model
                                                              .blockSelect!
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      dense: false,
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .trailing,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
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
                                  FFButtonWidget(
                                    onPressed: () async {
                                      if (FFAppState().isLoading2 == false) {
                                        FFAppState().isLoading2 = true;
                                        safeSetState(() {});
                                        _model.getQuery1 =
                                            await ShiftRequestsTable()
                                                .queryRows(
                                          queryFn: (q) => q.eqOrNull(
                                            'shift_request_id',
                                            _model.selectedRequestId,
                                          ),
                                        );
                                        if (_model.getQuery1?.firstOrNull
                                                ?.actualStartTime !=
                                            null) {
                                          if (_model.getQuery1?.firstOrNull
                                                  ?.actualEndTime !=
                                              null) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'You Already Attended'),
                                                  content: Text(
                                                      'Ask Manager if Any Problem'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else {
                                            await ShiftRequestsTable().update(
                                              data: {
                                                'checkout_location':
                                                    '0101000020E610000092132C5C4B4C5B40DC7AABD9DE7A2840',
                                                'actual_end_time':
                                                    supaSerialize<DateTime>(
                                                        getCurrentTimestamp),
                                                'updated_at':
                                                    supaSerialize<DateTime>(
                                                        getCurrentTimestamp),
                                              },
                                              matchingRows: (rows) =>
                                                  rows.eqOrNull(
                                                'shift_request_id',
                                                _model.selectedRequestId,
                                              ),
                                            );
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Success End'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }

                                          FFAppState().isLoading2 = false;
                                          safeSetState(() {});
                                        } else {
                                          await ShiftRequestsTable().update(
                                            data: {
                                              'actual_start_time':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'updated_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'checkin_location':
                                                  '0101000020E610000092132C5C4B4C5B40DC7AABD9DE7A2840',
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'shift_request_id',
                                              _model.selectedRequestId,
                                            ),
                                          );
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Success Attend'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }

                                        FFAppState().isLoading2 = false;
                                        safeSetState(() {});
                                      }
                                      FFAppState().isLoading2 = false;
                                      safeSetState(() {});

                                      safeSetState(() {});
                                    },
                                    text: 'Attend',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.notoSansJp(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
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
