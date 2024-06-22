import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'k_y_c_verification2_widget.dart' show KYCVerification2Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KYCVerification2Model extends FlutterFlowModel<KYCVerification2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for AadharCardNumber widget.
  FocusNode? aadharCardNumberFocusNode1;
  TextEditingController? aadharCardNumberTextController1;
  String? Function(BuildContext, String?)?
      aadharCardNumberTextController1Validator;
  // State field(s) for AadharCardNumber widget.
  FocusNode? aadharCardNumberFocusNode2;
  TextEditingController? aadharCardNumberTextController2;
  String? Function(BuildContext, String?)?
      aadharCardNumberTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    aadharCardNumberFocusNode1?.dispose();
    aadharCardNumberTextController1?.dispose();

    aadharCardNumberFocusNode2?.dispose();
    aadharCardNumberTextController2?.dispose();
  }
}
