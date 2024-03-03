import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:mobile/commons/handle_exception/custom_exception.dart';
import 'package:mobile/commons/widgets/show_snackbar.dart';
import 'package:mobile/constants/app_color.dart';
import 'package:mobile/constants/routes.dart';

class VerificationScreen extends StatefulWidget {
  static const String routeName = RoutePath.verification;
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String _code = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void handleVerifyOTP() async {
    setState(() {
      _isLoading = true;
    });
    try {
      if (mounted) {
        showSnackBar(
          context,
          'Xác thực thành công',
        );
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutePath.auth,
          (route) => false,
        );
      }
    } on CustomException catch (e) {
      if (mounted) {
        showSnackBar(
          context,
          e.cause,
          color: Colors.red,
        );
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(
          context,
          e.toString(),
          color: Colors.red,
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void handleResendOTP() async {
    try {
      if (mounted) {
        showSnackBar(
          context,
          'Đã gửi mã xác thực về số điện thoại',
        );
      }
    } on CustomException catch (e) {
      if (mounted) {
        showSnackBar(
          context,
          e.cause,
          color: Colors.red,
        );
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(
          context,
          e.toString(),
          color: Colors.red,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Nhập mã xác thực',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
                const SizedBox(height: 10),
                const Text(
                  '(Mã xác thực đã được gửi về số điện thoại)',
                ),
                const SizedBox(height: 20),
                VerificationCode(
                  textStyle: const TextStyle(fontSize: 20),
                  length: 6,
                  underlineColor: AppColor.primary,
                  onCompleted: (String value) {
                    setState(() {
                      _code = value;
                    });
                  },
                  onEditing: (bool value) => {},
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : () {
                            handleVerifyOTP();
                          },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Xác nhận'),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Bạn chưa nhận được mã xác thực, vui lòng ấn'),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                      ),
                      child: const Text(
                        'gửi lại',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        handleResendOTP();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
