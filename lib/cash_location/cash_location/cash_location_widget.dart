import '/backend/supabase/supabase.dart';
import '/cash_location/cash_location_component/cash_location_component_widget.dart';
import '/cash_location/create_cash_location/create_cash_location_widget.dart';
import '/components/menu_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/jeong_work/add/add_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cash_location_model.dart';
export 'cash_location_model.dart';

class CashLocationWidget extends StatefulWidget {
  const CashLocationWidget({super.key});

  static String routeName = 'cashLocation';
  static String routePath = '/cashLocation';

  @override
  State<CashLocationWidget> createState() => _CashLocationWidgetState();
}

class _CashLocationWidgetState extends State<CashLocationWidget> {
  late CashLocationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CashLocationModel());
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.menuBarModel,
                updateCallback: () => safeSetState(() {}),
                child: MenuBarWidget(
                  menuName: 'Cash Location',
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 4.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  valueOrDefault<String>(
                                    FFAppState()
                                        .user
                                        .companies
                                        .where((e) =>
                                            FFAppState().companyChoosen ==
                                            e.companyId)
                                        .toList()
                                        .firstOrNull
                                        ?.companyName,
                                    'CompanyName',
                                  ),
                                  maxLines: 1,
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
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  alignment: AlignmentDirectional(1.0, 0.0),
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
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child:
                                                    CreateCashLocationWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        FFAppState().isLoading1 = false;
                                        safeSetState(() {});
                                      }
                                    },
                                    child: wrapWithModel(
                                      model: _model.addModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: AddWidget(
                                        name: '+ Add location',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FutureBuilder<List<CashLocationsRow>>(
                              future: CashLocationsTable().queryRows(
                                queryFn: (q) => q
                                    .eqOrNull(
                                      'company_id',
                                      FFAppState().companyChoosen,
                                    )
                                    .order('created_at', ascending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 80.0,
                                      height: 80.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<CashLocationsRow>
                                    containerCashLocationsRowList =
                                    snapshot.data!;

                                return Container(
                                  child: Builder(
                                    builder: (context) {
                                      final cashLocation = (FFAppState().storeChoosen ==
                                                      ''
                                              ? containerCashLocationsRowList
                                                  .where((e) =>
                                                      e.storeId == null ||
                                                      e.storeId == '')
                                                  .toList()
                                                  .map((e) => e)
                                                  .toList()
                                              : containerCashLocationsRowList
                                                  .where((e) =>
                                                      (e.storeId ==
                                                          FFAppState()
                                                              .storeChoosen) ||
                                                      (e.storeId == ''))
                                                  .toList())
                                          .toList();

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: cashLocation.length,
                                        itemBuilder:
                                            (context, cashLocationIndex) {
                                          final cashLocationItem =
                                              cashLocation[cashLocationIndex];
                                          return CashLocationComponentWidget(
                                            key: Key(
                                                'Key4zw_${cashLocationIndex}_of_${cashLocation.length}'),
                                            cashLocationData: cashLocationItem,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
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
        ),
      ),
    );
  }
}
