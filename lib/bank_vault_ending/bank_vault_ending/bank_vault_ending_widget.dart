import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/cash_ending/cash_amount_input/cash_amount_input_widget.dart';
import '/components/isloading_widget.dart';
import '/components/menu_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bank_vault_ending_model.dart';
export 'bank_vault_ending_model.dart';

class BankVaultEndingWidget extends StatefulWidget {
  const BankVaultEndingWidget({super.key});

  static String routeName = 'bankVaultEnding';
  static String routePath = '/bankVaultEnding';

  @override
  State<BankVaultEndingWidget> createState() => _BankVaultEndingWidgetState();
}

class _BankVaultEndingWidgetState extends State<BankVaultEndingWidget> {
  late BankVaultEndingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BankVaultEndingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isLoading1 = true;
      safeSetState(() {});
      _model.oPLCashLocation = await CashLocationsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_id',
          FFAppState().companyChoosen,
        ),
      );
      _model.oPLCurrencyType = await CurrencyTypesTable().queryRows(
        queryFn: (q) => q,
      );
      _model.oPLCompanyCurrency = await CompanyCurrencyTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_id',
          FFAppState().companyChoosen,
        ),
      );
      _model.oPLCurrencyDenomination =
          await CurrencyDenominationsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_id',
          FFAppState().companyChoosen,
        ),
      );
      FFAppState().isLoading1 = false;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<CashierAmountLinesRow>>(
      future: CashierAmountLinesTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'company_id',
              FFAppState().companyChoosen,
            )
            .eqOrNull(
              'record_date',
              supaSerialize<DateTime>(getCurrentTimestamp),
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 80.0,
                height: 80.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<CashierAmountLinesRow> bankVaultEndingCashierAmountLinesRowList =
            snapshot.data!;

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
                          menuName: 'Bank & Vault Ending',
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Choose Location',
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
                                      FutureBuilder<List<CashLocationsRow>>(
                                        future: CashLocationsTable().queryRows(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'company_id',
                                                FFAppState().companyChoosen,
                                              )
                                              .neqOrNull(
                                                'location_type',
                                                'cash',
                                              ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 80.0,
                                                height: 80.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<CashLocationsRow>
                                              cashlocationDropDownCashLocationsRowList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .cashlocationDropDownValueController ??=
                                                FormFieldController<String>(
                                              _model.cashlocationDropDownValue ??=
                                                  '',
                                            ),
                                            options: List<
                                                String>.from(FFAppState().storeChoosen !=
                                                        ''
                                                ? cashlocationDropDownCashLocationsRowList
                                                    .where((e) =>
                                                        e.storeId ==
                                                        FFAppState()
                                                            .storeChoosen)
                                                    .toList()
                                                    .map(
                                                        (e) => e.cashLocationId)
                                                    .toList()
                                                : cashlocationDropDownCashLocationsRowList
                                                    .where((e) =>
                                                        e.storeId == null ||
                                                        e.storeId == '')
                                                    .toList()
                                                    .map(
                                                        (e) => e.cashLocationId)
                                                    .toList()),
                                            optionLabels: FFAppState().storeChoosen !=
                                                        ''
                                                ? cashlocationDropDownCashLocationsRowList
                                                    .where((e) =>
                                                        e.storeId ==
                                                        FFAppState()
                                                            .storeChoosen)
                                                    .toList()
                                                    .map((e) => e.locationName)
                                                    .toList()
                                                : cashlocationDropDownCashLocationsRowList
                                                    .where((e) =>
                                                        e.storeId == null ||
                                                        e.storeId == '')
                                                    .toList()
                                                    .map((e) => e.locationName)
                                                    .toList(),
                                            onChanged: (val) async {
                                              safeSetState(() => _model
                                                      .cashlocationDropDownValue =
                                                  val);
                                              _model.selectedLocationId = _model
                                                  .cashlocationDropDownValue;
                                              safeSetState(() {});
                                            },
                                            width: 200.0,
                                            height: 40.0,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
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
                                            hintText: 'Select...',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Stack(
                                  children: [
                                    if (_model.oPLCashLocation
                                            ?.where((e) =>
                                                _model.selectedLocationId ==
                                                e.cashLocationId)
                                            .toList()
                                            .firstOrNull
                                            ?.locationType ==
                                        'vault')
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final companyCurrency222 = _model
                                                      .oPLCompanyCurrency
                                                      ?.toList() ??
                                                  [];

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    companyCurrency222.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 16.0),
                                                itemBuilder: (context,
                                                    companyCurrency222Index) {
                                                  final companyCurrency222Item =
                                                      companyCurrency222[
                                                          companyCurrency222Index];
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  4.0,
                                                                  12.0,
                                                                  4.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  _model
                                                                      .oPLCurrencyType
                                                                      ?.where((e) =>
                                                                          e.currencyId ==
                                                                          companyCurrency222Item
                                                                              .currencyId)
                                                                      .toList()
                                                                      .firstOrNull
                                                                      ?.currencyName,
                                                                  'VietnamDong',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .notoSansJp(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .fontStyle,
                                                                      ),
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
                                                              Icon(
                                                                Icons
                                                                    .check_circle_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 24.0,
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 14.0)),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.8,
                                                                        child:
                                                                            CashAmountInputWidget(
                                                                          currencyId:
                                                                              companyCurrency222Item.currencyId,
                                                                          currencyDenominationData: _model
                                                                              .oPLCurrencyDenomination
                                                                              ?.where((e) => e.currencyId == companyCurrency222Item.currencyId)
                                                                              .toList(),
                                                                          currencyType: _model
                                                                              .oPLCurrencyType
                                                                              ?.where((e) => e.currencyId == companyCurrency222Item.currencyId)
                                                                              .toList(),
                                                                          currencies:
                                                                              (currencies) async {
                                                                            if (functions.isListHaveCurrnencies(_model.currencies.toList(),
                                                                                currencies?.currencyId)!) {
                                                                              _model.currencies = functions.removeCurrencies(_model.currencies.toList(), companyCurrency222Item.currencyId, currencies)!.toList().cast<CurrenciesStruct>();
                                                                              safeSetState(() {});
                                                                            } else {
                                                                              _model.addToCurrencies(currencies!);
                                                                              safeSetState(() {});
                                                                            }
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .add_circle_outline,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 40.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 20.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState().isLoading2 = true;
                                                safeSetState(() {});
                                                if (_model.cashlocationDropDownValue !=
                                                        null &&
                                                    _model.cashlocationDropDownValue !=
                                                        '') {
                                                  if (FFAppState()
                                                              .storeChoosen !=
                                                          '') {
                                                    if (bankVaultEndingCashierAmountLinesRowList
                                                        .isNotEmpty) {
                                                      await CashierAmountLinesTable()
                                                          .delete(
                                                        matchingRows: (rows) =>
                                                            rows
                                                                .eqOrNull(
                                                                  'company_id',
                                                                  FFAppState()
                                                                      .companyChoosen,
                                                                )
                                                                .eqOrNull(
                                                                  'store_id',
                                                                  FFAppState()
                                                                      .storeChoosen,
                                                                )
                                                                .eqOrNull(
                                                                  'record_date',
                                                                  supaSerialize<
                                                                          DateTime>(
                                                                      functions.changeStringToDateTime(
                                                                          getCurrentTimestamp
                                                                              .toString())),
                                                                ),
                                                      );
                                                      _model.apiResultla7 =
                                                          await InsertCashLineCall
                                                              .call(
                                                        pCompanyId: FFAppState()
                                                            .companyChoosen,
                                                        pStoreId: FFAppState()
                                                            .storeChoosen,
                                                        pLocationId: _model
                                                            .cashlocationDropDownValue,
                                                        pRecordDate: dateTimeFormat(
                                                            "yyyy-MM-dd",
                                                            getCurrentTimestamp),
                                                        pCreatedBy: FFAppState()
                                                            .user
                                                            .userId,
                                                        pCurrenciesJson: functions
                                                            .mapListDatatoJsonb(
                                                                _model
                                                                    .currencies
                                                                    .toList()),
                                                      );

                                                      if ((_model.apiResultla7
                                                              ?.succeeded ??
                                                          true)) {
                                                        FFAppState()
                                                            .isLoading2 = false;
                                                        safeSetState(() {});
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title:
                                                                  Text('Fail1'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    } else {
                                                      _model.apiResultggc =
                                                          await InsertCashLineCall
                                                              .call(
                                                        pCompanyId: FFAppState()
                                                            .companyChoosen,
                                                        pStoreId: FFAppState()
                                                            .storeChoosen,
                                                        pLocationId: _model
                                                            .cashlocationDropDownValue,
                                                        pRecordDate: dateTimeFormat(
                                                            "yyyy-MM-dd",
                                                            getCurrentTimestamp),
                                                        pCreatedBy: FFAppState()
                                                            .user
                                                            .userId,
                                                        pCurrenciesJson: functions
                                                            .mapListDatatoJsonb(
                                                                _model
                                                                    .currencies
                                                                    .toList()),
                                                      );

                                                      if ((_model.apiResultggc
                                                              ?.succeeded ??
                                                          true)) {
                                                        FFAppState()
                                                            .isLoading2 = false;
                                                        safeSetState(() {});
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title:
                                                                  Text('Fail2'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    }
                                                  } else {
                                                    if (bankVaultEndingCashierAmountLinesRowList
                                                        .isNotEmpty) {
                                                      _model.apiResult6mc =
                                                          await DeleteCashAmountLineCall
                                                              .call(
                                                        pCompanyId: FFAppState()
                                                            .companyChoosen,
                                                        pRecordDate: dateTimeFormat(
                                                            "yyyy-MM-dd",
                                                            getCurrentTimestamp),
                                                      );

                                                      _model.apiResult3ck =
                                                          await InsertCashLineCall
                                                              .call(
                                                        pCompanyId: FFAppState()
                                                            .companyChoosen,
                                                        pLocationId: _model
                                                            .cashlocationDropDownValue,
                                                        pRecordDate: dateTimeFormat(
                                                            "yyyy-MM-dd",
                                                            getCurrentTimestamp),
                                                        pCurrenciesJson: functions
                                                            .mapListDatatoJsonb(
                                                                _model
                                                                    .currencies
                                                                    .toList()),
                                                        pCreatedBy: FFAppState()
                                                            .user
                                                            .userId,
                                                      );

                                                      if ((_model.apiResult3ck
                                                              ?.succeeded ??
                                                          true)) {
                                                        FFAppState()
                                                            .isLoading2 = false;
                                                        safeSetState(() {});
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title:
                                                                  Text('Fail3'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    } else {
                                                      _model.apiResultpqu =
                                                          await InsertCashLineCall
                                                              .call(
                                                        pCompanyId: FFAppState()
                                                            .companyChoosen,
                                                        pLocationId: _model
                                                            .cashlocationDropDownValue,
                                                        pRecordDate: dateTimeFormat(
                                                            "yyyy-MM-dd",
                                                            getCurrentTimestamp),
                                                        pCurrenciesJson: functions
                                                            .mapListDatatoJsonb(
                                                                _model
                                                                    .currencies
                                                                    .toList()),
                                                        pCreatedBy: FFAppState()
                                                            .user
                                                            .userId,
                                                      );

                                                      if ((_model.apiResultpqu
                                                              ?.succeeded ??
                                                          true)) {
                                                        FFAppState()
                                                            .isLoading2 = false;
                                                        safeSetState(() {});
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Fail 4'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    }
                                                  }
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Choose Location First'),
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

                                                safeSetState(() {});
                                              },
                                              text: 'Confirm',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansJp(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          if (bankVaultEndingCashierAmountLinesRowList
                                                  .firstOrNull !=
                                              null)
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                FutureBuilder<
                                                    List<CompanyCurrencyRow>>(
                                                  future: CompanyCurrencyTable()
                                                      .queryRows(
                                                    queryFn: (q) => q.eqOrNull(
                                                      'company_id',
                                                      FFAppState()
                                                          .companyChoosen,
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 80.0,
                                                          height: 80.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<CompanyCurrencyRow>
                                                        listViewCompanyCurrencyRowList =
                                                        snapshot.data!;

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          listViewCompanyCurrencyRowList
                                                              .length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 8.0),
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewCompanyCurrencyRow =
                                                            listViewCompanyCurrencyRowList[
                                                                listViewIndex];
                                                        return Visibility(
                                                          visible: (FFAppState()
                                                                              .storeChoosen !=
                                                                          ''
                                                                  ? functions.isListcashAmountSupa(
                                                                      bankVaultEndingCashierAmountLinesRowList
                                                                          .where((e) =>
                                                                              e.locationId ==
                                                                              _model
                                                                                  .cashlocationDropDownValue)
                                                                          .toList(),
                                                                      listViewCompanyCurrencyRow
                                                                          .currencyId)
                                                                  : functions.isListcashAmountSupa(
                                                                      bankVaultEndingCashierAmountLinesRowList
                                                                          .where((e) =>
                                                                              (e.locationId == _model.cashlocationDropDownValue) &&
                                                                              (e.storeId == null || e.storeId == ''))
                                                                          .toList(),
                                                                      listViewCompanyCurrencyRow.currencyId)) ??
                                                              true,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      _model
                                                                          .oPLCurrencyType
                                                                          ?.where((e) =>
                                                                              e.currencyId ==
                                                                              listViewCompanyCurrencyRow.currencyId)
                                                                          .toList()
                                                                          .firstOrNull
                                                                          ?.currencyName,
                                                                      'error',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.notoSansJp(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Text(
                                                                        'Currency',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              font: GoogleFonts.notoSansJp(
                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        'Quantity',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              font: GoogleFonts.notoSansJp(
                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final cashierAmountLine =
                                                                              (FFAppState().storeChoosen != '' ? bankVaultEndingCashierAmountLinesRowList.where((e) => (e.storeId == FFAppState().storeChoosen) && (e.locationId == _model.cashlocationDropDownValue) && (e.currencyId == listViewCompanyCurrencyRow.currencyId)).toList() : bankVaultEndingCashierAmountLinesRowList.where((e) => (e.storeId == null || e.storeId == '') && (e.locationId == _model.cashlocationDropDownValue) && (e.currencyId == listViewCompanyCurrencyRow.currencyId)).toList()).toList();

                                                                          return ListView
                                                                              .separated(
                                                                            padding:
                                                                                EdgeInsets.fromLTRB(
                                                                              0,
                                                                              4.0,
                                                                              0,
                                                                              0,
                                                                            ),
                                                                            primary:
                                                                                false,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                cashierAmountLine.length,
                                                                            separatorBuilder: (_, __) =>
                                                                                SizedBox(height: 12.0),
                                                                            itemBuilder:
                                                                                (context, cashierAmountLineIndex) {
                                                                              final cashierAmountLineItem = cashierAmountLine[cashierAmountLineIndex];
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                      children: [
                                                                                        Text(
                                                                                          formatNumber(
                                                                                            _model.oPLCurrencyDenomination!.where((e) => cashierAmountLineItem.denominationId == e.denominationId).toList().firstOrNull!.value,
                                                                                            formatType: FormatType.decimal,
                                                                                            decimalType: DecimalType.periodDecimal,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                font: GoogleFonts.notoSansJp(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          formatNumber(
                                                                                            cashierAmountLineItem.quantity,
                                                                                            formatType: FormatType.decimal,
                                                                                            decimalType: DecimalType.periodDecimal,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                font: GoogleFonts.notoSansJp(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                          FFButtonWidget(
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text: 'Check Yesterday',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.notoSansJp(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    if (_model.oPLCashLocation
                                            ?.where((e) =>
                                                _model.selectedLocationId ==
                                                e.cashLocationId)
                                            .toList()
                                            .firstOrNull
                                            ?.locationType ==
                                        'bank')
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  'Choose Currency',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansJp(
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
                                                FutureBuilder<
                                                    List<CurrencyTypesRow>>(
                                                  future: CurrencyTypesTable()
                                                      .queryRows(
                                                    queryFn: (q) => q,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 80.0,
                                                          height: 80.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<CurrencyTypesRow>
                                                        currencyDropDownCurrencyTypesRowList =
                                                        snapshot.data!;

                                                    return FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .currencyDropDownValueController ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model.currencyDropDownValue ??=
                                                            '',
                                                      ),
                                                      options: List<
                                                              String>.from(
                                                          currencyDropDownCurrencyTypesRowList
                                                              .map((e) =>
                                                                  e.currencyId)
                                                              .toList()),
                                                      optionLabels:
                                                          currencyDropDownCurrencyTypesRowList
                                                              .map((e) => e
                                                                  .currencyName)
                                                              .withoutNulls
                                                              .toList(),
                                                      onChanged: (val) =>
                                                          safeSetState(() =>
                                                              _model.currencyDropDownValue =
                                                                  val),
                                                      width: 200.0,
                                                      height: 40.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansJp(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      hintText: 'Select...',
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 0.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isOverButton: false,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            'Insert Bank Balance',
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
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.7,
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansJp(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                hintText: 'Number Only',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansJp(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFE0E3E7),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF4B39EF),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.notoSansJp(
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
                                              keyboardType:
                                                  TextInputType.number,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              FFAppState().isLoading3 = true;
                                              safeSetState(() {});
                                              if (_model.currencyDropDownValue !=
                                                      null &&
                                                  _model.currencyDropDownValue !=
                                                      '') {
                                                await BankAmountInsertCall.call(
                                                  pCompanyId: FFAppState()
                                                      .companyChoosen,
                                                  pStoreId:
                                                      FFAppState().storeChoosen,
                                                  pRecordDate: dateTimeFormat(
                                                      "yyyy-MM-dd",
                                                      getCurrentTimestamp),
                                                  pLocationId: _model
                                                      .cashlocationDropDownValue,
                                                  pCurrencyId: _model
                                                      .currencyDropDownValue,
                                                  pTotalAmount: int.tryParse(
                                                      _model
                                                          .textController.text),
                                                  pCreatedBy:
                                                      FFAppState().user.userId,
                                                );

                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Success'),
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
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Choose Currency First'),
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

                                              FFAppState().isLoading3 = false;
                                              safeSetState(() {});
                                            },
                                            text: 'Confirm',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.notoSansJp(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 20.0)),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if ((FFAppState().isLoading1 == true) ||
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
      },
    );
  }
}
