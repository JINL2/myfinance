import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/isloading_widget.dart';
import '/components/menu_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'bank_vault_ending_widget.dart' show BankVaultEndingWidget;
import 'package:flutter/material.dart';

class BankVaultEndingModel extends FlutterFlowModel<BankVaultEndingWidget> {
  ///  Local state fields for this page.

  String? selectedLocationId;

  List<CurrenciesStruct> currencies = [];
  void addToCurrencies(CurrenciesStruct item) => currencies.add(item);
  void removeFromCurrencies(CurrenciesStruct item) => currencies.remove(item);
  void removeAtIndexFromCurrencies(int index) => currencies.removeAt(index);
  void insertAtIndexInCurrencies(int index, CurrenciesStruct item) =>
      currencies.insert(index, item);
  void updateCurrenciesAtIndex(
          int index, Function(CurrenciesStruct) updateFn) =>
      currencies[index] = updateFn(currencies[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in bankVaultEnding widget.
  List<CashLocationsRow>? oPLCashLocation;
  // Stores action output result for [Backend Call - Query Rows] action in bankVaultEnding widget.
  List<CurrencyTypesRow>? oPLCurrencyType;
  // Stores action output result for [Backend Call - Query Rows] action in bankVaultEnding widget.
  List<CompanyCurrencyRow>? oPLCompanyCurrency;
  // Stores action output result for [Backend Call - Query Rows] action in bankVaultEnding widget.
  List<CurrencyDenominationsRow>? oPLCurrencyDenomination;
  // Model for menuBar component.
  late MenuBarModel menuBarModel;
  // State field(s) for cashlocationDropDown widget.
  String? cashlocationDropDownValue;
  FormFieldController<String>? cashlocationDropDownValueController;
  // Stores action output result for [Backend Call - API (insertCashLine)] action in Button widget.
  ApiCallResponse? apiResultla7;
  // Stores action output result for [Backend Call - API (insertCashLine)] action in Button widget.
  ApiCallResponse? apiResultggc;
  // Stores action output result for [Backend Call - API (deleteCashAmountLine)] action in Button widget.
  ApiCallResponse? apiResult6mc;
  // Stores action output result for [Backend Call - API (insertCashLine)] action in Button widget.
  ApiCallResponse? apiResult3ck;
  // Stores action output result for [Backend Call - API (insertCashLine)] action in Button widget.
  ApiCallResponse? apiResultpqu;
  // State field(s) for currencyDropDown widget.
  String? currencyDropDownValue;
  FormFieldController<String>? currencyDropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for isloading component.
  late IsloadingModel isloadingModel;

  @override
  void initState(BuildContext context) {
    menuBarModel = createModel(context, () => MenuBarModel());
    isloadingModel = createModel(context, () => IsloadingModel());
  }

  @override
  void dispose() {
    menuBarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    isloadingModel.dispose();
  }
}
