import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/custom_drawer/drawer_user_controller.dart';
import 'package:best_flutter_ui_templates/custom_drawer/home_drawer.dart';
import 'package:best_flutter_ui_templates/feedback_screen.dart';
import 'package:best_flutter_ui_templates/asistencia_empleados/registrar_asistencia.dart';
import 'package:best_flutter_ui_templates/asistencia_empleados/generar_qr.dart';
import 'package:best_flutter_ui_templates/Absences/view_absences.dart';
import 'package:best_flutter_ui_templates/home_screen.dart';
import 'package:best_flutter_ui_templates/invite_friend_screen.dart';
import 'package:best_flutter_ui_templates/nomina_empleados.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  final String user;
  NavigationHomeScreen({Key key, @required this.user}) : super(key: key);

  _NavigationHomeScreenState createState() => _NavigationHomeScreenState(user: user);
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  final String user;
  _NavigationHomeScreenState({Key key, @required this.user});
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = RegisterAsistencia();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(user);
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery
                .of(context)
                .size
                .width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = const MyHomePage();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = RegisterAsistencia();
        });
      } else if (drawerIndex == DrawerIndex.Absences) {
        setState(() {
          screenView = AbsencesActivity();
        });
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = FeedbackScreen();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = InviteFriend();
        });
      } else if (drawerIndex == DrawerIndex.NominaEmpleados) {
        setState(() {
          screenView = NominaEmpleados();
        });
      } else if (drawerIndex == DrawerIndex.QR) {
        setState(() {
          screenView = GenerarQr();
        });
      }
      }
    }
  }
