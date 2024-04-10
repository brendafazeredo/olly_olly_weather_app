import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';
import 'signup_page.dart';
import 'weather_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),

                // logo
                Image.asset(
                  'lib/images/logo.png',
                  width: 200,
                  height: 200,
                ),

                const SizedBox(height: 20),

                // welcome back text
                Text(
                  'Welcome back',
                  style: TextStyle(
                    color: const Color(0xFFF05C59),
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 25),

                // e-mail or username field
                MyTextField(
                  controller: usernameController,
                  hintText: 'E-mail address or username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password field
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(color: Color(0xFFF05C59)),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: MyButton(
                      onTap: () {
                        // going to the WeatherPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WeatherPage()),
                        );
                      },
                      text: 'Sign In',
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // or continue with text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: const Color(0xFFF05C59),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Text(
                          'or continue with',
                          style: TextStyle(color: Color(0xFFF05C59)),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: const Color(0xFFF05C59),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // google and apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: SquareTile(
                        imagePath: 'lib/images/google.png',
                      ),
                    ),
                    SizedBox(width: 25),
                    // apple button
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: SquareTile(
                        imagePath: 'lib/images/apple.png',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // don't have an account text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: const Color(0xFFF05C59)),
                    ),
                    const SizedBox(width: 4),
                    // sign up text
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          // going to the signup page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpPage(context: context)), // Pass the context here
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: const Color(0xFFF05C59),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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