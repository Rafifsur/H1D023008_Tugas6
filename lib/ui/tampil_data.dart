import 'package:flutter/material.dart';

class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final String tahunLahir;

  const TampilData({Key? key, required this.nama, required this.nim, required this.tahunLahir}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int? tahun = int.tryParse(tahunLahir);
    final int umur = (tahun != null) ? (DateTime.now().year - tahun) : 0;

    final String teks = tahun != null
        ? 'Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun'
        : 'Nama saya $nama, NIM $nim, dan tahun lahir tidak valid';

    final theme = Theme.of(context);
    final Color primary = theme.colorScheme.primary;
    final Color onPrimary = theme.colorScheme.onPrimary;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const Text('Perkenalan'),
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [primary, primary.withOpacity(0.85)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: onPrimary.withOpacity(0.12),
                      child: Text(
                        nama.isNotEmpty ? nama[0].toUpperCase() : '?',
                        style: TextStyle(color: onPrimary, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            teks,
                            style: TextStyle(fontSize: 16, height: 1.5, color: onPrimary),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(Icons.calendar_month, size: 16, color: onPrimary.withOpacity(0.9)),
                              const SizedBox(width: 6),
                              Text(
                                tahun != null ? 'Tahun Lahir: $tahun' : 'Tahun lahir tidak valid',
                                style: TextStyle(fontSize: 13, color: onPrimary.withOpacity(0.9)),
                              ),
                              const Spacer(),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: onPrimary,
                                  side: BorderSide(color: onPrimary.withOpacity(0.9)),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Back'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
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
