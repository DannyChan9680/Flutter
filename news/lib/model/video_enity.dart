import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class video_enity extends Object {
  @JsonKey(name: 'videoList')
  List<VideoList> videolist;

  video_enity(this.videolist,);

  factory video_enity.fromJson(Map<String, dynamic> srcJson) =>_$video_enityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$video_enityToJson(this);
}

@JsonSerializable()
class VideoList extends Object {
  @JsonKey(name: 'sizeHD')
  int sizeHD;

  @JsonKey(name: 'mp4Hd_url')
  String mp4Hdurl;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'mp4_url')
  String mp4url;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'vid')
  String vid;

  @JsonKey(name: 'sizeSHD')
  int sizeSHD;

  @JsonKey(name: 'playersize')
  int playersize;

  @JsonKey(name: 'ptime')
  String ptime;

  @JsonKey(name: 'm3u8_url')
  String m3u8url;

  @JsonKey(name: 'topicImg')
  String topicImg;

  @JsonKey(name: 'votecount')
  int votecount;

  @JsonKey(name: 'length')
  int length;

  @JsonKey(name: 'videosource')
  String videosource;

  @JsonKey(name: 'm3u8Hd_url')
  String m3u8Hdurl;

  @JsonKey(name: 'sizeSD')
  int sizeSD;

  @JsonKey(name: 'topicSid')
  String topicSid;

  @JsonKey(name: 'playCount')
  int playCount;

  @JsonKey(name: 'replyCount')
  int replyCount;

  @JsonKey(name: 'replyBoard')
  String replyBoard;

  @JsonKey(name: 'replyid')
  String replyid;

  @JsonKey(name: 'topicName')
  String topicName;

  @JsonKey(name: 'sectiontitle')
  String sectiontitle;

  @JsonKey(name: 'topicDesc')
  String topicDesc;

  VideoList(
      this.sizeHD,
      this.mp4Hdurl,
      this.description,
      this.title,
      this.mp4url,
      this.cover,
      this.vid,
      this.sizeSHD,
      this.playersize,
      this.ptime,
      this.m3u8url,
      this.topicImg,
      this.votecount,
      this.length,
      this.videosource,
      this.m3u8Hdurl,
      this.sizeSD,
      this.topicSid,
      this.playCount,
      this.replyCount,
      this.replyBoard,
      this.replyid,
      this.topicName,
      this.sectiontitle,
      this.topicDesc,
  );

  factory VideoList.fromJson(Map<String, dynamic> srcJson) => _$videoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoRecomToJson(this);
}

video_enity _$video_enityFromJson(Map<String, dynamic> json) {
  return video_enity(
    (json['videoList'] as List)
        ?.map((e) => e == null
            ? null
            : VideoList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$video_enityToJson(video_enity instance) =>
    <String, dynamic>{
      'videoList': instance.videolist,
    };

VideoList _$videoFromJson(Map<String, dynamic> json) {
  return VideoList(
    json['sizeHD'] as int,
    json['mp4Hd_url'] as String,                                        
    json['description'] as String,
    json['title'] as String,
    json['mp4_url'] as String, 
    json['cover'] as String,
    json['vid'] as String,
    json['sizeSHD'] as int,
    json['playersize'] as int,
    json['ptime'] as String,
    json['m3u8_url'] as String,
    json['topicImg'] as String,
    json['votecount'] as int,
    json['length'] as int,
    json['videosource'] as String,
    json['m3u8Hd_url'] as String,
    json['sizeSD'] as int,
    json['topicSid'] as String,
    json['playCount'] as int,
    json['replyCount'] as int,
    json['replyBoard'] as String,
    json['replyid'] as String,
    json['topicName'] as String,
    json['sectiontitle'] as String,
    json['topicDesc']as String,
  );
}

Map<String, dynamic> _$VideoRecomToJson(VideoList instance) =>
    <String, dynamic>{
      'sizeHD':instance.sizeHD,
      'mp4Hd_url':instance.mp4Hdurl,
      'description':instance.description,
      'title':instance.title,
      'mp4_url':instance.mp4url,
      'cover':instance.cover,
      'vid':instance.vid,
      'sizeSHD':instance.sizeSHD,
      'playersize':instance.playersize,
      'ptime':instance.ptime,
      'm3u8_url':instance.m3u8url,
      'topicImg':instance.topicImg,
      'votecount':instance.votecount,
      'length':instance.length,
      'videosource':instance.videosource,
      'm3u8Hd_url':instance.m3u8Hdurl,
      'sizeSD':instance.sizeSD,
      'topicSid':instance.topicSid,
      'playCount':instance.playCount,
      'replyCount':instance.replyCount,
      'replyBoard':instance.replyBoard,
      'replyid':instance.replyid,
      'topicName':instance.topicName,
      'sectiontitle':instance.sectiontitle,
      'topicDesc':instance.topicDesc,
    };

