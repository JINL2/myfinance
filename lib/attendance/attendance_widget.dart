import '/backend/api_requests/api_calls.dart';
import '/components/isloading_widget.dart';
import '/components/menu_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
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
      FFAppState().isLoading1 = true;
      safeSetState(() {});
      _model.oPLShiftFilterNum = await ShiftrequestfilternumberCall.call(
        pUserId: FFAppState().user.userId,
        pRequestDate: dateTimeFormat("yyyy-MM-dd", getCurrentTimestamp),
        pStoreId: FFAppState().storeChoosen,
      );

      if ((_model.oPLShiftFilterNum?.succeeded ?? true)) {
        _model.todayShiftCount = (_model.oPLShiftFilterNum?.jsonBody ?? '');
        safeSetState(() {});
      }
      if (_model.todayShiftCount == 0) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('You Don\'t have Work Today'),
              content: Text('Ask to Manager'),
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

        context.pushNamed(HomepageWidget.routeName);
      } else {
        _model.oPLWorkStatus = await ShiftRequestStartOrNotCall.call(
          pUserId: FFAppState().user.userId,
          pRequestDate: dateTimeFormat("yyyy-MM-dd", getCurrentTimestamp),
          pStoreId: FFAppState().storeChoosen,
        );

        if ((_model.oPLWorkStatus?.succeeded ?? true)) {
          _model.todayWorkStatus = (_model.oPLWorkStatus?.jsonBody ?? '');
          safeSetState(() {});
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Fail Start Or Not'),
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
      }

      FFAppState().isLoading1 = false;
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
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    () {
                                      if (_model.todayWorkStatus == 0) {
                                        return 'Not Attended';
                                      } else if (_model.todayWorkStatus == 1) {
                                        return 'Working';
                                      } else if (_model.todayWorkStatus == 2) {
                                        return 'Work Finish';
                                      } else {
                                        return 'Work Status';
                                      }
                                    }(),
                                    'Null',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.notoSansJp(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                ),
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if (_model.todayWorkStatus == 0) {
                                        return FlutterFlowTheme.of(context)
                                            .tertiary;
                                      } else if (_model.todayWorkStatus == 1) {
                                        return FlutterFlowTheme.of(context)
                                            .success;
                                      } else if (_model.todayWorkStatus == 2) {
                                        return FlutterFlowTheme.of(context)
                                            .primary;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .primaryText;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(80.0),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              currentUserLocationValue =
                                  await getCurrentUserLocation(
                                      defaultLocation: LatLng(0.0, 0.0));
                              FFAppState().isLoading2 = true;
                              safeSetState(() {});
                              _model.scanQR =
                                  await FlutterBarcodeScanner.scanBarcode(
                                '#C62828', // scanning line color
                                'Cancel', // cancel button text
                                true, // whether to show the flash icon
                                ScanMode.QR,
                              );

                              _model.scanedStoreId = _model.scanQR;
                              safeSetState(() {});
                              if (_model.todayShiftCount == 0) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('You Don\'t have Work Today'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                if (_model.todayWorkStatus == 0) {
                                  _model.buttonAPI1 =
                                      await UpdateShiftRequestsCall.call(
                                    pUserId: FFAppState().user.userId,
                                    pStoreId: _model.scanedStoreId,
                                    pRequestDate: dateTimeFormat(
                                        "yyyy-MM-dd", getCurrentTimestamp),
                                    pTime: getCurrentTimestamp.toString(),
                                    pLat: functions.lat(
                                        currentUserLocationValue, true),
                                    pLng: functions.lat(
                                        currentUserLocationValue, false),
                                  );

                                  if ((_model.buttonAPI1?.succeeded ?? true)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Success Attend'),
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
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Fail1'),
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
                                } else {
                                  if (_model.todayWorkStatus == 1) {
                                    _model.buttonAPI2 =
                                        await UpdateShiftRequestsCall.call(
                                      pUserId: FFAppState().user.userId,
                                      pStoreId: _model.scanedStoreId,
                                      pRequestDate: dateTimeFormat(
                                          "yyyy-MM-dd", getCurrentTimestamp),
                                      pTime: getCurrentTimestamp.toString(),
                                      pLat: functions.lat(
                                          currentUserLocationValue, true),
                                      pLng: functions.lat(
                                          currentUserLocationValue, false),
                                    );

                                    if ((_model.buttonAPI2?.succeeded ??
                                        true)) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Success Finish Work'),
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
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Fail2'),
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
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title:
                                              Text('You Already Finished Work'),
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
                                }
                              }

                              FFAppState().isLoading2 = false;
                              safeSetState(() {});

                              context.pushNamed(HomepageWidget.routeName);

                              safeSetState(() {});
                            },
                            text: 'Scan QR',
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
