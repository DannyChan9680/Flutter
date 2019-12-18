import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class education_enity extends Object {
  @JsonKey(name: 'BA8FF5PRwangning')
  List<BA8FF5PRwangning> bA8FF5PRwangning;

  education_enity(
    this.bA8FF5PRwangning,
  );

  factory education_enity.fromJson(Map<String, dynamic> srcJson) =>
      _$education_enityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$education_enityToJson(this);
}

@JsonSerializable()
class BA8FF5PRwangning extends Object {
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

  BA8FF5PRwangning(
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

  factory BA8FF5PRwangning.fromJson(Map<String, dynamic> srcJson) =>
      _$educationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BA8FF5PRwangningToJson(this);
}

education_enity _$education_enityFromJson(Map<String, dynamic> json) {
  return education_enity(
    (json['BA8FF5PRwangning'] as List)
        ?.map((e) => e == null
            ? null
            : BA8FF5PRwangning.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$education_enityToJson(education_enity instance) =>
    <String, dynamic>{
      'BA8FF5PRwangning': instance.bA8FF5PRwangning,
    };

BA8FF5PRwangning _$educationFromJson(Map<String, dynamic> json) {
  return BA8FF5PRwangning(
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

Map<String, dynamic> _$BA8FF5PRwangningToJson(BA8FF5PRwangning instance) =>
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
