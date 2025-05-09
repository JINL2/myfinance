import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_cash_location_widget.dart' show CreateCashLocationWidget;
import 'package:flutter/material.dart';

class CreateCashLocationModel
    extends FlutterFlowModel<CreateCashLocationWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for cashLocationName widget.
  FocusNode? cashLocationNameFocusNode;
  TextEditingController? cashLocationNameTextController;
  String? Function(BuildContext, String?)?
      cashLocationNameTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for storeNameDropdown widget.
  String? storeNameDropdownValue;
  FormFieldController<String>? storeNameDropdownValueController;
  // State field(s) for TypeDropDown widget.
  String? typeDropDownValue;
  FormFieldController<String>? typeDropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  CashLocationsRow? test;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cashLocationNameFocusNode?.dispose();
    cashLocationNameTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
