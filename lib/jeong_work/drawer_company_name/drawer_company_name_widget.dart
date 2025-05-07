import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'drawer_company_name_model.dart';
export 'drawer_company_name_model.dart';

class DrawerCompanyNameWidget extends StatefulWidget {
  const DrawerCompanyNameWidget({
    super.key,
    this.companyInfo,
  });

  final CompaniesStruct? companyInfo;

  @override
  State<DrawerCompanyNameWidget> createState() =>
      _DrawerCompanyNameWidgetState();
}

class _DrawerCompanyNameWidgetState extends State<DrawerCompanyNameWidget> {
  late DrawerCompanyNameModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerCompanyNameModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.5,
              children: [
                SlidableAction(
                  label: 'Edit',
                  backgroundColor: FlutterFlowTheme.of(context).alternate,
                  icon: Icons.edit,
                  onPressed: (_) {
                    print('SlidableActionWidget pressed ...');
                  },
                ),
                SlidableAction(
                  label: 'Delete',
                  backgroundColor: FlutterFlowTheme.of(context).error,
                  icon: Icons.delete_outline_rounded,
                  onPressed: (_) {
                    print('SlidableActionWidget pressed ...');
                  },
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: ListTile(
                title: Text(
                  valueOrDefault<String>(
                    widget.companyInfo?.companyName,
                    'Company Name',
                  ),
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        font: GoogleFonts.notoSansJp(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                tileColor: Color(0xFFA0C2FF),
                dense: false,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
