import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tokens/src/domain/entities/token_details/urls.dart';

part 'urls_model.g.dart';

@JsonSerializable()
class UrlsModel extends Equatable {
  final List<String>? website;
  final List<String>? twitter;
  @JsonKey(name: 'message_board')
  final List<String>? messageBoard;
  final List<String>? chat;
  final List<String>? facebook;
  final List<String>? explorer;
  final List<String>? reddit;
  @JsonKey(name: 'technical_doc')
  final List<String>? technicalDoc;
  @JsonKey(name: 'source_code')
  final List<String>? sourceCode;
  final List<String>? announcement;

  const UrlsModel({
    this.website,
    this.twitter,
    this.messageBoard,
    this.chat,
    this.facebook,
    this.explorer,
    this.reddit,
    this.technicalDoc,
    this.sourceCode,
    this.announcement,
  });

  factory UrlsModel.fromJson(Map<String, dynamic> json) =>
      _$UrlsModelFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      website,
      twitter,
      messageBoard,
      chat,
      facebook,
      explorer,
      reddit,
      technicalDoc,
      sourceCode,
      announcement,
    ];
  }

  Urls toEntity() => Urls(
        website: website,
        twitter: twitter,
        messageBoard: messageBoard,
        chat: chat,
        facebook: facebook,
        explorer: explorer,
        reddit: reddit,
        technicalDoc: technicalDoc,
        sourceCode: sourceCode,
        announcement: announcement,
      );
}
