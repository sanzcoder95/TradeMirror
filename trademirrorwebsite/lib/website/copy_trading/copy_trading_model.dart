import '/components/bottom_infocompany_phone_widget.dart';
import '/components/bottom_infocompany_tablet_widget.dart';
import '/components/bottom_infocompany_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'copy_trading_widget.dart' show CopyTradingWidget;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CopyTradingModel extends FlutterFlowModel<CopyTradingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController1;
  int get tabBarCurrentIndex1 =>
      tabBarController1 != null ? tabBarController1!.index : 0;

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for DropDown widget.
  String? dropDownValue4;
  FormFieldController<String>? dropDownValueController4;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for bottomInfocompany component.
  late BottomInfocompanyModel bottomInfocompanyModel1;
  // State field(s) for TabBar widget.
  TabController? tabBarController2;
  int get tabBarCurrentIndex2 =>
      tabBarController2 != null ? tabBarController2!.index : 0;

  // State field(s) for DropDown widget.
  String? dropDownValue5;
  FormFieldController<String>? dropDownValueController5;
  // State field(s) for DropDown widget.
  String? dropDownValue6;
  FormFieldController<String>? dropDownValueController6;
  // State field(s) for DropDown widget.
  String? dropDownValue7;
  FormFieldController<String>? dropDownValueController7;
  // State field(s) for DropDown widget.
  String? dropDownValue8;
  FormFieldController<String>? dropDownValueController8;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for bottomInfocompany component.
  late BottomInfocompanyModel bottomInfocompanyModel2;
  // Model for bottomInfocompanyTablet component.
  late BottomInfocompanyTabletModel bottomInfocompanyTabletModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController3;
  int get tabBarCurrentIndex3 =>
      tabBarController3 != null ? tabBarController3!.index : 0;

  // State field(s) for DropDown widget.
  String? dropDownValue9;
  FormFieldController<String>? dropDownValueController9;
  // State field(s) for DropDown widget.
  String? dropDownValue10;
  FormFieldController<String>? dropDownValueController10;
  // State field(s) for DropDown widget.
  String? dropDownValue11;
  FormFieldController<String>? dropDownValueController11;
  // State field(s) for DropDown widget.
  String? dropDownValue12;
  FormFieldController<String>? dropDownValueController12;
  // Model for bottomInfocompanyPhone component.
  late BottomInfocompanyPhoneModel bottomInfocompanyPhoneModel;

  @override
  void initState(BuildContext context) {
    bottomInfocompanyModel1 =
        createModel(context, () => BottomInfocompanyModel());
    bottomInfocompanyModel2 =
        createModel(context, () => BottomInfocompanyModel());
    bottomInfocompanyTabletModel =
        createModel(context, () => BottomInfocompanyTabletModel());
    bottomInfocompanyPhoneModel =
        createModel(context, () => BottomInfocompanyPhoneModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController1?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    bottomInfocompanyModel1.dispose();
    tabBarController2?.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    bottomInfocompanyModel2.dispose();
    bottomInfocompanyTabletModel.dispose();
    tabBarController3?.dispose();
    bottomInfocompanyPhoneModel.dispose();
  }
}
