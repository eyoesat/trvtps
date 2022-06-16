import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'announcement_record.g.dart';

abstract class AnnouncementRecord
    implements Built<AnnouncementRecord, AnnouncementRecordBuilder> {
  static Serializer<AnnouncementRecord> get serializer =>
      _$announcementRecordSerializer;

  @nullable
  String get news;

  @nullable
  DateTime get time;

  @nullable
  String get title;

  @nullable
  BuiltList<String> get seen;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AnnouncementRecordBuilder builder) => builder
    ..news = ''
    ..title = ''
    ..seen = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('announcement');

  static Stream<AnnouncementRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AnnouncementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  AnnouncementRecord._();
  factory AnnouncementRecord(
          [void Function(AnnouncementRecordBuilder) updates]) =
      _$AnnouncementRecord;

  static AnnouncementRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAnnouncementRecordData({
  String news,
  DateTime time,
  String title,
}) =>
    serializers.toFirestore(
        AnnouncementRecord.serializer,
        AnnouncementRecord((a) => a
          ..news = news
          ..time = time
          ..title = title
          ..seen = null));
