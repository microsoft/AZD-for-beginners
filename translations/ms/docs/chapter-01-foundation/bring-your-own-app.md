# Bawa Aplikasi Anda Sendiri - Tambah azd ke Projek Sedia Ada

**Chapter Navigation:**
- **📚 Laman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Mula Pantas
- **⬅️ Sebelumnya**: [Projek Pertama Anda](first-project.md)
- **➡️ Seterusnya**: [Kontena Dev & Codespaces](dev-containers.md)

> Disahkan menggunakan `azd 1.25.6` pada Jun 2026.

## Pengenalan

Dalam [Projek Pertama Anda](first-project.md) anda menyebarkan aplikasi dengan bermula dari templat. Tetapi kebanyakan masa anda sudah pun *mempunyai* aplikasi—sebuah API Node.js, perkhidmatan Python Flask, aplikasi web .NET—yang terletak dalam folder di mesin anda. Pelajaran ini menunjukkan cara menambah azd ke kod sedia ada itu supaya anda boleh menyebarkannya dengan `azd up`, tiada templat diperlukan.

## Matlamat Pembelajaran

Pada akhir pelajaran ini, anda akan:
- Faham tiga cara untuk memulakan projek azd
- Jalankan `azd init` di dalam pangkalan kod sedia ada
- Faham apa yang `azure.yaml` dan folder `infra/` lakukan untuk aplikasi anda
- Tahu bila untuk membiarkan azd menjana infrastruktur vs. menulis sendiri
- Sebarkan aplikasi sedia ada anda ke Azure dengan `azd up`

## Hasil Pembelajaran

Selepas menyelesaikan pelajaran ini, anda akan dapat:
- Menginisialisasi azd dalam projek yang anda sudah ada
- Membaca dan mengedit fail asas `azure.yaml`
- Menjana infrastruktur permulaan dengan `azd infra generate`
- Memilih hos Azure yang sesuai untuk aplikasi anda
- Menyebarkan dan membersihkan aplikasi anda sendiri

---

## Tiga Cara untuk Memulakan Projek azd

| Titik permulaan | Arahan | Bila untuk digunakan |
|----------------|---------|-------------|
| **Daripada templat** | `azd init --template <name>` | Untuk pembelajaran, atau memulakan aplikasi baru dari contoh yang terbukti |
| **Daripada kod sedia ada anda** | `azd init` (dalam folder projek anda) | Anda sudah mempunyai aplikasi dan mahu menyebarkannya |
| **Daripada repositori Git** | `azd init --from-code` (dalam repo yang diklon) | Mengadaptasi azd untuk repositori sedia ada |

Anda sudah mengamalkan pilihan pertama. Pelajaran ini merangkumi kedua—senario dunia sebenar yang paling biasa.

---

## Langkah 1: Jalankan `azd init` dalam Projek Anda

Buka terminal **dalam folder projek sedia ada anda** dan jalankan:

```bash
cd my-existing-app
azd init
```

azd akan bertanya bagaimana anda mahu menginisialisasi. Pilih:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Pilih **"Gunakan kod dalam direktori semasa."** azd kemudian mengimbas folder anda, mengesan bahasa dan rangka kerja anda, dan mencadangkan hos.

### Apa yang azd mengesan

azd mencari isyarat seperti `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, atau sebuah `Dockerfile`, dan mencadangkan hos Azure yang sepadan:

| Aplikasi anda | Hos Azure yang mungkin dikesan |
|----------|----------------------|
| Aplikasi web Node.js / Python / .NET | Azure App Service atau Container Apps |
| Aplikasi bercontainer (`Dockerfile`) | Azure Container Apps |
| Aplikasi fungsi | Azure Functions |
| Laman statik (output binaan React/Vue) | Azure Static Web Apps |

Sahkan perkhidmatan yang dikesan, dan azd akan menjana fail yang anda perlukan.

---

## Langkah 2: Fahami Apa yang azd Cipta

Selepas init, anda akan mempunyai dua perkara baru dalam projek anda:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — definisi projek

Ini adalah inti sebuah projek azd. Sebuah versi minimal kelihatan seperti ini:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` adalah bahagian utama: setiap entri memetakan sebuah folder kod anda kepada hos Azure. Jika aplikasi anda mempunyai frontend dan API, anda akan mempunyai dua perkhidmatan.

