import 'package:flutter/material.dart';
import 'package:wordwiz/CrearCuenta.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WordWiz',
      debugShowCheckedModeBanner: false, // Elimina el banner de debug
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDED), // Color de fondo

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Imagen local mucho más grande
            Image.asset(
              'assets/logo.png', // Ruta de la imagen local
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 30),

            // Título
            const Text(
              'WordWiz',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            const Text(
              'Impulsando tu viaje en el idioma',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 80),

            // Botón de Iniciar Sesión
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón de iniciar sesión
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6482AD),
                padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Inicia Sesión',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // Botón de Crear Cuenta que redirige a la nueva página
            ElevatedButton(
              onPressed: () {
                // Navegación a la página CrearCuenta
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CrearCuenta()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7FA1C3),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Crea una Cuenta',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
