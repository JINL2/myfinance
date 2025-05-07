import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'transaction_input_widget.dart' show TransactionInputWidget;
import 'package:flutter/material.dart';

class TransactionInputModel extends FlutterFlowModel<TransactionInputWidget> {
  ///  Local state fields for this component.

  bool isDebt = false;

  String? interestDueDate;

  String? issueDate;

  String? dueDate;

  dynamic transactionDetail;

  String? acquisitionDate;

  String? selectedCounterparty;

  String? category;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for accountTypeDrop widget.
  String? accountTypeDropValue;
  FormFieldController<String>? accountTypeDropValueController;
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  // State field(s) for counterParty widget.
  String? counterPartyValue;
  FormFieldController<String>? counterPartyValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for DropDownCate widget.
  String? dropDownCateValue;
  FormFieldController<String>? dropDownCateValueController;
  // State field(s) for InterestRate widget.
  FocusNode? interestRateFocusNode;
  TextEditingController? interestRateTextController;
  String? Function(BuildContext, String?)? interestRateTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for assetName widget.
  FocusNode? assetNameFocusNode;
  TextEditingController? assetNameTextController;
  String? Function(BuildContext, String?)? assetNameTextControllerValidator;
  // State field(s) for dropdownUsefulLife widget.
  int? dropdownUsefulLifeValue;
  FormFieldController<int>? dropdownUsefulLifeValueController;
  // State field(s) for TextFieldSalvageValue widget.
  FocusNode? textFieldSalvageValueFocusNode;
  TextEditingController? textFieldSalvageValueTextController;
  String? Function(BuildContext, String?)?
      textFieldSalvageValueTextControllerValidator;
  DateTime? datePicked4;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    amountFocusNode?.dispose();
    amountTextController?.dispose();

    interestRateFocusNode?.dispose();
    interestRateTextController?.dispose();

    assetNameFocusNode?.dispose();
    assetNameTextController?.dispose();

    textFieldSalvageValueFocusNode?.dispose();
    textFieldSalvageValueTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