### `infra/` — sumber Azure anda sebagai kod

Folder `infra/` mengandungi fail Bicep yang mentakrifkan sumber Azure yang aplikasi anda perlukan (App Service, pangkalan data, dsb.). Anda tidak perlu menulis ini secara manual—azd menjana titik permulaan yang berfungsi. Anda *boleh* mengeditnya kemudian untuk menambah sumber atau menguatkan keselamatan (dijelaskan dalam [Bab 4](../chapter-04-infrastructure/README.md)).

> **Petua:** Mahu melihat atau menyesuaikan infrastruktur yang dijana sebelum menyebarkan? Jalankan `azd infra generate` (juga tersedia sebagai `azd infra synth`) untuk menulis IaC ke disk supaya anda boleh menyemak dan mengawalnya melalui versi.

---

## Langkah 3: Tetapkan Konfigurasi Diperlukan

Jika aplikasi anda memerlukan tetapan atau rahsia (rentetan sambungan, kunci API), jangan kodkannya secara statik. Gunakan nilai persekitaran:

```bash
# Cipta persekitaran
azd env new dev

# Tetapkan nilai bukan rahsia
azd env set API_VERSION 1.0.0
```

Untuk rahsia sebenar, simpan dalam Key Vault dan rujuk daripadanya dari infrastruktur anda—lihat [Bab 3: Konfigurasi & Pengesahan](../chapter-03-configuration/authsecurity.md).

---

## Langkah 4: Sebarkan

Kini gunakan aliran kerja yang sama yang anda sudah tahu:

```bash
# Sahkan (diperlukan untuk azd)
azd auth login

# Pratonton sumber yang akan dibuat
azd provision --preview

# Sediakan infrastruktur dan terapkan kod anda
azd up
```

Apabila ia selesai, azd akan mencetak URL aplikasi anda. Sahkan dengan cara yang sama seperti mana-mana aplikasi azd:

```bash
azd show           # paparkan titik akhir
azd monitor --logs # semak log jika perlu
```

---

## Isu Biasa Kali Pertama

| Gejala | Punca yang mungkin | Pembetulan |
|---------|--------------|-----|
| azd tidak mengesan aplikasi saya | Manifes hilang (contoh: `package.json`) | Tambah manifes, atau pilih hos secara manual semasa `azd init` |
| Pembinaan gagal semasa `azd up` | Aplikasi memerlukan langkah binaan | Tambahkan `buildCommand`/`outputPath` di bawah perkhidmatan dalam `azure.yaml` |
| Aplikasi bermula tetapi memulangkan ralat | Konfigurasi/rahsia hilang | Tetapkan nilai dengan `azd env set` atau sambungkan Key Vault |
| Hos salah dipilih | Pengesanan automatik meneka | Edit `host:` dalam `azure.yaml` dan jalankan semula `azd up` |

Untuk maklumat lanjut, lihat [Bab 7: Penyelesaian Masalah](../chapter-07-troubleshooting/README.md).

---

## Bersihkan

```bash
azd down --force --purge
```

---

## Ringkasan

- `azd init` → **"Gunakan kod dalam direktori semasa"** menambah azd kepada aplikasi yang sudah anda miliki.
- `azure.yaml` memetakan folder kod anda kepada hos Azure; `infra/` mentakrifkan sumber sebagai Bicep.
- `azd infra generate` membolehkan anda menyemak atau menyesuaikan infrastruktur yang dijana.
- Selepas diinisialisasi, aplikasi sedia ada anda menggunakan aliran kerja `azd up` / `azd down` yang sama seperti aplikasi berasaskan templat.

---

## 🔗 Navigasi

| Arah | Pelajaran |
|-----------|--------|
| **Sebelumnya** | [Projek Pertama Anda](first-project.md) |
| **Seterusnya** | [Kontena Dev & Codespaces](dev-containers.md) |

## 📖 Sumber Berkaitan

- [Asas AZD](azd-basics.md)
- [Bab 4: Infrastruktur sebagai Kod](../chapter-04-infrastructure/README.md)
- [Konfigurasi & Pengesahan](../chapter-03-configuration/authsecurity.md)
- [Ringkasan Perintah](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->