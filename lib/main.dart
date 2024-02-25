import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Schedule App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Widget gunlerListesi(String gun) {
    return Column(
      children: [
        const Divider(
          color: Colors.grey,
        ),
        SizedBox(
          height: 40,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(Icons.calendar_month),
              const SizedBox(
                width: 25,
              ),
              Text("$gun", style: const TextStyle(fontSize: 20)),
              const Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(gun: gun)));
                  });
                },
                icon: const Icon(Icons.arrow_forward_ios_outlined),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("Home"),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Ayarlar()));
                  },
                  icon: const Icon(Icons.settings)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profil()));
                  },
                  icon: const Icon(Icons.person)),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 5),
                child: Text(
                  "Welcome To Schedule App!",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 250,
            width: 500,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
              child: Image(image: AssetImage("images/neon.jpg")),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 50,
            width: 450,
            child: ColoredBox(
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "See your schedule for the week:",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: [
                gunlerListesi("Monday"),
                gunlerListesi("Tuesday"),
                gunlerListesi("Wednesday"),
                gunlerListesi("Thursday "),
                gunlerListesi("Friday "),
                gunlerListesi("Saturday "),
                gunlerListesi("Sunday "),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Ayarlar extends StatefulWidget {
  const Ayarlar({super.key});

  @override
  State<Ayarlar> createState() => _AyarlarState();
}

List<String> secenekler = ['Never', 'Daily', 'Weekly'];
String deger = secenekler.first;

class _AyarlarState extends State<Ayarlar> {
  bool _darkMode = false;
  bool _enableNot = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.orange,
      ),
      body: Column(children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.0, top: 5),
              child: Text(
                "Theme Settings:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: SwitchListTile(
                  title: const Text("Dark mode"),
                  value: _darkMode,
                  onChanged: (value) {
                    setState(
                      () {
                        _darkMode = value;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
        ),
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.0, top: 5.0),
              child: Text(
                "Notifications Settings:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: SwitchListTile(
                  title: const Text("Enable Notifications"),
                  value: _enableNot,
                  onChanged: (value) {
                    setState(
                      () {
                        _enableNot = value;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: Expanded(
                  child: DropdownButton<String>(
                    value: deger,
                    items: secenekler
                        .map((secenek) => DropdownMenuItem(
                              value: secenek,
                              child: Text(secenek),
                            ))
                        .toList(),
                    onChanged: (yeniDeger) {
                      setState(() {
                        deger = yeniDeger!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
        ),
      ]),
    );
  }
}

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  Widget profilInfo(String yazi, final IconData icon) {
    return Column(
      children: [
        SizedBox(
          height: 45,
          child: Row(
            children: [
              const SizedBox(
                width: 50,
              ),
              Icon(icon),
              const SizedBox(
                width: 25,
              ),
              Text("$yazi", style: const TextStyle(fontSize: 20)),
              const Spacer(),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Info"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 10),
                child: Text(
                  "User Information:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          profilInfo("Name: Uğur Yılmaz", Icons.person_2_outlined),
          profilInfo("Email: yugur464@icloud.com", Icons.email),
          profilInfo("Location: Giresun", Icons.location_on_outlined)
        ],
      ),
    );
  }
}

class DetailsPage extends StatefulWidget {
  final String gun;

  const DetailsPage({super.key, required this.gun});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<String> tasks = [
    'Task 1',
    'Task 2',
    'Task 3',
  ];

  @override
  Widget build(BuildContext context) {
    List<String> randomTasks = [];

    for (int i = 0; i < tasks.length; i++) {
      if (Random().nextBool()) {
        randomTasks.add(tasks[i]);
      }
    }

    List<Widget> taskWidgets = [];
    for (String task in randomTasks) {
      taskWidgets.add(Text("- $task", style: const TextStyle(fontSize: 16.0)));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Details for ${widget.gun}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tasks For ${widget.gun}:",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            ...taskWidgets,
          ],
        ),
      ),
    );
  }
}
