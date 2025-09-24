// Base class abstrak untuk konten HIMA (Encapsulation: private fields + getter/setter)
abstract class HimaContent {
  String _id;
  String _judul; // Misal: Nama dosen atau judul konten
  String _deskripsiSingkat; // Misal: Bidang keahlian singkat
  String _deskripsiLengkap; // Deskripsi lebih panjang untuk detail
  String _gambarPath;

  HimaContent({
    required String id,
    required String judul,
    required String deskripsiSingkat,
    required String deskripsiLengkap,
    required String gambarPath,
  })  : _id = id,
        _judul = judul,
        _deskripsiSingkat = deskripsiSingkat,
        _deskripsiLengkap = deskripsiLengkap,
        _gambarPath = gambarPath;

  // Getters (Encapsulation)
  String get id => _id;
  String get judul => _judul;
  String get deskripsiSingkat => _deskripsiSingkat;
  String get deskripsiLengkap => _deskripsiLengkap;
  String get gambarPath => _gambarPath;

  // Setters dengan validasi (Encapsulation)
  set judul(String value) {
    if (value.trim().isEmpty) {
      throw ArgumentError('Judul/Nama tidak boleh kosong');
    }
    _judul = value.trim();
  }

  set deskripsiSingkat(String value) {
    _deskripsiSingkat = value.trim();
  }

  set deskripsiLengkap(String value) {
    _deskripsiLengkap = value.trim();
  }

  set gambarPath(String value) {
    _gambarPath = value;
  }

  // Polymorphism: Method abstrak yang di-override di subclass
  String getDisplayInfo();

  // Method umum untuk konversi ke Map (misal untuk database/API)
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'judul': _judul,
      'deskripsiSingkat': _deskripsiSingkat,
      'deskripsiLengkap': _deskripsiLengkap,
      'gambarPath': _gambarPath,
    };
  }
}

// Subclass untuk Dosen HIMA (Inheritance dari HimaContent)
class DosenHima extends HimaContent {
  String _nidn;
  String _jabatan;
  String _bidangKeahlian;

  DosenHima({
    required super.id,
    required super.judul, // judul = Nama Dosen
    required super.deskripsiSingkat, // deskripsiSingkat = Bidang Keahlian Singkat
    required super.deskripsiLengkap, // deskripsiLengkap = Riwayat Pendidikan/Publikasi
    required super.gambarPath, // gambarPath = Foto Dosen
    required String nidn,
    required String jabatan,
    required String bidangKeahlian,
  })  : _nidn = nidn,
        _jabatan = jabatan,
        _bidangKeahlian = bidangKeahlian;

  // Getter tambahan
  String get nidn => _nidn;
  String get jabatan => _jabatan;
  String get bidangKeahlian => _bidangKeahlian;

  // Setter tambahan
  set nidn(String value) {
    _nidn = value;
  }

  set jabatan(String value) {
    _jabatan = value;
  }

  set bidangKeahlian(String value) {
    _bidangKeahlian = value;
  }

  // Polymorphism: Override untuk info spesifik dosen
  @override
  String getDisplayInfo() {
    return 'Dosen: ${super.judul} - $_jabatan (NIDN: $_nidn, Keahlian: $_bidangKeahlian)';
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'nidn': _nidn,
      'jabatan': _jabatan,
      'bidangKeahlian': _bidangKeahlian,
    };
  }
}
