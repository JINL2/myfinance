import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_counterparty_widget.dart' show UpdateCounterpartyWidget;
import 'package:flutter/material.dart';

class UpdateCounterpartyModel
    extends FlutterFlowModel<UpdateCounterpartyWidget> {
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
  // Stores action output result for [Backend Call - Update Row(s)] action in Icon widget.
  List<CounterpartiesRow>? test;

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
