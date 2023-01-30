import 'package:bucc_app/theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  final String imageURL;
  final BoxFit boxFit;
  final double? largerRadius;
  final double? smallerRadius;
  final double? iconSize;

  const ProfileImage({
    Key? key,
    required this.imageURL,
    required this.boxFit,
    this.largerRadius,
    this.smallerRadius,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
      borderRadius: BorderRadius.circular(24.0.r),
      child: imageURL.isEmpty
          ?
          //! IMAGE URL HAS NO CONTENT
          CircleAvatar(
              radius: largerRadius ?? 15.w,
              child: CircleAvatar(
                  radius: smallerRadius ?? 13.4.w,
                  backgroundColor: AppThemeColours.primaryColour,
                  child: Icon(Icons.person_outline, size: iconSize ?? 18.0.sp)))
          :

          //! DISPLAY AWAY !
          SizedBox.square(
              dimension: largerRadius != null ? largerRadius! * 2 : 30.w,
              child: CachedNetworkImage(
                  imageUrl: imageURL,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          backgroundColor: AppThemeColours.primaryColour,
                          color: AppThemeColours.primaryColourWitOpacity,
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: boxFit)));
}
