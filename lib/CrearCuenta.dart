import 'package:flutter/material.dart';
import 'package:wordwiz/main.dart';

class CrearCuenta extends StatefulWidget {
  const CrearCuenta({super.key});

  @override
  _CrearCuentaState createState() => _CrearCuentaState();
}

class _CrearCuentaState extends State<CrearCuenta> {
  int _currentIndex = 0; // Índice de la sección actual
  List<bool> _languageSelection = List.generate(14, (index) => false); // Para mantener el estado de los botones de idioma
  List<bool> _levelSelection = List.generate(6, (index) => false); // Para mantener el estado de los botones de nivel

  void _nextPage() {
    setState(() {
      _currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDED),

      appBar: AppBar(
        title: Text(
          '${_currentIndex + 1}/2',
          style: const TextStyle(
            color: Color(0xFFE2DAD6),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barra de progreso
            LinearProgressIndicator(
              value: _currentIndex / 2,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF7FA1C3)),
              minHeight: 10,
              semanticsLabel: 'Progreso',
              semanticsValue: '${_currentIndex + 1} de 2',
              borderRadius: BorderRadius.circular(20), // Bordes redondeados
            ),
            const SizedBox(height: 20),

            // Secciones usando IndexedStack
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: [
                  // Sección de crear cuenta
                  _buildCreateAccountSection(_nextPage),
                  // Sección de habilidades lingüísticas
                  _buildLanguageSkillsSection(_nextPage),
                  _buildAccountCreatedSection()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateAccountSection(VoidCallback onNext) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Crea tu perfil',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Campo de Nombre
          TextField(
            decoration: InputDecoration(
              labelText: 'Nombre',
              labelStyle: const TextStyle(
                color: Color(0xFF7FA1C3),
                fontWeight: FontWeight.bold,
              ),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(
              color: Color(0xFF7FA1C3),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // Campo de Correo
          TextField(
            decoration: InputDecoration(
              labelText: 'Correo',
              labelStyle: const TextStyle(
                color: Color(0xFF7FA1C3),
                fontWeight: FontWeight.bold,
              ),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(
              color: Color(0xFF7FA1C3),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // Campo de Contraseña
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              labelStyle: const TextStyle(
                color: Color(0xFF7FA1C3),
                fontWeight: FontWeight.bold,
              ),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(
              color: Color(0xFF7FA1C3),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // Campo de Confirmar Contraseña
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirmar Contraseña',
              labelStyle: const TextStyle(
                color: Color(0xFF7FA1C3),
                fontWeight: FontWeight.bold,
              ),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(
              color: Color(0xFF7FA1C3),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // Texto de Fecha de Nacimiento
          const Center(
            child: Text(
              'Fecha de Nacimiento',
              style: TextStyle(fontSize: 18, color: Color(0xFF7FA1C3), fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),

          // Campos de día, mes y año en una fila
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Campo de Día
              SizedBox(
                width: 60,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'DD',
                    labelStyle: const TextStyle(
                      color: Color(0xFF7FA1C3),
                      fontWeight: FontWeight.bold,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(
                    color: Color(0xFF7FA1C3),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),

              // Campo de Mes
              SizedBox(
                width: 60,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'MM',
                    labelStyle: const TextStyle(
                      color: Color(0xFF7FA1C3),
                      fontWeight: FontWeight.bold,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(
                    color: Color(0xFF7FA1C3),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),

              // Campo de Año
              SizedBox(
                width: 60,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'AA',
                    labelStyle: const TextStyle(
                      color: Color(0xFF7FA1C3),
                      fontWeight: FontWeight.bold,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(
                    color: Color(0xFF7FA1C3),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          // Botón de Siguiente
          Center(
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6482AD),
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Siguiente',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSkillsSection(VoidCallback onNext) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tus habilidades lingüísticas',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Selecciona tu idioma nativo',
            style: TextStyle(fontSize: 16), // Texto regular
          ),
          const SizedBox(height: 20),

          // Botones de selección de idiomas
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 3, // Ajusta la relación de aspecto
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 7,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {
                  setState(() {
                    _languageSelection[index] = !_languageSelection[index];
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _languageSelection[index] ? const Color(0xFF7FA1C3) : const Color(0xFFD9D9D9),
                  foregroundColor: _languageSelection[index] ? Colors.white : const Color(0xFF7FA1C3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Bordes redondeados
                  ),
                  padding: const EdgeInsets.all(2), // Padding interior de 2
                ),
                child: Text(
                  _getLanguageButtonLabel(index),
                  style: const TextStyle(
                    fontSize: 12, // Tamaño de letra más pequeño
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          // Texto de idiomas a practicar
          const Text(
            '¿Qué idioma quieres practicar?',
            style: TextStyle(fontSize: 16), // Texto regular
          ),
          const SizedBox(height: 10),

          // Repetición de botones de selección de idiomas
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 3.0, // Ajusta la relación de aspecto
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 7,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {
                  setState(() {
                    _languageSelection[index + 7] = !_languageSelection[index + 7];
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _languageSelection[index + 7] ? const Color(0xFF7FA1C3) : const Color(0xFFD9D9D9),
                  foregroundColor: _languageSelection[index + 7] ? Colors.white : const Color(0xFF7FA1C3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(2), // Padding interior de 2
                ),
                child: Text(
                  _getLanguageButtonLabel(index + 7),
                  style: const TextStyle(
                    fontSize: 12, // Tamaño de letra más pequeño
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          // Texto para seleccionar nivel
          const Text(
            'Selecciona tu nivel actual',
            style: TextStyle(fontSize: 16), // Texto regular
          ),
          const SizedBox(height: 10),

          // Botones de selección de nivel
          Wrap(
            spacing: 10, // Espacio horizontal entre botones
            runSpacing: 10, // Espacio vertical entre filas de botones
            alignment: WrapAlignment.center, // Alinear al centro
            children: List.generate(6, (index) {
              // Definir los niveles en función del índice
              String level;
              switch (index) {
                case 0:
                  level = 'A1';
                  break;
                case 1:
                  level = 'A2';
                  break;
                case 2:
                  level = 'B1';
                  break;
                case 3:
                  level = 'B2';
                  break;
                case 4:
                  level = 'C1';
                  break;
                case 5:
                  level = 'C2';
                  break;
                default:
                  level = ''; // Por si acaso
              }

              return ElevatedButton(
                onPressed: () {
                  setState(() {
                    _levelSelection[index] = !_levelSelection[index];
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _levelSelection[index] ? const Color(0xFF7FA1C3) : const Color(0xFFD9D9D9),
                  foregroundColor: _levelSelection[index] ? Colors.white : const Color(0xFF7FA1C3),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Ajustar el padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  level, // Mostrar el nivel correspondiente
                  style: const TextStyle(
                    fontSize: 12, // Tamaño de letra más pequeño
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 20),

          // Botón de siguiente
          Center(
            child: ElevatedButton(
              onPressed: () {
                onNext();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6482AD),
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Siguiente',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildAccountCreatedSection() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle,
            color: Color(0xFF6482AD),
            size: 100,
          ),
          const SizedBox(height: 20),
          const Text(
            '¡Cuenta creada con éxito!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'Ahora puedes empezar a usar la aplicación.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          // Botón de Siguiente
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()), // Asegúrate de que MainScreen es el nombre de tu clase principal
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6482AD),
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Siguiente',
                style: TextStyle(color: Colors.white),
              ),
            ),

        ],
      ),
    );
  }


  String _getLanguageButtonLabel(int index) {
    const languages = [
      'Inglés',
      'Francés',
      'Alemán',
      'Italiano',
      'Portugués',
      'Chino',
      'Japonés',
      'Español',
      'Árabe',
      'Ruso',
      'Hindi',
      'Coreano',
      'Turco',
      'Neerlandés',
    ];
    return languages[index % languages.length]; // Para evitar desbordamiento
  }
}
