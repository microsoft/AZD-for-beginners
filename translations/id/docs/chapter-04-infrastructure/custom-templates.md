# Membuat Template azd Anda Sendiri

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 4 - Infrastruktur sebagai Kode & Penyebaran
- **⬅️ Sebelumnya**: [Panduan Penyebaran](deployment-guide.md)
- **🚀 Bab Berikutnya**: [Bab 5: Solusi Multi-Agen](../chapter-05-multi-agent/README.md)

> Ditinjau terhadap `azd 1.37.2` (November 2026). Ini adalah **panduan pembuatan dengan file sebagian**, bukan template lengkap: Anda harus menyediakan kode aplikasi dan `modules/web.bicep` dengan lingkungan, registri, Container App, dan outputnya sebelum penyebaran. Penyediaan Azure tidak dijalankan dalam tinjauan ini.

## Pendahuluan

Sejauh ini Anda telah *menggunakan* template dengan `azd init --template <name>`. Namun setelah Anda memiliki tata letak proyek yang disukai tim Anda—misalnya, Container App dengan Cosmos DB dan pemantauan yang tepat—Anda pasti ingin mengubahnya menjadi template yang dapat digunakan ulang milik Anda sendiri. Template hanyalah repositori Git dengan struktur yang dapat diprediksi yang dapat dibaca oleh azd. Pelajaran ini menunjukkan bagaimana membangunnya dari awal, mengujinya, dan (opsional) mempublikasikannya ke galeri komunitas.

## Tujuan Pembelajaran

Pada akhir pelajaran ini, Anda akan:
- Memahami apa yang membuat suatu folder menjadi "template azd"
- Mengetahui file dan tata letak folder yang diperlukan
- Menambahkan `azure.yaml` dan `infra/` yang dapat digunakan ulang oleh orang lain
- Menguji template Anda secara lokal sebelum membagikannya
- Mempublikasikannya dan (opsional) mengirimkannya ke Awesome AZD

## Hasil Pembelajaran

Setelah menyelesaikan pelajaran ini, Anda akan bisa:
- Membuat kerangka kerja repositori template baru
- Memparametrisasi infrastruktur agar bekerja di langganan mana pun
- Memvalidasi template dengan `azd init` dan `azd up`
- Menambahkan metadata yang dibutuhkan galeri komunitas

---

## Apa Itu Template, Sebenarnya?

Template azd adalah **repositori Git** yang berisi, paling tidak:

| File / folder | Tujuan | Wajib? |
|---------------|---------|-----------|
| `azure.yaml` | Menjelaskan layanan, host, dan penyedia infra | ✅ Ya |
| `infra/` | Definisi penyediaan Bicep atau Terraform | Wajib untuk contoh IaC eksplisit ini; proyek dengan infrastruktur yang dihasilkan dapat mengabaikannya |
| `src/` (atau kode Anda) | Kode aplikasi yang disebarkan azd | Wajib untuk layanan berbasis kode sumber; tidak semua template berisi kode aplikasi |
| `README.md` | Cara menggunakan template | ✅ Sangat disarankan |
| `.azdo/` atau `.github/` | Definisi pipeline CI/CD | Opsional |
| `.devcontainer/` | Lingkungan pengembang yang dapat direproduksi | Opsional |
| `azure.yaml` `metadata` | Informasi identitas/telemetri template | Disarankan; publikasi repositori Git tidak mewajibkannya |

Tidak ada yang ajaib di sini: ketika Anda menjalankan `azd init --template you/your-repo`, azd mengkloning repo dan membaca `azure.yaml`.

---

## Langkah 1: Membuat Kerangka Repositori

Buat struktur folder secara manual atau mulai dari template minimal dan edit:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Tata letak akhir yang umum terlihat seperti ini:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## Langkah 2: Tulis `azure.yaml`

Ini adalah inti dari template. Ini memberi tahu azd apa yang diterapkan dan bagaimana:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Field `metadata.template` adalah yang digunakan telemetri galeri untuk menghitung penggunaan. Gunakan konvensi `name@version`.

---

## Langkah 3: Parametrisasi Infrastruktur

Aturan terpenting untuk template *yang dapat digunakan ulang*: **jangan pernah menuliskan nama, wilayah, atau nilai langganan secara eksplisit.** Gunakan parameter dan pola token sumber daya agar template yang sama bekerja di langganan siapa pun.

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Dua hal membuat template ini ramah:

1. **Tag `azd-env-name`** — azd menggunakannya untuk melacak dan membersihkan sumber daya per lingkungan.
2. **Token sumber daya `uniqueString(...)`** — menghasilkan sufiks hash stabil untuk mengurangi tabrakan; ini bukan jaminan keunikan global.

