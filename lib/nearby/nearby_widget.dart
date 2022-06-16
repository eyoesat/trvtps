import '../backend/backend.dart';
import '../components/nearby_list_widget.dart';
import '../flutter_flow/flutter_flow_static_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/lat_lng.dart';
import '../menu/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';

class NearbyWidget extends StatefulWidget {
  const NearbyWidget({Key key}) : super(key: key);

  @override
  _NearbyWidgetState createState() => _NearbyWidgetState();
}

class _NearbyWidgetState extends State<NearbyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFEFEFEF),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder<List<AcceptedRecord>>(
                stream: queryAcceptedRecord(
                  queryBuilder: (acceptedRecord) =>
                      acceptedRecord.where('idDriver',
                          isEqualTo: getJsonField(
                                    FFAppState().userdata,
                                    r'''$.userData.username''',
                                  ).toString() !=
                                  ''
                              ? getJsonField(
                                  FFAppState().userdata,
                                  r'''$.userData.username''',
                                ).toString()
                              : null),
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
                  List<AcceptedRecord> containerAcceptedRecordList =
                      snapshot.data;
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 128,
                    decoration: BoxDecoration(
                      color: Color(0xFF4C8A72),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x430F1113),
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 44, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MenuWidget(),
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.arrow_back_outlined,
                                  color: Colors.black,
                                  size: 29,
                                ),
                              ),
                              Text(
                                'Officer Search',
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 1, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if ((containerAcceptedRecordList.length) < 1)
                                  StreamBuilder<List<AcceptedRecord>>(
                                    stream: queryAcceptedRecord(
                                      queryBuilder: (acceptedRecord) =>
                                          acceptedRecord.where('idDriver',
                                              isNotEqualTo: getJsonField(
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<AcceptedRecord>
                                          buttonAcceptedRecordList =
                                          snapshot.data;
                                      // Return an empty Container when the document does not exist.
                                      if (snapshot.data.isEmpty) {
                                        return Container();
                                      }
                                      final buttonAcceptedRecord =
                                          buttonAcceptedRecordList.isNotEmpty
                                              ? buttonAcceptedRecordList.first
                                              : null;
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: NearbyListWidget(),
                                              );
                                            },
                                          );
                                        },
                                        text: 'Contact Officer',
                                        options: FFButtonOptions(
                                          width: 160,
                                          height: 40,
                                          color: Color(0xFF03261A),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      );
                                    },
                                  ),
                                if ((containerAcceptedRecordList.length) > 0)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Text(
                                      'Officer on the way',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF0D2EF1),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    'Waiting for officer',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 40,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, -277.22),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                    child: StreamBuilder<List<AcceptedRecord>>(
                      stream: queryAcceptedRecord(
                        queryBuilder: (acceptedRecord) =>
                            acceptedRecord.where('idDriver',
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<AcceptedRecord> staticMapAcceptedRecordList =
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final staticMapAcceptedRecord =
                            staticMapAcceptedRecordList.isNotEmpty
                                ? staticMapAcceptedRecordList.first
                                : null;
                        return FlutterFlowStaticMap(
                          location: staticMapAcceptedRecord.location,
                          apiKey:
                              'pk.eyJ1IjoiYXNkZmFmZGMiLCJhIjoiY2wzeWJtbjViMDJwaTNpcXliN2ZzdGxtNCJ9.R1PQX3DPADVLmWaldTWc8w',
                          style: MapBoxStyle.Outdoors,
                          width: 380,
                          height: 690,
                          fit: BoxFit.cover,
                          borderRadius: BorderRadius.circular(0),
                          markerUrl: 'E',
                          zoom: 15,
                          tilt: 0,
                          rotation: 0,
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
