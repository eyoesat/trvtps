import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../tmenu/tmenu_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TsettingWidget extends StatefulWidget {
  const TsettingWidget({Key key}) : super(key: key);

  @override
  _TsettingWidgetState createState() => _TsettingWidgetState();
}

class _TsettingWidgetState extends State<TsettingWidget> {
  LocsRecord insertion;
  String dropDownValue;
  String radioButtonValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng currentUserLocationValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF235D63),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFDBE2E7),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: Container(
                      width: 90,
                      height: 90,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1536164261511-3a17e671d380?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=630&q=80',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 16, 0, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: FlutterFlowDropDown(
                      initialOption: dropDownValue ??= 'English',
                      options: ['English', 'Amharic', 'Oromifa'],
                      onChanged: (val) => setState(() => dropDownValue = val),
                      width: 134,
                      height: 35,
                      textStyle: FlutterFlowTheme.of(context)
                          .bodyText1
                          .override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 18,
                          ),
                      hintText: 'English',
                      fillColor: Color(0xFF4C8A72),
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 12,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 120, 0),
                    child: InkWell(
                      onTap: () async {
                        if ((dropDownValue) == 'English') {
                          setState(
                              () => FFAppState().aaa = FFAppState().english);
                        } else {
                          if ((dropDownValue) == 'Amharic') {
                            setState(
                                () => FFAppState().aaa = FFAppState().amharic);
                          } else {
                            if ((dropDownValue) == 'Oromifa') {
                              setState(() =>
                                  FFAppState().aaa = FFAppState().oromifa);
                            } else {
                              return;
                            }
                          }
                        }

                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TmenuWidget(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.check_circle_sharp,
                        color: Color(0xFF043C28),
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(19, 0, 0, 0),
                    child: Text(
                      'Discoverablity',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF235D63),
                            fontSize: 18,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                    child: FlutterFlowRadioButton(
                      options: ['on', 'off'].toList(),
                      initialValue: 'on',
                      onChanged: (value) {
                        setState(() => radioButtonValue = value);
                      },
                      optionHeight: 25,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      buttonPosition: RadioButtonPosition.left,
                      direction: Axis.horizontal,
                      radioButtonColor: Color(0xFF095537),
                      inactiveRadioButtonColor: Color(0x8A000000),
                      toggleable: false,
                      horizontalAlignment: WrapAlignment.spaceBetween,
                      verticalAlignment: WrapCrossAlignment.start,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
              child: StreamBuilder<List<LocsRecord>>(
                stream: queryLocsRecord(
                  queryBuilder: (locsRecord) => locsRecord.where('id',
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
                  List<LocsRecord> rowLocsRecordList = snapshot.data;
                  final rowLocsRecord = rowLocsRecordList.isNotEmpty
                      ? rowLocsRecordList.first
                      : null;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            currentUserLocationValue =
                                await getCurrentUserLocation(
                                    defaultLocation: LatLng(0.0, 0.0));
                            var _shouldSetState = false;
                            if (rowLocsRecord != null) {
                              if ((radioButtonValue) == 'off') {
                                await rowLocsRecord.reference.delete();
                              } else {
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              setState(() => FFAppState().visibility = 'off');
                            } else {
                              if ((radioButtonValue) == 'on') {
                                final locsCreateData = createLocsRecordData(
                                  locate: currentUserLocationValue,
                                  id: getJsonField(
                                    FFAppState().userdata,
                                    r'''$.userData.username''',
                                  ).toString(),
                                );
                                var locsRecordReference =
                                    LocsRecord.collection.doc();
                                await locsRecordReference.set(locsCreateData);
                                insertion = LocsRecord.getDocumentFromData(
                                    locsCreateData, locsRecordReference);
                                _shouldSetState = true;
                              } else {
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              setState(() => FFAppState().visibility = 'on');
                            }

                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TmenuWidget(),
                              ),
                            );
                            if (_shouldSetState) setState(() {});
                          },
                          text: 'Save changes',
                          options: FFButtonOptions(
                            width: 230,
                            height: 50,
                            color: Color(0xFF03261A),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
