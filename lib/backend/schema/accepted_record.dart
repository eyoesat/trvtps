import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'accepted_record.g.dart';

abstract class AcceptedRecord
    implements Built<AcceptedRecord, AcceptedRecordBuilder> {
  static Serializer<AcceptedRecord> get serializer =>
      _$acceptedRecordSerializer;

  @nullable
  String get id;

  @nullable
  LatLng get location;

  @nullable
  String get idDriver;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AcceptedRecordBuilder builder) => builder
    ..id = ''
    ..idDriver = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('accepted');

  static Stream<AcceptedRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AcceptedRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AcceptedRecord._();
  factory AcceptedRecord([void Function(AcceptedRecordBuilder) updates]) =
      _$AcceptedRecord;

  static AcceptedRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAcceptedRecordData({
  String id,
  LatLng location,
  String idDriver,
}) =>
    serializers.toFirestore(
        AcceptedRecord.serializer,
        AcceptedRecord((a) => a
          ..id = id
          ..location = location
          ..idDriver = idDriver));
