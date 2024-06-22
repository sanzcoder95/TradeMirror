import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'k_y_c_verification1_widget.dart' show KYCVerification1Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KYCVerification1Model extends FlutterFlowModel<KYCVerification1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for FullName widget.
  FocusNode? fullNameFocusNode1;
  TextEditingController? fullNameTextController1;
  String? Function(BuildContext, String?)? fullNameTextController1Validator;
  // State field(s) for Dateofbirth widget.
  FocusNode? dateofbirthFocusNode1;
  TextEditingController? dateofbirthTextController1;
  String? Function(BuildContext, String?)? dateofbirthTextController1Validator;
  // State field(s) for Emailaddress widget.
  FocusNode? emailaddressFocusNode1;
  TextEditingController? emailaddressTextController1;
  String? Function(BuildContext, String?)? emailaddressTextController1Validator;
  // State field(s) for Phonenumber widget.
  FocusNode? phonenumberFocusNode1;
  TextEditingController? phonenumberTextController1;
  String? Function(BuildContext, String?)? phonenumberTextController1Validator;
  // State field(s) for FullName widget.
  FocusNode? fullNameFocusNode2;
  TextEditingController? fullNameTextController2;
  String? Function(BuildContext, String?)? fullNameTextController2Validator;
  // State field(s) for Dateofbirth widget.
  FocusNode? dateofbirthFocusNode2;
  TextEditingController? dateofbirthTextController2;
  String? Function(BuildContext, String?)? dateofbirthTextController2Validator;
  // State field(s) for Emailaddress widget.
  FocusNode? emailaddressFocusNode2;
  TextEditingController? emailaddressTextController2;
  String? Function(BuildContext, String?)? emailaddressTextController2Validator;
  // State field(s) for Phonenumber widget.
  FocusNode? phonenumberFocusNode2;
  TextEditingController? phonenumberTextController2;
  String? Function(BuildContext, String?)? phonenumberTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    fullNameFocusNode1?.dispose();
    fullNameTextController1?.dispose();

    dateofbirthFocusNode1?.dispose();
    dateofbirthTextController1?.dispose();

    emailaddressFocusNode1?.dispose();
    emailaddressTextController1?.dispose();

    phonenumberFocusNode1?.dispose();
    phonenumberTextController1?.dispose();

    fullNameFocusNode2?.dispose();
    fullNameTextController2?.dispose();

    dateofbirthFocusNode2?.dispose();
    dateofbirthTextController2?.dispose();

    emailaddressFocusNode2?.dispose();
    emailaddressTextController2?.dispose();

    phonenumberFocusNode2?.dispose();
    phonenumberTextController2?.dispose();
  }
}
