# Menulis Template azd Anda Sendiri

**Chapter Navigation:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 4 - Infrastruktur sebagai Kode & Penyebaran
- **⬅️ Sebelumnya**: [Panduan Penyebaran](deployment-guide.md)
- **🚀 Bab Berikutnya**: [Bab 5: Solusi Multi-Agen](../chapter-05-multi-agent/README.md)

> Divalidasi terhadap `azd 1.25.6` pada Juni 2026.

## Introduction

Sejauh ini Anda telah *menggunakan* template dengan `azd init --template <name>`. Tetapi setelah Anda memiliki tata letak proyek yang disukai tim Anda—misalnya, sebuah Container App dengan Cosmos DB dan pemantauan yang tepat—Anda akan ingin mengubahnya menjadi template yang dapat digunakan kembali. Sebuah template hanyalah repositori Git dengan struktur yang dapat diprediksi yang dapat dibaca azd. Pelajaran ini menunjukkan cara membuatnya dari awal, mengujinya, dan (opsional) menerbitkannya ke galeri komunitas.

## Learning Goals

Di akhir pelajaran ini, Anda akan:
- Memahami apa yang membuat sebuah folder menjadi "template azd"
- Mengetahui file dan tata letak folder yang dibutuhkan
- Menambahkan `azure.yaml` dan `infra/` yang dapat digunakan kembali oleh orang lain
- Menguji template Anda secara lokal sebelum membagikannya
- Mempublikasikannya dan (opsional) mengirimkannya ke Awesome AZD

## Learning Outcomes

Setelah menyelesaikan pelajaran ini, Anda akan mampu:
- Membuat kerangka repository template baru
- Mem-parameter-kan infrastruktur sehingga bekerja di subscription manapun
- Memvalidasi template dengan `azd init` dan `azd up`
- Menambahkan metadata yang dibutuhkan galeri komunitas

---

## Sebenarnya, Apa Itu Template?

Sebuah template azd adalah **repositori Git** yang berisi, paling tidak:

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | Menjelaskan layanan, host, dan penyedia infra | ✅ Ya |
| `infra/` | Bicep, Terraform, atau Pulumi yang menyediakan sumber daya | ✅ Ya |
| `src/` (or your code) | Kode aplikasi yang dideploy azd | ✅ Ya |
| `README.md` | Cara menggunakan template | ✅ Sangat disarankan |
| `.azdo/` atau `.github/` | Definisi pipeline CI/CD | Opsional |
| `.devcontainer/` | Lingkungan dev yang dapat direproduksi | Opsional |
| `azure.yaml` `metadata` | Informasi galeri + telemetri | Opsional (diperlukan untuk menerbitkan) |

Tidak ada yang ajaib di sini: ketika Anda menjalankan `azd init --template you/your-repo`, azd meng-clone repo dan membaca `azure.yaml`.

---

## Step 1: Scaffold the Repository

Buat struktur folder secara manual atau mulai dari template minimal dan sunting:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Buat tata letak standar
mkdir -p src infra
```

A typical finished layout looks like this:

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

## Step 2: Write `azure.yaml`

Ini adalah inti dari template. File ini memberi tahu azd apa yang harus dideploy dan bagaimana:

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

> Field `metadata.template` adalah apa yang digunakan telemetri galeri untuk menghitung penggunaan. Gunakan konvensi `name@version`.

---

## Step 3: Parameterize the Infrastructure

Aturan paling penting untuk template yang *dapat digunakan kembali*: **jangan pernah meng-hardcode nama, region, atau nilai khusus subscription.** Gunakan parameter dan pola token resource sehingga template yang sama bekerja di subscription siapa pun.

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

Dua hal membuat ini ramah-template:

1. **Tag `azd-env-name`** — azd menggunakannya untuk melacak dan membersihkan sumber daya per environment.
2. **Token resource `uniqueString(...)`** — menghasilkan akhiran yang stabil dan unik secara global sehingga nama tidak saling bertabrakan.

Sediakan file parameter yang sesuai yang membaca nilai yang di-inject azd dari environment:

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

azd menggantikan `${AZURE_ENV_NAME}` dan `${AZURE_LOCATION}` dari environment saat ini secara otomatis.

---

## Step 4: Test Your Template Locally

Sebelum membagikan, buktikan bahwa template bekerja dari keadaan bersih.

**Uji dari folder lokal** (tidak perlu push ke Git):

```bash
# Dari direktori kosong, inisialisasi menggunakan jalur template lokal Anda
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Penyediaan + penerapan dari ujung ke ujung
azd auth login
azd up
```

**Lalu uji teardown**—template yang baik membersihkan sepenuhnya:

```bash
azd down --force --purge
```

Jika `azd down` meninggalkan sumber daya, kemungkinan Anda melewatkan tag `azd-env-name` pada sebuah sumber daya.

> **Tip:** jalankan `azd provision --preview` terlebih dahulu. Ini melakukan what-if dan menampilkan kesalahan template sebelum sumber daya apa pun dibuat.

---

## Step 5: Publish the Template

Push repository ke GitHub (publik jika Anda ingin orang lain menggunakannya):

```bash
gh repo create my-azd-template --public --source=. --push
```

Siapapun sekarang dapat menggunakannya:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Step 6 (Optional): Submit to Awesome AZD

Galeri [Awesome AZD](https://azure.github.io/awesome-azd/) menampilkan template komunitas. Agar tercantum, repo Anda sebaiknya mencakup:

- ✅ README.md yang jelas dengan prasyarat, diagram arsitektur, dan catatan biaya
- ✅ `azure.yaml` yang berfungsi dengan `metadata.template`
- ✅ Infrastruktur yang dapat disediakan dengan bersih di subscription baru
- ✅ File `LICENSE`
- ✅ (Direkomendasikan) `.devcontainer/` untuk one-click Codespaces

Kirimkan dengan membuka pull request yang menambahkan template Anda ke file data galeri, mengikuti panduan kontribusi di repository [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Common Pitfalls

| Pitfall | Fix |
|---------|-----|
| Hardcoded resource names | Gunakan token resource `uniqueString()` |
| `azd down` leaves resources | Tag setiap sumber daya (atau resource group) dengan `azd-env-name` |
| Template works for you, fails for others | Hapus ID subscription, ID tenant, dan asumsi region |
| Outputs not wired into the app | Ekspor `SERVICE_<NAME>_ENDPOINT_URL` dan output `AZURE_*` lainnya |
| Gallery submission rejected | Tambahkan `README.md`, `LICENSE`, dan `metadata.template` |

---

## Summary

- Template hanyalah repositori Git dengan `azure.yaml`, `infra/`, dan kode Anda.
- Parameter-kan semuanya—nama, region, dan ID—agar dapat dijalankan di mana saja.
- Selalu tag sumber daya dengan `azd-env-name` agar `azd down` berfungsi.
- Uji secara lokal dengan `azd init --template <local-path>` sebelum menerbitkan.
- Tambahkan metadata dan README untuk mengirim ke Awesome AZD.

---

## 🔗 Navigation

| Direction | Resource |
|-----------|----------|
| **Previous** | [Panduan Penyebaran](deployment-guide.md) |
| **Chapter Home** | [Bab 4: Infrastructure as Code](README.md) |
| **Next Chapter** | [Bab 5: Solusi Multi-Agen](../chapter-05-multi-agent/README.md) |

## 📖 Related Resources

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Official azd template documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->