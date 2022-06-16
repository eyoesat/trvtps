import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_static_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/lat_lng.dart';
import '../tmenu/tmenu_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';

class TcalledWidget extends StatefulWidget {
  const TcalledWidget({Key key}) : super(key: key);

  @override
  _TcalledWidgetState createState() => _TcalledWidgetState();
}

class _TcalledWidgetState extends State<TcalledWidget> {
  AcceptedRecord acceptedResult;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng currentUserLocationValue;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CallnearbyRecord>>(
      stream: queryCallnearbyRecord(
        queryBuilder: (callnearbyRecord) => callnearbyRecord.where('calling',
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
        List<CallnearbyRecord> tcalledCallnearbyRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final tcalledCallnearbyRecord = tcalledCallnearbyRecordList.isNotEmpty
            ? tcalledCallnearbyRecordList.first
            : null;
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
                  Container(
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
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 14, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.65, 0),
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                    size: 29,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 10, 0, 0),
                                child: Text(
                                  'Emergency contact',
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 22,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    currentUserLocationValue =
                                        await getCurrentUserLocation(
                                            defaultLocation: LatLng(0.0, 0.0));

                                    final acceptedCreateData =
                                        createAcceptedRecordData(
                                      id: getJsonField(
                                        FFAppState().userdata,
                                        r'''$.userData.username''',
                                      ).toString(),
                                      location: currentUserLocationValue,
                                      idDriver:
                                          tcalledCallnearbyRecord.licenseId,
                                    );
                                    var acceptedRecordReference =
                                        AcceptedRecord.collection.doc();
                                    await acceptedRecordReference
                                        .set(acceptedCreateData);
                                    acceptedResult =
                                        AcceptedRecord.getDocumentFromData(
                                            acceptedCreateData,
                                            acceptedRecordReference);
                                    setState(() => FFAppState().going = 'yes');
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TmenuWidget(
                                          toBeDeleted: tcalledCallnearbyRecord,
                                        ),
                                      ),
                                    );

                                    setState(() {});
                                  },
                                  text: 'Accept ',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    color: Color(0xFF095537),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 10, 0, 0),
                                  child: Text(
                                    tcalledCallnearbyRecord.licenseId,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
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
                  ),
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 1,
                        decoration: BoxDecoration(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: FlutterFlowStaticMap(
                        location: tcalledCallnearbyRecord.currentLocation,
                        apiKey:
                            'pk.eyJ1IjoiYXNkZmFmZGMiLCJhIjoiY2wzeWJtbjViMDJwaTNpcXliN2ZzdGxtNCJ9.R1PQX3DPADVLmWaldTWc8w',
                        style: MapBoxStyle.Outdoors,
                        width: 500,
                        height: 700,
                        fit: BoxFit.cover,
                        borderRadius: BorderRadius.circular(0),
                        markerUrl: 'pe',
                        zoom: 15,
                        tilt: 0,
                        rotation: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
