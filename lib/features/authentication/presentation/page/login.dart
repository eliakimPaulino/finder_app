import 'package:finder_app/core/constants/colors.dart';
import 'package:finder_app/core/constants/sizes.dart';
import 'package:finder_app/core/constants/text_strings.dart';
import 'package:finder_app/core/style/spacing_styles.dart';
import 'package:finder_app/core/theme/custom_theme/image_strings.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: KSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                // -- Logo, title & subtitle
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      height: 150,
                      image: AssetImage(
                        dark ? KImages.darkAppLogo : KImages.lightAppLogo,
                      ),
                    ),
                    Text(
                      KTexts.loginTitle,
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    Text(
                      KTexts.loginSubTitle,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    SizedBox(height: KSizes.spaceBtwSections),
                  ],
                ),

                // -- Form
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        labelText: KTexts.email,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            KSizes.inputFieldRadius,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: KSizes.spaceBtwInputFields),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.visibility_off_outlined),
                        labelText: KTexts.password,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            KSizes.inputFieldRadius,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // -- Remember me & Forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        Text(KTexts.rememberMe),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        KTexts.forgetPassword,
                        style: TextStyle(color: KColors.buttonPrimary),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: KSizes.spaceBtwSections),

                // -- Sign In Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KColors.primary, // sua cor personalizada
                      minimumSize: const Size(double.infinity, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          KSizes.buttonRadius,
                        ),
                      ),
                    ),
                    child: Text(KTexts.logIn),
                  ),
                ),
                SizedBox(height: KSizes.spaceBtwItems),

                // -- Create Account
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    style: OutlinedButton.styleFrom(
                      // minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          KSizes.buttonRadius,
                        ),
                      ),
                    ),
                    child: Text(
                      KTexts.createAccount,
                      style: Theme.of(context).textTheme.bodyLarge,
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
}
