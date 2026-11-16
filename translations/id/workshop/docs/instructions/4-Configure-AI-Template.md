# 4. Konfigurasikan Template

!!! tip "PADA AKHIR MODUL INI ANDA AKAN BISA"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Mulai dengan template yang sebenarnya

Buka [`azure.yaml` dalam Mulai dengan Agen AI](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) di repositori yang Anda inisialisasi. Template induk dapat berubah secara independen dari lokakarya ini. Berikut **kutipan** yang diperiksa pada 4 November 2026; ini bukan pengganti untuk file lengkap:

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

- `name` mengidentifikasi proyek AZD; `metadata.template` mencatat versi template.
- `requiredVersions.azd` adalah minimum template, bukan rekomendasi untuk tetap menggunakan CLI lama. Gunakan rilis AZD yang didukung saat ini.
- `services` mendefinisikan target penyebaran aplikasi. Template ini menyebarkan API Python dan frontend sebagai satu layanan Container Apps.
- `project` relatif terhadap `azure.yaml`.
- `remoteBuild` meminta build container jarak jauh. Identitas Anda masih memerlukan izin Azure yang diperlukan.

File Bicep template di bawah `infra/`, bukan hanya daftar `services`, mendeklarasikan sumber daya seperti Microsoft Foundry, penyebaran model, penyimpanan, dan AI Search opsional.

## 2. Pahami hook siklus hidup

Periksa bagian `hooks` dan skrip yang direferensikan sebelum menjalankan template. Versi yang ditinjau berisi:

| Hook | Tujuan | Perilaku penting |
|------|---------|--------------------|
| `preup` | Validasi input lingkungan template sebelum alur kerja `up` | Skrip shell spesifik platform dapat menghentikan alur kerja jika gagal |
| `postdeploy` | Jalankan setup khusus template setelah penyebaran aplikasi | Periksa `continueOnError` dan keluaran skrip; penyebaran yang berhasil tidak membuktikan semua tugas setup berhasil |

Versi ini **tidak** berisi hook lama `postprovision` / `write_env` yang ditampilkan pada materi lokakarya sebelumnya. Jangan menyalin referensi hook ke skrip yang tidak ada lagi.

Kunci hook memilih event siklus hidup; `posix` dan `windows` memilih implementasi platform. `shell`, `run`, `interactive`, dan `continueOnError` mengontrol eksekusi. Ini adalah skrip eksekusi dengan izin Anda, jadi tinjau seperti Anda meninjau kode aplikasi.

Lihat [dokumentasi hook AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) untuk siklus hidup lengkap.

## 3. Lacak input lingkungan ke infrastruktur

Jalankan perintah ini dari repositori contoh yang diinisialisasi:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Periksa `infra/main.parameters.json` untuk melihat variabel lingkungan mana yang benar-benar dikonsumsi template. Menetapkan nama sembarangan dengan `azd env set` tidak otomatis mengubah sumber daya Azure.

Default yang ditinjau meliputi:

| Input | Default / tujuan |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; satuan kuota tergantung model dan tipe penyebaran |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; jangan aktifkan kecuali pengelolaan data sudah ditinjau |

Ini adalah input spesifik contoh, bukan pengaturan AZD global. Periksa [dokumentasi dukungan model dan wilayah](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) dan kuota langganan Anda sebelum memilih model, SKU, kapasitas, atau lokasi. Jangan mengartikan setiap satuan kapasitas sebagai 1.000 token per menit.

Untuk memilih model chat yang berbeda, perbarui **nama, versi, format, SKU, dan kapasitas yang kompatibel bersama-sama**, sesuai [panduan kustomisasi contoh](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Mengubah hanya nama bisa meninggalkan versi atau tipe penyebaran yang tidak kompatibel.

## 4. Lab: aktifkan pencarian dan pelacakan opsional

!!! warning "Pengaturan ini dapat menambah sumber daya berbayar"

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

Perubahan infrastruktur memerlukan provisioning; `azd deploy` saja hanya menyebarkan layanan aplikasi. Untuk pengindeksan pencarian dan opsi pengambilan yang didukung, ikuti [panduan AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Untuk pemantauan, ikuti [panduan observability](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Jangan aktifkan penangkapan isi prompt/respons pada data pelanggan nyata tanpa persetujuan, kontrol akses, kebijakan retensi, dan redaksi yang diperlukan.

## 5. Sumber daya yang ada dan CI/CD

Untuk menggunakan kembali proyek Foundry, ikuti [instruksi sumber daya yang ada pada contoh](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). Menetapkan `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` mengubah jalur penyebaran; dalam skenario itu, template tidak membuat Application Insights atau AI Search untuk Anda. Verifikasi dependensi, penugasan peran, dan penyebaran model secara eksplisit.

Bagian `pipeline.variables` mengontrol nilai yang diteruskan ke pipeline yang dihasilkan; ini bukan toko rahasia dan tidak membuat sumber daya Azure. Utamakan managed identity dalam aplikasi dan OIDC untuk CI/CD. File lingkungan AZD adalah teks polos dan tidak boleh dikomit.

AZD mendukung impor file dotenv yang disiapkan secara lokal dan dipercaya:

```bash
azd env set --file .env
```

Tinjau file itu sebelum mengimpornya, dan jangan cetak file lingkungan yang berisi rahasia di terminal bersama atau log CI.

## 6. Periksa pemahaman Anda

- Layanan `azure.yaml` mana yang menyebarkan aplikasi?
- Parameter infrastruktur mana yang mengkonsumsi setiap nilai yang Anda ubah?
- Perubahan mana yang memerlukan provisioning dan bukan hanya penyebaran?
- Apakah wilayah dan langganan yang dipilih mendukung model dan kuota?
- Apakah semua hook setup berhasil, dan dapatkah Anda memverifikasi perilaku aplikasi yang disebarkan?

Lanjutkan ke [Sesuaikan Template](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->