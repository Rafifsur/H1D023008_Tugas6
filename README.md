# H1D023008 TUGAS 6


## Penjelasan: Passing Data dari Form ke Tampilan

Pada tugas ini kita menambahkan dua file UI di `lib/ui`:

- `form_data.dart` — berisi form input (Nama, NIM, Tahun Lahir). Setelah user menekan tombol, aplikasi akan menavigasi ke layar hasil dan mengirim data yang diisi.
- `tampil_data.dart` — menerima data melalui konstruktor dan menampilkan hasil input.

Prinsip passing datanya sederhana dan umum di Flutter:

1. Ambil data dari `TextEditingController` setelah validasi form.
2. Panggil `Navigator.push` lalu buat instance layar tujuan dengan memasukkan data sebagai parameter konstruktor.

Contoh kode (dari `form_data.dart`):

```dart
Navigator.push(
	context,
	MaterialPageRoute(
		builder: (context) => TampilData(
			nama: nama,
			nim: nim,
			tahunLahir: tahun,
		),
	),
);
```

Di `tampil_data.dart`, kita membuat widget dengan konstruktor yang menerima data:

```dart
class TampilData extends StatelessWidget {
	final String nama;
	final String nim;
	final String tahunLahir;

	const TampilData({Key? key, required this.nama, required this.nim, required this.tahunLahir}) : super(key: key);

	// build() menampilkan data
}
```

Dengan pendekatan ini data dikirim langsung melalui konstruktor widget tujuan. Ini cocok untuk kasus sederhana. Untuk kebutuhan yang lebih kompleks (state global, sinkronisasi, persistensi) bisa dipertimbangkan teknik lain seperti Provider, Riverpod, atau Bloc.



