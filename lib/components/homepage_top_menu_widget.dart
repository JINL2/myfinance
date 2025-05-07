import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'homepage_top_menu_model.dart';
export 'homepage_top_menu_model.dart';

class HomepageTopMenuWidget extends StatefulWidget {
  const HomepageTopMenuWidget({super.key});

  @override
  State<HomepageTopMenuWidget> createState() => _HomepageTopMenuWidgetState();
}

class _HomepageTopMenuWidgetState extends State<HomepageTopMenuWidget> {
  late HomepageTopMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageTopMenuModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
