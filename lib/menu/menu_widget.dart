import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../profile/profile_widget.dart';
import '../status/status_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key key}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> with TickerProviderStateMixin {
  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 22),
        scale: 0.2,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 60),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF235D63),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF9F7F6),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileWidget(),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: 280,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/Capxture.JPG',
                                  ).image,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 6,
                                    color: Color(0x4B1A1F24),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF00968A),
                                    Color(0xFFF2A384)
                                  ],
                                  stops: [0, 1],
                                  begin: AlignmentDirectional(0.94, -1),
                                  end: AlignmentDirectional(-0.94, 1),
                                ),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color(0xFF110909),
                                ),
                              ),
                              alignment: AlignmentDirectional(0, -0.85),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 50, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 9, 0, 0),
                                          child: Image.network(
                                            'data:image/png;base64,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',
                                            width: 99,
                                            height: 84,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 0, 0, 0),
                                          child: Text(
                                            'የመንጃ ፈቃድ ቁጥር - ',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.black,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          getJsonField(
                                            FFAppState().userdata,
                                            r'''$.userData.username''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF235D63),
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.75),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 6, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'ስም - ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.black,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 0, 0),
                                            child: Text(
                                              getJsonField(
                                                FFAppState().userdata,
                                                r'''$.userData.first_name''',
                                              ).toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFF235D63),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    26, 0, 0, 0),
                                            child: Text(
                                              'ዜግነት - ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    1, 0, 0, 0),
                                            child: Text(
                                              getJsonField(
                                                FFAppState().userdata,
                                                r'''$.userData.nationality''',
                                              ).toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFF235D63),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'ደረጃ - ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.black,
                                                fontSize: 19,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  1, 0, 0, 0),
                                          child: Text(
                                            getJsonField(
                                              FFAppState().userdata,
                                              r'''$.userData.level''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF235D63),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Text(
                                            'ቀበሌ - ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.black,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  1, 0, 0, 0),
                                          child: Text(
                                            getJsonField(
                                              FFAppState().userdata,
                                              r'''$.userData.woreda''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF235D63),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'የትውልድ ቀን - ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.black,
                                                fontSize: 19,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  1, 0, 0, 0),
                                          child: Text(
                                            getJsonField(
                                              FFAppState().userdata,
                                              r'''$.userData.yob''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF235D63),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'ክፍለ ከተማ - ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.black,
                                                fontSize: 19,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  1, 0, 0, 0),
                                          child: Text(
                                            getJsonField(
                                              FFAppState().userdata,
                                              r'''$.userData.subcity''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF235D63),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ).animated([animationsMap['rowOnPageLoadAnimation']]),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.5, -1),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xFFF9F7F6),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 110,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF4C8A72),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.moneyBill,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 40,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
                                            child: Text(
                                              'Pay',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF8B97A2),
                                                        fontSize: 16,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 110,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF4C8A72),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  StatusWidget(),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.stacked_line_chart_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              size: 40,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Text(
                                                'Status',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF8B97A2),
                                                          fontSize: 16,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 110,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF4C8A72),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_history,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 40,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
                                            child: Text(
                                              'nearby officer',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF8B97A2),
                                                        fontSize: 15,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 12, 20, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Records',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF235D63),
                                            fontSize: 20,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.92,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xFF4C8A72),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 0),
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: Color(0x6639D2C0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          child: FaIcon(
                                            FontAwesomeIcons.moneyBill,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Penality type',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                '12/4/2022',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF8B97A2),
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 12, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '\$200',
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Text(
                                              'addis ababa',
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 12,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.92,
                                  height: 0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF1A1F24),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 0, 0),
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: Color(0x6639D2C0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 8),
                                            child: Icon(
                                              Icons.monetization_on_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Go Far Rewards',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Text(
                                                  'Income',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF8B97A2),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 12, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '\$50.00',
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                'Hello World',
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 12,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.92,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xFF4C8A72),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 0),
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: Color(0x6639D2C0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          child: FaIcon(
                                            FontAwesomeIcons.moneyBill,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Penality type',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                '12/4/2022',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF8B97A2),
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 12, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '\$200',
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Text(
                                              'addis ababa',
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 12,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ).animated(
                              [animationsMap['columnOnPageLoadAnimation']]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FFButtonWidget(
                    onPressed: () {
                      print('Button-SeeMore pressed ...');
                    },
                    text: 'See more records',
                    icon: Icon(
                      Icons.navigate_next,
                      size: 15,
                    ),
                    options: FFButtonOptions(
                      width: 205,
                      height: 40,
                      color: Color(0xFF4C8A72),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
