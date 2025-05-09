import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'testattend_model.dart';
export 'testattend_model.dart';

class TestattendWidget extends StatefulWidget {
  const TestattendWidget({super.key});

  static String routeName = 'testattend';
  static String routePath = '/testattend';

  @override
  State<TestattendWidget> createState() => _TestattendWidgetState();
}

class _TestattendWidgetState extends State<TestattendWidget> {
  late TestattendModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestattendModel());
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: BarcodeWidget(
                  data: '618f46b0-163d-4751-91e6-d86d0c79aa9b',
                  barcode: Barcode.qrCode(),
                  width: 200.0,
                  height: 200.0,
                  color: FlutterFlowTheme.of(context).primaryText,
                  backgroundColor: Colors.transparent,
                  errorBuilder: (_context, _error) => SizedBox(
                    width: 200.0,
                    height: 200.0,
                  ),
                  drawText: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
