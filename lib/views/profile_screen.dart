import 'dart:developer';
import 'dart:io' show exit;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'utils/helper.dart';
import 'widgets/profile_data_widget.dart';
import 'widgets/profile_menu_tile.dart';
import 'package:go_router/go_router.dart'; // pastikan kamu pakai go_router

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Yakin ingin keluar dari aplikasi?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () async {
              log('Confirmed logout');
              Navigator.of(context, rootNavigator: true).pop(); // Tutup dialog

              if (kIsWeb) {
                // 👉 Di Web: redirect ke login
                context.go('/login'); // pastikan rute ini ada di GoRouter
              } else {
                // 👉 Di Android/iOS
                try {
                  await SystemNavigator.pop();
                } catch (e) {
                  log('SystemNavigator.pop gagal: $e');
                }
                exit(0); // fallback
              }
            },
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/Meliuk-liuk.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: IconButton(
                    onPressed: () {
                      log('Logout button (top right) tapped');
                      _showLogoutDialog(context);
                    },
                    icon: const Icon(Icons.logout_rounded, color: Colors.white),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      'Data Diri',
                      style: headline4.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: REdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    vsTiny,
                    Text(
                      'Profil',
                      style: headline3.copyWith(color: cPrimary, fontWeight: bold),
                    ),
                    vsTiny,
                    Container(
                      padding: REdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: cWhite,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              log('image onTap');
                            },
                            child: Center(
                              child: CircleAvatar(
                                backgroundColor: cGrey,
                                radius: 70.r,
                                backgroundImage: const AssetImage(
                                  'assets/images/news logo.png',
                                ),
                              ),
                            ),
                          ),
                          vsSmall,
                          ProfileDataWidget(
                            profile: 'Name',
                            dataProfile: ': Kelompok 4',
                          ),
                          vsTiny,
                          ProfileDataWidget(
                            profile: 'Email',
                            dataProfile: ': babang@gmail.com',
                          ),
                          vsTiny,
                          ProfileDataWidget(
                            profile: 'Number',
                            dataProfile: ': 0821555408',
                          ),
                          vsTiny,
                          ProfileDataWidget(
                            profile: 'Address',
                            dataProfile:
                                ': alan Melati No. 123, Kelurahan Harapan Baru, Kecamatan Sukajaya, Kota Sentosa, Jawa Barat 40231',
                          ),
                        ],
                      ),
                    ),
                    vsLarge,
                    ProfileMenuTile(
                      title: 'Edit Profile',
                      onTap: () {
                        log('Edit Profile onTap');
                      },
                      leading: const Icon(Icons.border_color_outlined, color: cBlack),
                      trailing: const Icon(Icons.keyboard_arrow_right_rounded, color: cBlack),
                    ),
                    const Divider(color: cBlack, height: 4.0),
                    ProfileMenuTile(
                      title: 'Edit Password',
                      onTap: () {
                        log('Edit Password onTap');
                      },
                      leading: const Icon(Icons.password, color: cBlack),
                      trailing: const Icon(Icons.keyboard_arrow_right_rounded, color: cBlack),
                    ),
                    const Divider(color: cBlack, height: 4.0),
                    ProfileMenuTile(
                      title: 'Logout',
                      onTap: () {
                        log('Logout onTap (from bottom list)');
                        _showLogoutDialog(context);
                      },
                      leading: const Icon(Icons.logout_rounded, color: cBlack),
                      trailing: const Icon(Icons.keyboard_arrow_right_rounded, color: cBlack),
                    ),
                    vsLarge,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
