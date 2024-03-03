import 'package:flutter/material.dart';
import 'package:mobile/constants/routes.dart';
import 'package:mobile/utils/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = RoutePath.profile;
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    void logout() async {
      await SharedPreferencesUtils.clearStorage();
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutePath.auth,
          (route) => false,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin cá nhân'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  'Le Huu Hieu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text(
                    'Chỉnh sửa thông tin',
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  // onTap: () => {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const Text('Edit profile'),
                  //     ),
                  //   ),
                  // },
                ),
                const ListTile(
                  leading: Icon(Icons.password),
                  title: Text(
                    'Thay đổi mật khẩu',
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const ChangePasswordScreen(),
                  //   ),
                  // ),
                ),
                const Divider(),
                Center(
                  child: ElevatedButton(
                    onPressed: () => logout(),
                    child: const Text('Đăng xuất'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
