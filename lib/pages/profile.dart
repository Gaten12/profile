import 'package:flutter/material.dart';
import 'package:profile/models/iconbar.dart';
import 'package:profile/models/profilestat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool temaGelap = true;

  void gantiTema() {
    setState(() {
      temaGelap = !temaGelap;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color background = temaGelap ? Colors.black : Colors.yellow[100]!;
    final Color textColor = temaGelap ? Colors.white : Colors.black;
    final Color headerColor = temaGelap ? Colors.purple[800]! : Colors.deepPurple[100]!;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: background,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                color: headerColor,
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                child: Text(
                  'Profile',
                  style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/profile.png'),
              ),
              const SizedBox(height: 8),
              Text(
                '@Gaten.mbledos',
                style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ProfileStat(label: 'Following', value: '1'),
                  SizedBox(width: 16),
                  ProfileStat(label: 'Followers', value: '12M'),
                  SizedBox(width: 16),
                  ProfileStat(label: 'Likes', value: '1k'),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text('Edit Profile')),
                  const SizedBox(width: 8),
                  ElevatedButton(onPressed: () {}, child: const Text('Share Profile')),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.person_add, color: textColor),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.all(12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add bio'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 16),
              const IconBar(),
              const SizedBox(height: 8),

              /// 🔘 Tombol Ganti Tema
              ElevatedButton(
                onPressed: gantiTema,
                child: const Text('Ganti Tema'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
              ),

              const SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage('images/image_${index + 1}.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


