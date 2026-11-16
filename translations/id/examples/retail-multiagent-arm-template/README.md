# Kerangka Infrastruktur Multi-Agen Ritel

**Contoh arsitektur lanjutan — bukan aplikasi multi-agen yang berfungsi.**

[Halaman kursus](../../README.md) ·
[Bab 5](../../docs/chapter-05-multi-agent/README.md) ·
[Cetak biru arsitektur](../retail-scenario.md)

## Apa yang ini deploy

Direktori ini berisi template ARM, parameter, dan skrip deployment Bash.
Tidak ada **`azure.yaml` atau sumber aplikasi ritel**.

| Resource | Kondisi aktual setelah provisioning |
|---|---|
| Akun Azure OpenAI Utama | Penyebaran `gpt-4.1-chat` menggunakan versi `gpt-4.1` `2025-04-14`, `GlobalStandard` |
| Akun OpenAI Sekunder (opsional) | `gpt-4.1-mini-inventory`, model `gpt-4.1-mini` versi `2025-04-14`, `GlobalStandard` |
| Akun Embeddings (opsional) | `text-embedding-ada-002` versi `2`, `Standard`; tidak ada pipeline pengindeksan |
| Akun Grader OpenAI | `gpt-4.1-grader`, model `gpt-4.1` versi `2025-04-14`, `GlobalStandard`; tidak ada evaluator |
| AI Search | Layanan kosong; tidak ada indeks atau dokumen |
| Penyimpanan | Kontainer blob `documents` dan `uploads` kosong |
| Cosmos DB | Akun tanpa server, database `chathistory`, kontainer `conversations` dipartisi oleh `/userId`, TTL item 30 hari |
| Container Apps | Router dan frontend keduanya menjalankan `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` di port 80 |
| Key Vault (opsional) | Vault yang diaktifkan RBAC kosong; **tidak ada rahasia atau penugasan peran** |
| Application Insights / Log Analytics (opsional) | Pengumpulan log sumber daya dan lingkungan; tidak ada instrumentasi aplikasi khusus, peringatan, atau dasbor |
| Document Intelligence | Akun S0; tidak ada alur kerja pemrosesan dokumen |

Bing Search v7 Legacy dihentikan pada 11 Agustus 2025 dan **tidak disediakan**.
Tidak ada integrasi pengganti berbasis web-grounding yang diimplementasikan.

**Tidak termasuk:** agen pelanggan/inventaris, API router `/chat`, UI chat frontend,
skema pencarian atau skrip pengambilan data, Azure Container Registry, titik akhir pribadi,
identitas yang dikelola, penugasan RBAC, failover otomatis, Front Door, pemindai
tim merah, CLI evaluasi, autentikasi, atau CI/CD.

Pesan keberhasilan ARM hanya mengonfirmasi penyediaan sumber daya. Ini tidak menjamin
fungsionalitas aplikasi, keamanan, ketersediaan, atau kesiapan produksi.

## Prasyarat dan biaya

