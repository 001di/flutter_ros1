import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Переменная для управления темой приложения (Урок 13)
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Course App',
      debugShowCheckedModeBanner: false,
      // 13. Динамическое переключение светлой и темной темы
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(
              isDarkMode: _isDarkMode,
              onThemeChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
            ),
        '/details': (context) => const DetailsScreen(),
      },
    );
  }
}

class Lesson {
  final String title;
  final String description;
  final String imageUrl;

  Lesson({required this.title, required this.description, required this.imageUrl});
}

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Полный список всех пройденных тем курса с 1 по 13
  final List<Lesson> lessons = [
    Lesson(
      title: '1. Установка',
      description: 'Установка SDK, настройка VS Code и создание первого проекта.',
      imageUrl: 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=500',
    ),
    Lesson(
      title: '2. Структура',
      description: 'Разбор основных папок и файлов проекта Flutter.',
      imageUrl: 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=500',
    ),
    Lesson(
      title: '3. Stateless',
      description: 'Изучение виджетов без внутреннего состояния.',
      imageUrl: 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=500',
    ),
    Lesson(
      title: '4. Stateful',
      description: 'Виджеты с изменяемым состоянием и метод setState.',
      imageUrl: 'https://images.unsplash.com/photo-1507238691740-187a5b1d37b8?w=500',
    ),
    Lesson(
      title: '5. Container',
      description: 'Использование контейнеров и стилей BoxDecoration.',
      imageUrl: 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=500',
    ),
    Lesson(
      title: '6. Column/Row',
      description: 'Вертикальное и горизонтальное расположение элементов.',
      imageUrl: 'https://images.unsplash.com/photo-1531403009284-440f080d1e12?w=500',
    ),
    Lesson(
      title: '7. ListView',
      description: 'Создание прокручивающихся списков.',
      imageUrl: 'https://images.unsplash.com/photo-1506784983877-45594efa4cbe?w=500',
    ),
    Lesson(
      title: '8. GridView',
      description: 'Создание адаптивных сеток элементов.',
      imageUrl: 'https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?w=500',
    ),
    Lesson(
      title: '9. PageView',
      description: 'Листание страниц и экранов горизонтальными свайпами.',
      imageUrl: 'https://images.unsplash.com/photo-1434030216411-0b793f4b4173?w=500',
    ),
    Lesson(
      title: '10. Stack & Positioned',
      description: 'Наложение элементов друг на друга и IndexedStack.',
      imageUrl: 'https://images.unsplash.com/photo-1542744094-3a31246263d0?w=500',
    ),
    Lesson(
      title: '11. Шрифты и стили',
      description: 'Настройка типографики, начертаний и размеров текста.',
      imageUrl: 'https://images.unsplash.com/photo-1455390582262-044cdead277a?w=500',
    ),
    Lesson(
      title: '12. Картинки (Images)',
      description: 'Использование Image.asset и Image.network для отображения графики.',
      imageUrl: 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=500',
    ),
    Lesson(
      title: '13. Темы (ThemeData)',
      description: 'Кастомизация цветов и создание светлой/темной темы.',
      imageUrl: 'https://images.unsplash.com/photo-1507238691740-187a5b1d37b8?w=500',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Course App (Все темы)'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // Вкладка 1: Полный список всех уроков с картинками и шрифтами
          ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              final lesson = lessons[index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/details',
                    arguments: lesson,
                  );
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            lesson.imageUrl,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              width: 60,
                              height: 60,
                              color: Colors.grey,
                              child: const Icon(Icons.broken_image, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lesson.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                lesson.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                  height: 1.2,
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
            },
          ),
          // Вкладка 2: Настройка темы (Урок 13)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.palette, size: 64, color: Colors.blue),
                  const SizedBox(height: 16),
                  const Text(
                    'Управление темой приложения',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Переключайте тему оформления с помощью ThemeData:',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 32),
                  SwitchListTile(
                    title: const Text('Темная тема (Dark Mode)'),
                    secondary: Icon(
                      widget.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    ),
                    value: widget.isDarkMode,
                    onChanged: widget.onThemeChanged,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Все уроки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки темы',
          ),
        ],
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lesson = ModalRoute.of(context)!.settings.arguments as Lesson;

    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              lesson.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Описание урока:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    lesson.description,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Назад к списку'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}