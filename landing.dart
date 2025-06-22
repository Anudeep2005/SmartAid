import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_aid/homescreen.dart';
import 'package:lottie/lottie.dart';

class LandingAndLogin extends StatefulWidget {
  const LandingAndLogin({super.key});
  @override
  State<LandingAndLogin> createState() => _LandingAndLoginState();
}

class _LandingAndLoginState extends State<LandingAndLogin> {
  final PageController _controller = PageController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  int _currentPage = 0; 

  final List<Map<String, dynamic>> users = [
    {
      'email': 'anudeep@smartaid.com',
      'password': 'smartaid123'
    },
    {
      'email': 'dummy',
      'password': '12345'
    },
    {
      'email': 'example.com',
      'password': '123456'
    },
    {
      'email': '',
      'password': ''
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                buildPage("assets/lottie_1.gif", "Quick instructions", "Step-by-step first aid help for emergencies."),
                buildPage("https://i.pinimg.com/736x/a7/08/e4/a708e4d29f470a24de285e099ee767ec.jpg", "Be Prepared", "Always be ready with on-the-go medical advice."),
                buildPage("https://i.pinimg.com/736x/a7/08/e4/a708e4d29f470a24de285e099ee767ec.jpg", "User Friendly", "Designed for everyone, no medical training needed."),
                buildPage("https://i.pinimg.com/736x/a7/08/e4/a708e4d29f470a24de285e099ee767ec.jpg", "SmartAid", "Your pocket emergency health assistant."),
                buildLoginPage(),
              ],
            ),
          ),
          SizedBox(height: 16),
          buildPageIndicator(), 
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildPage(String image, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 400),
          SizedBox(height: 30),
          Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text(subtitle, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
        ],
      ),
    );
  }

  Widget buildLoginPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Login to SmartAid", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 24),
              TextField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                  icon: Icon(Icons.email_outlined, color: Colors.black),
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.password_outlined, color: Colors.black),
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  final String mail = _emailcontroller.text.trim();
                  final String password = _passwordcontroller.text.trim();
                  bool isValid = users.any((user) =>
                      user["email"] == mail && user["password"] == password);
                  if (isValid) {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Homescreen()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Invalid Username/Password!")));
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text("Don't have an account? Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 6),
          height: 10,
          width: _currentPage == index ? 22 : 10,
          decoration: BoxDecoration(
            color: _currentPage == index ? Colors.greenAccent : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }),
    );
  }
}