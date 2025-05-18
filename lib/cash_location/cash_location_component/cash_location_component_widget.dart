import '/backend/supabase/supabase.dart';
import '/cash_location/update_cash_location/update_cash_location_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cash_location_component_model.dart';
export 'cash_location_component_model.dart';

class CashLocationComponentWidget extends StatefulWidget {
  const CashLocationComponentWidget({
    super.key,
    this.color,
    this.image,
    required this.cashLocationData,
  });

  final Color? color;
  final String? image;
  final CashLocationsRow? cashLocationData;

  @override
  State<CashLocationComponentWidget> createState() =>
      _CashLocationComponentWidgetState();
}

class _CashLocationComponentWidgetState
    extends State<CashLocationComponentWidget> {
  late CashLocationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CashLocationComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: widget.color,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              color: FlutterFlowTheme.of(context).secondaryBackground,
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 12.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 0.0, 12.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.cashLocationData?.locationName,
                              'Error',
                            ),
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (FFAppState().isLoading1 == false) {
                      FFAppState().isLoading1 = true;
                      safeSetState(() {});
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: UpdateCashLocationWidget(
                              cashLocationInfo: widget.cashLocationData!,
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));

                      FFAppState().isLoading1 = false;
                      safeSetState(() {});
                    }
                  },
                  child: Icon(
                    Icons.edit_outlined,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 28.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
