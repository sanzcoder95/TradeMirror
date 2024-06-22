import '/components/bottom_infocompany_phone_widget.dart';
import '/components/bottom_infocompany_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'copy_trading_copy_widget.dart' show CopyTradingCopyWidget;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CopyTradingCopyModel extends FlutterFlowModel<CopyTradingCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController1;
  int get tabBarCurrentIndex1 =>
      tabBarController1 != null ? tabBarController1!.index : 0;

  // State field(s) for TabBar widget.
  TabController? tabBarController2;
  int get tabBarCurrentIndex2 =>
      tabBarController2 != null ? tabBarController2!.index : 0;

  // Model for bottomInfocompany component.
  late BottomInfocompanyModel bottomInfocompanyModel1;
  // State field(s) for TabBar widget.
  TabController? tabBarController3;
  int get tabBarCurrentIndex3 =>
      tabBarController3 != null ? tabBarController3!.index : 0;

  // State field(s) for TabBar widget.
  TabController? tabBarController4;
  int get tabBarCurrentIndex4 =>
      tabBarController4 != null ? tabBarController4!.index : 0;

  // Model for bottomInfocompany component.
  late BottomInfocompanyModel bottomInfocompanyModel2;
  // State field(s) for TabBar widget.
  TabController? tabBarController5;
  int get tabBarCurrentIndex5 =>
      tabBarController5 != null ? tabBarController5!.index : 0;

  // State field(s) for TabBar widget.
  TabController? tabBarController6;
  int get tabBarCurrentIndex6 =>
      tabBarController6 != null ? tabBarController6!.index : 0;

  // Model for bottomInfocompany component.
  late BottomInfocompanyModel bottomInfocompanyModel3;
  // Model for bottomInfocompanyPhone component.
  late BottomInfocompanyPhoneModel bottomInfocompanyPhoneModel;

  @override
  void initState(BuildContext context) {
    bottomInfocompanyModel1 =
        createModel(context, () => BottomInfocompanyModel());
    bottomInfocompanyModel2 =
        createModel(context, () => BottomInfocompanyModel());
    bottomInfocompanyModel3 =
        createModel(context, () => BottomInfocompanyModel());
    bottomInfocompanyPhoneModel =
        createModel(context, () => BottomInfocompanyPhoneModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController1?.dispose();
    tabBarController2?.dispose();
    bottomInfocompanyModel1.dispose();
    tabBarController3?.dispose();
    tabBarController4?.dispose();
    bottomInfocompanyModel2.dispose();
    tabBarController5?.dispose();
    tabBarController6?.dispose();
    bottomInfocompanyModel3.dispose();
    bottomInfocompanyPhoneModel.dispose();
  }
}
