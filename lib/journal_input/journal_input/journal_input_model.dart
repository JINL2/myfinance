import '/backend/api_requests/api_calls.dart';
import '/components/menu_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/jeong_work/add/add_widget.dart';
import 'journal_input_widget.dart' show JournalInputWidget;
import 'package:flutter/material.dart';

class JournalInputModel extends FlutterFlowModel<JournalInputWidget> {
  ///  Local state fields for this page.

  List<dynamic> transactionDetail = [];
  void addToTransactionDetail(dynamic item) => transactionDetail.add(item);
  void removeFromTransactionDetail(dynamic item) =>
      transactionDetail.remove(item);
  void removeAtIndexFromTransactionDetail(int index) =>
      transactionDetail.removeAt(index);
  void insertAtIndexInTransactionDetail(int index, dynamic item) =>
      transactionDetail.insert(index, item);
  void updateTransactionDetailAtIndex(int index, Function(dynamic) updateFn) =>
      transactionDetail[index] = updateFn(transactionDetail[index]);

  double? debitValue = 0.0;

  double? creditValue = 0.0;

  double differences = 0.0;

  ///  State fields for stateful widgets in this page.

  // Model for menuBar component.
  late MenuBarModel menuBarModel;
  // Stores action output result for [Backend Call - API (bringFinanceAccountInfo)] action in Text widget.
  ApiCallResponse? bringAccount;
  // State field(s) for chooseCompan widget.
  String? chooseCompanValue;
  FormFieldController<String>? chooseCompanValueController;
  // State field(s) for chooseStore widget.
  String? chooseStoreValue;
  FormFieldController<String>? chooseStoreValueController;
  // Model for add component.
  late AddModel addModel1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for add component.
  late AddModel addModel2;
  // Stores action output result for [Backend Call - API (insertjournalwitheverything)] action in add widget.
  ApiCallResponse? inputJournal;

  @override
  void initState(BuildContext context) {
    menuBarModel = createModel(context, () => MenuBarModel());
    addModel1 = createModel(context, () => AddModel());
    addModel2 = createModel(context, () => AddModel());
  }

  @override
  void dispose() {
    menuBarModel.dispose();
    addModel1.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    addModel2.dispose();
  }
}
