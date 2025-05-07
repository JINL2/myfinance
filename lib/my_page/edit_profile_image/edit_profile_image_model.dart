import '/buttons/add_button/add_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_image_widget.dart' show EditProfileImageWidget;
import 'package:flutter/material.dart';

class EditProfileImageModel extends FlutterFlowModel<EditProfileImageWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for add_button component.
  late AddButtonModel addButtonModel;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {
    addButtonModel = createModel(context, () => AddButtonModel());
  }

  @override
  void dispose() {
    addButtonModel.dispose();
  }
}
