import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:custom_form/presentation/cubits/register/register_cubit.dart';
import 'package:custom_form/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => RegisterCubit(),
          child: const Column(
            children: [
              _RegisterView(),
              _RegisteredDataView(),
            ],
          ),
        ),
      ),
      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FlutterLogo(size: 100),
              _RegisterForm(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;

    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          label: 'Nombre de usuario',
          onChanged: registerCubit.usernameChanged,
          errorMessage: username.errorMessage,
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'Correo electrónico',
          onChanged: registerCubit.emailChanged,
          errorMessage: email.errorMessage,
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'Contraseña',
          obscureText: true,
          onChanged: registerCubit.passwordChanged,
          errorMessage: password.errorMessage,
        ),
        const SizedBox(height: 10),
        FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Guardar'))
      ],
    ));
  }
}

class _RegisteredDataView extends StatelessWidget {
  const _RegisteredDataView();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username.value;
    final email = registerCubit.state.email.value;
    final password = registerCubit.state.password.value;
    final isValid = registerCubit.state.isValid;
    final formStatus = registerCubit.state.formStatus;

    if (isValid && formStatus == FormStatus.validating) {
      return Column(
        children: [
          const SizedBox(height: 20),
          Text('Bienvenido:', style: Theme.of(context).textTheme.headlineSmall),
          Text('Nombre de usuario: $username'),
          Text('Correo electrónico: $email'),
          Text('Contraseña: $password'),
        ],
      );
    } else {
      return Container(); // Mostrar un contenedor vacío si isValid es falso
    }
  }
}
