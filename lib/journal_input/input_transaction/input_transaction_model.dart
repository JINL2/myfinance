import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'input_transaction_widget.dart' show InputTransactionWidget;
import 'package:flutter/material.dart';

class InputTransactionModel extends FlutterFlowModel<InputTransactionWidget> {
  ///  Local state fields for this component.

  bool isDebt = false;

  String? interestDueDate;

  String? issueDate;

  String? dueDate;

  dynamic transactionDetail;

  String? selectedCounterparty;

  String? category;

  bool debitOrCredit = true;

  double? diff;

  String? acquireDate;

  ///  State fields for stateful widgets in this component.

  // State field(s) for accountDropDown widget.
  String? accountDropDownValue;
  FormFieldController<String>? accountDropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for counterpartycompanyDropDown widget.
  String? counterpartycompanyDropDownValue;
  FormFieldController<String>? counterpartycompanyDropDownValueController;
  // State field(s) for counterpartystoreDropDown widget.
  String? counterpartystoreDropDownValue;
  FormFieldController<String>? counterpartystoreDropDownValueController;
  // State field(s) for debtDropdown widget.
  String? debtDropdownValue;
  FormFieldController<String>? debtDropdownValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for fixedAssetName widget.
  FocusNode? fixedAssetNameFocusNode;
  TextEditingController? fixedAssetNameTextController;
  String? Function(BuildContext, String?)?
      fixedAssetNameTextControllerValidator;
  // State field(s) for usefulLifeDropdown widget.
  int? usefulLifeDropdownValue;
  FormFieldController<int>? usefulLifeDropdownValueController;
  // State field(s) for salvageValue widget.
  FocusNode? salvageValueFocusNode;
  TextEditingController? salvageValueTextController;
  String? Function(BuildContext, String?)? salvageValueTextControllerValidator;
  DateTime? datePicked3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    fixedAssetNameFocusNode?.dispose();
    fixedAssetNameTextController?.dispose();

    salvageValueFocusNode?.dispose();
    salvageValueTextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController4?.dispose();
  }
}
