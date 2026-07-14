# Membuat Template azd Anda Sendiri

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 4 - Infrastruktur sebagai Kode & Penyebaran
- **⬅️ Sebelumnya**: [Panduan Penyebaran](deployment-guide.md)
- **🚀 Bab Selanjutnya**: [Bab 5: Solusi Multi-Agen](../chapter-05-multi-agent/README.md)

> Divalidasi dengan `azd 1.27.1` pada Juli 2026.

## Pendahuluan

Sejauh ini Anda telah *menggunakan* template dengan `azd init --template <nama>`. Tetapi setelah Anda memiliki tata letak proyek yang disukai tim—misalnya, Container App dengan Cosmos DB dan pemantauan yang tepat—Anda akan ingin mengubahnya menjadi template yang dapat digunakan kembali. Template hanyalah repositori Git dengan struktur yang dapat diprediksi yang azd bisa baca. Pelajaran ini menunjukkan cara membuatnya dari awal, menguji, dan (opsional) mempublikasikannya ke galeri komunitas.

## Tujuan Pembelajaran

Pada akhir pelajaran ini, Anda akan:
- Memahami apa yang membuat folder menjadi "template azd"
- Mengetahui file dan tata letak folder yang dibutuhkan
- Menambahkan `azure.yaml` dan `infra/` yang dapat digunakan kembali oleh orang lain
- Menguji template Anda secara lokal sebelum membagikannya
- Mempublikasikannya dan (opsional) mengirimkannya ke Awesome AZD

## Hasil Pembelajaran

Setelah menyelesaikan pelajaran ini, Anda akan bisa:
- Membuat kerangka kerja repositori template baru
- Memparameterisasi infrastruktur agar bekerja di langganan mana pun
- Memvalidasi template dengan `azd init` dan `azd up`
- Menambahkan metadata yang dibutuhkan galeri komunitas

---

## Apa Sebenarnya Template Itu?

Template azd adalah **repositori Git** yang berisi, paling tidak:

| File / folder | Tujuan | Wajib? |
|---------------|---------|-----------|
| `azure.yaml` | Menjelaskan layanan, host, dan penyedia infra | ✅ Ya |
| `infra/` | Bicep, Terraform, atau Pulumi yang menyediakan sumber daya | ✅ Ya |
| `src/` (atau kode Anda) | Kode aplikasi yang dideploy oleh azd | ✅ Ya |
| `README.md` | Cara menggunakan template | ✅ Sangat disarankan |
| `.azdo/` atau `.github/` | Definisi pipeline CI/CD | Opsional |
| `.devcontainer/` | Lingkungan dev yang dapat direproduksi | Opsional |
| `azure.yaml` `metadata` | Info galeri + telemetri | Opsional (dibutuhkan untuk publikasi) |

Tidak ada hal ajaib di sini: saat Anda menjalankan `azd init --template you/your-repo`, azd akan mengkloning repo dan membaca `azure.yaml`.

---

## Langkah 1: Membuat Kerangka Repositori

