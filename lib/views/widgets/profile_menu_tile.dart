import 'package:flutter/material.dart';
import '../utils/helper.dart';

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    super.key,
    required this.title,
    this.onTap,
    this.leading,
    this.trailing,
  });

  final String title;
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leading,
      title: Text(title, style: subtitle1.copyWith(fontWeight: semibold)),
      trailing: trailing,
    );
  }
}