`modules/web.bicep` yang hilang harus menerima `name`, `location`, dan `tags`, menyediakan lingkungan/registri Container Apps dan aplikasi, menandai aplikasi dengan `azd-service-name: web`, dan mengekspor `uri`. Juga harus mengekspose nilai registri yang dibutuhkan oleh alur build/deploy yang dipilih (misalnya `AZURE_CONTAINER_REGISTRY_ENDPOINT` dari modul root). Output endpoint saja tidak menyambungkan penemuan layanan, pengaturan aplikasi, atau autentikasi registri.

Sediakan file parameter yang sesuai yang membaca nilai yang disuntik oleh azd dari lingkungan:

Simpan berikut sebagai `infra/main.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd secara otomatis menggantikan `${AZURE_ENV_NAME}` dan `${AZURE_LOCATION}` dari lingkungan saat ini.

---

## Langkah 4: Uji Template Anda Secara Lokal

Sebelum membagikan, buktikan template bekerja dari kondisi bersih.

**Uji dari folder lokal** (tanpa perlu push Git):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Kemudian uji pembersihan**—template yang baik membersihkan semua sumber daya dengan tuntas:

```bash
azd down --force --purge
```

Jika `azd down` meninggalkan sumber daya, periksa penemuan lingkungan/grup sumber daya, sumber daya eksternal/bersama, izin, kunci, dan perlindungan penghapusan. `--purge` tidak menghapus status lokal `.azure/`.

> **Tip:** setelah menyediakan semua file yang hilang, jalankan `azd provision --preview` terlebih dahulu. Periksa hook sebelum preview karena hook dapat menjalankan perintah yang menyebabkan efek samping. Preview bukan estimasi harga atau jaminan bahwa penyediaan akan berhasil.

---

## Langkah 5: Publikasikan Template

Push repositori ke GitHub (publik jika Anda ingin orang lain menggunakannya):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Siapapun sekarang dapat menggunakannya:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Langkah 6 (Opsional): Kirim ke Awesome AZD

Galeri [Awesome AZD](https://azure.github.io/awesome-azd/) mencantumkan template komunitas. Untuk terdaftar, repo Anda harus menyertakan:

- ✅ Sebuah `README.md` yang jelas dengan prasyarat, diagram arsitektur, dan catatan biaya
- ✅ Sebuah `azure.yaml` yang berfungsi dengan `metadata.template`
- ✅ Infrastruktur yang menyediakan provisioning dengan bersih di langganan baru
- ✅ Sebuah file `LICENSE`
- ✅ (Direkomendasikan) Sebuah `.devcontainer/` untuk Codespaces satu-klik

Kirimkan dengan membuka pull request yang menambahkan template Anda ke file data galeri, mengikuti panduan kontribusi di [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Kesalahan Umum

| Kesalahan | Perbaikan |
|---------|-----|
| Nama sumber daya dikodekan keras | Gunakan token sumber daya `uniqueString()` |
| `azd down` meninggalkan sumber daya | Tandai setiap sumber daya (atau grup sumber daya) dengan `azd-env-name` |
| Template berfungsi untuk Anda, gagal untuk orang lain | Hapus ID langganan, ID tenant, dan asumsi wilayah |
| Output tidak terhubung ke aplikasi | Cocokkan `azd-service-name`/`resourceName` untuk deployment dan secara eksplisit petakan output ke pengaturan aplikasi |
| Pengajuan galeri ditolak | Tambahkan `README.md`, `LICENSE`, dan `metadata.template` |

---

## Ringkasan

- Template adalah repo Git dengan `azure.yaml`, `infra/`, dan kode Anda.
- Parametrisasi semua hal—nama, wilayah, dan ID—agar dapat berjalan di mana saja.
- Selalu beri tag sumber daya dengan `azd-env-name` agar `azd down` berfungsi.
- Uji secara lokal dengan `azd init --template <local-path>` sebelum dipublikasikan.
- Tambahkan metadata dan README untuk mengirimkan ke Awesome AZD.

---

## 🔗 Navigasi

| Arah | Sumber Daya |
|-----------|----------|
| **Sebelumnya** | [Panduan Deployment](deployment-guide.md) |
| **Beranda Bab** | [Bab 4: Infrastruktur sebagai Kode](README.md) |
| **Bab Berikutnya** | [Bab 5: Solusi Multi-Agen](../chapter-05-multi-agent/README.md) |

## 📖 Sumber Daya Terkait

- [Penyediaan Sumber Daya](provisioning.md)
- [Galeri Awesome AZD](https://azure.github.io/awesome-azd/)
- [Dokumentasi template azd resmi](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->