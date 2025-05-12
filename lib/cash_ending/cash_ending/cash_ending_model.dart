import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/isloading_widget.dart';
import '/components/menu_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cash_ending_widget.dart' show CashEndingWidget;
import 'package:flutter/material.dart';

class CashEndingModel extends FlutterFlowModel<CashEndingWidget> {
  ///  Local state fields for this page.

  List<CompanyCurrencyRow> companyCurrency = [];
  void addToCompanyCurrency(CompanyCurrencyRow item) =>
      companyCurrency.add(item);
  void removeFromCompanyCurrency(CompanyCurrencyRow item) =>
      companyCurrency.remove(item);
  void removeAtIndexFromCompanyCurrency(int index) =>
      companyCurrency.removeAt(index);
  void insertAtIndexInCompanyCurrency(int index, CompanyCurrencyRow item) =>
      companyCurrency.insert(index, item);
  void updateCompanyCurrencyAtIndex(
          int index, Function(CompanyCurrencyRow) updateFn) =>
      companyCurrency[index] = updateFn(companyCurrency[index]);

  List<CurrencyDenominationsRow> currencyDenomination1 = [];
  void addToCurrencyDenomination1(CurrencyDenominationsRow item) =>
      currencyDenomination1.add(item);
  void removeFromCurrencyDenomination1(CurrencyDenominationsRow item) =>
      currencyDenomination1.remove(item);
  void removeAtIndexFromCurrencyDenomination1(int index) =>
      currencyDenomination1.removeAt(index);
  void insertAtIndexInCurrencyDenomination1(
          int index, CurrencyDenominationsRow item) =>
      currencyDenomination1.insert(index, item);
  void updateCurrencyDenomination1AtIndex(
          int index, Function(CurrencyDenominationsRow) updateFn) =>
      currencyDenomination1[index] = updateFn(currencyDenomination1[index]);

  int? textfield;

  CashEndingStruct? cashEnding;
  void updateCashEndingStruct(Function(CashEndingStruct) updateFn) {
    updateFn(cashEnding ??= CashEndingStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in cashEnding widget.
  List<CurrencyTypesRow>? currencyType;
  // Stores action output result for [Backend Call - Query Rows] action in cashEnding widget.
  List<CompanyCurrencyRow>? getCompanyCurrency;
  // Stores action output result for [Backend Call - Query Rows] action in cashEnding widget.
  List<CurrencyDenominationsRow>? currencyDenomination;
  // Model for menuBar component.
  late MenuBarModel menuBarModel;
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
    isloadingModel.dispose();
  }
}
