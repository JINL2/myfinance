import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/isloading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/jeong_work/add/add_widget.dart';
import '/jeong_work/create_code_f1/create_code_f1_widget.dart';
import '/jeong_work/create_company_by_code_f1/create_company_by_code_f1_widget.dart';
import '/jeong_work/create_company_f1/create_company_f1_widget.dart';
import '/jeong_work/create_store_f1/create_store_f1_widget.dart';
import '/jeong_work/drawer_list_view/drawer_list_view_widget.dart';
import '/jeong_work/home_cate_list_view_v1/home_cate_list_view_v1_widget.dart';
import '/jeong_work/popup/popup_widget.dart';
import '/my_page/edit_profile_image/edit_profile_image_widget.dart';
import '/my_page/edit_profile_name/edit_profile_name_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'homepage_model.dart';
export 'homepage_model.dart';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({super.key});

  static String routeName = 'homepage';
  static String routePath = '/homepage';

  @override
  State<HomepageWidget> createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  late HomepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isLoading1 = false;
      FFAppState().isLoading2 = false;
      FFAppState().isLoading3 = false;
      safeSetState(() {});
      if (FFAppState().localMyCompanyCount != FFAppState().user.companyCount) {
        _model.newgetInitialUserData = await GetUserCompaniesCall.call(
          pUserId: currentUserUid,
        );

        if ((_model.newgetInitialUserData?.succeeded ?? true)) {
          FFAppState().user = UserStruct.maybeFromMap(
              (_model.newgetInitialUserData?.jsonBody ?? ''))!;
          safeSetState(() {});
          FFAppState().localMyCompanyCount = GetUserCompaniesCall.compnycount(
            (_model.newgetInitialUserData?.jsonBody ?? ''),
          )!;
          safeSetState(() {});
          FFAppState().companyChoosen =
              FFAppState().user.companies.lastOrNull!.companyId;
          FFAppState().storeChoosen = FFAppState()
              .user
              .companies
              .lastOrNull!
              .stores
              .firstOrNull!
              .storeId;
          safeSetState(() {});
        }
      } else {
        if (!(FFAppState().companyChoosen != '')) {
          FFAppState().companyChoosen =
              FFAppState().user.companies.firstOrNull!.companyId;
          safeSetState(() {});
        }
        if (!(FFAppState().storeChoosen != '')) {
          FFAppState().storeChoosen = FFAppState()
              .user
              .companies
              .firstOrNull!
              .stores
              .firstOrNull!
              .storeId;
          safeSetState(() {});
        }
      }
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
        drawer: Drawer(
          elevation: 20.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You are in Company${FFAppState().user.companies.where((e) => FFAppState().companyChoosen == e.companyId).toList().firstOrNull?.companyName}',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
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
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            final companyInfo =
                                FFAppState().user.companies.toList();

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: companyInfo.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 10.0),
                              itemBuilder: (context, companyInfoIndex) {
                                final companyInfoItem =
                                    companyInfo[companyInfoIndex];
                                return wrapWithModel(
                                  model: _model.drawerListViewModels.getModel(
                                    companyInfoItem.companyId,
                                    companyInfoIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: DrawerListViewWidget(
                                    key: Key(
                                      'Key762_${companyInfoItem.companyId}',
                                    ),
                                    companyInfo: companyInfoItem,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
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
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: PopupWidget(
                                        popupTitle: 'Create Company',
                                        widgetBuilder: () =>
                                            CreateCompanyF1Widget(
                                          widgetTitle1: 'Company Name',
                                          widgetTitle2: 'Select Type',
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
                            model: _model.addCompanyModel,
                            updateCallback: () => safeSetState(() {}),
                            child: AddWidget(
                              name: 'Add Company',
                            ),
                          ),
                        ),
                        InkWell(
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
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: PopupWidget(
                                        popupTitle: 'Create Store',
                                        widgetBuilder: () =>
                                            CreateStoreF1Widget(
                                          widgetTitle1: 'Store Name',
                                          widgetTitle2: 'Store Address',
                                          widgetTitle3: 'Store Phone Number',
                                          companyId:
                                              FFAppState().companyChoosen,
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
                            model: _model.addStoreModel,
                            updateCallback: () => safeSetState(() {}),
                            child: AddWidget(
                              name: 'Add Store',
                            ),
                          ),
                        ),
                        InkWell(
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
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: PopupWidget(
                                        popupTitle: 'Join By Code',
                                        widgetBuilder: () =>
                                            CreateCompanyByCodeF1Widget(
                                          widgetTitle1: 'Put Your Code',
                                          widgetTitle2: 'Confirm',
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
                            model: _model.addByCodeModel,
                            updateCallback: () => safeSetState(() {}),
                            child: AddWidget(
                              name: 'Add By Code',
                            ),
                          ),
                        ),
                        InkWell(
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
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: PopupWidget(
                                        popupTitle: 'Your Code',
                                        widgetBuilder: () => CreateCodeF1Widget(
                                          companyInfo: FFAppState()
                                              .user
                                              .companies
                                              .where((e) =>
                                                  FFAppState().companyChoosen ==
                                                  e.companyId)
                                              .toList()
                                              .firstOrNull,
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
                            model: _model.showCodeModel,
                            updateCallback: () => safeSetState(() {}),
                            child: AddWidget(
                              name: 'Show Code',
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 5.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
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
                                                popupTitle: 'Edit Profile Name',
                                                widgetBuilder: () =>
                                                    EditProfileNameWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Text(
                                      'Hello! ${FFAppState().user.userFirstName}',
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 20.0,
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
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      scaffoldKey.currentState!.openDrawer();
                                    },
                                    child: Icon(
                                      Icons.menu,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 30.0,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
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
                                                child: PopupWidget(
                                                  popupTitle:
                                                      'Update Profile Image',
                                                  widgetBuilder: () =>
                                                      EditProfileImageWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        child: Image.network(
                                          FFAppState().user.profileImage,
                                          width: 48.0,
                                          height: 48.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            'Your Company : ${FFAppState().user.companies.where((e) => FFAppState().companyChoosen == e.companyId).toList().firstOrNull?.companyName}',
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 15.0,
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
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.getInitialUserData =
                                                await GetUserCompaniesCall.call(
                                              pUserId: currentUserUid,
                                            );

                                            if ((_model.getInitialUserData
                                                    ?.succeeded ??
                                                true)) {
                                              FFAppState().user =
                                                  UserStruct.maybeFromMap(
                                                      (_model.getInitialUserData
                                                              ?.jsonBody ??
                                                          ''))!;
                                              safeSetState(() {});
                                              FFAppState().companyChoosen =
                                                  FFAppState()
                                                      .user
                                                      .companies
                                                      .firstOrNull!
                                                      .companyId;
                                              FFAppState().storeChoosen =
                                                  FFAppState()
                                                      .user
                                                      .companies
                                                      .firstOrNull!
                                                      .stores
                                                      .firstOrNull!
                                                      .storeId;
                                              safeSetState(() {});
                                            }
                                            _model.categoryFeatures =
                                                await GetCategoriesWithFeaturesCall
                                                    .call();

                                            if ((_model.categoryFeatures
                                                    ?.succeeded ??
                                                true)) {
                                              FFAppState()
                                                  .categoryFeatures = ((_model
                                                                  .categoryFeatures
                                                                  ?.jsonBody ??
                                                              '')
                                                          .toList()
                                                          .map<CategoryFeaturesStruct?>(
                                                              CategoryFeaturesStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          CategoryFeaturesStruct?>)
                                                  .withoutNulls
                                                  .toList()
                                                  .cast<
                                                      CategoryFeaturesStruct>();
                                              safeSetState(() {});
                                            }
                                            FFAppState().companyChoosen =
                                                FFAppState().companyChoosen;
                                            FFAppState().storeChoosen =
                                                FFAppState().storeChoosen;
                                            FFAppState().categoryFeatures =
                                                FFAppState()
                                                    .categoryFeatures
                                                    .toList()
                                                    .cast<
                                                        CategoryFeaturesStruct>();
                                            FFAppState().selectedFeatures =
                                                FFAppState()
                                                    .selectedFeatures
                                                    .toList()
                                                    .cast<String>();
                                            safeSetState(() {});

                                            safeSetState(() {});
                                          },
                                          child: Text(
                                            'API Call',
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
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                AttendanceWidget.routeName);
                                          },
                                          child: Text(
                                            'Move To Location',
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
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                TestattendWidget.routeName);
                                          },
                                          child: Text(
                                            'test',
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
                                      ].divide(SizedBox(width: 20.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Your Store : ${functions.getStoreNameByIdFromList(FFAppState().user.companies.where((e) => FFAppState().companyChoosen == e.companyId).toList().firstOrNull?.stores.toList(), FFAppState().storeChoosen)}',
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 15.0,
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
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              context.goNamedAuth(
                                  Auth1Widget.routeName, context.mounted);
                            },
                            child: Text(
                              'Today Sales: ',
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
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
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 90,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                final cateInfo =
                                    FFAppState().categoryFeatures.toList();

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: cateInfo.length,
                                  itemBuilder: (context, cateInfoIndex) {
                                    final cateInfoItem =
                                        cateInfo[cateInfoIndex];
                                    return wrapWithModel(
                                      model: _model.homeCateListViewV1Models
                                          .getModel(
                                        cateInfoItem.categoryId,
                                        cateInfoIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: HomeCateListViewV1Widget(
                                        key: Key(
                                          'Keympu_${cateInfoItem.categoryId}',
                                        ),
                                        cateInfo: cateInfoItem,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ].divide(SizedBox(height: 10.0)),
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
