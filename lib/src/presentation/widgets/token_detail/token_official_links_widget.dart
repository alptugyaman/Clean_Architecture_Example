import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tokens/src/core/utils/launch_url.dart';
import 'package:tokens/src/domain/entities/token_details/token_detail.dart';

class TokenOfficialLinks extends StatelessWidget {
  const TokenOfficialLinks({
    Key? key,
    required this.tokenDetail,
  }) : super(key: key);

  final TokenDetail tokenDetail;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        IconLinks(
          url: tokenDetail.urls!.website,
          icon: Icon(
            LineIcons.link,
            color: Colors.grey.shade300,
          ),
        ),
        IconLinks(
          url: tokenDetail.urls!.twitter,
          icon: const Icon(
            LineIcons.twitter,
            color: Color(0xFF1DA1F2),
          ),
        ),
        IconLinks(
          url: tokenDetail.urls!.messageBoard,
          icon: Icon(
            LineIcons.medium,
            color: Colors.grey.shade300,
          ),
        ),
        IconLinks(
          url: tokenDetail.urls!.chat,
          icon: const Icon(
            LineIcons.gitter,
            color: Color(0xFFED1965),
          ),
        ),
        IconLinks(
          url: tokenDetail.urls!.facebook,
          icon: const Icon(
            LineIcons.facebookSquare,
            color: Color(0xFF3b5998),
          ),
        ),
        IconLinks(
          url: tokenDetail.urls!.reddit,
          icon: const Icon(
            LineIcons.redditAlien,
            color: Color(0xFFFF5700),
          ),
        ),
        IconLinks(
          url: tokenDetail.urls!.explorer,
          icon: Icon(
            LineIcons.binoculars,
            color: Colors.green.shade400,
          ),
        ),
        IconLinks(
          url: tokenDetail.urls!.technicalDoc,
          icon: const Icon(
            LineIcons.github,
            color: Colors.white,
          ),
        ),
        IconLinks(
          url: tokenDetail.urls!.sourceCode,
          icon: const Icon(
            LineIcons.code,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

class IconLinks extends StatelessWidget {
  const IconLinks({
    Key? key,
    required this.url,
    required this.icon,
  }) : super(key: key);

  final List<String>? url;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    if (url!.isNotEmpty) {
      return IconButton(
        onPressed: () => launchURL(url!.first),
        icon: icon,
      );
    }
    return const SizedBox();
  }
}
