import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizzle_starter/src/core/widget/circular_progress_indicator_widget.dart';
import 'package:sizzle_starter/src/core/widget/refresh_indicator_widget.dart';
import 'package:sizzle_starter/src/feature/authentication/bloc/authentication_bloc.dart';
import 'package:sizzle_starter/src/feature/initialization/widget/dependencies_scope.dart';

class AuthenticationWidget extends StatefulWidget {
  const AuthenticationWidget({super.key});

  @override
  State<AuthenticationWidget> createState() => _AuthenticationWidgetState();
}

class _AuthenticationWidgetState extends State<AuthenticationWidget> {
  late final AuthenticationBloc _authenticationBloc;
  final TextEditingController _emailController = TextEditingController(text: 'test@example.com');
  final TextEditingController _passwordController = TextEditingController(text: 'password');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final dependencies = DependenciesScope.of(context);
    _authenticationBloc = dependencies.authenticationBloc;
    _authenticationBloc.add(const AuthenticationEvent.getCurrentUser());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication Widget')),
      body: RefreshIndicatorWidget(
        onRefresh: () async {
          context.read<AuthenticationBloc>().add(const AuthenticationEvent.getCurrentUser());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state is AuthenticationAuthenticatedState) {
                    // change screen when authenticated
                    Navigator.pushNamedAndRemoveUntil(context, 'task-board', (_) => false);
                  }
                },
                bloc: _authenticationBloc,
                builder: (context, state) {
                  return switch (state) {
                    AuthenticationInitialState() => const SliverToBoxAdapter(
                      child: Center(child: Text('Initial State')),
                    ),
                    AuthenticationInProgressState() => const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicatorWidget()),
                    ),
                    AuthenticationFailureState() => SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'Failure State: ${state.message ?? "Unknown error"}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    AuthenticationUnauthenticatedState() => SliverFillRemaining(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Unauthenticated State"),
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(labelText: 'Email'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _passwordController,
                              decoration: const InputDecoration(labelText: 'Password'),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    AuthenticationAuthenticatedState() => SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'Authenticated State: ${state.stateModel.user?.email ?? "No user"}',
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  };
                },
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: BlocBuilder<AuthenticationBloc, AuthenticationState>(
      //   builder: (context, state) {
      //     return Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         if (state is AuthenticationAuthenticatedState && state.stateModel.user != null)
      //           FloatingActionButton(
      //             heroTag: "update",
      //             onPressed: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => UpdateUserConfigWidget(user: state.stateModel.user!),
      //                 ),
      //               );
      //             },
      //             child: Icon(Icons.cloud_upload_outlined),
      //           ),
      //         SizedBox(height: 10),
      //         FloatingActionButton(
      //           heroTag: "auth_action",
      //           onPressed: () {
      //             if (state is AuthenticationAuthenticatedState) {
      //               context.read<AuthenticationBloc>().add(const AuthenticationEvent.signOut());
      //             } else {
      //               if (_formKey.currentState?.validate() != true) {
      //                 return;
      //               }
      //               context.read<AuthenticationBloc>().add(
      //                 AuthenticationEvent.signIn(
      //                   email: _emailController.text.trim(),
      //                   password: _passwordController.text.trim(),
      //                 ),
      //               );
      //             }
      //           },
      //           child:
      //               state is AuthenticationAuthenticatedState
      //                   ? Icon(Icons.logout)
      //                   : Icon(Icons.person),
      //         ),
      //       ],
      //     );
      //   },
      // ),
    );
  }
}
