/* // ignore_for_file: deprecated_member_use
import 'package:bucc_app/utils/extentions/app_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constants/app_constants.dart';

ImageProvider makeNetworkImage(String? link) {
  return link == null || !link.validateLink()
      ? const CachedNetworkImageProvider(defaultNetworkImage)
      : CachedNetworkImageProvider(link);
}

Future<void> openUrl(String? url) async {
  if (url != null && url.validateLink()) {
    // final canOpen = await canLaunch(url);
    // if (canOpen) await launch(url);
  }
}

bool nullListChecker(List? list) {
  if (list == null) {
    return true;
  } else {
    return false;
  }
}

Future<bool> launcher(String url) {
  var _launcher = launch(url);
  return _launcher;
}

Future<bool> canLaunchUrl(String url) async {
  var canBeLaunched = await canLaunch(url);
  return canBeLaunched;
}
 */