import '/backend/supabase/supabase.dart';
import '/components/menu_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/jeong_work/add/add_widget.dart';
import '/jeong_work/popup/popup_widget.dart';
import '/register_counterparty/counterparty_list/counterparty_list_widget.dart';
import '/register_counterparty/create_counterparty/create_counterparty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'register_counterparty_model.dart';
export 'register_counterparty_model.dart';

class RegisterCounterpartyWidget extends StatefulWidget {
  const RegisterCounterpartyWidget({super.key});

  static String routeName = 'registerCounterparty';
  static String routePath = '/registerCounterparty';

  @override
  State<RegisterCounterpartyWidget> createState() =>
      _RegisterCounterpartyWidgetState();
}

class _RegisterCounterpartyWidgetState
    extends State<RegisterCounterpartyWidget> {
  late RegisterCounterpartyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterCounterpartyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isLoading1 = false;
      FFAppState().isLoading2 = false;
      FFAppState().isLoading3 = false;
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: wrapWithModel(
                  model: _model.menuBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: MenuBarWidget(
                    menuName: 'Role List',
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
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
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Container(
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
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: PopupWidget(
                                                popupTitle:
                                                    'Create Counterparty',
                                                widgetBuilder: () =>
                                                    CreateCounterpartyWidget(
                                                  companyId:
                                                      FFAppState().user.userId,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      FFAppState().isLoading1 = false;
                                      safeSetState(() {});
                                    }
                                  },
                                  child: wrapWithModel(
                                    model: _model.addPartyModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: AddWidget(
                                      name: '+ Add party',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: FutureBuilder<List<CounterpartiesRow>>(
                          future: CounterpartiesTable().queryRows(
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<CounterpartiesRow>
                                listViewCounterpartiesRowList = snapshot.data!;

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewCounterpartiesRowList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewCounterpartiesRow =
                                    listViewCounterpartiesRowList[
                                        listViewIndex];
                                return wrapWithModel(
                                  model: _model.counterpartyListModels.getModel(
                                    listViewCounterpartiesRow.counterpartyId,
                                    listViewIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: CounterpartyListWidget(
                                    key: Key(
                                      'Key175_${listViewCounterpartiesRow.counterpartyId}',
                                    ),
                                    counterpartyData: listViewCounterpartiesRow,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
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
