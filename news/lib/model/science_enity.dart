import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class science_enity extends Object {
  @JsonKey(name: 'BA8D4A3Rwangning')
  List<BA8D4A3Rwangning> bA8D4A3Rwangning;

  science_enity(
    this.bA8D4A3Rwangning,
  );

  factory science_enity.fromJson(Map<String, dynamic> srcJson) =>
      _$science_enityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$science_enityToJson(this);
}

@JsonSerializable()
class BA8D4A3Rwangning extends Object {
  @JsonKey(name: 'docid')
  String docid;

  @JsonKey(name: 'source')
  String source;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'priority')
  int priority;

  @JsonKey(name: 'hasImg')
  int hasImg;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'skipURL')
  String skipURL;

  @JsonKey(name: 'commentCount')
  int commentCount;

  @JsonKey(name: 'imgsrc3gtype')
  String imgsrc3gtype;

  @JsonKey(name: 'stitle')
  String stitle;

  @JsonKey(name: 'digest')
  String digest;

  @JsonKey(name: 'imgsrc')
  String imgsrc;

  @JsonKey(name: 'ptime')
  String ptime;

  BA8D4A3Rwangning(
    this.docid,
    this.source,
    this.title,
    this.priority,
    this.hasImg,
    this.url,
    this.skipURL,
    this.commentCount,
    this.imgsrc3gtype,
    this.stitle,
    this.digest,
    this.imgsrc,
    this.ptime,
  );

  factory BA8D4A3Rwangning.fromJson(Map<String, dynamic> srcJson) =>
      _$scienceFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BA8D4A3RwangningToJson(this);
}

science_enity _$science_enityFromJson(Map<String, dynamic> json) {
  return science_enity(
    (json['BA8D4A3Rwangning'] as List)
        ?.map((e) => e == null
            ? null
            : BA8D4A3Rwangning.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$science_enityToJson(science_enity instance) =>
    <String, dynamic>{
      'BA8D4A3Rwangning': instance.bA8D4A3Rwangning,
    };

BA8D4A3Rwangning _$scienceFromJson(Map<String, dynamic> json) {
  return BA8D4A3Rwangning(
    json['docid'] as String,
    json['source'] as String,
    json['title'] as String,
    json['priority'] as int,
    json['hasImg'] as int,
    json['url'] as String,
    json['skipURL']as String,
    json['commentCount'] as int,
    json['imgsrc3gtype'] as String,
    json['stitle'] as String,
    json['digest'] as String,
    json['imgsrc'] as String,
    json['ptime'] as String,
  );
}

Map<String, dynamic> _$BA8D4A3RwangningToJson(BA8D4A3Rwangning instance) =>
    <String, dynamic>{
      'docid': instance.docid,
      'source': instance.source,
      'title': instance.title,
      'priority': instance.priority,
      'hasImg': instance.hasImg,
      'url': instance.url,
      'skipURL':instance.skipURL,
      'commentCount': instance.commentCount,
      'imgsrc3gtype': instance.imgsrc3gtype,
      'stitle': instance.stitle,
      'digest': instance.digest,
      'imgsrc': instance.imgsrc,
      'ptime': instance.ptime,
    };
