import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'locs_record.g.dart';

abstract class LocsRecord implements Built<LocsRecord, LocsRecordBuilder> {
  static Serializer<LocsRecord> get serializer => _$locsRecordSerializer;

  @nullable
  LatLng get locate;

  @nullable
  String get id;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(LocsRecordBuilder builder) => builder..id = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('locs');

  static Stream<LocsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<LocsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  LocsRecord._();
  factory LocsRecord([void Function(LocsRecordBuilder) updates]) = _$LocsRecord;

  static LocsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createLocsRecordData({
  LatLng locate,
  String id,
}) =>
    serializers.toFirestore(
        LocsRecord.serializer,
        LocsRecord((l) => l
          ..locate = locate
          ..id = id));
