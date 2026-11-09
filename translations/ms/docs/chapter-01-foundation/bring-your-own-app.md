# Bawa Aplikasi Anda Sendiri - Tambah azd ke Projek Sedia Ada

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Permulaan Pantas
- **⬅️ Sebelumnya**: [Projek Pertama Anda](first-project.md)
- **➡️ Seterusnya**: [Dev Containers & Codespaces](dev-containers.md)

> Semakan arahan dan konfigurasi sasaran: `azd 1.37.2` (November 2026). Fail yang dijana bergantung pada aplikasi yang dikesan; pengedaran Azure tidak dijalankan dalam semakan ini.

## Pengenalan

Dalam [Projek Pertama Anda](first-project.md) anda mengedarkan aplikasi dengan bermula dari templat. Tetapi kebanyakan masa anda sudah *mempunyai* aplikasi—API Node.js, perkhidmatan Python Flask, aplikasi web .NET—yang terletak dalam folder pada mesin anda. Pelajaran ini menunjukkan cara untuk menambah azd pada kod sedia ada itu supaya anda boleh mengedar dengan `azd up`, tanpa perlu templat.

## Matlamat Pembelajaran

Menjelang akhir pelajaran ini, anda akan:
- Memahami tiga cara untuk memulakan projek azd
- Menjalankan `azd init` dalam asas kod yang sedia ada
- Memahami apa yang dilakukan oleh `azure.yaml` dan folder `infra/` untuk aplikasi anda
- Tahu bila untuk membiarkan azd menjana infrastruktur vs. menulis sendiri
- Mengedar aplikasi sedia ada anda ke Azure dengan `azd up`

## Hasil Pembelajaran

Selepas menamatkan pelajaran ini, anda akan dapat:
- Memulakan azd dalam projek yang anda sudah ada
- Membaca dan mengedit fail `azure.yaml` asas
- Menjana infrastruktur permulaan dengan `azd infra generate`
- Memilih hos Azure yang sesuai untuk aplikasi anda
- Mengedar dan membersihkan aplikasi anda sendiri

---

## Tiga Cara untuk Memulakan Projek azd

| Titik permulaan | Arahan | Bila digunakan |
|----------------|---------|-------------|
| **Dari templat** | `azd init --template <name> .` (direktori kosong) | Pembelajaran, atau memulakan aplikasi baru dari contoh yang terbukti |
| **Dari kod sedia ada anda** | `azd init` (dalam folder projek anda) | Anda sudah mempunyai aplikasi dan ingin mengedarkannya |
| **Dari repo Git** | `azd init --from-code` (dalam repo yang diklon) | Menggunakan azd untuk repositori sedia ada |

Anda sudah mengamalkan pilihan pertama. Pelajaran ini meliputi pilihan kedua—senario dunia nyata yang paling biasa.

---

## Langkah 1: Jalankan `azd init` Dalam Projek Anda

Buka terminal **dalam folder projek sedia ada anda** dan jalankan:

```bash
cd my-existing-app
azd init
```

azd akan bertanya bagaimana anda mahu inisialisasi. Pilih:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Pilih **"Gunakan kod dalam direktori semasa."** azd kemudian mengimbas folder anda, mengesan bahasa dan kerangka anda, dan mencadangkan hos.

### Apa yang azd kesan

azd mencari isyarat aplikasi seperti `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, atau `Dockerfile`. Aliran dari-kod bukan wizard pemilihan hos umum untuk setiap sasaran pengedaran yang disokong:

| Aplikasi anda | Hos yang mungkin dikesan |
|----------|----------------------|
| Aplikasi web Node.js / Python / .NET yang disokong | Biasanya Azure Container Apps; periksa definisi yang dijana |
| Aplikasi berbekas (`Dockerfile`) | Azure Container Apps |
| Aplikasi fungsi atau projek Static Web Apps | Gunakan templat sepadan atau buat `azure.yaml` dan infrastruktur jika dari-kod tidak menyokong susun atur anda |

Sahkan perkhidmatan yang dikesan, dan azd akan membina fail yang anda perlukan.

---

## Langkah 2: Fahami Apa Yang azd Cipta

Selepas inisialisasi, periksa `azure.yaml`. Aliran infrastruktur yang dijana boleh mengekalkan infrastruktur secara tersirat sehingga anda menjalankan `azd infra generate`; jangan anggap `infra/` sudah wujud:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — definisi projek

Ini adalah nadi projek azd. **Definisi App Service ilustrasi berikut** memerlukan infrastruktur App Service sepadan; ini bukan alasan untuk menukar hos Container Apps yang dijana tanpa menukar infrastruktur:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` adalah bahagian utama: setiap entri memetakan folder kod anda ke hos Azure. Jika aplikasi anda mempunyai frontend dan API, anda akan mempunyai dua perkhidmatan.

