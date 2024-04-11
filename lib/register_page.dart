import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.white],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Image.asset(
                'assets/img/pasana.png',
                width: 80,
                height: 80,
              ),
              SizedBox(height: 10),
              Text(
                'Registro',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        labelText: 'Nombre de Usuario',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        labelText: 'Nombre Completo',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        labelText: 'Correo Electrónico',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        labelText: 'Teléfono',
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Acción para registrar al usuario
                      },
                      child: Text('Registrar'),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        // Acción para regresar a la página de inicio de sesión
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Volver al Inicio de Sesión',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
