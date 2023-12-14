import 'package:flutter/material.dart';
//import 'package:todo/pie_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    setState(() {
      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 184, 182, 187)),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "Create Your Account",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Set a password",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Please create a secure password including the following criteria below",
                  style: TextStyle(
                      fontSize: 16, height: 1.5, color: Colors.grey.shade600),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  onChanged: (password) => onPasswordChanged(password),
                  obscureText: !_isVisible,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: _isVisible
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.grey,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: _isPasswordEightCharacters &&
                                      _hasPasswordOneNumber
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color:
                            _isPasswordEightCharacters && _hasPasswordOneNumber
                                ? Colors.green
                                : Colors.black,
                      ),
                    ),
                    hintText: "Password",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(microseconds: 500),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: _hasPasswordOneNumber
                              ? Colors.green
                              : Colors.transparent,
                          border: _hasPasswordOneNumber
                              ? Border.all(
                                  color: Colors.transparent,
                                )
                              : Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Contains at least 1 number ")
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(microseconds: 500),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: _isPasswordEightCharacters
                              ? Colors.green
                              : Colors.transparent,
                          border: _isPasswordEightCharacters
                              ? Border.all(
                                  color: Colors.transparent,
                                )
                              : Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Contains at least 8 characters")
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                _isPasswordEightCharacters && _hasPasswordOneNumber
                    ? MaterialButton(
                        height: 40,
                        minWidth: double.infinity,
                        onPressed: () {},
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          "CREATE ACCOUNT",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ));
  }
}
