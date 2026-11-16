# Rangka Infrastruktur Multi-Ejen Runcit

**Contoh seni bina maju — bukan aplikasi multi-ejen yang berfungsi.**

[Laman utama kursus](../../README.md) ·
[Bab 5](../../docs/chapter-05-multi-agent/README.md) ·
[Pelan seni bina](../retail-scenario.md)

## Apa yang dipasang ini

Direktori ini mengandungi templat ARM, parameter, dan skrip penyebaran Bash.
Tiada **`azure.yaml` atau sumber aplikasi runcit**.

| Sumber | Keadaan sebenar selepas penyediaan |
|---|---|
| Akaun Azure OpenAI utama | Penggunaan `gpt-4.1-chat` dengan `gpt-4.1` versi `2025-04-14`, `GlobalStandard` |
| Akaun OpenAI sekunder (pilihan) | `gpt-4.1-mini-inventory`, model `gpt-4.1-mini` versi `2025-04-14`, `GlobalStandard` |
| Akaun embeddings (pilihan) | `text-embedding-ada-002` versi `2`, `Standard`; tiada saluran pengindeksan |
| Akaun Grader OpenAI | `gpt-4.1-grader`, model `gpt-4.1` versi `2025-04-14`, `GlobalStandard`; tiada penilai |
| AI Search | Perkhidmatan kosong; tiada indeks atau dokumen |
| Penyimpanan | Bekas blob `documents` dan `uploads` kosong |
| Cosmos DB | Akaun tanpa pelayan, pangkalan data `chathistory`, bekas `conversations` yang dipartisikan oleh `/userId`, TTL item 30 hari |
| Container Apps | Router dan frontend kedua-duanya menjalankan `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` pada port 80 |
| Key Vault (pilihan) | Kubur RBAC yang kosong; **tiada rahsia atau penugasan peranan** |
| Application Insights / Log Analytics (pilihan) | Sumber dan pengumpulan log persekitaran; tiada instrumentasi app tersuai, amaran, atau papan pemuka |
| Document Intelligence | Akaun S0; tiada aliran kerja pemprosesan dokumen |

Legacy Bing Search v7 telah bersara pada 11 Ogos 2025 dan **tidak disediakan**.
Tiada integrasi web-grounding pengganti dilaksanakan.

**Tidak termasuk:** ejen pelanggan/inventori, API router `/chat`, UI sembang frontend,
skema carian atau skrip penyertaan, Azure Container Registry, titik akhir persendirian,
identiti terurus, penugasan RBAC, failover automatik, Front Door, pengimbas
pasukan merah, CLI penilaian, pengesahan, atau CI/CD.

Mesej kejayaan ARM hanya mengesahkan penyediaan sumber. Ia tidak mengesahkan
fungsi aplikasi, keselamatan, ketersediaan, atau kesediaan produksi.

## Prasyarat dan kos

