import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../menu/menu_widget.dart';
import '../nearby/nearby_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NearbyListWidget extends StatefulWidget {
  const NearbyListWidget({Key key}) : super(key: key);

  @override
  _NearbyListWidgetState createState() => _NearbyListWidgetState();
}

class _NearbyListWidgetState extends State<NearbyListWidget> {
  CallnearbyRecord submit;
  LatLng currentUserLocationValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
          child: StreamBuilder<List<LocsRecord>>(
            stream: queryLocsRecord(
              queryBuilder: (locsRecord) => locsRecord.orderBy('locate'),
              limit: 3,
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
              List<LocsRecord> listViewLocsRecordList = snapshot.data;
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewLocsRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewLocsRecord =
                      listViewLocsRecordList[listViewIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 2, 16, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            color: Color(0xFF095537),
                            offset: Offset(0, 5),
                            spreadRadius: 1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                            child: Container(
                              width: 4,
                              height: 90,
                              decoration: BoxDecoration(
                                color: Color(0xFF4B39EF),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 12, 16, 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    currentUserLocationValue =
                                        await getCurrentUserLocation(
                                            defaultLocation: LatLng(0.0, 0.0));

                                    final callnearbyCreateData =
                                        createCallnearbyRecordData(
                                      currentLocation: currentUserLocationValue,
                                      licenseId: getJsonField(
                                        FFAppState().userdata,
                                        r'''$.userData.username''',
                                      ).toString(),
                                      calling: listViewLocsRecord.id,
                                    );
                                    var callnearbyRecordReference =
                                        CallnearbyRecord.collection.doc();
                                    await callnearbyRecordReference
                                        .set(callnearbyCreateData);
                                    submit =
                                        CallnearbyRecord.getDocumentFromData(
                                            callnearbyCreateData,
                                            callnearbyRecordReference);
                                    await listViewLocsRecord.reference.delete();
                                    await Future.delayed(
                                        const Duration(milliseconds: 1000));
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NearbyWidget(),
                                      ),
                                    );

                                    setState(() {});
                                  },
                                  text: 'Contact officer',
                                  options: FFButtonOptions(
                                    width: 150,
                                    height: 40,
                                    color: Color(0xFF4C8A72),
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
                                      10, 4, 0, 0),
                                  child: Text(
                                    listViewLocsRecord.id,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF095537),
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
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
              );
            },
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 18, 0),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuWidget(),
                    ),
                  );
                },
                child: Icon(
                  Icons.cancel_sharp,
                  color: Color(0xFFFF0010),
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