### `infra/` — sumber Azure anda sebagai kod

Folder `infra/` menyimpan fail Bicep yang menentukan sumber Azure yang aplikasi anda perlukan (App Service, pangkalan data, dll.). Anda tidak perlu menulis secara manual—azd menjana titik permulaan yang berfungsi. Anda *boleh* mengeditnya kemudian untuk menambah sumber atau menguatkan keselamatan (dibincangkan dalam [Bab 4](../chapter-04-infrastructure/README.md)).

> **Petua:** Mahu melihat atau menyesuaikan infrastruktur yang dijana sebelum mengedar? Jalankan `azd infra generate` (juga tersedia sebagai `azd infra synth`) untuk menulis IaC ke cakera supaya anda boleh menyemak dan mengawal versi.

---

## Langkah 3: Tetapkan Konfigurasi Diperlukan

Jika aplikasi anda memerlukan tetapan atau rahsia (rantaian sambungan, kunci API), jangan kod keraskan. Gunakan nilai persekitaran:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Ini hanya menyimpan nilai setempat. Untuk mempengaruhi aplikasi, gunakannya secara eksplisit dalam parameter infrastruktur, tetapan perkhidmatan yang disokong, atau hook; menetapkan pembolehubah sewenang-wenangnya tidak mengkonfigurasi runtime yang diedarkan.

Untuk rahsia sebenar, simpan dalam Key Vault dan rujuk dari infrastruktur anda—lihat [Bab 3: Konfigurasi & Pengesahan](../chapter-03-configuration/authsecurity.md).

---

## Langkah 4: Edar

Sekarang gunakan aliran kerja yang sama yang anda sudah tahu:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Apabila selesai, azd akan mencetak URL aplikasi anda. Sahkan ia sama seperti mana-mana aplikasi azd:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Isu Biasa Kali Pertama

| Gejala | Sebab Mungkin | Cara Betulkan |
|---------|--------------|-----|
| azd tidak mengesan aplikasi saya | Tiada manifest (contoh, `package.json`) | Tambah manifest, atau pilih hos secara manual semasa `azd init` |
| Pembinaan gagal semasa `azd up` | Aplikasi memerlukan langkah binaan | Konfigurasikan skrip pakej aplikasi atau hook perkhidmatan `prepackage`; gunakan `dist` untuk keluaran pengedaran, bukan `buildCommand`/`outputPath` |
| Aplikasi mula tetapi mengembalikan kesilapan | Tiada konfigurasi/rahsia | Sambungkan nilai ke tetapan aplikasi runtime atau rujukan Key Vault; hanya `azd env set` tidak mencukupi |
| Hos salah dipilih | Pengesanan auto tidak mengikut keperluan anda | Tukar kedua-dua `host:` dan infrastruktur bersesuaian, atau pilih templat yang sepadan |

Untuk maklumat lanjut, lihat [Bab 7: Penyelesaian Masalah](../chapter-07-troubleshooting/README.md).

---

## Membersihkan

```bash
azd down --force --purge
```

---

## Ringkasan

- `azd init` → **"Gunakan kod dalam direktori semasa"** menambah azd ke aplikasi yang anda sudah ada.
- `azure.yaml` memetakan folder kod anda ke hos Azure; `infra/` mentakrifkan sumber sebagai Bicep.
- `azd infra generate` membenarkan anda menyemak atau menyesuaikan infrastruktur yang dijana.
- Setelah diinisialisasi, aplikasi sedia ada anda menggunakan aliran kerja `azd up` / `azd down` yang sama dengan aplikasi berasaskan templat.

---

## 🔗 Navigasi

| Arah | Pelajaran |
|-----------|--------|
| **Sebelumnya** | [Projek Pertama Anda](first-project.md) |
| **Seterusnya** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Sumber Berkaitan

- [Asas AZD](azd-basics.md)
- [Bab 4: Infrastruktur sebagai Kod](../chapter-04-infrastructure/README.md)
- [Konfigurasi & Pengesahan](../chapter-03-configuration/authsecurity.md)
- [Lembaran Perintah](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->