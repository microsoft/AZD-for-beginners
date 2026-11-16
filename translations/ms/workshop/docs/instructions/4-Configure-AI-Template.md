# 4. Konfigurasikan Template

!!! tip "PADA AKHIR MODUL INI ANDA AKAN BOLEH"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Mula dengan template sebenar

Buka [`azure.yaml` dalam Memulakan dengan Ejen AI](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) dalam repositori yang anda inisialisasi. Template hulu boleh berubah secara bebas daripada bengkel ini. **Petikan** berikut diperiksa pada 4 November 2026; ia bukan pengganti untuk fail lengkap:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` mengenal pasti projek AZD; `metadata.template` merekodkan versi template.
- `requiredVersions.azd` adalah minimum template, bukan saranan untuk terus menggunakan CLI lama. Gunakan pelepasan AZD yang disokong semasa.
- `services` mendefinisikan sasaran penyebaran aplikasi. Template ini menyebarkan API Python dan frontendnya sebagai satu perkhidmatan Container Apps.
- `project` adalah relatif kepada `azure.yaml`.
- `remoteBuild` meminta binaan kontena jauh. Identiti anda masih memerlukan kebenaran Azure yang diperlukan.

Fail Bicep template di bawah `infra/`, bukan hanya senarai `services`, mengisytiharkan sumber seperti Microsoft Foundry, penyebaran model, storan, dan AI Search pilihan.

## 2. Fahami kaitan kitaran hayat

Periksa bahagian `hooks` dan skrip yang dirujuk sebelum menjalankan template. Versi yang disemak mengandungi:

| Kait | Tujuan | Tingkah laku penting |
|------|---------|--------------------|
| `preup` | Sahkan input persekitaran template sebelum aliran kerja `up` | Skrip shell khusus platform boleh menghentikan aliran kerja jika gagal |
| `postdeploy` | Jalankan persediaan khusus template selepas penyebaran aplikasi | Periksa `continueOnError` dan output skrip; penyebaran berjaya tidak membuktikan setiap tugasan persediaan berjaya |

Versi ini **tidak** mengandungi kait `postprovision` / `write_env` lama yang ditunjukkan dalam bahan bengkel terdahulu. Jangan salin rujukan kait ke skrip yang tidak lagi wujud.

Kekunci kait memilih acara kitaran hayat; `posix` dan `windows` memilih pelaksanaan platform. `shell`, `run`, `interactive`, dan `continueOnError` mengawal pelaksanaan. Ini adalah skrip boleh laksana dengan kebenaran anda, jadi semak seperti anda menilai kod aplikasi.

Lihat [dokumentasi kait AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) untuk kitaran hayat lengkap.

## 3. Jejak input persekitaran ke infrastruktur

Jalankan arahan ini dari repositori contoh yang diinisialisasi:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Periksa `infra/main.parameters.json` untuk melihat pemboleh ubah persekitaran yang sebenarnya digunakan oleh template. Menetapkan nama samaran dengan `azd env set` tidak secara automatik menukar sumber Azure.

Default yang disemak termasuk:

| Input | Default / tujuan |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; unit kuota bergantung pada model dan jenis penyebaran |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; biarkan dilumpuhkan kecuali pengendalian data telah disemak |

Ini adalah input khusus contoh, bukan tetapan AZD global. Semak [dokumentasi sokongan model dan rantau](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) dan kuota langganan anda sebelum memilih model, SKU, kapasiti, atau lokasi. Jangan tafsir setiap unit kapasiti sebagai 1,000 token seminit.

Untuk memilih model chat yang berbeza, kemas kini **nama, versi, format, SKU, dan kapasiti yang serasi bersama**, mengikut [panduan pengubahsuaian contoh](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Menukar hanya nama boleh meninggalkan versi atau jenis penyebaran yang tidak serasi.

## 4. Makmal: aktifkan carian pilihan dan penjejakan

!!! warning "Tetapan ini boleh menambah sumber yang boleh dikenakan bayaran"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

Perubahan infrastruktur memerlukan penyediaan; `azd deploy` sahaja hanya menyebarkan perkhidmatan aplikasi. Untuk pengindeksan carian dan pilihan pengambilan yang disokong, ikut [panduan AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Untuk pemantauan, ikut [panduan kebolehlihatan](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Jangan aktifkan rakaman kandungan prompt/respon ke atas data pelanggan sebenar tanpa keizinan, kawalan akses, polisi penyimpanan, dan pemotongan yang diperlukan.

## 5. Sumber sedia ada dan CI/CD

Untuk guna semula projek Foundry, ikut [arahan sumber sedia ada contoh](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). Menetapkan `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` mengubah laluan penyebaran; dalam senario itu, template tidak mencipta Application Insights atau AI Search untuk anda. Sahkan kebergantungan, pelantikan peranan, dan penyebaran model dengan jelas.

Bahagian `pipeline.variables` mengawal nilai yang dihantar ke pipeline yang dihasilkan; ia bukan stor rahsia dan tidak mencipta sumber Azure. Utamakan identiti terurus dalam aplikasi dan OIDC untuk CI/CD. Fail persekitaran AZD adalah teks biasa dan tidak patut dikomit.

AZD menyokong mengimport fail dotenv tempatan yang dipercayai:

```bash
azd env set --file .env
```

Semak fail itu sebelum mengimport, dan jangan cetak fail persekitaran yang mengandungi rahsia di terminal dikongsi atau log CI.

## 6. Semak kefahaman anda

- Perkhidmatan `azure.yaml` mana yang menyebarkan aplikasi?
- Parameter infrastruktur mana yang menggunakan setiap nilai yang anda ubah?
- Perubahan mana yang memerlukan penyediaan dan bukan hanya penyebaran?
- Adakah rantau dan langganan yang dipilih menyokong model dan kuota?
- Adakah semua kait persediaan berjaya, dan bolehkah anda sahkan tingkah laku aplikasi yang disebarkan?

Teruskan ke [Sesuaikan Template](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->