- Bash (Git Bash/WSL di Windows) dan
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Langganan dengan izin untuk membuat semua sumber daya yang terdaftar.
- Periksa ketersediaan **setiap model/versi/SKU di setiap wilayah yang dipilih** dan
  kuota untuk langganan Anda. Default adalah contoh, bukan jaminan.
  Konsultasikan [ketersediaan model](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Pilih grup sumber daya khusus yang dapat Anda hapus setelah pengujian.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Lokasi default: utama `eastus2`, sekunder `westus2`, embeddings `francecentral`;
grader default ke wilayah utama kecuali `graderLocation` disuplai.
`--no-multi-region` melewati akun sekunder dan embeddings; tidak melewati
akun grader.

Pencarian dikenakan biaya saat disediakan walaupun kosong. Replika minimum kontainer,
redundansi penyimpanan, permintaan/penyimpanan Cosmos DB, token model, panggilan Document Intelligence,
dan pengambilan/penyimpanan log bisa menambah biaya. Tidak ada **total bulanan tetap atau tervalidasi**.
Perkirakan SKU tepat di
[kalkulator harga Azure](https://azure.microsoft.com/pricing/calculator/) dan
konfigurasikan anggaran sebelum menyebarkan.

### Mode Penyebaran

Pengaturan ini adalah ukuran sumber daya, **bukan sertifikasi produksi atau SLA**:

| Mode | Unit kapasitas chat / mini / embedding / grader | Replika router | Replika frontend | Tingkat pencarian | Penyimpanan |
|---|---|---|---|---|---|
| minimal | 10 / 10 / 20 / 5 | 0–3 | 1–2 | dasar, 1 replika | Standard_LRS |
| standar | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standar, 1 replika | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 replika | Standard_GRS |

Unit kapasitas model spesifik untuk model/SKU; jangan jumlahkan sebagai jaminan TPM universal.
Premium tidak mengaktifkan Container Apps dengan redundansi zona: itu memerlukan
desain jaringan tambahan. Pencarian dasar mendukung pencarian vektor, sesuai
batas layanan; ini tidak secara inheren tidak kompatibel dengan vektor.

## 🚀 Penyebaran Cepat

Tinjau `azuredeploy.json` dan `azuredeploy.parameters.json` terlebih dahulu. Perintah
di bawah ini **membuat sumber daya Azure yang dapat ditagih**; bukan pemeriksaan offline.

Dari akar repositori:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Skrip menggunakan jalur relatif ke direktori sendiri, memeriksa login/alatan/argumen,
membuat grup sumber daya jika tidak ada, memvalidasi penyebaran, menyediakan, dan
menunjukkan keluaran non-rahasia. Tidak ada `jq`, pengisian data,
pengambilan rahasia, atau pengaturan aplikasi pasca-penyebaran yang diperlukan atau dilakukan.

Nilai baris perintah default skrip menimpa nilai yang sesuai dalam
file parameter. Edit file parameter untuk pengaturan seperti wilayah sekunder/tersier;
gunakan penyebaran CLI langsung jika perlu penggantian parameter arbitrer:

```bash
az group create --name retail-learning-rg --location eastus2
az deployment group create \
  --resource-group retail-learning-rg \
  --name retail-learning \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --parameters projectName=retail environmentName=dev \
    deploymentMode=minimal enableMultiRegion=false
```

Penyediaan dapat memakan waktu 15–45 menit atau lebih, dan mungkin gagal karena kuota regional atau
pembatasan siklus hidup model. Jangan coba ulang secara membabi buta: baca operasi gagal terlebih dahulu.

## Opsi konfigurasi

| Parameter | Default dalam templat | Makna |
|---|---|---|
| `projectName` | Diperlukan (`retail` dalam file parameter) | 3–10 huruf kecil/angka |
| `location` | Lokasi grup sumber daya | Wilayah utama (`eastus2` dalam file parameter) |
| `secondaryLocation` | `westus2` | Wilayah akun model mini |
| `tertiaryLocation` | `francecentral` | Wilayah akun embeddings |
| `graderLocation` | Wilayah utama | Wilayah akun grader independen |
| `environmentName` | `dev` | `dev`, `staging`, atau `prod`; hanya nama, bukan pengalih penguatan |
| `deploymentMode` | `standard` | Pilihan SKU/kapasitas |
| `enableMultiRegion` | `true` | Tambahkan akun sekunder dan embeddings |
| `enableMonitoring` | `true` | Tambahkan pengumpulan log Insights/ruang kerja dan lingkungan |
| `enableSecurity` | `true` | Buat vault kosong yang diaktifkan RBAC saja |

Parameter `openAiApiVersion` yang menyesatkan telah dihapus: versi API data-plane
tidak mengontrol versi sumber daya ARM atau versi model. Pasangan nama/versi model
ada di `variables.modelDeployments`; periksa bersama dengan SKU penyebaran.

## Verifikasi penyediaan

Gunakan nama penyebaran dari keluaran skrip atau `az deployment group list`.
Untuk penyebaran langsung di atas:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Diharapkan: status penyebaran `Succeeded`. Untuk kegagalan, periksa detail kesalahan operasi.
Keluaran daftar sumber daya saja bukan pemeriksaan status penyediaan yang dapat diandalkan.

Uji placeholder **root**, bukan titik akhir agen yang tidak ada:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Diharapkan: halaman hello-world HTTP 200, **bukan respons chat**. Kesalahan HTTP
tidak dianggap sebagai verifikasi berhasil.

Untuk menguji inferensi model utama yang sebenarnya (dapat ditagih):

```bash
OPENAI_ENDPOINT=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.openAiEndpointPrimary.value -o tsv)
OPENAI_NAME=$(az cognitiveservices account list -g "$RG" \
  --query "[?kind=='OpenAI' && contains(name, '-openai-primary-')].name | [0]" -o tsv)
OPENAI_KEY=$(az cognitiveservices account keys list -g "$RG" -n "$OPENAI_NAME" \
  --query key1 -o tsv)
curl --fail-with-body \
  "${OPENAI_ENDPOINT%/}/openai/deployments/gpt-4.1-chat/chat/completions?api-version=2024-10-21" \
  -H "Content-Type: application/json" -H "api-key: $OPENAI_KEY" \
  -d '{"messages":[{"role":"user","content":"Say hello"}],"max_tokens":20}'
unset OPENAI_KEY
```

Diharapkan: JSON dengan `choices` dan `usage`. Nama penyebaran adalah
`gpt-4.1-chat`, bukan nama model dasar `gpt-4.1`.

## 🔧 Pasca-Penyebaran: Langkah Selanjutnya

Ini adalah **daftar tugas pengembangan**, bukan latihan selesai:

1. Implementasikan agen pelanggan/inventaris yang diautentikasi dan kontrak router.
2. Implementasikan frontend dan validasi konfigurasinya.
3. Buat dan isi indeks pencarian dengan dimensi/profil yang cocok dengan
   model embedding Anda, serta tangani kegagalan dan pembaruan dokumen.
4. Buat registri dan konfigurasikan identitas/izin penarikan gambar.
5. Bangun dan dorong gambar nyata. Ubah port ingress dan probe Container App untuk
   cocok dengan gambar tersebut sebelum pengujian; port 80 di sini milik placeholder.
6. Konfigurasikan rahasia atau identitas yang dikelola dan peran data-plane terbatas. Jangan
   referensi nama rahasia imajiner: templat ini tidak membuat rahasia aplikasi.
7. Instrumentasi aplikasi, konfigurasikan peringatan, uji kegagalan/pemulihan, dan evaluasi
   hasil dengan kebenaran tanah yang representatif dan tinjauan manusia.

Lihat [arsitektur biru cetak](../retail-scenario.md) untuk batasan desain.

## Pemecahan Masalah dan Batasan Keamanan

- **Model tidak tersedia:** verifikasi model/versi/SKU, wilayah, dan kuota langganan;
  skrip tidak memeriksa katalog model sebelumnya.
- **Pemantauan dinonaktifkan:** tujuan log lingkungan adalah `none`, bukan
  konfigurasi Log Analytics kosong yang tidak valid.
- **Hanya placeholder:** `/chat`, evaluasi agen, dan pengambilan file tidak ada.
- **Jaringan/identitas:** titik akhir publik dan autentikasi lokal diaktifkan.
  Mengaktifkan RBAC Key Vault saja tidak membuat penugasan peran atau identitas.
- **Produksi:** tambahkan autentikasi, identitas terbatas, manajemen rahasia,
  jaringan privat jika perlu, desain ketersediaan, dan uji operasional.
  Akun multi-wilayah model sendiri tidak menyediakan failover.

## Pembersihan

Tidak ada proyek AZD di sini; `azd down` bukan perintah pembersihan.
Setelah memastikan grup hanya berisi sumber belajar Anda:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Diharapkan setelah penghapusan selesai: `false`. Sumber daya Key Vault dan Cognitive Services
yang soft-deleted dapat mempertahankan nama; penghapusan permanen membutuhkan izin yang sesuai.
Periksa Manajemen Biaya untuk biaya penggunaan yang tertunda.

[Laporkan masalah](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->