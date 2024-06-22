import '/components/bottom_infocompany_phone_widget.dart';
import '/components/bottom_infocompany_tablet_widget.dart';
import '/components/bottom_infocompany_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'landing_page_widget.dart' show LandingPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LandingPageModel extends FlutterFlowModel<LandingPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for bottomInfocompany component.
  late BottomInfocompanyModel bottomInfocompanyModel1;
  // Model for bottomInfocompany component.
  late BottomInfocompanyModel bottomInfocompanyModel2;
  // Model for bottomInfocompanyTablet component.
  late BottomInfocompanyTabletModel bottomInfocompanyTabletModel;
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
    bottomInfocompanyModel1.dispose();
    bottomInfocompanyModel2.dispose();
    bottomInfocompanyTabletModel.dispose();
    bottomInfocompanyPhoneModel.dispose();
  }
}
