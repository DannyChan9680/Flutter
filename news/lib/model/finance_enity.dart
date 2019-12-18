import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class finance_enity extends Object {
  @JsonKey(name: 'BA8EE5GMwangning')
  List<BA8EE5GMwangning> bA8EE5GMwangning;

  finance_enity(
    this.bA8EE5GMwangning,
  );

  factory finance_enity.fromJson(Map<String, dynamic> srcJson) =>
      _$finance_enityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$finance_enityToJson(this);
}

@JsonSerializable()
class BA8EE5GMwangning extends Object {
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

  BA8EE5GMwangning(
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

  factory BA8EE5GMwangning.fromJson(Map<String, dynamic> srcJson) =>
      _$financeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BA8EE5GMwangningToJson(this);
}

finance_enity _$finance_enityFromJson(Map<String, dynamic> json) {
  return finance_enity(
    (json['BA8EE5GMwangning'] as List)
        ?.map((e) => e == null
            ? null
            : BA8EE5GMwangning.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$finance_enityToJson(finance_enity instance) =>
    <String, dynamic>{
      'BA8EE5GMwangning': instance.bA8EE5GMwangning,
    };

BA8EE5GMwangning _$financeFromJson(Map<String, dynamic> json) {
  return BA8EE5GMwangning(
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

Map<String, dynamic> _$BA8EE5GMwangningToJson(BA8EE5GMwangning instance) =>
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
