# Membuat Templat azd Anda Sendiri

**Navigasi Bab:**
- **📚 Halaman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 4 - Infrastruktur sebagai Kod & Penyebaran
- **⬅️ Sebelumnya**: [Panduan Penyebaran](deployment-guide.md)
- **🚀 Bab Seterusnya**: [Bab 5: Penyelesaian Multi-Ejen](../chapter-05-multi-agent/README.md)

> Disahkan dengan `azd 1.27.1` pada Julai 2026.

## Pengenalan

Sejauh ini anda telah *menggunakan* templat dengan `azd init --template <name>`. Tetapi setelah anda mempunyai susun atur projek yang disukai oleh pasukan anda—contohnya, Aplikasi Kontena dengan Cosmos DB dan pemantauan yang sesuai—anda akan ingin mengubahnya menjadi templat boleh guna semula milik anda sendiri. Templat hanyalah sebuah repositori Git dengan struktur yang boleh diramal yang azd tahu bagaimana untuk membacanya. Pelajaran ini menunjukkan cara membina satu dari awal, mengujinya, dan (secara pilihan) menerbitkannya ke galeri komuniti.

## Matlamat Pembelajaran

Pada akhir pelajaran ini, anda akan:
- Memahami apa yang menjadikan folder sebagai "templat azd"
- Mengetahui fail dan susun atur folder yang diperlukan
- Menambah `azure.yaml` dan `infra/` yang boleh digunakan semula oleh orang lain
- Menguji templat anda secara tempatan sebelum berkongsi
- Menerbitkan dan (secara pilihan) menyerahkannya ke Awesome AZD

## Hasil Pembelajaran

Setelah melengkapkan pelajaran ini, anda akan boleh:
- Membina repositori templat baru
- Memparametrkan infrastruktur supaya berfungsi dalam mana-mana langganan
- Mengesahkan templat dengan `azd init` dan `azd up`
- Menambah metadata yang diperlukan oleh galeri komuniti

---

## Apa Itu Templat, Sebenarnya?

Templat azd adalah **repositori Git** yang mengandungi, sekurang-kurangnya:

| Fail / folder | Tujuan | Wajib? |
|---------------|---------|-----------|
| `azure.yaml` | Menerangkan perkhidmatan, hos, dan penyedia infra | ✅ Ya |
| `infra/` | Bicep, Terraform, atau Pulumi yang menyediakan sumber | ✅ Ya |
| `src/` (atau kod anda) | Kod aplikasi yang azd sebarkan | ✅ Ya |
| `README.md` | Cara menggunakan templat | ✅ Sangat disyorkan |
| `.azdo/` atau `.github/` | Definisi aliran kerja CI/CD | Pilihan |
| `.devcontainer/` | Persekitaran pembangunan boleh ulang | Pilihan |
| `azure.yaml` `metadata` | Maklumat galeri + telemetri | Pilihan (diperlukan untuk terbit) |

Tiada yang ajaib di sini: apabila anda menjalankan `azd init --template you/your-repo`, azd menyalin repo dan membaca `azure.yaml`.

---

## Langkah 1: Membina Kerangka Repositori

