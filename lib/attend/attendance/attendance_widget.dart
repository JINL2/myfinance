import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/isloading_widget.dart';
import '/components/menu_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
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
      _model.selectedStoreId = null;
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
                  FFButtonWidget(
                    onPressed: () async {
                      _model.selectedStoreId = FFAppState().storeChoosen;
                      safeSetState(() {});
                      if (FFAppState().isLoading1 == false) {
                        FFAppState().isLoading1 = true;
                        safeSetState(() {});
                        _model.meta1 = await GetshiftmetadataCall.call(
                          pStoreId: _model.selectedStoreId,
                        );

                        if ((_model.meta1?.succeeded ?? true)) {
                          _model.meta11 =
                              await actions.mergeAndRemoveDuplicatesShiftMeta(
                            FFAppState().shiftMetaData.toList(),
                            ((_model.meta1?.jsonBody ?? '')
                                    .toList()
                                    .map<ShiftMetaDataStruct?>(
                                        ShiftMetaDataStruct.maybeFromMap)
                                    .toList() as Iterable<ShiftMetaDataStruct?>)
                                .withoutNulls
                                .toList(),
                          );
                          FFAppState().shiftMetaData = _model.meta11!
                              .toList()
                              .cast<ShiftMetaDataStruct>();
                          safeSetState(() {});
                        } else {
                          FFAppState().isLoading1 = false;
                          safeSetState(() {});
                        }

                        _model.shiftstatus1 = await GetUserShiftStatusCall.call(
                          pUserId: FFAppState().user.userId,
                          pStoreId: _model.selectedStoreId,
                          pRequestDate: getCurrentTimestamp.toString(),
                        );

                        if ((_model.shiftstatus1?.succeeded ?? true)) {
                          _model.shiftstatus11 =
                              await actions.mergeAndRemoveDuplicatesShiftStatus(
                            FFAppState().shiftStatus.toList(),
                            ((_model.shiftstatus1?.jsonBody ?? '')
                                    .toList()
                                    .map<ShiftStatusStruct?>(
                                        ShiftStatusStruct.maybeFromMap)
                                    .toList() as Iterable<ShiftStatusStruct?>)
                                .withoutNulls
                                .toList(),
                          );
                          FFAppState().shiftStatus = _model.shiftstatus11!
                              .toList()
                              .cast<ShiftStatusStruct>();
                          safeSetState(() {});
                        } else {
                          FFAppState().isLoading1 = false;
                          safeSetState(() {});
                        }

                        FFAppState().isLoading1 = false;
                        safeSetState(() {});
                      } else {
                        FFAppState().isLoading1 = false;
                        safeSetState(() {});
                      }

                      safeSetState(() {});
                    },
                    text: 'Button',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.notoSansJp(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Builder(
                                builder: (context) {
                                  final shiftMeta = FFAppState()
                                      .shiftMetaData
                                      .where((e) =>
                                          _model.selectedStoreId == e.storeId)
                                      .toList();

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: shiftMeta.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 4.0),
                                    itemBuilder: (context, shiftMetaIndex) {
                                      final shiftMetaItem =
                                          shiftMeta[shiftMetaIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final shiftStatus = FFAppState()
                                                  .shiftStatus
                                                  .where((e) =>
                                                      (_model.selectedStoreId ==
                                                          e.storeId) &&
                                                      e.isApproved &&
                                                      (functions.changeDateTimeToString(
                                                              getCurrentTimestamp) ==
                                                          e.requestDate))
                                                  .toList();

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: shiftStatus.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 8.0),
                                                itemBuilder: (context,
                                                    shiftStatusIndex) {
                                                  final shiftStatusItem =
                                                      shiftStatus[
                                                          shiftStatusIndex];
                                                  return Material(
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
                                                            shiftStatusItem] ??= _model
                                                                .selectedRequestId ==
                                                            shiftStatusItem
                                                                .shiftRequestId,
                                                        onChanged: ((_model
                                                                    .checkboxListTileCheckedItems
                                                                    .isNotEmpty) ==
                                                                true)
                                                            ? null
                                                            : (newValue) async {
                                                                safeSetState(() =>
                                                                    _model.checkboxListTileValueMap[
                                                                            shiftStatusItem] =
                                                                        newValue!);
                                                                if (newValue!) {
                                                                  _model.selectedRequestId =
                                                                      shiftStatusItem
                                                                          .shiftRequestId;
                                                                  _model.blockSelect =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model.selectedRequestId =
                                                                      null;
                                                                  _model.blockSelect =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                        title: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            shiftMetaItem
                                                                .shiftName,
                                                            'shift Name',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                        subtitle: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            shiftStatusItem
                                                                .requestDate,
                                                            'Date',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansJp(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
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
                                                        checkColor: ((_model
                                                                    .checkboxListTileCheckedItems
                                                                    .isNotEmpty) ==
                                                                true)
                                                            ? null
                                                            : FlutterFlowTheme
                                                                    .of(context)
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
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      _model.scanQR =
                                          await FlutterBarcodeScanner
                                              .scanBarcode(
                                        '#C62828', // scanning line color
                                        'Cancel', // cancel button text
                                        true, // whether to show the flash icon
                                        ScanMode.QR,
                                      );

                                      _model.selectedStoreId = _model.scanQR;
                                      safeSetState(() {});
                                      if (FFAppState().isLoading2 == false) {
                                        FFAppState().isLoading2 = true;
                                        safeSetState(() {});
                                        _model.getShiftMeta1 =
                                            await GetshiftmetadataCall.call(
                                          pStoreId: _model.selectedStoreId,
                                        );

                                        if ((_model.getShiftMeta1?.succeeded ??
                                            true)) {
                                          _model.getShiftMeta11 = await actions
                                              .mergeAndRemoveDuplicatesShiftMeta(
                                            FFAppState().shiftMetaData.toList(),
                                            ((_model.getShiftMeta1?.jsonBody ??
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

                                      safeSetState(() {});
                                    },
                                    text: 'Scan QR',
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
                            ],
                          ),
                          if (_model.selectedStoreId != null &&
                              _model.selectedStoreId != '')
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    if (FFAppState().isLoading2 == false) {
                                      FFAppState().isLoading2 = true;
                                      safeSetState(() {});
                                      _model.getQuery1 =
                                          await ShiftRequestsTable().queryRows(
                                        queryFn: (q) => q.eqOrNull(
                                          'shift_request_id',
                                          _model.selectedRequestId,
                                        ),
                                      );
                                      if (functions.changeDateTimeToString(
                                                  _model.getQuery1?.firstOrNull
                                                      ?.actualStartTime) !=
                                              null &&
                                          functions.changeDateTimeToString(
                                                  _model.getQuery1?.firstOrNull
                                                      ?.actualStartTime) !=
                                              '') {
                                        await ShiftRequestsTable().update(
                                          data: {
                                            'checkout_location':
                                                'POINT(109.19209961227742 12.239981462652786)',
                                            'actual_end_time':
                                                supaSerialize<DateTime>(
                                                    getCurrentTimestamp),
                                            'updated_at':
                                                supaSerialize<DateTime>(
                                                    getCurrentTimestamp),
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
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
                                      } else {
                                        await ShiftRequestsTable().update(
                                          data: {
                                            'checkin_location':
                                                'POINT(109.19209961227742 12.239981462652786)',
                                            'actual_start_time':
                                                supaSerialize<DateTime>(
                                                    getCurrentTimestamp),
                                            'updated_at':
                                                supaSerialize<DateTime>(
                                                    getCurrentTimestamp),
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'shift_request_id',
                                            _model.selectedRequestId,
                                          ),
                                        );
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Success Start'),
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

                                    safeSetState(() {});
                                  },
                                  text: 'Start',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
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
                              ].divide(SizedBox(width: 8.0)),
                            ),
                        ].divide(SizedBox(height: 20.0)),
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
