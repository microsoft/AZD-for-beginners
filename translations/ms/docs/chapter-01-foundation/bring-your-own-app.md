# Bawa Aplikasi Anda Sendiri - Tambah azd ke Projek Sedia Ada

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Permulaan Pantas
- **⬅️ Sebelumnya**: [Projek Pertama Anda](first-project.md)
- **➡️ Seterusnya**: [Kontena Dev & Codespaces](dev-containers.md)

> Disahkan dengan `azd 1.27.1` pada Julai 2026.

## Pengenalan

Dalam [Projek Pertama Anda](first-project.md), anda melancarkan aplikasi dengan memulakan daripada templat. Tetapi kebanyakan masa anda sudah *mempunyai* aplikasi—API Node.js, perkhidmatan Python Flask, aplikasi web .NET—terletak dalam folder di mesin anda. Pelajaran ini menunjukkan cara untuk menambah azd ke kod sedia ada itu supaya anda boleh melancarkannya dengan `azd up`, tanpa memerlukan templat.

## Matlamat Pembelajaran

Menjelang akhir pelajaran ini, anda akan:
- Memahami tiga cara untuk memulakan projek azd
- Menjalankan `azd init` dalam kod sedia ada
- Memahami apa fungsi `azure.yaml` dan folder `infra/` untuk aplikasi anda
- Tahu bila hendak membiarkan azd menjana infrastruktur vs. menulis sendiri
- Melancarkan aplikasi sedia ada anda ke Azure dengan `azd up`

## Hasil Pembelajaran

Selepas menyelesaikan pelajaran ini, anda akan dapat:
- Memulakan azd dalam projek yang sudah anda miliki
- Membaca dan menyunting fail `azure.yaml` asas
- Menjana infrastruktur permulaan dengan `azd infra generate`
- Memilih hos Azure yang sesuai untuk aplikasi anda
- Melancarkan dan membersihkan aplikasi anda sendiri

---

## Tiga Cara Memulakan Projek azd

| Titik permulaan | Perintah | Bila digunakan |
|----------------|---------|-------------|
| **Daripada templat** | `azd init --template <name>` | Pembelajaran, atau memulakan aplikasi baru dari contoh terbukti |
| **Daripada kod sedia ada** | `azd init` (dalam folder projek anda) | Anda sudah ada aplikasi dan ingin melancarkannya |
| **Daripada repo Git** | `azd init --from-code` (dalam repo yang diklon) | Menggunakan azd untuk repositori sedia ada |

Anda sudah mencuba pilihan pertama. Pelajaran ini merangkumi pilihan kedua—senario sebenar yang paling biasa.

---

## Langkah 1: Jalankan `azd init` Dalam Projek Anda

Buka terminal **dalam folder projek sedia ada anda** dan jalankan:

```bash
cd my-existing-app
azd init
```

azd akan bertanya bagaimana anda mahu memulakan. Pilih:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Pilih **"Gunakan kod dalam direktori semasa."** azd kemudian mengimbas folder anda, mengesan bahasa dan rangka kerja anda, dan mencadangkan hos.

### Apa yang azd kesan

azd mencari isyarat seperti `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, atau `Dockerfile`, dan mencadangkan hos Azure yang sepadan:

| Aplikasi anda | Hos yang mungkin dikesan |
|-------------|--------------------------|
| Aplikasi Node.js / Python / .NET web | Azure App Service atau Container Apps |
| Aplikasi berkontena (`Dockerfile`) | Azure Container Apps |
| Aplikasi fungsi | Azure Functions |
| Laman statik (hasil binaan React/Vue) | Azure Static Web Apps |

Sahkan perkhidmatan yang dikesan, dan azd akan menyediakan fail yang anda perlukan.

---

## Langkah 2: Fahami Apa yang azd Buat

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

Ini adalah inti projek azd. Versi minima kelihatan seperti ini:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` adalah bahagian utama: setiap entri memetakan folder kod anda ke hos Azure. Jika aplikasi anda mempunyai frontend dan API, anda akan ada dua perkhidmatan.

### `infra/` — sumber Azure anda sebagai kod

