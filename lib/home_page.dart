import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 List<Map<String, dynamic>> gruposParticipando = [
    {
      'nombre': 'Grupo 1',
      'participantes': ['Usuario1', 'Usuario2', 'Usuario3'],
      'tiempo_pago': 'Semanal',
      'monto_total': 1000,
      'moneda': 'Bs',
      'otro_input': 'Valor1',
      'otro_input_moneda': 'Valor2',
    },
    {
      'nombre': 'Grupo 2',
      'participantes': ['Usuario4', 'Usuario5', 'Usuario6'],
      'tiempo_pago': 'Mensual',
      'monto_total': 2000,
      'moneda': 'USD',
      'otro_input': 'Valor3',
      'otro_input_moneda': 'Valor4',
    },
  ];
  
  List<Map<String, dynamic>> gruposInvitados = [
    {
      'nombre': 'Grupo 3',
      'participantes': ['Usuario7', 'Usuario8'],
      'tiempo_pago': 'Quincenal',
      'monto_total': 1500,
      'moneda': 'EUR',
      'otro_input': 'Valor5',
      'otro_input_moneda': 'Valor6',
    },
    {
      'nombre': 'Grupo 4',
      'participantes': ['Usuario9', 'Usuario10'],
      'tiempo_pago': 'Mensual',
      'monto_total': 2500,
      'moneda': 'USD',
      'otro_input': 'Valor7',
      'otro_input_moneda': 'Valor8',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bienvenido a Pasanaku',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Image.asset(
            'assets/img/pasana.png',
            width: 80,
            height: 80,
            
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Tus grupos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 150, // Altura de la lista de grupos
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: gruposParticipando.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildParticipatingGroupCard(gruposParticipando[index]);
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Invitaciones a grupos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            gruposInvitados.isEmpty
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'No tienes ninguna solicitud para unirte a un grupo',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                : Container(
                    height: 150, // Altura de la lista de grupos
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: gruposInvitados.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildInvitedGroupCard(gruposInvitados[index]);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildParticipatingGroupCard(Map<String, dynamic> grupo) {
    return GestureDetector(
      onTap: () {
        // Acción al hacer clic en el grupo
      },
      child: Container(
        width: 120, // Ancho de cada tarjeta de grupo
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              grupo['nombre'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Participantes: ${grupo['participantes'].join(', ')}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Tiempo de Pago: ${grupo['tiempo_pago']}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvitedGroupCard(Map<String, dynamic> grupo) {
    return GestureDetector(
      onTap: () {
        _showGroupDialog(context, grupo);
      },
      child: Container(
        width: 120, // Ancho de cada tarjeta de grupo
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              grupo['nombre'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Invitado',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showGroupDialog(BuildContext context, Map<String, dynamic> grupo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(grupo['nombre']),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Participantes: ${grupo['participantes'].join(', ')}'),
              SizedBox(height: 10),
              Text('Tiempo de Pago: ${grupo['tiempo_pago']}'),
              SizedBox(height: 10),
              Text('Monto Total: ${grupo['monto_total']} ${grupo['moneda']}'),
              SizedBox(height: 10),
              Text('Cantidad de Participantes: ${grupo['participantes'].length}'),
              SizedBox(height: 10),
              // Agregar más información aquí según sea necesario
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _updateGroupStatus(grupo, true);
              },
              child: Text('Aceptar'),
            ),
            TextButton(
              onPressed: () {
                _updateGroupStatus(grupo, false);
              },
              child: Text('Rechazar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void _updateGroupStatus(Map<String, dynamic> grupo, bool aceptar) {
    setState(() {
      if (aceptar) {
        gruposInvitados.remove(grupo);
        gruposParticipando.add(grupo);
      } else {
        gruposInvitados.remove(grupo);
      }
    });
    Navigator.of(context).pop();
  }
}
