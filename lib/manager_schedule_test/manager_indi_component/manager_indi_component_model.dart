import '/flutter_flow/flutter_flow_util.dart';
import 'manager_indi_component_widget.dart' show ManagerIndiComponentWidget;
import 'package:flutter/material.dart';

class ManagerIndiComponentModel
    extends FlutterFlowModel<ManagerIndiComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
