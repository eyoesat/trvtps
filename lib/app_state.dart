import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('ff_token') ?? _token;
    if (prefs.containsKey('ff_userdata')) {
      try {
        _userdata = jsonDecode(prefs.getString('ff_userdata'));
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    _role = prefs.getString('ff_role') ?? _role;
    _statusa = prefs.getString('ff_statusa') ?? _statusa;
    if (prefs.containsKey('ff_aaa')) {
      try {
        _aaa = jsonDecode(prefs.getString('ff_aaa'));
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    _visibility = prefs.getString('ff_visibility') ?? _visibility;
    _going = prefs.getString('ff_going') ?? _going;
    if (prefs.containsKey('ff_amharic')) {
      try {
        _amharic = jsonDecode(prefs.getString('ff_amharic'));
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    if (prefs.containsKey('ff_english')) {
      try {
        _english = jsonDecode(prefs.getString('ff_english'));
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    if (prefs.containsKey('ff_oromifa')) {
      try {
        _oromifa = jsonDecode(prefs.getString('ff_oromifa'));
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }
  }

  SharedPreferences prefs;

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
    prefs.setString('ff_token', _value);
  }

  dynamic _userdata;
  dynamic get userdata => _userdata;
  set userdata(dynamic _value) {
    _userdata = _value;
    prefs.setString('ff_userdata', jsonEncode(_value));
  }

  String _role = '';
  String get role => _role;
  set role(String _value) {
    _role = _value;
    prefs.setString('ff_role', _value);
  }

  dynamic ticketdata;

  String _statusa = '';
  String get statusa => _statusa;
  set statusa(String _value) {
    _statusa = _value;
    prefs.setString('ff_statusa', _value);
  }

  String tmpSearch = '';

  dynamic _aaa = jsonDecode(
      '{\"welcome\":\"Welcome\",\"login\":\"Log in\",\"signup\":\"signup\",\"or\":\"OR\",\"congestion\":\"Congestion Status\",\"page\":\"Login page\",\"userid\":\"User ID\",\"password\":\"Password\",\"forgot\":\"Forgot Password\",\"activate\":\"Activate Your Account\",\"license\":\"License\"}');
  dynamic get aaa => _aaa;
  set aaa(dynamic _value) {
    _aaa = _value;
    prefs.setString('ff_aaa', jsonEncode(_value));
  }

  String tmpurl = '';

  String called = '';

  String _visibility = 'on';
  String get visibility => _visibility;
  set visibility(String _value) {
    _visibility = _value;
    prefs.setString('ff_visibility', _value);
  }

  String _going = '';
  String get going => _going;
  set going(String _value) {
    _going = _value;
    prefs.setString('ff_going', _value);
  }

  dynamic _amharic = jsonDecode('{\"license\":\"የመንጃ ፈቃድ\"}');
  dynamic get amharic => _amharic;
  set amharic(dynamic _value) {
    _amharic = _value;
    prefs.setString('ff_amharic', jsonEncode(_value));
  }

  dynamic _english = jsonDecode(
      '{\"welcome\":\"Welcome\",\"login\":\"Log in\",\"signup\":\"signup\",\"or\":\"OR\",\"congestion\":\"Congestion Status\",\"page\":\"Login page\",\"userid\":\"User ID\",\"password\":\"Password\",\"forgot\":\"Forgot Password\",\"activate\":\"Activate Your Account\",\"license\":\"License\"}');
  dynamic get english => _english;
  set english(dynamic _value) {
    _english = _value;
    prefs.setString('ff_english', jsonEncode(_value));
  }

  dynamic _oromifa = jsonDecode('{\"license\":\"fek’adi\"}');
  dynamic get oromifa => _oromifa;
  set oromifa(dynamic _value) {
    _oromifa = _value;
    prefs.setString('ff_oromifa', jsonEncode(_value));
  }

  int trial = 0;
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
