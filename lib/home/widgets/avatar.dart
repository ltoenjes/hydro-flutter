import 'package:flutter/material.dart';

const _avatarSize = 48.0;

class Avatar extends StatelessWidget {
  final double? radius;

  const Avatar({Key? key, this.photo, this.radius}) : super(key: key);

  final String? photo;

  @override
  Widget build(BuildContext context) {
    final photo = this.photo;
    return CircleAvatar(
      radius: radius ?? _avatarSize,
      backgroundImage: photo != null ? NetworkImage(photo) : null,
      child: photo == null
          ? const Icon(Icons.person_outline, size: _avatarSize)
          : null,
    );
  }
}
