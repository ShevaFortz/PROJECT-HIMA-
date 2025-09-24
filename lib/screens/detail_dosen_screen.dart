import 'package:flutter/material.dart';
import '../models/hima_content.dart'; // Import model DosenHima

class DetailDosenScreen extends StatelessWidget {
  final DosenHima dosen;

  const DetailDosenScreen({super.key, required this.dosen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Dosen'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Dosen (besar)
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  dosen.gambarPath,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child:
                        const Icon(Icons.person, size: 80, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Nama Dosen (Judul)
            Text(
              dosen.judul,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // Info Singkat (NIDN, Jabatan, Bidang Keahlian - Card rapi)
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.badge, size: 18, color: Colors.orange[700]),
                        const SizedBox(width: 8),
                        Text('NIDN: ${dosen.nidn}',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[800])),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.school, size: 18, color: Colors.orange[700]),
                        const SizedBox(width: 8),
                        Text('Jabatan: ${dosen.jabatan}',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[800])),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.work, size: 18, color: Colors.orange[700]),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Bidang Keahlian: ${dosen.bidangKeahlian}',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[800]),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      dosen.getDisplayInfo(), // Polymorphism: Info khusus dosen
                      style: TextStyle(
                        color: Colors.orange[700],
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Deskripsi Lengkap (Riwayat Pendidikan/Publikasi)
            const Text(
              'Riwayat & Pengalaman:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              dosen.deskripsiLengkap,
              style:
                  TextStyle(fontSize: 16, height: 1.5, color: Colors.grey[700]),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),

            // Tombol Kontak (Opsional, interaktif)
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Hubungi ${dosen.judul} via email hima@unesa.ac.id'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                },
                icon: const Icon(Icons.email),
                label: const Text('Hubungi Dosen'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
