# Mencipta Templat azd Anda Sendiri

**Navigasi Bab:**
- **📚 Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 4 - Infrastruktur sebagai Kod & Penyebaran
- **⬅️ Sebelumnya**: [Panduan Penyebaran](deployment-guide.md)
- **🚀 Bab Seterusnya**: [Bab 5: Penyelesaian Berbilang Ejen](../chapter-05-multi-agent/README.md)

> Disahkan menggunakan `azd 1.25.6` pada Jun 2026.

## Pengenalan

Sehingga kini anda telah *menggunakan* templat dengan `azd init --template <name>`. Tetapi setelah anda mempunyai susun atur projek yang pasukan anda sukai—contohnya, Container App dengan Cosmos DB dan pemantauan yang betul—anda akan mahu menukarnya menjadi templat boleh guna semula sendiri. Satu templat hanyalah sebuah repositori Git dengan struktur yang boleh diramal yang azd tahu bagaimana untuk dibaca. Pelajaran ini menunjukkan cara membinanya dari awal, menguji, dan (secara pilihan) menerbitkannya ke galeri komuniti.

## Matlamat Pembelajaran

Menjelang akhir pelajaran ini, anda akan:
- Faham apa yang menjadikan folder sebuah "templat azd"
- Tahu fail dan susun atur folder yang diperlukan
- Menambah `azure.yaml` dan `infra/` yang boleh digunakan semula oleh orang lain
- Menguji templat anda secara tempatan sebelum berkongsi
- Menerbitkannya dan (secara pilihan) menghantarnya ke Awesome AZD

## Hasil Pembelajaran

Selepas menyiapkan pelajaran ini, anda akan dapat:
- Menyusun repositori templat baru
- Memparameterkan infrastruktur supaya ia berfungsi dalam mana-mana langganan
- Mengesahkan templat dengan `azd init` dan `azd up`
- Menambah metadata yang diperlukan oleh galeri komuniti

---

## Apakah Templat Sebenarnya?

Satu templat azd adalah **sebuah repositori Git** yang mengandungi, pada minimum:

| Fail / folder | Tujuan | Diperlukan? |
|---------------|---------|-----------|
| `azure.yaml` | Menerangkan perkhidmatan, hos, dan pembekal infra | ✅ Ya |
| `infra/` | Bicep, Terraform, atau Pulumi yang menyediakan sumber | ✅ Ya |
| `src/` (atau kod anda) | Kod aplikasi yang disebarkan oleh azd | ✅ Ya |
| `README.md` | Cara menggunakan templat | ✅ Sangat disyorkan |
| `.azdo/` atau `.github/` | Definisi pipeline CI/CD | Pilihan |
| `.devcontainer/` | Persekitaran dev yang boleh dihasilkan semula | Pilihan |
| `azure.yaml` `metadata` | Maklumat Galeri + telemetri | Pilihan (diperlukan untuk menerbitkan) |

Tiada apa-apa yang magikal di sini: apabila anda menjalankan `azd init --template you/your-repo`, azd mengklon repo dan membaca `azure.yaml`.

---

## Langkah 1: Buat Struktur Repositori

