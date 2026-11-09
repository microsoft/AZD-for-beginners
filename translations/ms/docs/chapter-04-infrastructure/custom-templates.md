# Menulis Template azd Anda Sendiri

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 4 - Infrastruktur sebagai Kod & Penghantaran
- **⬅️ Sebelumnya**: [Panduan Penghantaran](deployment-guide.md)
- **🚀 Bab Seterusnya**: [Bab 5: Penyelesaian Pelbagai Agen](../chapter-05-multi-agent/README.md)

> Disemak berbanding `azd 1.37.2` (November 2026). Ini adalah **panduan penulisan dengan fail separa**, bukan template lengkap: anda mesti menyediakan kod aplikasi dan `modules/web.bicep` dengan persekitarannya, daftar, Container App, dan output sebelum penghantaran. Penyediaan Azure tidak dilaksanakan dalam semakan ini.

## Pengenalan

Setakat ini anda telah *menggunakan* template dengan `azd init --template <name>`. Tetapi setelah anda mempunyai susun atur projek yang disukai pasukan anda—contohnya, Container App dengan Cosmos DB dan pemantauan yang sesuai—anda akan mahu menukarnya menjadi template boleh guna semula milik anda sendiri. Template hanyalah repositori Git dengan struktur yang boleh dijangka yang azd tahu cara untuk bacanya. Pelajaran ini menunjukkan cara membina satu dari awal, mengujinya, dan (pilihan) menerbitkannya ke galeri komuniti.

## Matlamat Pembelajaran

Pada akhir pelajaran ini, anda akan:
- Memahami apa yang menjadikan folder sebagai "template azd"
- Mengetahui fail dan susun atur folder yang diperlukan
- Menambah `azure.yaml` dan `infra/` yang boleh digunakan semula oleh orang lain
- Menguji template anda secara tempatan sebelum berkongsi
- Menerbitkannya dan (pilihan) mengemukakan ke Awesome AZD

## Hasil Pembelajaran

Setelah melengkapkan pelajaran ini, anda akan dapat:
- Menyediakan repositori template baru
- Parameterkan infrastruktur supaya ia berfungsi dalam mana-mana langganan
- Mengesahkan template dengan `azd init` dan `azd up`
- Menambah metadata yang diperlukan galeri komuniti

---

## Apakah Sebenarnya Template?

Template azd adalah **repositori Git** yang mengandungi, sekurang-kurangnya:

| Fail / folder | Tujuan | Diperlukan? |
|---------------|---------|-----------|
| `azure.yaml` | Menerangkan perkhidmatan, hos, dan penyedia infra | ✅ Ya |
| `infra/` | Definisi penyediaan Bicep atau Terraform | Diperlukan untuk contoh IaC eksplisit ini; projek infrastruktur-dijana boleh mengabaikannya |
| `src/` (atau kod anda) | Kod aplikasi yang azd hantar | Diperlukan untuk perkhidmatan berasaskan sumber; tidak semua template mengandungi kod aplikasi |
| `README.md` | Cara menggunakan template | ✅ Sangat disyorkan |
| `.azdo/` atau `.github/` | Definisi paip CI/CD | Pilihan |
| `.devcontainer/` | Persekitaran pembangunan boleh diulang | Pilihan |
| `azure.yaml` `metadata` | Maklumat identiti/telemetri template | Disyorkan; menerbitkan repositori Git tidak memerlukannya |

Tiada perkara ajaib di sini: apabila anda menjalankan `azd init --template you/your-repo`, azd menggandakan repo dan membaca `azure.yaml`.

---

## Langkah 1: Sediakan Repositori

Buat struktur folder secara manual atau mula dari template minimum dan edit:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Susun atur siap tipikal kelihatan seperti ini:

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

Ini adalah inti template. Ia memberitahu azd apa yang hendak dihantar dan bagaimana:

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

> Medan `metadata.template` adalah yang digunakan telemetri galeri untuk mengira penggunaan. Gunakan konvensyen `name@version`.

---

## Langkah 3: Parameterkan Infrastruktur

Peraturan paling penting untuk template *boleh guna semula*: **jangan pernah kodkan nama, rantau, atau nilai khusus langganan secara keras.** Gunakan parameter dan corak token sumber supaya template yang sama berfungsi dalam langganan sesiapa pun.

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

Dua perkara menjadikan template ini mesra pengguna:

1. **Tag `azd-env-name`** — azd menggunakannya untuk mengesan dan membersihkan sumber bagi setiap persekitaran.
2. **Token sumber `uniqueString(...)`** — menghasilkan sufiks hash stabil untuk mengurangkan perlanggaran; ia bukan jaminan keunikan global.

