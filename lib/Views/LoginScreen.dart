import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.amberAccent.shade700,
              Colors.black54,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Image.asset("images/splash.png", height: 120),
                      ),
                      // const SizedBox(height: 10.0),
                      // const Text(
                      //   "Login",
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 40,
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Welcome back to BOA CRM",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 60),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: const TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.amber),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black54,
                                    ),
                                    labelText: "Username",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: const TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.amber),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.password,
                                      color: Colors.black54,
                                    ),
                                    labelText: "Password",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 40),
                        GestureDetector(
                          onTap: () => {},
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.amber,
                            ),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(height: 20),
                        // Text(
                        //   "Continue with outlook",
                        //   style: TextStyle(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        const SizedBox(height: 20),
                        //   Row(
                        //     children: <Widget>[
                        //       Expanded(
                        //         child: Container(
                        //           height: 50,
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(50),
                        //             color: Colors.black,
                        //           ),
                        //           child: Center(
                        //             child: Text(
                        //               "Outlook",
                        //               style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontWeight: FontWeight.bold,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}