import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class military_enity extends Object {
  @JsonKey(name: 'BBM54PGAwangning')
  List<BAI67OGGwangning> bAI67OGGwangning;

  military_enity(
    this.bAI67OGGwangning,
  );

  factory military_enity.fromJson(Map<String, dynamic> srcJson) =>
      _$military_enityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$military_enityToJson(this);
}

@JsonSerializable()
class BAI67OGGwangning extends Object {
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

  BAI67OGGwangning(
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

  factory BAI67OGGwangning.fromJson(Map<String, dynamic> srcJson) =>
      _$militaryFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BAI67OGGwangningToJson(this);
}

military_enity _$military_enityFromJson(Map<String, dynamic> json) {
  return military_enity(
    (json['BAI67OGGwangning'] as List)
        ?.map((e) => e == null
            ? null
            : BAI67OGGwangning.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$military_enityToJson(military_enity instance) =>
    <String, dynamic>{
      'BAI67OGGwangning': instance.bAI67OGGwangning,
    };

BAI67OGGwangning _$militaryFromJson(Map<String, dynamic> json) {
  return BAI67OGGwangning(
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

Map<String, dynamic> _$BAI67OGGwangningToJson(BAI67OGGwangning instance) =>
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
