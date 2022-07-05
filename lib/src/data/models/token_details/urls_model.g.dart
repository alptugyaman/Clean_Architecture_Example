// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'urls_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrlsModel _$UrlsModelFromJson(Map<String, dynamic> json) => UrlsModel(
      website:
          (json['website'] as List<dynamic>?)?.map((e) => e as String).toList(),
      twitter:
          (json['twitter'] as List<dynamic>?)?.map((e) => e as String).toList(),
      messageBoard: (json['message_board'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      chat: (json['chat'] as List<dynamic>?)?.map((e) => e as String).toList(),
      facebook: (json['facebook'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      explorer: (json['explorer'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      reddit:
          (json['reddit'] as List<dynamic>?)?.map((e) => e as String).toList(),
      technicalDoc: (json['technical_doc'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      sourceCode: (json['source_code'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      announcement: (json['announcement'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UrlsModelToJson(UrlsModel instance) => <String, dynamic>{
      'website': instance.website,
      'twitter': instance.twitter,
      'message_board': instance.messageBoard,
      'chat': instance.chat,
      'facebook': instance.facebook,
      'explorer': instance.explorer,
      'reddit': instance.reddit,
      'technical_doc': instance.technicalDoc,
      'source_code': instance.sourceCode,
      'announcement': instance.announcement,
    };