`modules/web.bicep` yang hilang mesti menerima `name`, `location`, dan `tags`, menyediakan persekitaran/daftar Container Apps dan aplikasi, menanda aplikasi dengan `azd-service-name: web`, dan mengeksport `uri`. Ia juga mesti mendedahkan nilai daftar yang diperlukan oleh aliran bina/hantar yang dipilih (contohnya `AZURE_CONTAINER_REGISTRY_ENDPOINT` dari modul akar). Output titik akhir sahaja tidak menyambungkan penemuan perkhidmatan, tetapan aplikasi, atau pengesahan daftar.

Sediakan fail parameter sepadan yang membaca nilai yang azd suntik dari persekitaran:

Simpan yang berikut sebagai `infra/main.parameters.json`:

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

azd menggantikan `${AZURE_ENV_NAME}` dan `${AZURE_LOCATION}` dari persekitaran semasa secara automatik.

---

## Langkah 4: Uji Template Anda Secara Tempatan

Sebelum berkongsi, buktikan template berfungsi dari keadaan bersih.

**Uji dari folder tempatan** (tidak perlu Git push):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Kemudian uji pembersihan**—template yang baik membersihkan sepenuhnya:

```bash
azd down --force --purge
```

Jika `azd down` meninggalkan sumber, periksa penemuan persekitaran/kumpulan sumber, sumber luaran/bersama, kebenaran, kunci, dan perlindungan pembersihan. `--purge` tidak memadam keadaan `.azure/` tempatan.

> **Petua:** selepas menyediakan semua fail yang hilang, jalankan `azd provision --preview` dahulu. Periksa hook sebelum pratayang kerana ia boleh melaksanakan arahan yang memberi kesan sampingan. Pratayang bukan anggaran harga atau jaminan bahawa penyediaan akan berjaya.

---

## Langkah 5: Terbitkan Template

Tolak repositori ke GitHub (awam jika anda mahu orang lain menggunakannya):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Sekarang sesiapa pun boleh menggunakannya:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Langkah 6 (Pilihan): Hantar ke Awesome AZD

Galeri [Awesome AZD](https://azure.github.io/awesome-azd/) menyenaraikan templat komuniti. Untuk disenaraikan, repo anda harus termasuk:

- ✅ Satu `README.md` yang jelas dengan prasyarat, rajah seni bina, dan nota kos
- ✅ Satu `azure.yaml` yang berfungsi dengan `metadata.template`
- ✅ Infrastruktur yang menyediakan dengan bersih dalam langganan baru
- ✅ Fail `LICENSE`
- ✅ (Disyorkan) Satu `.devcontainer/` untuk Codespaces satu klik

Serahkan dengan membuka pull request yang menambah templat anda ke fail data galeri, mengikut panduan sumbangan di [repo Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Kesilapan Biasa

| Kesilapan | Pembetulan |
|---------|-----|
| Nama sumber ditetapkan keras | Guna token sumber `uniqueString()` |
| `azd down` meninggalkan sumber | Tag setiap sumber (atau kumpulan sumber) dengan `azd-env-name` |
| Templat berfungsi untuk anda, gagal untuk orang lain | Buang ID langganan, ID tenant, dan anggapan rantau |
| Output tidak dihubungkan ke aplikasi | Sesuaikan `azd-service-name`/`resourceName` untuk penyebaran dan namakan output dengan jelas ke tetapan aplikasi |
| Penyerahan galeri ditolak | Tambah `README.md`, `LICENSE`, dan `metadata.template` |

---

## Ringkasan

- Templat hanyalah repo Git dengan `azure.yaml`, `infra/`, dan kod anda.
- Parámetrikan segala-galanya—nama, rantau, dan ID—supaya ia berjalan di mana-mana.
- Sentiasa tag sumber dengan `azd-env-name` supaya `azd down` berfungsi.
- Uji secara tempatan dengan `azd init --template <local-path>` sebelum diterbitkan.
- Tambah metadata dan README untuk dihantar ke Awesome AZD.

---

## 🔗 Navigasi

| Arah | Sumber |
|-----------|----------|
| **Sebelumnya** | [Panduan Penyebaran](deployment-guide.md) |
| **Laman Utama Bab** | [Bab 4: Infrastruktur sebagai Kod](README.md) |
| **Bab Seterusnya** | [Bab 5: Penyelesaian Multi-Ejen](../chapter-05-multi-agent/README.md) |

## 📖 Sumber Berkaitan

- [Penyediaan Sumber](provisioning.md)
- [Galeri Awesome AZD](https://azure.github.io/awesome-azd/)
- [Dokumentasi templat azd rasmi](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->