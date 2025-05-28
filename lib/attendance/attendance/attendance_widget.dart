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
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
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
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.clicked == false)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 0.0),
                                        child: Text(
                                          'Selected Store: ',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.notoSansJp(
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
                                      Expanded(
                                        child: Text(
                                          valueOrDefault<String>(
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
                                            'Store Name',
                                          ),
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.notoSansJp(
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
                                    ],
                                  ),
                                ),
                                FlutterFlowDropDown<String>(
                                  controller: _model
                                          .selectStoreDropDownValueController ??=
                                      FormFieldController<String>(
                                    _model.selectStoreDropDownValue ??= '',
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
                                        _model.selectStoreDropDownValue = val);
                                    _model.selectedStoreId =
                                        _model.selectStoreDropDownValue;
                                    safeSetState(() {});
                                  },
                                  width: MediaQuery.sizeOf(context).width * 0.6,
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
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
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    FFAppState().isLoading1 = true;
                                    safeSetState(() {});
                                    _model.clicked = true;
                                    safeSetState(() {});
                                    _model.shiftStatus1 =
                                        await GetUserShiftStatusCall.call(
                                      pUserId: FFAppState().user.userId,
                                      pStoreId: _model.selectedStoreId,
                                      pRequestDate: dateTimeFormat(
                                          "yyyy-MM-dd", getCurrentTimestamp),
                                    );

                                    if ((_model.shiftStatus1?.succeeded ??
                                        true)) {
                                      FFAppState().shiftStatus =
                                          ((_model.shiftStatus1?.jsonBody ?? '')
                                                      .toList()
                                                      .map<ShiftStatusStruct?>(
                                                          ShiftStatusStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      ShiftStatusStruct?>)
                                              .withoutNulls
                                              .toList()
                                              .cast<ShiftStatusStruct>();
                                      safeSetState(() {});
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Fail'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    _model.metaData =
                                        await GetshiftmetadataCall.call(
                                      pStoreId: _model.selectedStoreId,
                                    );

                                    if ((_model.metaData?.succeeded ?? true)) {
                                      FFAppState().shiftMetaData = ((_model
                                                          .metaData?.jsonBody ??
                                                      '')
                                                  .toList()
                                                  .map<ShiftMetaDataStruct?>(
                                                      ShiftMetaDataStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<ShiftMetaDataStruct?>)
                                          .withoutNulls
                                          .toList()
                                          .cast<ShiftMetaDataStruct>();
                                      safeSetState(() {});
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Fail'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    FFAppState().isLoading1 = false;
                                    safeSetState(() {});

                                    safeSetState(() {});
                                  },
                                  text: 'Confirm Select Store',
                                  options: FFButtonOptions(
                                    height: 48.0,
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
                              ]
                                  .divide(SizedBox(height: 12.0))
                                  .addToStart(SizedBox(height: 28.0))
                                  .addToEnd(SizedBox(height: 20.0)),
                            ),
                          if (_model.clicked ?? true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            valueOrDefault<String>(
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
                                              'Store Name',
                                            ),
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  font: GoogleFonts.notoSansJp(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final shiftStatus = FFAppState()
                                          .shiftStatus
                                          .where((e) =>
                                              (e.requestDate ==
                                                  dateTimeFormat("yyyy-MM-dd",
                                                      getCurrentTimestamp)) &&
                                              (e.isApproved == true))
                                          .toList();

                                      return ListView.separated(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          4.0,
                                          0,
                                          0,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: shiftStatus.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 12.0),
                                        itemBuilder:
                                            (context, shiftStatusIndex) {
                                          final shiftStatusItem =
                                              shiftStatus[shiftStatusIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    4.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Shift: ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansJp(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            FFAppState()
                                                                .shiftMetaData
                                                                .where((e) =>
                                                                    e.shiftId ==
                                                                    shiftStatusItem
                                                                        .shiftId)
                                                                .toList()
                                                                .firstOrNull
                                                                ?.shiftName,
                                                            'Shift Name',
                                                          ),
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansJp(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        flex: 8,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  shiftStatusItem
                                                                      .requestDate,
                                                                  'Date',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .notoSansJp(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
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
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                              ),
                                                            ),
                                                            unselectedWidgetColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                          ),
                                                          child: Checkbox(
                                                            value: _model
                                                                    .checkboxValueMap[
                                                                shiftStatusItem] ??= false,
                                                            onChanged: _model
                                                                    .blockSelect!
                                                                ? null
                                                                : (newValue) async {
                                                                    safeSetState(() =>
                                                                        _model.checkboxValueMap[shiftStatusItem] =
                                                                            newValue!);
                                                                    if (newValue!) {
                                                                      _model.blockSelect =
                                                                          true;
                                                                      _model.selectedRequestId =
                                                                          shiftStatusItem
                                                                              .shiftRequestId;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                            side: BorderSide(
                                                              width: 2,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            checkColor: _model
                                                                    .blockSelect!
                                                                ? null
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
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
                                      currentUserLocationValue =
                                          await getCurrentUserLocation(
                                              defaultLocation:
                                                  LatLng(0.0, 0.0));
                                      FFAppState().isLoading1 = true;
                                      safeSetState(() {});
                                      _model.callShiftStatus =
                                          await ShiftRequestsTable().queryRows(
                                        queryFn: (q) => q.eqOrNull(
                                          'shift_request_id',
                                          _model.selectedRequestId,
                                        ),
                                      );
                                      if (_model.callShiftStatus?.firstOrNull
                                              ?.actualStartTime !=
                                          null) {
                                        if (_model.callShiftStatus?.firstOrNull
                                                ?.actualEndTime !=
                                            null) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Already Attended'),
                                                content: Text('Ask to Manager'),
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
                                          _model.end =
                                              await UpdateShiftRequestsEndCall
                                                  .call(
                                            pShiftRequestId:
                                                _model.selectedRequestId,
                                            pActualEndTime:
                                                getCurrentTimestamp.toString(),
                                            pEndLat: functions.lat(
                                                currentUserLocationValue, true),
                                            pEndLng: functions.lat(
                                                currentUserLocationValue,
                                                false),
                                          );

                                          if ((_model.end?.succeeded ?? true)) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Success Finish Work'),
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
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title:
                                                      Text('Fail Finish Work'),
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

                                          FFAppState().isLoading1 = false;
                                          safeSetState(() {});
                                        }

                                        FFAppState().isLoading1 = false;
                                        safeSetState(() {});
                                      } else {
                                        _model.start =
                                            await UpdateShiftReqeustStartCall
                                                .call(
                                          pShiftRequestId:
                                              _model.selectedRequestId,
                                          pActualStartTime:
                                              getCurrentTimestamp.toString(),
                                          pStartLat: functions.lat(
                                              currentUserLocationValue, true),
                                          pStartLng: functions.lat(
                                              currentUserLocationValue, false),
                                        );

                                        if ((_model.start?.succeeded ?? true)) {
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
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Fail Attend'),
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

                                        FFAppState().isLoading1 = false;
                                        safeSetState(() {});
                                      }

                                      FFAppState().isLoading1 = false;
                                      safeSetState(() {});

                                      context
                                          .pushNamed(HomepageWidget.routeName);

                                      safeSetState(() {});
                                    },
                                    text: 'Attend',
                                    options: FFButtonOptions(
                                      width: 132.0,
                                      height: 48.0,
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
                                ].divide(SizedBox(height: 32.0)),
                              ),
                            ),
                        ],
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
