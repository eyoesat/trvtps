import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'callnearby_record.g.dart';

abstract class CallnearbyRecord
    implements Built<CallnearbyRecord, CallnearbyRecordBuilder> {
  static Serializer<CallnearbyRecord> get serializer =>
      _$callnearbyRecordSerializer;

  @nullable
  LatLng get currentLocation;

  @nullable
  String get licenseId;

  @nullable
  String get calling;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CallnearbyRecordBuilder builder) => builder
    ..licenseId = ''
    ..calling = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('callnearby');

  static Stream<CallnearbyRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CallnearbyRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CallnearbyRecord._();
  factory CallnearbyRecord([void Function(CallnearbyRecordBuilder) updates]) =
      _$CallnearbyRecord;

  static CallnearbyRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCallnearbyRecordData({
  LatLng currentLocation,
  String licenseId,
  String calling,
}) =>
    serializers.toFirestore(
        CallnearbyRecord.serializer,
        CallnearbyRecord((c) => c
          ..currentLocation = currentLocation
          ..licenseId = licenseId
          ..calling = calling));