Buat struktur folder secara manual atau mula dari templat minimum dan sunting:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Cipta susun atur standard
mkdir -p src infra
```

Susun atur siap biasa adalah seperti ini:

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

Ini adalah inti templat. Ia memberitahu azd apa yang hendak disebarkan dan bagaimana:

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

> Medan `metadata.template` adalah yang digunakan telemetri galeri untuk mengira penggunaan. Gunakan konvensyen `nama@versi`.

---

## Langkah 3: Parameterkan Infrastruktur

Peraturan paling penting untuk templat *boleh guna semula*: **jangan sesekali menyeragamkan nama, rantau, atau nilai khusus langganan.** Gunakan parameter dan corak token sumber supaya templat yang sama berfungsi dalam langganan sesiapa sahaja.

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

Dua perkara menjadikan ini mesra templat:

1. **Tag `azd-env-name`** — azd menggunakannya untuk menjejak dan membersihkan sumber per persekitaran.
2. **Token sumber `uniqueString(...)`** — menghasilkan sufiks yang stabil dan unik global supaya nama tidak bertembung.

Sediakan fail parameter yang sepadan yang membaca nilai yang disuntik azd dari persekitaran:

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

azd menggantikan `${AZURE_ENV_NAME}` dan `${AZURE_LOCATION}` dari persekitaran semasa secara automatik.

---

## Langkah 4: Uji Templat Anda Secara Tempatan

Sebelum berkongsi, buktikan templat berfungsi dari keadaan bersih.

**Uji dari folder tempatan** (tidak perlu push ke Git):

```bash
# Dari direktori kosong, inisialisasi menggunakan laluan templat tempatan anda
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Sediakan + lancarkan dari awal hingga akhir
azd auth login
azd up
```

**Kemudian uji penutupan**—templat yang baik membersihkan sepenuhnya:

```bash
azd down --force --purge
```

Jika `azd down` meninggalkan sumber, mungkin anda terlepas tag `azd-env-name` pada sumber tersebut.

> **Petua:** jalankan `azd provision --preview` terlebih dahulu. Ia melakukan simulasi dan mengenalpasti ralat templat sebelum mana-mana sumber dibuat.

---

## Langkah 5: Terbitkan Templat

Tolak repositori ke GitHub (awam jika anda mahu orang lain menggunakannya):

```bash
gh repo create my-azd-template --public --source=. --push
```

Kini sesiapa sahaja boleh menggunakannya:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Langkah 6 (Pilihan): Serahkan ke Awesome AZD

Galeri [Awesome AZD](https://azure.github.io/awesome-azd/) menyenaraikan templat komuniti. Untuk disenaraikan, repo anda harus mengandungi:

- ✅ `README.md` yang jelas dengan prasyarat, rajah seni bina, dan nota kos
- ✅ `azure.yaml` yang berfungsi dengan `metadata.template`
- ✅ Infrastruktur yang boleh dibina bersih dalam langganan baru
- ✅ Fail `LICENSE`
- ✅ (Disyorkan) `.devcontainer/` untuk Codespaces satu klik

Serahkan dengan membuka pull request yang menambah templat anda ke fail data galeri, mengikut panduan sumbangan di [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Perangkap Lazim

| Perangkap | Pembetulan |
|---------|-----|
| Nama sumber keras kod | Gunakan token sumber `uniqueString()` |
| `azd down` meninggalkan sumber | Tag setiap sumber (atau kumpulan sumber) dengan `azd-env-name` |
| Templat berfungsi untuk anda, gagal untuk orang lain | Buang ID langganan, ID penyewa, dan andaian rantau |
| Output tidak disambungkan ke aplikasi | Eksport `SERVICE_<NAME>_ENDPOINT_URL` dan output lain `AZURE_*` |
| Penyerahan galeri ditolak | Tambah `README.md`, `LICENSE`, dan `metadata.template` |

---

## Ringkasan

- Templat hanyalah repo Git dengan `azure.yaml`, `infra/`, dan kod anda.
- Parameterkan segala-galanya—nama, rantau, dan ID—supaya berfungsi di mana-mana.
- Sentiasa tag sumber dengan `azd-env-name` supaya `azd down` berfungsi.
- Uji secara tempatan dengan `azd init --template <local-path>` sebelum menerbit.
- Tambah metadata dan README untuk menyerah ke Awesome AZD.

---

## 🔗 Navigasi

| Arah | Sumber |
|-----------|----------|
| **Sebelumnya** | [Panduan Penyebaran](deployment-guide.md) |
| **Halaman Bab** | [Bab 4: Infrastruktur sebagai Kod](README.md) |
| **Bab Seterusnya** | [Bab 5: Penyelesaian Multi-Ejen](../chapter-05-multi-agent/README.md) |

## 📖 Sumber Berkaitan

- [Penyediaan Sumber](provisioning.md)
- [Galeri Awesome AZD](https://azure.github.io/awesome-azd/)
- [Dokumentasi rasmi templat azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->