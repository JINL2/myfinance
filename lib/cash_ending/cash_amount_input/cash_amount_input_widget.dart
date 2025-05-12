import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'cash_amount_input_model.dart';
export 'cash_amount_input_model.dart';

class CashAmountInputWidget extends StatefulWidget {
  const CashAmountInputWidget({super.key});

  @override
  State<CashAmountInputWidget> createState() => _CashAmountInputWidgetState();
}

class _CashAmountInputWidgetState extends State<CashAmountInputWidget> {
  late CashAmountInputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CashAmountInputModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [],
      ),
    );
  }
}
