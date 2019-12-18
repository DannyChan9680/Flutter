import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class fashion_enity extends Object {
  @JsonKey(name: 'BA8F6ICNwangning')
  List<BA8F6ICNwangning> bA8F6ICNwangning;

  fashion_enity(
    this.bA8F6ICNwangning,
  );

  factory fashion_enity.fromJson(Map<String, dynamic> srcJson) =>
      _$fashion_enityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$fashion_enityToJson(this);
}

@JsonSerializable()
class BA8F6ICNwangning extends Object {
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

  BA8F6ICNwangning(
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

  factory BA8F6ICNwangning.fromJson(Map<String, dynamic> srcJson) =>
      _$fashionFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BAI67OGGwangningToJson(this);
}

fashion_enity _$fashion_enityFromJson(Map<String, dynamic> json) {
  return fashion_enity(
    (json['BA8F6ICNwangning'] as List)
        ?.map((e) => e == null
            ? null
            : BA8F6ICNwangning.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$fashion_enityToJson(fashion_enity instance) =>
    <String, dynamic>{
      'BA8F6ICNwangning': instance.bA8F6ICNwangning,
    };

BA8F6ICNwangning _$fashionFromJson(Map<String, dynamic> json) {
  return BA8F6ICNwangning(
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

Map<String, dynamic> _$BAI67OGGwangningToJson(BA8F6ICNwangning instance) =>
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
