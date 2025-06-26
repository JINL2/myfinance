import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calender_day_text_model.dart';
export 'calender_day_text_model.dart';

class CalenderDayTextWidget extends StatefulWidget {
  const CalenderDayTextWidget({
    super.key,
    required this.day,
  });

  final String? day;

  @override
  State<CalenderDayTextWidget> createState() => _CalenderDayTextWidgetState();
}

class _CalenderDayTextWidgetState extends State<CalenderDayTextWidget> {
  late CalenderDayTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalenderDayTextModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Text(
        valueOrDefault<String>(
          widget.day,
          'error',
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.notoSansJp(
                fontWeight: FontWeight.w500,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 11.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
      ),
    );
  }
}
