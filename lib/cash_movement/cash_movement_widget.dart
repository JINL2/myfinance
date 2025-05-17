import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'cash_movement_model.dart';
export 'cash_movement_model.dart';

class CashMovementWidget extends StatefulWidget {
  const CashMovementWidget({super.key});

  static String routeName = 'cashMovement';
  static String routePath = '/cashMovement';

  @override
  State<CashMovementWidget> createState() => _CashMovementWidgetState();
}

class _CashMovementWidgetState extends State<CashMovementWidget> {
  late CashMovementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CashMovementModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