Cipta struktur folder secara manual atau mulakan dari templat minimum dan suntingnya:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Buat susun atur piawai
mkdir -p src infra
```

Susunan siap yang tipikal kelihatan seperti ini:

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

> Medan `metadata.template` adalah apa yang telemetri galeri gunakan untuk mengira penggunaan. Gunakan konvensyen `name@version`.

---

## Langkah 3: Parameterkan Infrastruktur

Peraturan paling penting untuk templat *boleh digunakan semula*: **jangan sesekali mengehardkod nama, rantau, atau nilai khusus langganan.** Gunakan parameter dan corak token sumber supaya templat yang sama berfungsi dalam langganan sesiapa pun.

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

1. **`azd-env-name` tag** — azd menggunakannya untuk menjejaki dan membersihkan sumber mengikut persekitaran.
2. **Token sumber `uniqueString(...)`** — menghasilkan sufiks unik global yang stabil supaya nama tidak bertembung.

Sediakan fail parameter sepadan yang membaca nilai yang disuntik azd dari persekitaran:

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

Sebelum berkongsi, buktikan templat berfungsi dari keadaan yang bersih.

**Uji dari folder tempatan** (tiada Git push diperlukan):

```bash
# Daripada direktori kosong, inisialisasikan menggunakan laluan templat tempatan anda
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Sediakan + terapkan dari hujung ke hujung
azd auth login
azd up
```

**Kemudian uji proses pembersihan**—templat yang baik membersihkan sepenuhnya:

```bash
azd down --force --purge
```

Jika `azd down` meninggalkan sumber, kemungkinan anda terlepas tag `azd-env-name` pada sumber.

> **Petua:** jalankan `azd provision --preview` terlebih dahulu. Ia melakukan what-if dan memaparkan ralat templat sebelum sebarang sumber dicipta.

---

## Langkah 5: Terbitkan Templat

Tolak repositori ke GitHub (awam jika anda mahu orang lain menggunakannya):

```bash
gh repo create my-azd-template --public --source=. --push
```

Sesiapa kini boleh menggunakannya:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Langkah 6 (Pilihan): Hantar ke Awesome AZD

Galeri [Awesome AZD](https://azure.github.io/awesome-azd/) menyenaraikan templat komuniti. Untuk disenaraikan repo anda harus menyertakan:

- ✅ `README.md` yang jelas dengan pra-syarat, rajah seni bina, dan nota kos
- ✅ `azure.yaml` yang berfungsi dengan `metadata.template`
- ✅ Infrastruktur yang menyediakan dengan bersih dalam langganan yang baru
- ✅ Fail `LICENSE`
- ✅ (Disyorkan) `.devcontainer/` untuk Codespaces satu-klik

Hantar dengan membuka pull request yang menambah templat anda ke fail data galeri, mengikut panduan sumbangan di repositori [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Perangkap Biasa

| Perangkap | Pembaikan |
|---------|-----|
| Nama sumber yang di-hardcode | Gunakan token sumber `uniqueString()` |
| `azd down` meninggalkan sumber | Tandakan setiap sumber (atau kumpulan sumber) dengan `azd-env-name` |
| Templat berfungsi untuk anda, gagal bagi orang lain | Alih keluar ID langganan, ID tenant, dan andaian rantau |
| Output tidak disambung ke aplikasi | Eksport `SERVICE_<NAME>_ENDPOINT_URL` dan output `AZURE_*` lain |
| Penyerahan galeri ditolak | Tambahkan `README.md`, `LICENSE`, dan `metadata.template` |

---

## Ringkasan

- Satu templat hanyalah repo Git dengan `azure.yaml`, `infra/`, dan kod anda.
- Parameterkan segala-galanya—nama, rantau, dan ID—supaya ia berjalan di mana-mana.
- Sentiasa tandakan sumber dengan `azd-env-name` supaya `azd down` berfungsi.
- Uji secara tempatan dengan `azd init --template <local-path>` sebelum menerbitkan.
- Tambah metadata dan README untuk menghantar ke Awesome AZD.

---

## 🔗 Navigasi

| Arah | Sumber |
|-----------|----------|
| **Sebelumnya** | [Panduan Penyebaran](deployment-guide.md) |
| **Utama Bab** | [Bab 4: Infrastruktur sebagai Kod](README.md) |
| **Bab Seterusnya** | [Bab 5: Penyelesaian Berbilang Ejen](../chapter-05-multi-agent/README.md) |

## 📖 Sumber Berkaitan

- [Penyediaan Sumber](provisioning.md)
- [Galeri Awesome AZD](https://azure.github.io/awesome-azd/)
- [Dokumentasi rasmi templat azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->