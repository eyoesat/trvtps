import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OffenceCodeWidget extends StatefulWidget {
  const OffenceCodeWidget({Key key}) : super(key: key);

  @override
  _OffenceCodeWidgetState createState() => _OffenceCodeWidgetState();
}

class _OffenceCodeWidgetState extends State<OffenceCodeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Color(0xFFF9F7F6),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      height: 1,
                      decoration: BoxDecoration(
                        color: Color(0xFF3CD239),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'violation grade',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF235D63),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 220, 20),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button-2ndPage pressed ...');
                        },
                        text: '2nd stage',
                        options: FFButtonOptions(
                          width: 130,
                          height: 35,
                          color: Color(0xFF4C8A72),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          elevation: 2,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 8,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'This Regulation is issued by the Council of Ministers\npursuant to Article 5 of the Definition of Powers and\nDuties of the Executive Organs of the Federal Democratic\nRepublic of Ethiopia Proclamation No.916/2015 and\nArticle 28 of the Transport Proclamation No.468/2005.',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                              child: Text(
                                'The Road Transport Traffic Control Council of\nMinisters Regulation No.208/2011 is hereby amended\nas follows:\n1/ sub-article (12) of Article 2 of the Regulation is\ndeleted and replaced by the following new subarticle (12) and other new sub-articles (13) and \n\nThe Road Transport Traffic Control Council of\nMinisters Regulation No.208/2011 is hereby amended\nas follows:\n1/ sub-article (12) of Article 2 of the Regulation is\ndeleted and replaced by the following new subarticle (12) and other new sub-articles (13) and \nThe Road Transport Traffic Control Council of\nMinisters Regulation No.208/2011 is hereby amended\nas follows:\n\n',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.getFont(
                                  'Lexend Deca',
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
