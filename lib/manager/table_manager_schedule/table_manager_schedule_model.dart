import '/flutter_flow/flutter_flow_util.dart';
import '/manager/schdule_list_manager/schdule_list_manager_widget.dart';
import 'table_manager_schedule_widget.dart' show TableManagerScheduleWidget;
import 'package:flutter/material.dart';

class TableManagerScheduleModel
    extends FlutterFlowModel<TableManagerScheduleWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for schduleListManager dynamic component.
  late FlutterFlowDynamicModels<SchduleListManagerModel>
      schduleListManagerModels;

  @override
  void initState(BuildContext context) {
    schduleListManagerModels =
        FlutterFlowDynamicModels(() => SchduleListManagerModel());
  }

  @override
  void dispose() {
    schduleListManagerModels.dispose();
  }
}