Buat struktur folder secara manual atau mulai dari template minimal dan edit:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Buat tata letak standar
mkdir -p src infra
```

Tata letak akhir yang khas terlihat seperti ini:

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

Ini adalah inti dari template. Ini memberi tahu azd apa yang harus dideploy dan bagaimana:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Field `metadata.template` adalah yang digunakan telemetri galeri untuk menghitung penggunaan. Gunakan konvensi `nama@versi`.

---

## Langkah 3: Parameterisasi Infrastruktur

Aturan paling penting untuk template *yang dapat digunakan ulang*: **jangan pernah menggunakan nama, wilayah, atau nilai spesifik langganan secara keras.** Gunakan parameter dan pola token sumber daya agar template yang sama bisa bekerja di langganan siapa pun.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Dua hal membuat ini ramah template:

1. **Tag `azd-env-name`** — azd menggunakannya untuk melacak dan membersihkan sumber daya per lingkungan.
2. **Token sumber daya `uniqueString(...)`** — menghasilkan suffiks unik dan stabil secara global agar nama tidak bertabrakan.

Sediakan file parameter yang sesuai yang membaca nilai yang diinjeksi azd dari lingkungan:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd menggantikan `${AZURE_ENV_NAME}` dan `${AZURE_LOCATION}` dari lingkungan saat ini secara otomatis.

---

## Langkah 4: Uji Template Anda Secara Lokal

Sebelum membagikan, buktikan template bekerja dari keadaan bersih.

**Uji dari folder lokal** (tidak perlu push Git):

```bash
# Dari direktori kosong, inisialisasi menggunakan jalur template lokal Anda
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisi + deploy dari awal sampai akhir
azd auth login
azd up
```

**Kemudian uji pembersihan**—template yang baik membersihkan seluruhnya:

```bash
azd down --force --purge
```

Jika `azd down` meninggalkan sumber daya, kemungkinan Anda lupa memberi tag `azd-env-name` pada suatu sumber daya.

> **Tip:** jalankan `azd provision --preview` dulu. Ini melakukan simulasi apa yang akan terjadi dan menampilkan kesalahan template sebelum sumber daya dibuat.

---

## Langkah 5: Publikasikan Template

Push repositori ke GitHub (publik jika Anda ingin orang lain menggunakannya):

```bash
gh repo create my-azd-template --public --source=. --push
```

Siapapun sekarang bisa menggunakannya:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Langkah 6 (Opsional): Kirim ke Awesome AZD

[Galeri Awesome AZD](https://azure.github.io/awesome-azd/) mencantumkan template komunitas. Agar tercantum, repo Anda harus menyertakan:

- ✅ Sebuah `README.md` yang jelas dengan prasyarat, diagram arsitektur, dan catatan biaya
- ✅ `azure.yaml` yang berfungsi dengan `metadata.template`
- ✅ Infrastruktur yang dapat disediakan bersih di langganan baru
- ✅ Sebuah file `LICENSE`
- ✅ (Disarankan) `.devcontainer/` untuk Codespaces satu-klik

Kirimkan dengan membuka pull request yang menambahkan template Anda ke file data galeri, mengikuti panduan kontribusi di [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Kesalahan Umum

| Kesalahan | Perbaikan |
|---------|-----|
| Nama sumber daya yang dikodekan keras | Gunakan token sumber daya `uniqueString()` |
| `azd down` meninggalkan sumber daya | Beri tag setiap sumber daya (atau grup sumber daya) dengan `azd-env-name` |
| Template bekerja untuk Anda, gagal untuk orang lain | Hapus ID langganan, ID tenant, dan asumsi wilayah |
| Output tidak terhubung ke aplikasi | Ekspor `SERVICE_<NAME>_ENDPOINT_URL` dan output `AZURE_*` lainnya |
| Penyerahan galeri ditolak | Tambahkan `README.md`, `LICENSE`, dan `metadata.template` |

---

## Ringkasan

- Template hanyalah repositori Git dengan `azure.yaml`, `infra/`, dan kode Anda.
- Parameterisasi semuanya—nama, wilayah, dan ID—agar berjalan di mana saja.
- Selalu beri tag sumber daya dengan `azd-env-name` agar `azd down` berfungsi.
- Uji secara lokal dengan `azd init --template <jalur-lokal>` sebelum dipublikasikan.
- Tambahkan metadata dan README untuk mengirim ke Awesome AZD.

---

## 🔗 Navigasi

| Arah | Sumber Daya |
|-----------|----------|
| **Sebelumnya** | [Panduan Penyebaran](deployment-guide.md) |
| **Beranda Bab** | [Bab 4: Infrastruktur sebagai Kode](README.md) |
| **Bab Selanjutnya** | [Bab 5: Solusi Multi-Agen](../chapter-05-multi-agent/README.md) |

## 📖 Sumber Daya Terkait

- [Penyediaan Sumber Daya](provisioning.md)
- [Galeri Awesome AZD](https://azure.github.io/awesome-azd/)
- [Dokumentasi template azd resmi](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->