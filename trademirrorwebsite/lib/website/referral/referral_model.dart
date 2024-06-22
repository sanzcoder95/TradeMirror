import '/components/bottom_infocompany_phone_widget.dart';
import '/components/bottom_infocompany_tablet_widget.dart';
import '/components/bottom_infocompany_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:badges/badges.dart' as badges;
import 'referral_widget.dart' show ReferralWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReferralModel extends FlutterFlowModel<ReferralWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for bottomInfocompany component.
  late BottomInfocompanyModel bottomInfocompanyModel;
  // Model for bottomInfocompanyTablet component.
  late BottomInfocompanyTabletModel bottomInfocompanyTabletModel1;
  // Model for bottomInfocompanyTablet component.
  late BottomInfocompanyTabletModel bottomInfocompanyTabletModel2;
  // Model for bottomInfocompanyPhone component.
  late BottomInfocompanyPhoneModel bottomInfocompanyPhoneModel;

  @override
  void initState(BuildContext context) {
    bottomInfocompanyModel =
        createModel(context, () => BottomInfocompanyModel());
    bottomInfocompanyTabletModel1 =
        createModel(context, () => BottomInfocompanyTabletModel());
    bottomInfocompanyTabletModel2 =
        createModel(context, () => BottomInfocompanyTabletModel());
    bottomInfocompanyPhoneModel =
        createModel(context, () => BottomInfocompanyPhoneModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bottomInfocompanyModel.dispose();
    bottomInfocompanyTabletModel1.dispose();
    bottomInfocompanyTabletModel2.dispose();
    bottomInfocompanyPhoneModel.dispose();
  }
}
