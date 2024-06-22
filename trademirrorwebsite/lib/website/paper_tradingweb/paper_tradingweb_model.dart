import '/components/bottom_infocompany_phone_widget.dart';
import '/components/bottom_infocompany_tablet_widget.dart';
import '/components/bottom_infocompany_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:badges/badges.dart' as badges;
import 'paper_tradingweb_widget.dart' show PaperTradingwebWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaperTradingwebModel extends FlutterFlowModel<PaperTradingwebWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController1;
  int get tabBarCurrentIndex1 =>
      tabBarController1 != null ? tabBarController1!.index : 0;

  // Model for bottomInfocompany component.
  late BottomInfocompanyModel bottomInfocompanyModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController2;
  int get tabBarCurrentIndex2 =>
      tabBarController2 != null ? tabBarController2!.index : 0;

  // Model for bottomInfocompanyTablet component.
  late BottomInfocompanyTabletModel bottomInfocompanyTabletModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController3;
  int get tabBarCurrentIndex3 =>
      tabBarController3 != null ? tabBarController3!.index : 0;

  // Model for bottomInfocompanyPhone component.
  late BottomInfocompanyPhoneModel bottomInfocompanyPhoneModel;

  @override
  void initState(BuildContext context) {
    bottomInfocompanyModel =
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
    bottomInfocompanyModel.dispose();
    tabBarController2?.dispose();
    bottomInfocompanyTabletModel.dispose();
    tabBarController3?.dispose();
    bottomInfocompanyPhoneModel.dispose();
  }
}
