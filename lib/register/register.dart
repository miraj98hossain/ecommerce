import 'package:ecommerce/welcome/bloc/sign_in_bloc.dart';
import 'package:ecommerce/welcome/bloc/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurple,
                centerTitle: true,
                title: const Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.53),
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: TextFormField(
                                  onChanged: (value) {
                                    context
                                        .read<SignInBloc>()
                                        .add(SignInEmailEvent(email: value));
                                  },
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.email),
                                    label: const Text("User Name"),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: TextFormField(
                                  onChanged: (value) {
                                    context
                                        .read<SignInBloc>()
                                        .add(SignInEmailEvent(email: value));
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.email),
                                    label: const Text("Email"),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: TextFormField(
                                  onChanged: (value) {
                                    context.read<SignInBloc>().add(
                                        SignInPasswordEvent(password: value));
                                  },
                                  obscureText: !state.passwordVisible,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.password),
                                    label: const Text("Password"),
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          context.read<SignInBloc>().add(
                                              SignInPasswordVisibleEvent(
                                                  passwordVisible:
                                                      !state.passwordVisible));
                                        },
                                        child: state.passwordVisible
                                            ? const Icon(Icons.remove_red_eye)
                                            : const Icon(
                                                Icons.remove_red_eye_outlined)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: TextFormField(
                                  onChanged: (value) {
                                    context.read<SignInBloc>().add(
                                        SignInPasswordEvent(password: value));
                                  },
                                  obscureText: !state.passwordVisible,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.password),
                                    label: const Text("Confirm Password"),
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          context.read<SignInBloc>().add(
                                              SignInPasswordVisibleEvent(
                                                  passwordVisible:
                                                      !state.passwordVisible));
                                        },
                                        child: state.passwordVisible
                                            ? const Icon(Icons.remove_red_eye)
                                            : const Icon(
                                                Icons.remove_red_eye_outlined)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: const Color.fromARGB(
                                          255, 28, 23, 36)),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/register');
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Enter your details here!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.53),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
