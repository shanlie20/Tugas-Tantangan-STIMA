# Tugas Tantangan IF2211 - Stategi Algoritma
### Program Dynamic Programming untuk Persoalan TSP Menggunakan Ruby
#### Oleh Shannon Aurellius Anastasya Lie / 13523019 / K1

## _Dynamic Programming_ (DP)
Program Dinamis (_Dynamic Programming_/DP) adalah sebuah metode pemecahan masalah yang bekerja dengan menguraikan solusi menjadi serangkaian tahapan. Ini memungkinkan solusi keseluruhan untuk dilihat sebagai serangkaian keputusan yang saling berkaitan. Istilah "program" dalam konteks ini tidak merujuk pada pemrograman komputer, melainkan pada sebuah rencana atau prosedur. Sementara itu, kata "dinamis" menunjukkan bahwa proses pencarian solusi melibatkan perhitungan bertahap menggunakan tabel yang dapat berkembang. DP umumnya diterapkan untuk menyelesaikan persoalan-persoalan optimasi, baik itu maksimisasi maupun minimisasi.

## _Traveling Salesperson Problem_ (TSP)
Masalah Penjual Keliling (_Traveling Salesperson Problem_ atau TSP) adalah masalah optimasi klasik dalam ilmu komputer dan riset operasi. Tujuannya adalah mencari rute terpendek bagi seorang "penjual" untuk mengunjungi sejumlah kota, masing-masing tepat satu kali, dan kembali ke kota asal. Meskipun terlihat sederhana, menemukan solusi optimal untuk TSP adalah tantangan besar karena kompleksitasnya yang meningkat secara eksponensial seiring bertambahnya jumlah kota. Untuk kasus dengan jumlah kota yang tidak terlalu besar, TSP sering diselesaikan menggunakan algoritma _Branch and Bound_. Algoritma ini bekerja dengan membangun pohon ruang status dan secara cerdas memangkas cabang-cabang yang tidak mungkin mengarah ke solusi terbaik, mengurangi waktu komputasi yang signifikan dibandingkan pencarian _brute-force_.

## _Dependencies_
Program ini membutuhkan Ruby versi 2.5 ke atas. <br>
Cek apakah Ruby sudah terinstall dengan cara ```ruby -v``` <br>
Jika belum terinstall, silakan install Ruby dari https://www.ruby-lang.org/en/downloads/

## Struktur Repositori
```
Tugas-Tantangan-STIMA
├── main.rb
├── README.md
└── test/     # Berisi testing file dalam ekstensi .txt dan screenshots hasil testing
```

## Cara Menjalankan Program
Buka terminal IDE/cmd, kemudian masukkan perintah berikut
```
git clone 'https://github.com/shanlie20/Tugas-Tantangan-STIMA.git'
ruby main.rb
```

## Screenshots
1. Melakukan testing dengan cara menerima input melalui txt <br>
![Alt text](https://github.com/shanlie20/Tugas-Tantangan-STIMA/blob/main/test/test1.png) <br>
2. Melakukan testing dengan cara menerima input melalui terminal <br>
![Alt text](https://github.com/shanlie20/Tugas-Tantangan-STIMA/blob/main/test/test1.png)

## Referensi
Munir, R. (2025). Program Dinamis (Dynamic Programming) Bagian 1. Diakses dari https://informatika.stei.itb.ac.id/~rinaldi.munir/Stmik/2024-2025/25-Program-Dinamis-(2025)-Bagian1.pdf <br>
Munir, R. (2025). Algoritma Branch and Bound (Bagian 2). Diakses dari https://informatika.stei.itb.ac.id/~rinaldi.munir/Stmik/2024-2025/18-Algoritma-Branch-and-Bound-(2025)-Bagian2.pdf
