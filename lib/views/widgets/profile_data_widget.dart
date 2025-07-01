import 'package:flutter/material.dart';
import '../utils/helper.dart';

class ProfileDataWidget extends StatelessWidget {
  const ProfileDataWidget({
    super.key,
    required this.profile,
    required this.dataProfile,
  });

  final String profile;
  final String dataProfile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(profile, style: subtitle1)),
        Expanded(
          flex: 3,
          child: Text(
            dataProfile,
            style: subtitle1.copyWith(fontWeight: semibold),
          ),
        ),
      ],
    );
  }
}
