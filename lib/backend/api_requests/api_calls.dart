import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class LoginApiCall {
  static Future<ApiCallResponse> call({
    String username = '',
    String password = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'loginApi',
      apiUrl: 'etmilestone.com/ts/driver/login',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'username': username,
        'password': password,
      },
      returnBody: true,
    );
  }
}

class IssueticketCall {
  static Future<ApiCallResponse> call({
    String licenseId = '',
    String date = '',
    String time = '',
    String location = '',
    String offenceLevel = '',
    String offenceCode = '',
    String plateNum = '',
    String remark = '',
    String xAccessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'issueticket',
      apiUrl: 'etmilestone.com/ts/officer/issueTicket',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'license_id': licenseId,
        'date': date,
        'time': time,
        'location': location,
        'offence_level': offenceLevel,
        'offence_code': offenceCode,
        'plate_num': plateNum,
        'remark': remark,
        'x_access_token': xAccessToken,
      },
      returnBody: true,
    );
  }
}

class FinddriverCall {
  static Future<ApiCallResponse> call({
    String licenseId = '',
    String xAccessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'finddriver',
      apiUrl: 'etmilestone.com/ts/officer/findDriver',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'license_id': licenseId,
        'x_access_token': xAccessToken,
      },
      returnBody: true,
    );
  }
}

class GetrecordsCall {
  static Future<ApiCallResponse> call({
    String xAccessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getrecords',
      apiUrl: 'http://etmilestone.com/ts/driver/getrecord',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'x_access_token': xAccessToken,
      },
      returnBody: true,
    );
  }
}
