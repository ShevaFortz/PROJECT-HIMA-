import 'package:flutter/material.dart';
import '../models/hima_content.dart';
import 'detail_dosen_screen.dart'; // Navigasi ke Detail saat klik item
import 'login_screen.dart'; // Untuk logout

class HomeScreen extends StatefulWidget {
  final String? userEmail;

  const HomeScreen({super.key, this.userEmail});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Data dummy daftar Dosen (menggunakan model OOP DosenHima - sesuai aturan daftar data)
  final List<DosenHima> dosenList = [
    DosenHima(
      id: 'd001',
      judul: 'Bonda Sisephaputra, M. Kom',
      deskripsiSingkat: 'Ahli dalam Artificial Intelligence dan Data Mining.',
      deskripsiLengkap:
          'Bonda Sisephaputra, M. Kom adalah dosen senior di Program Studi Informatika UNESA Kampus 5. Beliau memiliki pengalaman lebih dari 15 tahun dalam pengajaran dan penelitian, dengan fokus pada AI, Machine Learning, dan Data Mining. Sebagai Ketua Jurusan, beliau aktif membimbing mahasiswa dalam proyek penelitian dan kompetisi nasional. Gelar Doktornya diperoleh dari ITB Bandung, dan beliau sering mempublikasikan paper di jurnal internasional.',
      gambarPath: 'assets/dosen1.jpg',
      nidn: '0012345601',
      jabatan: 'KOORPRODI INFORMATIKA',
      bidangKeahlian: 'AI & Data Mining',
    ),
    DosenHima(
      id: 'd002',
      judul: 'Saifudin Yahya, S.Kom., M.T.I.,',
      deskripsiSingkat: 'Spesialis Software Engineering dan Web Development.',
      deskripsiLengkap:
          'Saifudin Yahya, S.Kom., M.T.I., adalah dosen pembimbing utama di HIMA Informatika. Beliau mengajar mata kuliah Software Engineering, Web Programming, dan Mobile Development. Dengan gelar Doktor Teknik dari Universitas Gadjah Mada, beliau memiliki pengalaman industri sebagai konsultan IT di perusahaan startup. Beliau sering mengadakan workshop dan seminar untuk mahasiswa.',
      gambarPath: 'assets/dosen2.jpg',
      nidn: '0012345602',
      jabatan: 'Dosen Pembimbing HIMA INFORMATIKA',
      bidangKeahlian: 'Software Engineering & Web Dev',
    ),
    DosenHima(
      id: 'd003',
      judul: 'Azis Suroni, S.Kom., M.Kom.',
      deskripsiSingkat: 'Fokus pada Jaringan Komputer dan Cybersecurity.',
      deskripsiLengkap:
          'Azis Suroni, S.Kom., M.Kom.. adalah dosen dengan keahlian di bidang Jaringan Komputer dan Keamanan Siber. Beliau mengajar mata kuliah Network Security dan Computer Networks. Sebagai alumni ITB, beliau aktif dalam penelitian cybersecurity dan sering menjadi narasumber di seminar nasional. Beliau juga membimbing tim mahasiswa dalam kompetisi hacking etis.',
      gambarPath: 'assets/dosen3.jpg',
      nidn: '0012345603',
      jabatan: 'Dosen Senior',
      bidangKeahlian: 'Jaringan & Cybersecurity',
    ),
    DosenHima(
      id: 'd004',
      judul: 'Durrotun Nashihin, M.Sc.',
      deskripsiSingkat: 'Ahli Database Systems dan Big Data.',
      deskripsiLengkap:
          'Durrotun Nashihin, M.Sc. adalah dosen yang mengajar Database Management dan Big Data Analytics. Dengan pengalaman 10 tahun di industri perbankan sebagai analis data, beliau membawa praktik nyata ke dalam kelas. Beliau sering berkolaborasi dengan HIMA untuk proyek data science mahasiswa.',
      gambarPath: 'assets/dosen4.jpg',
      nidn: '0012345604',
      jabatan: 'Dosen Pembantu',
      bidangKeahlian: 'Database & Big Data',
    ),
  ];

  // Menu list untuk Grid Menu (navigasi cepat - sesuai permintaan Anda)
  final List<Map<String, dynamic>> menuList = [
    {"icon": Icons.article_outlined, "title": "Berita"},
    {"icon": Icons.people_alt_outlined, "title": "Dosen"},
    {"icon": Icons.download_outlined, "title": "Unduhan"},
    {"icon": Icons.menu_book_outlined, "title": "I-Magz"},
    {"icon": Icons.event_outlined, "title": "Event"},
    {"icon": Icons.contact_mail_outlined, "title": "Kontak"},
    {"icon": Icons.info_outline, "title": "Tentang HIMA"},
    {"icon": Icons.group_outlined, "title": "Anggota"},
    {"icon": Icons.school_outlined, "title": "JUTIF"},
  ];

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  void _onMenuTap(String title) {
    // Demo navigasi sederhana dengan SnackBar (bisa di-expand ke halaman baru)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Menu "$title" diklik! (Bisa navigasi ke halaman baru di sini)'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text(
          'HIMA Informatika Kampus 5',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ==== NAVBAR (Lanjutan dari potongan kode Anda) ====
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo kiri (UNESA + HIMA)
                  Row(
                    children: [
                      Image.asset(
                        "assets/Logo2.png",
                        height: 40,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.school,
                                size: 40, color: Colors.orange),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "HIMA INFORMATIKA KAMPUS UNESA 5",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  // User info (email login)
                  Text(
                    'Selamat datang, ${widget.userEmail ?? 'User '}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ==== GRID MENU (Navigasi Cepat) ====
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Menu HIMA',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: menuList.length,
              itemBuilder: (context, index) {
                final menu = menuList[index];
                return Card(
                  elevation: 4,
                  color: Colors.white,
                  child: InkWell(
                    onTap: () => _onMenuTap(menu['title']),
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          menu['icon'],
                          size: 40,
                          color: Colors.orange,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          menu['title'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),

            // ==== LISTVIEW DAFTAR DOSEN (Menggunakan ListView.builder dengan Card rapi) ====
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Daftar Dosen HIMA',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: dosenList.length,
              itemBuilder: (context, index) {
                final dosen = dosenList[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 15),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        dosen.gambarPath,
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 60,
                          width: 60,
                          color: Colors.grey,
                          child: const Icon(Icons.person,
                              size: 30, color: Colors.white),
                        ),
                      ),
                    ),
                    title: Text(
                      dosen.judul,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dosen.deskripsiSingkat),
                        Text('Jabatan: ${dosen.jabatan} | NIDN: ${dosen.nidn}'),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: Colors.orange),
                    onTap: () {
                      // Navigasi ke DetailDosenScreen saat diklik (sesuai aturan)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailDosenScreen(dosen: dosen),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
