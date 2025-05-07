import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shift_test_model.dart';
export 'shift_test_model.dart';

class ShiftTestWidget extends StatefulWidget {
  const ShiftTestWidget({
    super.key,
    this.shiftName,
    this.startTime,
    this.endTime,
    this.selectedDate,
    this.shiftId,
  });

  final String? shiftName;
  final String? startTime;
  final String? endTime;
  final String? selectedDate;
  final String? shiftId;

  @override
  State<ShiftTestWidget> createState() => _ShiftTestWidgetState();
}

class _ShiftTestWidgetState extends State<ShiftTestWidget> {
  late ShiftTestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShiftTestModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.shiftName,
                                'Shift Name',
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.notoSansJp(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '${functions.formatTimeOnly(functions.changeStringToDateTime(widget.startTime))} ~ ${functions.formatTimeOnly(functions.changeStringToDateTime(widget.endTime))}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.notoSansJp(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
            ),
            if (valueOrDefault<bool>(
              FFAppState()
                      .shiftStatus
                      .where((e) =>
                          (e.shiftId == widget.shiftId) &&
                          (e.requestDate == widget.selectedDate))
                      .toList()
                      .firstOrNull
                      ?.isRegisteredByMe ==
                  true,
              false,
            ))
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F7F9),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          FFAppState()
                                  .shiftStatus
                                  .where((e) =>
                                      (widget.shiftId == e.shiftId) &&
                                      (widget.selectedDate == e.requestDate))
                                  .toList()
                                  .firstOrNull!
                                  .isApproved
                              ? 'Approved'
                              : 'Registered',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                font: GoogleFonts.notoSansJp(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                        ),
                        Icon(
                          Icons.cancel,
                          color: FFAppState()
                                  .shiftStatus
                                  .where((e) =>
                                      (widget.shiftId == e.shiftId) &&
                                      (widget.selectedDate == e.requestDate))
                                  .toList()
                                  .firstOrNull!
                                  .isApproved
                              ? FlutterFlowTheme.of(context).success
                              : FlutterFlowTheme.of(context).tertiary,
                          size: 32.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
