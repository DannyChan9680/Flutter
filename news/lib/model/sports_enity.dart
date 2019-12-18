import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class sports_enity extends Object {
  @JsonKey(name: 'BA8E6OEOwangning')
  List<BA8E6OEOwangning> bA8E6OEOwangning;

  sports_enity(
    this.bA8E6OEOwangning,
  );

  factory sports_enity.fromJson(Map<String, dynamic> srcJson) =>
      _$sports_enityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$sports_enityToJson(this);
}

@JsonSerializable()
class BA8E6OEOwangning extends Object {

  @JsonKey(name: 'imagextra')
  String imagextra;

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

  BA8E6OEOwangning(
    this.imagextra,
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

  factory BA8E6OEOwangning.fromJson(Map<String, dynamic> srcJson) =>
      _$sportsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BA8E6OEOwangningToJson(this);
}

sports_enity _$sports_enityFromJson(Map<String, dynamic> json) {
  return sports_enity(
    (json['BA8E6OEOwangning'] as List)
        ?.map((e) => e == null
            ? null
            : BA8E6OEOwangning.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$sports_enityToJson(sports_enity instance) =>
    <String, dynamic>{
      'BA8F6ICNwangning': instance.bA8E6OEOwangning,
    };

BA8E6OEOwangning _$sportsFromJson(Map<String, dynamic> json) {
  return BA8E6OEOwangning(
    json['imagextra'] as String,
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

Map<String, dynamic> _$BA8E6OEOwangningToJson(BA8E6OEOwangning instance) =>
    <String, dynamic>{
      'iamgextra':instance.imagextra,
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
