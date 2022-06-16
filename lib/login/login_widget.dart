import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home/home_widget.dart';
import '../menu/menu_widget.dart';
import '../tmenu/tmenu_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  ApiCallResponse returned;
  LocsRecord insertion;
  TextEditingController passwordController;
  bool passwordVisibility;
  TextEditingController userIdController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    passwordVisibility = false;
    userIdController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF9F7F6),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(27, 100, 0, 0),
                child: Text(
                  getJsonField(
                    FFAppState().aaa,
                    r'''$.page''',
                  ).toString(),
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF235D63),
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 340,
              decoration: BoxDecoration(
                color: Color(0xFFF9F7F6),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 6, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: userIdController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: getJsonField(
                                  FFAppState().aaa,
                                  r'''$.userid''',
                                ).toString(),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: 'Enter your ID',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE2E7),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE2E7),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 24, 0, 24),
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF2B343A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: !passwordVisibility,
                              decoration: InputDecoration(
                                labelText: getJsonField(
                                  FFAppState().aaa,
                                  r'''$.password''',
                                ).toString(),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: 'Enter your password',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE2E7),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE2E7),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 24, 0, 24),
                                prefixIcon: Icon(
                                  Icons.remove_red_eye_outlined,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => passwordVisibility =
                                        !passwordVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    passwordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Color(0xFF757575),
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF2B343A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: LoginApiCall.call(
                                    username: userIdController.text,
                                    password: passwordController.text,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    final buttonLoginApiResponse =
                                        snapshot.data;
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        currentUserLocationValue =
                                            await getCurrentUserLocation(
                                                defaultLocation:
                                                    LatLng(0.0, 0.0));
                                        var _shouldSetState = false;
                                        returned = await LoginApiCall.call(
                                          username: userIdController.text,
                                          password: passwordController.text,
                                        );
                                        _shouldSetState = true;
                                        if (((returned?.statusCode ?? 200)) ==
                                            200) {
                                          setState(() => FFAppState().userdata =
                                              (returned?.jsonBody ?? ''));
                                          setState(() =>
                                              FFAppState().token = getJsonField(
                                                (returned?.jsonBody ?? ''),
                                                r'''$.accessToken''',
                                              ).toString());
                                          setState(() =>
                                              FFAppState().role = getJsonField(
                                                (returned?.jsonBody ?? ''),
                                                r'''$.userData.role''',
                                              ).toString());
                                          setState(() => FFAppState().statusa =
                                                  getJsonField(
                                                (returned?.jsonBody ?? ''),
                                                r'''$.userData.status''',
                                              ).toString());
                                          setState(
                                              () => FFAppState().trial = 0);
                                          if ((FFAppState().statusa) !=
                                              'suspended') {
                                            if ((FFAppState().statusa) !=
                                                'active') {
                                              setState(() => FFAppState()
                                                  .statusa = 'deactive');
                                            }
                                          }
                                          if ((FFAppState().role) == 'driver') {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MenuWidget(),
                                              ),
                                            );
                                          } else {
                                            if (rowLocsRecord != null) {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TmenuWidget(),
                                                ),
                                              );
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            } else {
                                              if ((FFAppState().visibility) ==
                                                  'on') {
                                                final locsCreateData =
                                                    createLocsRecordData(
                                                  locate:
                                                      currentUserLocationValue,
                                                  id: getJsonField(
                                                    FFAppState().userdata,
                                                    r'''$.userData.username''',
                                                  ).toString(),
                                                );
                                                var locsRecordReference =
                                                    LocsRecord.collection.doc();
                                                await locsRecordReference
                                                    .set(locsCreateData);
                                                insertion = LocsRecord
                                                    .getDocumentFromData(
                                                        locsCreateData,
                                                        locsRecordReference);
                                                _shouldSetState = true;
                                              } else {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        TmenuWidget(),
                                                  ),
                                                );
                                              }

                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TmenuWidget(),
                                                ),
                                              );
                                            }

                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TmenuWidget(),
                                              ),
                                            );
                                          }

                                          if (_shouldSetState) setState(() {});
                                          return;
                                        } else {
                                          setState(() => FFAppState().trial =
                                              FFAppState().trial + 1);
                                          if ((FFAppState().trial) >= 4) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title:
                                                      Text('too many attempts'),
                                                  content: Text(
                                                      'maximum trial reached'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeWidget(),
                                              ),
                                            );
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }

                                        if (_shouldSetState) setState(() {});
                                      },
                                      text: getJsonField(
                                        FFAppState().aaa,
                                        r'''$.login''',
                                      ).toString(),
                                      options: FFButtonOptions(
                                        width: 300,
                                        height: 50,
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
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(250, 15, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuWidget(),
                            ),
                          );
                        },
                        child: Text(
                          getJsonField(
                            FFAppState().aaa,
                            r'''$.forgot''',
                          ).toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF939393),
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                    ),
                    if ((FFAppState().trial) > 0)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          'Inccorect Username or password',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFC42F38),
                                    fontSize: 19,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
            child: Text(
              getJsonField(
                FFAppState().aaa,
                r'''$.activate''',
              ).toString(),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF235D63),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
