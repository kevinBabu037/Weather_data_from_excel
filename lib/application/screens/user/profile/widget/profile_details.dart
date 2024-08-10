import 'package:flutter/material.dart';
import 'package:newtok/application/utils/colors.dart';
import 'package:newtok/data/model/profile_model.dart';

class ProfileDetailWidget extends StatelessWidget {
  const ProfileDetailWidget({
    super.key, required this.profile,
  });
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Text(
                profile.name, 
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                profile.email, 
                style: const TextStyle(
                  fontSize: 16,
                  color: kClrGrey,
                ),
              ),
            ],
          );
  }
}
