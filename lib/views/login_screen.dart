import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newshive/views/widgets/custom_form_field.dart';
import 'package:newshive/views/utils/form_validator.dart';
import 'package:newshive/views/widgets/primary_button.dart';
import 'package:newshive/views/widgets/rich_text_widget.dart';
import '../routes/route_names.dart';
import 'utils/helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichTextWidget(
                  textOne: 'Welcome',
                  textStyleOne: headline1.copyWith(fontWeight: semibold),
                  cTextOne: cBlack,
                  textTwo: '\nFrend',
                  textStyleTwo: headline1.copyWith(fontWeight: semibold),
                  cTextTwo: cPrimary,
                ),
                vsSmall,
                Text(
                  'ini bukan tentang hari esok, ini tentang hari ini',
                  style: subtitle1,
                ),
                vsXLarge,
                RichTextWidget(
                  textOne: '* ',
                  textStyleOne: subtitle2.copyWith(color: cError),
                  textTwo: 'Email',
                  textStyleTwo: subtitle2.copyWith(color: cBlack),
                ),
                vsSuperTiny,
                CustomFormField(
                  controller: emailController,
                  hintText: 'Email',
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: validateEmail,
                ),
                vsSmall,
                RichTextWidget(
                  textOne: '* ',
                  textStyleOne: subtitle2.copyWith(color: cError),
                  textTwo: 'Password',
                  textStyleTwo: subtitle2.copyWith(color: cBlack),
                ),
                vsSuperTiny,
                CustomFormField(
                  controller: passwordController,
                  hintText: 'Password',
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.done,
                  suffixIcon: IconButton(
                    onPressed: togglePasswordVisibility,
                    icon:
                        isObscure
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_off_outlined),
                  ),
                  validator: validatePassword,
                  obscureText: isObscure,
                ),
                vsMedium,
                GestureDetector(
                  onTap: () {
                    print('Forgot Password onTap');
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'lupa Password?',
                      style: subtitle2.copyWith(color: cError),
                    ),
                  ),
                ),
                Spacer(),
                PrimaryButton(
                  onPressed: () {
                    print('Login onTap');
                    context.goNamed(
                      RouteNames.main,
                    ); 
                  },
                  title: 'Login',
                ),

                vsSmall,
                GestureDetector(
                  onTap: () {
                    context.pushNamed(RouteNames.register);
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: RichTextWidget(
                      textOne: 'Don’t have an account? ',
                      textStyleOne: subtitle2.copyWith(color: cBlack),
                      textTwo: 'Sign Up',
                      textStyleTwo: subtitle2.copyWith(color: cPrimary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void togglePasswordVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
