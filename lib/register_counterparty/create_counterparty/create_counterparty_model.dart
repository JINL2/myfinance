import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_counterparty_widget.dart' show CreateCounterpartyWidget;
import 'package:flutter/material.dart';

class CreateCounterpartyModel
    extends FlutterFlowModel<CreateCounterpartyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for counterpartyName widget.
  FocusNode? counterpartyNameFocusNode;
  TextEditingController? counterpartyNameTextController;
  String? Function(BuildContext, String?)?
      counterpartyNameTextControllerValidator;
  // State field(s) for Type widget.
  String? typeValue;
  FormFieldController<String>? typeValueController;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for Phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for Note widget.
  FocusNode? noteFocusNode;
  TextEditingController? noteTextController;
  String? Function(BuildContext, String?)? noteTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  CounterpartiesRow? test;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    counterpartyNameFocusNode?.dispose();
    counterpartyNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    noteFocusNode?.dispose();
    noteTextController?.dispose();
  }
}
