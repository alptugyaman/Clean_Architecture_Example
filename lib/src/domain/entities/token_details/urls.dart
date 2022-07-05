import 'package:equatable/equatable.dart';

class Urls extends Equatable {
  final List<String>? website;
  final List<String>? twitter;
  final List<String>? messageBoard;
  final List<String>? chat;
  final List<String>? facebook;
  final List<String>? explorer;
  final List<String>? reddit;
  final List<String>? technicalDoc;
  final List<String>? sourceCode;
  final List<String>? announcement;

  const Urls({
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
}
