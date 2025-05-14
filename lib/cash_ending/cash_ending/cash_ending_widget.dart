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
import 'cash_ending_model.dart';
export 'cash_ending_model.dart';

class CashEndingWidget extends StatefulWidget {
  const CashEndingWidget({super.key});

  static String routeName = 'cashEnding';
  static String routePath = '/cashEnding';

  @override
  State<CashEndingWidget> createState() => _CashEndingWidgetState();
}

class _CashEndingWidgetState extends State<CashEndingWidget> {
  late CashEndingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CashEndingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isLoading1 = true;
      safeSetState(() {});
      _model.currencyType = await CurrencyTypesTable().queryRows(
        queryFn: (q) => q,
      );
      _model.getCompanyCurrency = await CompanyCurrencyTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_id',
          FFAppState().companyChoosen,
        ),
      );
      _model.currencyDenomination =
          await CurrencyDenominationsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_id',
          FFAppState().companyChoosen,
        ),
      );
      if (FFAppState().storeChoosen != '') {
        _model.cashierAmountLinestore =
            await CashierAmountLinesTable().queryRows(
          queryFn: (q) => q
              .eqOrNull(
                'company_id',
                FFAppState().companyChoosen,
              )
              .eqOrNull(
                'store_id',
                FFAppState().storeChoosen,
              )
              .eqOrNull(
                'record_date',
                supaSerialize<DateTime>(getCurrentTimestamp),
              ),
        );
      } else {
        _model.cashierAmountLineCompnay =
            await CashierAmountLinesTable().queryRows(
          queryFn: (q) => q
              .eqOrNull(
                'company_id',
                FFAppState().companyChoosen,
              )
              .eqOrNull(
                'record_date',
                supaSerialize<DateTime>(getCurrentTimestamp),
              ),
        );
      }

      _model.companyCurrency =
          _model.getCompanyCurrency!.toList().cast<CompanyCurrencyRow>();
      _model.currencyDenomination1 = _model.currencyDenomination!
          .toList()
          .cast<CurrencyDenominationsRow>();
      safeSetState(() {});
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
                      menuName: 'Cash Ending',
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Choose Location',
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
                        FutureBuilder<List<CashLocationsRow>>(
                          future: CashLocationsTable().queryRows(
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
                            List<CashLocationsRow>
                                dropDownCashLocationsRowList = snapshot.data!;

                            return FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController ??=
                                  FormFieldController<String>(
                                _model.dropDownValue ??= '',
                              ),
                              options: List<String>.from(
                                  dropDownCashLocationsRowList
                                      .map((e) => e.cashLocationId)
                                      .toList()),
                              optionLabels: dropDownCashLocationsRowList
                                  .map((e) => e.locationName)
                                  .toList(),
                              onChanged: (val) => safeSetState(
                                  () => _model.dropDownValue = val),
                              width: 200.0,
                              height: 40.0,
                              textStyle: FlutterFlowTheme.of(context)
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
                              hintText: 'Select...',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                            Builder(
                              builder: (context) {
                                final companyCurrencyType =
                                    _model.companyCurrency.toList();

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: companyCurrencyType.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 16.0),
                                  itemBuilder:
                                      (context, companyCurrencyTypeIndex) {
                                    final companyCurrencyTypeItem =
                                        companyCurrencyType[
                                            companyCurrencyTypeIndex];
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 4.0, 12.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    _model.currencyType
                                                        ?.where((e) =>
                                                            companyCurrencyTypeItem
                                                                .currencyId ==
                                                            e.currencyId)
                                                        .toList()
                                                        .firstOrNull
                                                        ?.currencyName,
                                                    'Error',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansJp(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                                if (functions
                                                        .isListHaveCurrnencies(
                                                            _model.currencies
                                                                .toList(),
                                                            companyCurrencyTypeItem
                                                                .currencyId) ??
                                                    true)
                                                  Icon(
                                                    Icons.check_circle_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                              ].divide(SizedBox(width: 14.0)),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            CashAmountInputWidget(
                                                          currencyId:
                                                              companyCurrencyTypeItem
                                                                  .currencyId,
                                                          currencyDenominationData: _model
                                                              .currencyDenomination
                                                              ?.where((e) =>
                                                                  companyCurrencyTypeItem
                                                                      .currencyId ==
                                                                  e.currencyId)
                                                              .toList(),
                                                          currencyType: _model
                                                              .currencyType
                                                              ?.where((e) =>
                                                                  e.currencyId ==
                                                                  companyCurrencyTypeItem
                                                                      .currencyId)
                                                              .toList(),
                                                          currencies:
                                                              (currencies) async {
                                                            if (functions.isListHaveCurrnencies(
                                                                _model
                                                                    .currencies
                                                                    .toList(),
                                                                currencies
                                                                    ?.currencyId)!) {
                                                              _model.currencies = functions
                                                                  .removeCurrencies(
                                                                      _model
                                                                          .currencies
                                                                          .toList(),
                                                                      companyCurrencyTypeItem
                                                                          .currencyId,
                                                                      currencies)!
                                                                  .toList()
                                                                  .cast<
                                                                      CurrenciesStruct>();
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              _model.addToCurrencies(
                                                                  currencies!);
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Icon(
                                                Icons.add_circle_outline,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (FFAppState().isLoading1 == false) {
                                    FFAppState().isLoading1 = true;
                                    safeSetState(() {});
                                    if (_model.dropDownValue != null &&
                                        _model.dropDownValue != '') {
                                      if (FFAppState().storeChoosen != '') {
                                        if (_model.cashierAmountLinestore !=
                                                null &&
                                            (_model.cashierAmountLinestore)!
                                                .isNotEmpty) {
                                          await CashierAmountLinesTable()
                                              .delete(
                                            matchingRows: (rows) => rows
                                                .eqOrNull(
                                                  'company_id',
                                                  FFAppState().companyChoosen,
                                                )
                                                .eqOrNull(
                                                  'store_id',
                                                  FFAppState().storeChoosen,
                                                )
                                                .eqOrNull(
                                                  'record_date',
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                                ),
                                          );
                                          _model.apiResultl36 =
                                              await InsertCashLineCall.call(
                                            pCompanyId:
                                                FFAppState().companyChoosen,
                                            pStoreId: FFAppState().storeChoosen,
                                            pLocationId: _model.dropDownValue,
                                            pRecordDate: dateTimeFormat(
                                                "yyyy-MM-dd",
                                                getCurrentTimestamp),
                                            pCurrenciesJson:
                                                functions.mapListDatatoJsonb(
                                                    _model.currencies.toList()),
                                            pCreatedBy:
                                                FFAppState().user.userId,
                                          );

                                          if ((_model.apiResultl36?.succeeded ??
                                              true)) {
                                            FFAppState().isLoading1 = false;
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

                                          FFAppState().isLoading1 = false;
                                          safeSetState(() {});
                                        } else {
                                          _model.apiResulttuy =
                                              await InsertCashLineCall.call(
                                            pCompanyId:
                                                FFAppState().companyChoosen,
                                            pLocationId: _model.dropDownValue,
                                            pRecordDate: dateTimeFormat(
                                                "yyyy-MM-dd",
                                                getCurrentTimestamp),
                                            pCurrenciesJson:
                                                functions.mapListDatatoJsonb(
                                                    _model.currencies.toList()),
                                            pCreatedBy:
                                                FFAppState().user.userId,
                                            pStoreId: FFAppState().storeChoosen,
                                          );

                                          if ((_model.apiResulttuy?.succeeded ??
                                              true)) {
                                            FFAppState().isLoading1 = false;
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

                                          FFAppState().isLoading1 = false;
                                          safeSetState(() {});
                                        }

                                        FFAppState().isLoading1 = false;
                                        safeSetState(() {});
                                      } else {
                                        if (_model.cashierAmountLineCompnay !=
                                                null &&
                                            (_model.cashierAmountLineCompnay)!
                                                .isNotEmpty) {
                                          await CashierAmountLinesTable()
                                              .delete(
                                            matchingRows: (rows) => rows
                                                .eqOrNull(
                                                  'company_id',
                                                  FFAppState().companyChoosen,
                                                )
                                                .eqOrNull(
                                                  'store_id',
                                                  FFAppState().storeChoosen,
                                                )
                                                .eqOrNull(
                                                  'record_date',
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                                ),
                                          );
                                          _model.apiResultja0 =
                                              await InsertCashLineCall.call(
                                            pCompanyId:
                                                FFAppState().companyChoosen,
                                            pLocationId: _model.dropDownValue,
                                            pRecordDate: dateTimeFormat(
                                                "yyyy-MM-dd",
                                                getCurrentTimestamp),
                                            pCurrenciesJson:
                                                functions.mapListDatatoJsonb(
                                                    _model.currencies.toList()),
                                            pCreatedBy:
                                                FFAppState().user.userId,
                                          );

                                          if ((_model.apiResultja0?.succeeded ??
                                              true)) {
                                            FFAppState().isLoading1 = false;
                                            safeSetState(() {});
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Fail3'),
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
                                        } else {
                                          _model.apiResult9hl =
                                              await InsertCashLineCall.call(
                                            pCompanyId:
                                                FFAppState().companyChoosen,
                                            pLocationId: _model.dropDownValue,
                                            pRecordDate: dateTimeFormat(
                                                "yyyy-MM-dd",
                                                getCurrentTimestamp),
                                            pCurrenciesJson:
                                                functions.mapListDatatoJsonb(
                                                    _model.currencies.toList()),
                                            pCreatedBy:
                                                FFAppState().user.userId,
                                          );

                                          if ((_model.apiResult9hl?.succeeded ??
                                              true)) {
                                            FFAppState().isLoading1 = false;
                                            safeSetState(() {});
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Fail4'),
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
                                      }

                                      FFAppState().isLoading1 = false;
                                      safeSetState(() {});
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Choose Cashier First'),
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
                                  }
                                  FFAppState().isLoading1 = false;
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                                text: 'Confirm',
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
                            ),
                            if (FFAppState().storeChoosen != ''
                                ? ((_model.cashierAmountLinestore != null &&
                                        (_model.cashierAmountLinestore)!
                                            .isNotEmpty) ==
                                    true)
                                : ((_model.cashierAmountLineCompnay != null &&
                                        (_model.cashierAmountLineCompnay)!
                                            .isNotEmpty) ==
                                    true))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final cashierAmountLine2 = (FFAppState().storeChoosen !=
                                                              ''
                                                      ? _model
                                                          .cashierAmountLinestore
                                                      : _model
                                                          .cashierAmountLineCompnay)
                                                  ?.toList() ??
                                              [];

                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                cashierAmountLine2.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 8.0),
                                            itemBuilder: (context,
                                                cashierAmountLine2Index) {
                                              final cashierAmountLine2Item =
                                                  cashierAmountLine2[
                                                      cashierAmountLine2Index];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          _model.currencyType
                                                              ?.where((e) =>
                                                                  cashierAmountLine2Item
                                                                      .currencyId ==
                                                                  e.currencyId)
                                                              .toList()
                                                              .firstOrNull
                                                              ?.currencyName,
                                                          'Currency Name',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansJp(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            'Currency',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansJp(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Quantity',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansJp(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        final denominationData = _model
                                                                .currencyDenomination
                                                                ?.where((e) =>
                                                                    cashierAmountLine2Item
                                                                        .currencyId ==
                                                                    e.currencyId)
                                                                .toList()
                                                                .toList() ??
                                                            [];

                                                        return ListView
                                                            .separated(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                            0,
                                                            8.0,
                                                            0,
                                                            0,
                                                          ),
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              denominationData
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 8.0),
                                                          itemBuilder: (context,
                                                              denominationDataIndex) {
                                                            final denominationDataItem =
                                                                denominationData[
                                                                    denominationDataIndex];
                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Text(
                                                                    'Hello World',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.notoSansJp(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      cashierAmountLine2Item
                                                                          .quantity
                                                                          .toString(),
                                                                      '123',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.notoSansJp(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
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
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ],
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
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 8.0)),
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
  }
}
