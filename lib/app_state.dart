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
