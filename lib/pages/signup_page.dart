import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';
import 'login_page.dart'; // Import the LoginPage
import 'weather_page.dart';

class SignUpPage extends StatelessWidget {
  final BuildContext context;

  SignUpPage({Key? key, required this.context}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void signUp() {
  // Navigate to the WeatherPage using the context passed in the constructor
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => WeatherPage()),
  );
}

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
                const SizedBox(height: 50),

                // logo
                Image.asset(
                  'lib/images/logo.png',
                  width: 200,
                  height: 200,
                ),

                const SizedBox(height: 20),

                // create an account text
                Text(
                  'Create an account',
                  style: TextStyle(
                    color: Color(0xFFF05C59),
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 25),

                // username field
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // e-mail field
                MyTextField(
                  controller: emailController,
                  hintText: 'E-mail',
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

                // confirm your password field
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm your password',
                  obscureText: true,
                ),

                const SizedBox(height: 50),

                // sign up button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: MyButton(
                      onTap: signUp,
                      text: 'Sign Up',
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                // or continue with text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color(0xFFF05C59),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'or continue with',
                          style: TextStyle(color: Color(0xFFF05C59)),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color(0xFFF05C59),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

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

                const SizedBox(height: 50),

                // already have an account? text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Color(0xFFF05C59)),
                    ),
                    const SizedBox(width: 4),
                    // sign in text
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          // going to the login page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Color(0xFFF05C59),
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
