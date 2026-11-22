import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'custom_text.dart';

class NewsFeedCard extends StatelessWidget {
  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes = 0,
    this.hasImage = false,
    this.imageAsset,
    this.avatarAsset,
  });

  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final bool hasImage;
  final String? imageAsset;
  final String? avatarAsset;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22.r,
                  backgroundColor: FB_LIGHT_PRIMARY,
                  backgroundImage:
                      avatarAsset == null ? null : AssetImage(avatarAsset!),
                  child: avatarAsset == null
                      ? const Icon(Icons.person, color: FB_PRIMARY)
                      : null,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: userName,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          CustomText(text: date, fontSize: 12, color: Colors.grey),
                          SizedBox(width: 5.w),
                          Icon(Icons.public, size: 14.sp, color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                  tooltip: 'More options',
                ),
              ],
            ),
            SizedBox(height: 10.h),
            CustomText(text: postContent, fontSize: 14),
            if (hasImage) ...[
              SizedBox(height: 10.h),
              _PostImage(assetPath: imageAsset),
            ],
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.thumb_up, color: FB_DARK_PRIMARY, size: 18.sp),
                SizedBox(width: 5.w),
                CustomText(
                  text: '$numOfLikes',
                  fontSize: 12,
                  color: FB_DARK_PRIMARY,
                ),
                const Spacer(),
                const CustomText(text: '0 comments', fontSize: 12, color: Colors.grey),
              ],
            ),
            Divider(height: 18.h),
            Row(
              children: [
                Expanded(child: _PostAction(icon: Icons.thumb_up_outlined, label: 'Like')),
                Expanded(child: _PostAction(icon: Icons.mode_comment_outlined, label: 'Comment')),
                Expanded(child: _PostAction(icon: Icons.share_outlined, label: 'Share')),
              ],
            ),
            Divider(height: 18.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 15.r,
                  backgroundColor: FB_LIGHT_PRIMARY,
                  child: Icon(Icons.person, size: 18.sp, color: FB_PRIMARY),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: const CustomText(
                      text: 'Write a comment...',
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            const CustomText(
              text: 'View comments',
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}

class _PostImage extends StatelessWidget {
  const _PostImage({this.assetPath});

  final String? assetPath;

  @override
  Widget build(BuildContext context) {
    final path = assetPath;
    if (path == null || path.isEmpty) {
      return Container(
        height: 220.h,
        width: double.infinity,
        color: Colors.grey.shade200,
        alignment: Alignment.center,
        child: Icon(Icons.image_outlined, size: 48.sp, color: Colors.grey),
      );
    }

    return Image.asset(
      path,
      width: double.infinity,
      height: 220.h,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        height: 220.h,
        width: double.infinity,
        color: Colors.grey.shade200,
        alignment: Alignment.center,
        child: Icon(Icons.broken_image_outlined, size: 48.sp, color: Colors.grey),
      ),
    );
  }
}

class _PostAction extends StatelessWidget {
  const _PostAction({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18.sp, color: FB_DARK_PRIMARY),
      label: CustomText(text: label, fontSize: 12, color: FB_DARK_PRIMARY),
      style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 2.w)),
    );
  }
}
