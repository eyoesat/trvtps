import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';
import '../tticket/tticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<LocsRecord>>(
      stream: queryLocsRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<LocsRecord> homeLocsRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final homeLocsRecord =
            homeLocsRecordList.isNotEmpty ? homeLocsRecordList.first : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF9F7F6),
          body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 110, 20, 0),
            child: DefaultTabController(
              length: 1,
              initialIndex: 0,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Color(0xFF235D63),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        text: 'Welcome',
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 90, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginWidget(),
                                      ),
                                    );
                                  },
                                  text: getJsonField(
                                    FFAppState().aaa,
                                    r'''$.login''',
                                  ).toString(),
                                  options: FFButtonOptions(
                                    width: 300,
                                    height: 70,
                                    color: Color(0xFF4C8A72),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xC5FFFFFF),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    elevation: 3,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 40,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                                child: Text(
                                  getJsonField(
                                    FFAppState().aaa,
                                    r'''$.or''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF235D63),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 70, 10, 10),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TticketWidget(),
                                      ),
                                    );
                                  },
                                  text: getJsonField(
                                    FFAppState().aaa,
                                    r'''$.congestion''',
                                  ).toString(),
                                  options: FFButtonOptions(
                                    width: 300,
                                    height: 70,
                                    color: Color(0xFF4C8A72),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xC5FFFFFF),
                                          fontSize: 18,
                                        ),
                                    elevation: 3,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 40,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 150, 0, 0),
                                child: Text(
                                  'support@trvpts.com',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF235D63),
                                        fontSize: 20,
                                        decoration: TextDecoration.underline,
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
              ),
            ),
          ),
        );
      },
    );
  }
}
