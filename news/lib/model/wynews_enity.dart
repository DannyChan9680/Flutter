import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class wynews_enity extends Object {
  @JsonKey(name: 'BBM54PGAwangning')
  List<BBM54PGAwangning> bBM54PGAwangning;

  wynews_enity(this.bBM54PGAwangning,);

  factory wynews_enity.fromJson(Map<String, dynamic> srcJson) => _$wynews_enityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$wynews_enityToJson(this);
  
}


@JsonSerializable()
class BBM54PGAwangning extends Object {

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
 
  BBM54PGAwangning(this.docid,this.source,this.title,this.priority,this.hasImg,this.url,this.skipURL,this.commentCount,this.imgsrc3gtype,this.stitle,this.digest,this.imgsrc,this.ptime,);

  factory BBM54PGAwangning.fromJson(Map<String, dynamic> srcJson) => _$bbm4FromJson(srcJson);

  Map<String, dynamic> toJson() => _$BBM54PGAwangningToJson(this);

}

wynews_enity _$wynews_enityFromJson(Map<String, dynamic> json) {
  return wynews_enity(
    (json['BBM54PGAwangning'] as List)
        ?.map((e) => e == null
            ? null
            : BBM54PGAwangning.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$wynews_enityToJson(wynews_enity instance) =>
    <String, dynamic>{
      'BBM54PGAwangning': instance.bBM54PGAwangning,
    };

BBM54PGAwangning _$bbm4FromJson(Map<String, dynamic> json) {
  return BBM54PGAwangning(
    json['docid'] as String,
    json['source'] as String,
    json['title'] as String,
    json['priority'] as int,
    json['hasImg'] as int,
    json['url'] as String,
    json['skipURL'] as String,
    json['commentCount'] as int,
    json['imgsrc3gtype'] as String,
    json['stitle'] as String,
    json['digest'] as String,
    json['imgsrc'] as String,
    json['ptime'] as String,
  );
}

Map<String, dynamic> _$BBM54PGAwangningToJson(BBM54PGAwangning instance) =>
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