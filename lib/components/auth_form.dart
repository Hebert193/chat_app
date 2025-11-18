//customizacao dos campos
import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/material.dart';
 
class AuthForm extends StatefulWidget {
  const AuthForm({super.key, required void Function(AuthFormData formData) onSubmit});
 
  @override
  State<AuthForm> createState() => _AuthFormState();
  
  void onSubmit(AuthFormData formData) {}
}
 
class _AuthFormState extends State<AuthForm> {
final _formKey = GlobalKey<FormState>(); // acessando dados do formulário
final _formData = AuthFormData(); // usando a classe que foi criada
 
void _submit () {
  final isValid = _formKey.currentState?.validate() ?? false;
  if(!isValid) return;
  
  widget.onSubmit(_formData);
}
   @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              if(_formData.isSignup)
              TextFormField(
                key: const ValueKey('Name'),
                initialValue: _formData.name,
                onChanged: (name) => _formData.name = name,
                decoration: const InputDecoration(labelText: 'name'),
                validator: (localnome),
              ),
              TextFormField(
                key: const ValueKey('email'),
                initialValue: _formData.email,
                onChanged: (email) => _formData.email = email,
                decoration: const InputDecoration(labelText: 'email'),
              ),
              TextFormField(
                obscureText: true, //para deixar o texto ofuscado
                key: const ValueKey('Passaword'),
                initialValue: _formData.password,
                onChanged: (passaword) => _formData.password = passaword,
                decoration: const InputDecoration(labelText: 'Senha'),
                validator: (localPassword) =>  ,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _submit,
                child: Text(_formData.isLogin ? 'Entrar' : 'Cadastra'), //botao
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _formData.toggleAuthMode();
                  });
                },
                child: Text( _formData.isLogin ?
                'Criar uma nova conta?':
                'Já possui conta?',
                ), //texto com comportamento de clique
              )
            ],
          ),
        ),
      ),
    );
  }
}
 
 