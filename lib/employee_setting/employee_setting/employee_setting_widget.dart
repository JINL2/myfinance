import '/backend/supabase/supabase.dart';
import '/components/menu_bar_widget.dart';
import '/employee_setting/employee_setting_component/employee_setting_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'employee_setting_model.dart';
export 'employee_setting_model.dart';

class EmployeeSettingWidget extends StatefulWidget {
  const EmployeeSettingWidget({super.key});

  static String routeName = 'employeeSetting';
  static String routePath = '/employeeSetting';

  @override
  State<EmployeeSettingWidget> createState() => _EmployeeSettingWidgetState();
}

class _EmployeeSettingWidgetState extends State<EmployeeSettingWidget> {
  late EmployeeSettingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmployeeSettingModel());

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
              wrapWithModel(
                model: _model.menuBarModel,
                updateCallback: () => safeSetState(() {}),
                child: MenuBarWidget(
                  menuName: 'Employee Setting',
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
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FutureBuilder<List<VUserSalaryInfoRow>>(
                            future: VUserSalaryInfoTable().queryRows(
                              queryFn: (q) => q.eqOrNull(
                                'company_id',
                                FFAppState().companyChoosen,
                              ),
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
                              List<VUserSalaryInfoRow>
                                  listViewVUserSalaryInfoRowList =
                                  snapshot.data!;

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewVUserSalaryInfoRowList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 12.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewVUserSalaryInfoRow =
                                      listViewVUserSalaryInfoRowList[
                                          listViewIndex];
                                  return wrapWithModel(
                                    model: _model.employeeSettingComponentModels
                                        .getModel(
                                      listViewVUserSalaryInfoRow.userId!,
                                      listViewIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: EmployeeSettingComponentWidget(
                                      key: Key(
                                        'Keyf1x_${listViewVUserSalaryInfoRow.userId!}',
                                      ),
                                      detailInfoQuary:
                                          listViewVUserSalaryInfoRow,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
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
