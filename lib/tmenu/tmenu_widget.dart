import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../tcalled/tcalled_widget.dart';
import '../tform/tform_widget.dart';
import '../tnews/tnews_widget.dart';
import '../tsearch/tsearch_widget.dart';
import '../tsetting/tsetting_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class TmenuWidget extends StatefulWidget {
  const TmenuWidget({
    Key key,
    this.toBeDeleted,
  }) : super(key: key);

  final CallnearbyRecord toBeDeleted;

  @override
  _TmenuWidgetState createState() => _TmenuWidgetState();
}

class _TmenuWidgetState extends State<TmenuWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 1600,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 2,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      if ((FFAppState().going) == 'yes') {
        await widget.toBeDeleted.reference.delete();
      } else {
        return;
      }
    });

    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CallnearbyRecord>>(
      stream: queryCallnearbyRecord(
        queryBuilder: (callnearbyRecord) => callnearbyRecord.where('calling',
            isEqualTo: getJsonField(
              FFAppState().userdata,
              r'''$.userData.username''',
            ).toString()),
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
        List<CallnearbyRecord> tmenuCallnearbyRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0xFF235D63),
            automaticallyImplyLeading: true,
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TsettingWidget(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.menu_outlined,
                    color: FlutterFlowTheme.of(context).lineColor,
                    size: 34,
                  ),
                ),
              ),
              Visibility(
                visible: (tmenuCallnearbyRecordList.length) > 0,
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TcalledWidget(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.notifications_active,
                    color: FlutterFlowTheme.of(context).alternate,
                    size: 46,
                  ),
                ).animated([animationsMap['iconOnActionTriggerAnimation']]),
              ),
            ],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: Color(0xFFF9F7F6),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 40, 0, 0),
                          child: Text(
                            'Hello World',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                      Text(
                        getJsonField(
                          FFAppState().aaa,
                          r'''$.license''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF235D63),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              if ((FFAppState().going) == 'yes')
                StreamBuilder<List<AcceptedRecord>>(
                  stream: queryAcceptedRecord(
                    queryBuilder: (acceptedRecord) => acceptedRecord.where('id',
                        isEqualTo: getJsonField(
                          FFAppState().userdata,
                          r'''$.userData.username''',
                        ).toString()),
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
                    List<AcceptedRecord> rowAcceptedRecordList = snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final rowAcceptedRecord = rowAcceptedRecordList.isNotEmpty
                        ? rowAcceptedRecordList.first
                        : null;
                    return InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TformWidget(
                              toBeDeleted: rowAcceptedRecord.reference,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: Text(
                              'Verify Approval',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                  ),
                            ),
                          ),
                          Icon(
                            Icons.check_circle_outline_rounded,
                            color: Colors.black,
                            size: 33,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TsearchWidget(),
                            ),
                          );
                        },
                        text: 'insert id',
                        options: FFButtonOptions(
                          width: 300,
                          height: 70,
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
                          borderRadius: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TnewsWidget(),
                            ),
                          );
                        },
                        text: 'Announcement',
                        options: FFButtonOptions(
                          width: 300,
                          height: 70,
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
                          borderRadius: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'offence code',
                        options: FFButtonOptions(
                          width: 300,
                          height: 70,
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
                          borderRadius: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 90, 0, 40),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Log Out',
                  options: FFButtonOptions(
                    width: 300,
                    height: 50,
                    color: Color(0xFF043C28),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xC5FFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                    elevation: 0,
                    borderSide: BorderSide(
                      color: Color(0xFF090F13),
                      width: 1,
                    ),
                    borderRadius: 40,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