Folder `infra/` menyimpan fail Bicep yang mentakrifkan sumber Azure yang aplikasi anda perlukan (App Service, pangkalan data, dll.). Anda tidak perlu menulis ini secara manual—azd menjana titik permulaan yang boleh berfungsi. Anda *boleh* menyuntingnya kemudian untuk menambah sumber atau mengukuhkan keselamatan (dibincangkan dalam [Bab 4](../chapter-04-infrastructure/README.md)).

> **Petua:** Mahu lihat atau sesuaikan infrastruktur yang dijana sebelum melancarkan? Jalankan `azd infra generate` (juga tersedia sebagai `azd infra synth`) untuk menulis IaC ke cakera supaya anda boleh semak dan kawal versi.

---

## Langkah 3: Tetapkan Konfigurasi Diperlukan

Jika aplikasi anda memerlukan tetapan atau rahsia (rentetan sambungan, kunci API), jangan kod keraskan mereka. Gunakan nilai persekitaran:

```bash
# Cipta persekitaran
azd env new dev

# Tetapkan nilai bukan rahsia
azd env set API_VERSION 1.0.0
```

Untuk rahsia sebenar, simpan dalam Key Vault dan rujuk dari infrastruktur anda—lihat [Bab 3: Konfigurasi & Pengesahan](../chapter-03-configuration/authsecurity.md).

---

## Langkah 4: Lancarkan

Sekarang gunakan aliran kerja yang sama yang anda sudah tahu:

```bash
# Sahkan (diperlukan untuk azd)
azd auth login

# Pratonton sumber yang akan dibuat
azd provision --preview

# Sediakan infrastruktur dan sebarkan kod anda
azd up
```

Apabila selesai, azd mencetak URL aplikasi anda. Sahkan dengan cara yang sama seperti aplikasi azd lain:

```bash
azd show           # tunjukkan titik hujung
azd monitor --logs # semak log jika perlu
```

---

## Isu Biasa Kali Pertama

| Gejala | Punca Mungkin | Penyelesaian |
|--------|--------------|------------|
| azd tidak mengesan aplikasi saya | Tiada manifest (contoh: `package.json`) | Tambah manifest, atau pilih hos secara manual semasa `azd init` |
| Gagal bina semasa `azd up` | Aplikasi perlu langkah bina | Tambah `buildCommand`/`outputPath` di bawah perkhidmatan dalam `azure.yaml` |
| Aplikasi mula tapi pulangkan ralat | Tiada konfigurasi/rahsia | Tetapkan nilai dengan `azd env set` atau sambungkan Key Vault |
| Hos salah dipilih | Pengesanan auto meneka | Sunting `host:` dalam `azure.yaml` dan jalankan semula `azd up` |

Untuk maklumat lanjut, lihat [Bab 7: Penyelesaian Masalah](../chapter-07-troubleshooting/README.md).

---

## Bersihkan

```bash
azd down --force --purge
```

---

## Rumusan

- `azd init` → **"Gunakan kod dalam direktori semasa"** menambah azd ke aplikasi yang anda sudah ada.
- `azure.yaml` memetakan folder kod anda ke hos Azure; `infra/` mentakrifkan sumber sebagai Bicep.
- `azd infra generate` membolehkan anda menyemak atau menyesuaikan infrastruktur yang dijana.
- Setelah dimulakan, aplikasi sedia ada anda menggunakan aliran kerja `azd up` / `azd down` yang sama seperti aplikasi berasaskan templat.

---

## 🔗 Navigasi

| Arah | Pelajaran |
|------|----------|
| **Sebelumnya** | [Projek Pertama Anda](first-project.md) |
| **Seterusnya** | [Kontena Dev & Codespaces](dev-containers.md) |

## 📖 Sumber Berkaitan

- [Asas AZD](azd-basics.md)
- [Bab 4: Infrastruktur sebagai Kod](../chapter-04-infrastructure/README.md)
- [Konfigurasi & Pengesahan](../chapter-03-configuration/authsecurity.md)
- [Lembaran Pintas Perintah](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->