- Bash (Git Bash/WSL di Windows) dan
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Langganan dengan kebenaran untuk membuat semua sumber yang disenaraikan.
- Periksa ketersediaan **setiap model/versi/SKU di setiap rantau yang dipilih** dan
  kuota untuk langganan anda. Nilai lalai adalah contoh, bukan jaminan.
  Rujuk [ketersediaan model](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Pilih kumpulan sumber khusus yang boleh anda hapus selepas ujian.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Lokasi lalai: utama `eastus2`, sekunder `westus2`, embeddings `francecentral`;
grader menggunakan lalai rantau utama melainkan `graderLocation` diberikan.
`--no-multi-region` melewati akaun sekunder dan embeddings; ia tidak melewati
akaun grader.

Carian dikenakan caj semasa disediakan walaupun kosong. Minimum replika bekas,
redundansi penyimpanan, permintaan/penyimpanan Cosmos DB, token model, panggilan Document Intelligence
dan pengumpulan/penyimpanan log boleh menambah caj. Tiada **jumlah bulanan tetap atau sahih**.
Anggarkan SKU tepat dalam
[kalkulator harga Azure](https://azure.microsoft.com/pricing/calculator/) dan
tetapkan bajet sebelum membuat penyediaan.

### Mod penyediaan

Tetapan ini adalah saiz sumber, **bukan sijil produksi atau SLA**:

| Mod | Unit kapasiti Sembang / mini / embedding / grader | Replika router | Replika frontend | Tier carian | Penyimpanan |
|---|---|---|---|---|---|
| minimal | 10 / 10 / 20 / 5 | 0–3 | 1–2 | asas, 1 replika | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 replika | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 replika | Standard_GRS |

Unit kapasiti model adalah khusus model/SKU; jangan jumlahkan sebagai jaminan TPM sejagat.
Premium tidak membenarkan Container Apps berorientasikan zon redundan: itu memerlukan
reka bentuk rangkaian tambahan. Carian Asas menyokong carian vektor, tertakluk kepada
had perkhidmatan; ia tidak bertentangan dengan vektor secara inheren.

## 🚀 Penyediaan Pantas

Semak dahulu `azuredeploy.json` dan `azuredeploy.parameters.json`. Arahan
di bawah **membina sumber Azure yang boleh ditagih**; ia bukan pemeriksaan luar talian.

Dari akar repositori:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Skrip menggunakan laluan relatif ke direktori sendiri, periksa log masuk/alatan/argumen,
cipta kumpulan sumber jika tiada, sahkan penyediaan, menyediakan, dan
menunjukkan output bukan rahsia. Tiada `jq`, pengisian data, pengambilan rahsia, atau
persediaan aplikasi selepas penyediaan diperlukan atau dilakukan.

Nilai lalai arahan baris skrip menulis ganti nilai sepadan dalam
fail parameter. Edit fail parameter untuk tetapan seperti rantau sekunder/tertiari;
gunakan penyediaan CLI terus jika anda perlu override parameter sewenang-wenangnya:

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

Penyediaan boleh mengambil masa 15–45 minit atau lebih lama, dan mungkin gagal kerana kuota rantau atau
sekatan kitaran hayat model. Jangan cuba semula tanpa berfikir: baca dahulu operasi yang gagal.

## Pilihan konfigurasi

| Parameter | Lalai dalam templat | Maksud |
|---|---|---|
| `projectName` | Wajib (`retail` dalam fail parameter) | 3–10 huruf kecil/nombor |
| `location` | Lokasi kumpulan sumber | Rantau utama (`eastus2` dalam fail parameter) |
| `secondaryLocation` | `westus2` | Rantau akaun model mini |
| `tertiaryLocation` | `francecentral` | Rantau akaun embeddings |
| `graderLocation` | Rantau utama | Rantau akaun grader bebas |
| `environmentName` | `dev` | `dev`, `staging`, atau `prod`; hanya nama, bukan togol pengukuhan |
| `deploymentMode` | `standard` | Pemilihan SKU/kapasiti |
| `enableMultiRegion` | `true` | Tambah akaun sekunder dan embeddings |
| `enableMonitoring` | `true` | Tambah Insights/kawasan kerja dan pengumpulan log persekitaran |
| `enableSecurity` | `true` | Cipta kubur RBAC yang kosong sahaja |

Parameter `openAiApiVersion` yang mengelirukan telah dibuang: versi API satah data
tidak mengawal versi sumber ARM atau versi model. Pasangan nama/versi model
ada dalam `variables.modelDeployments`; periksa bersama-sama dengan SKU penyediaan.

## Sahkan penyediaan

Gunakan nama penyediaan dari output skrip atau `az deployment group list`.
Untuk penyediaan terus di atas:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Dijangka: status penyediaan `Succeeded`. Untuk kegagalan, periksa butiran ralat operasi.
Output senarai sumber sahaja bukan pemeriksaan status penyediaan yang boleh dipercayai.

Uji placeholder **root**, bukan titik akhir ejen yang tidak wujud:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Dijangka: halaman hello-world HTTP 200, **bukan respons sembang**. Ralat HTTP
tidak dianggap sebagai pengesahan berjaya.

Untuk menguji inferens model utama sebenar (boleh ditagih):

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

Dijangka: JSON dengan `choices` dan `usage`. Nama penyediaan adalah
`gpt-4.1-chat`, bukan nama model asas `gpt-4.1`.

## 🔧 Selepas Penyediaan: Langkah Seterusnya

Ini adalah **senarai tugasan pembangunan**, bukan latihan yang selesai:

1. Laksanakan ejen pelanggan/inventori yang disahkan dan kontrak router.
2. Laksanakan frontend dan sahkan konfigurasinya.
3. Cipta dan isi indeks carian dengan dimensi/profil yang sesuai dengan model
   embedding anda, dan uruskan kegagalan dan kemas kini dokumen.
4. Cipta registry dan konfigurasikan identiti/kebenaran penarik imej.
5. Bina dan push imej sebenar. Tukar port ingress dan probe Container App untuk
   padan dengan imej tersebut sebelum ujian; port 80 di sini milik placeholder.
6. Konfigurasikan rahsia atau identiti terurus dan peranan satah data yang berskop. Jangan
   rujuk nama rahsia khayalan: templat ini tidak mencipta rahsia aplikasi.
7. Instrumentasikan aplikasi, konfigurasikan amaran, uji kegagalan/pemulihan, dan nilai
   keputusan dengan kebenaran asas yang mewakili dan ulasan manusia.

Lihat [pelan induk seni bina](../retail-scenario.md) untuk garis batas reka bentuk.

## Penyelesaian masalah dan batas keselamatan

- **Model tidak tersedia:** sahkan model/versi/SKU, rantau, dan kuota langganan;
  skrip tidak pralat katalog model.
- **Pemantauan dilumpuhkan:** destinasi log persekitaran ialah `none`, bukan
  konfigurasi Log Analytics yang kosong tidak sah.
- **Hanya placeholder:** `/chat`, penilaian ejen, dan penyertaan fail tidak wujud.
- **Rangkaian/identiti:** titik akhir awam dan pengesahan tempatan diaktifkan.
  Mengaktifkan RBAC Key Vault sahaja tidak menghasilkan penugasan peranan atau identiti.
- **Produksi:** tambahkan pengesahan, identiti berskop, pengurusan rahsia,
  rangkaian peribadi bila sesuai, reka bentuk ketersediaan, dan ujian operasi.
  Akaun model multi-rantau sendiri tidak menyediakan failover.

## Pembersihan

Tiada projek AZD di sini; `azd down` bukan arahan pembersihan.
Selepas memeriksa kumpulan hanya mengandungi sumber pembelajaran anda:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Dijangka selepas penghapusan selesai: `false`. Sumber yang dipadam lembut Key Vault dan Perkhidmatan Kognitif
mungkin mengekalkan nama; pembersihan lengkap memerlukan kebenaran sesuai.
Semak Pengurusan Kos untuk caj penggunaan tertangguh.

[Laporkan isu](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->