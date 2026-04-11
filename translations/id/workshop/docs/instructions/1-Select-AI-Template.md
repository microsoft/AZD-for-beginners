# 1. Pilih Template

!!! tip "PADA AKHIR MODUL INI ANDA AKAN BISA"

    - [ ] Jelaskan apa itu template AZD
    - [ ] Temukan dan gunakan template AZD untuk AI
    - [ ] Memulai dengan template AI Agents
    - [ ] **Lab 1:** AZD Quickstart di Codespaces atau dev container

---

## 1. Analogi Pembangun

Membangun aplikasi AI modern yang siap untuk perusahaan _dari nol_ bisa terasa menakutkan. Ini sedikit mirip dengan membangun rumah baru Anda sendiri, bata demi bata. Ya, itu bisa dilakukan! Tetapi itu bukan cara yang paling efektif untuk mendapatkan hasil akhir yang diinginkan!

Sebagai gantinya, kita sering memulai dengan sebuah _cetakan biru desain_ yang sudah ada, dan bekerja dengan seorang arsitek untuk menyesuaikannya dengan kebutuhan pribadi kita. Dan itulah pendekatan yang tepat saat membangun aplikasi cerdas. Pertama, temukan arsitektur desain yang baik yang sesuai dengan ruang masalah Anda. Kemudian bekerja dengan seorang arsitek solusi untuk menyesuaikan dan mengembangkan solusi untuk skenario spesifik Anda.

Tetapi di mana kita bisa menemukan cetakan biru desain ini? Dan bagaimana kita menemukan seorang arsitek yang bersedia mengajari kita cara menyesuaikan dan menerapkan cetak biru ini sendiri? Dalam lokakarya ini, kami menjawab pertanyaan-pertanyaan tersebut dengan memperkenalkan Anda pada tiga teknologi:

1. [Azure Developer CLI](https://aka.ms/azd) - sebuah alat sumber terbuka yang mempercepat jalur pengembang dari pengembangan lokal (membangun) ke penyebaran cloud (mengirim).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - repositori sumber terbuka standar yang berisi contoh kode, infrastruktur, dan file konfigurasi untuk menerapkan arsitektur solusi AI.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - agen pengkodean yang berbasis pada pengetahuan Azure, yang dapat membimbing kita dalam menavigasi basis kode dan melakukan perubahan - menggunakan bahasa alami.

Dengan alat-alat ini di tangan, kita sekarang dapat _menemukan_ template yang tepat, _meng-deploy_ nya untuk memvalidasi bahwa itu berfungsi, dan _menyesuaikannya_ agar sesuai dengan skenario spesifik kita. Mari selami dan pelajari bagaimana semuanya bekerja.

---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (atau `azd`) adalah alat baris perintah sumber terbuka yang dapat mempercepat perjalanan kode-ke-cloud Anda dengan serangkaian perintah yang ramah pengembang dan bekerja konsisten di IDE (pengembangan) dan lingkungan CI/CD (devops) Anda.

Dengan `azd`, perjalanan penyebaran Anda bisa sesederhana:

- `azd init` - Menginisialisasi proyek AI baru dari template AZD yang sudah ada.
- `azd up` - Menyediakan infrastruktur dan menerapkan aplikasi Anda dalam satu langkah.
- `azd monitor` - Dapatkan pemantauan real-time dan diagnostik untuk aplikasi yang sudah Anda terapkan.
- `azd pipeline config` - Menyiapkan pipeline CI/CD untuk mengotomatisasi penyebaran ke Azure.

**🎯 | LATIHAN**: <br/> Eksplorasi alat baris perintah `azd` di lingkungan lokakarya Anda saat ini sekarang. Ini bisa berupa GitHub Codespaces, sebuah dev container, atau klon lokal dengan prasyarat yang sudah terpasang. Mulailah dengan mengetik perintah ini untuk melihat apa yang bisa dilakukan alat ini:

```bash title="" linenums="0"
azd help
```

![Alur](../../../../../translated_images/id/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. Template AZD

Untuk `azd` dapat mencapai ini, ia perlu mengetahui infrastruktur yang akan disediakan, pengaturan konfigurasi yang harus diberlakukan, dan aplikasi yang akan diterapkan. Di sinilah [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) berperan.

AZD templates adalah repositori sumber terbuka yang menggabungkan contoh kode dengan file infrastruktur dan konfigurasi yang diperlukan untuk menerapkan arsitektur solusi.
Dengan menggunakan pendekatan _Infrastructure-as-Code_ (IaC), mereka memungkinkan definisi sumber daya template dan pengaturan konfigurasi dikontrol versi (sama seperti kode sumber aplikasi) - menciptakan alur kerja yang dapat digunakan kembali dan konsisten di antara pengguna proyek tersebut.

Saat membuat atau menggunakan kembali sebuah template AZD untuk skenario _Anda_, pertimbangkan pertanyaan-pertanyaan ini:

1. What are you building? → Apakah ada template yang memiliki kode awal untuk skenario tersebut?
1. How is your solution architected? → Apakah ada template yang memiliki sumber daya yang diperlukan?
1. How is your solution deployed? → Pikirkan `azd deploy` dengan hook pra/pasca-pemrosesan!
1. How can you optimize it further? → Pikirkan pemantauan bawaan dan pipeline otomatisasi!

**🎯 | EXERCISE**: <br/> 
Kunjungi galeri [Awesome AZD](https://azure.github.io/awesome-azd/) dan gunakan filter untuk menjelajahi 250+ template yang saat ini tersedia. Lihat apakah Anda dapat menemukan satu yang sesuai dengan kebutuhan skenario _Anda_.

![Kode](../../../../../translated_images/id/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI App Templates

Untuk aplikasi bertenaga AI, Microsoft menyediakan template khusus yang menampilkan **Microsoft Foundry** dan **Foundry Agents**. Template-template ini mempercepat jalan Anda menuju pembuatan aplikasi cerdas yang siap produksi.

### Microsoft Foundry & Foundry Agents Templates

Pilih sebuah template di bawah ini untuk diterapkan. Setiap template tersedia di [Awesome AZD](https://azure.github.io/awesome-azd/) dan dapat diinisialisasi dengan satu perintah.

| Template | Deskripsi | Perintah Deploy |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Aplikasi obrolan dengan Retrieval Augmented Generation menggunakan Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Membangun agen AI dengan Foundry Agents untuk eksekusi tugas secara otonom | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Mengoordinasikan beberapa Foundry Agents untuk alur kerja yang kompleks | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Mengekstrak dan menganalisis dokumen dengan model Microsoft Foundry | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Membangun chatbot cerdas dengan integrasi Microsoft Foundry | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Menghasilkan gambar menggunakan DALL-E melalui Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Agen AI menggunakan Semantic Kernel dengan Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Sistem multi-agen menggunakan kerangka kerja AutoGen | `azd init -t azure-samples/autogen-multi-agent` |

### Mulai Cepat

1. **Telusuri template**: Kunjungi [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) dan saring berdasarkan `AI`, `Agents`, atau `Microsoft Foundry`
2. **Pilih template Anda**: Pilih satu yang sesuai dengan kasus penggunaan Anda
3. **Inisialisasi**: Jalankan perintah `azd init` untuk template yang Anda pilih
4. **Terapkan**: Jalankan `azd up` untuk menyediakan dan menerapkan

**🎯 | LATIHAN**: <br/>
Pilih salah satu template di atas berdasarkan skenario Anda:

- **Membangun chatbot?** → Mulailah dengan **AI Chat with RAG** atau **Conversational AI Bot**
- **Butuh agen otonom?** → Coba **Foundry Agent Service Starter** atau **Multi-Agent Orchestration**
- **Memproses dokumen?** → Gunakan **AI Document Intelligence**
- **Ingin bantuan pengkodean AI?** → Jelajahi **Semantic Kernel Agent** atau **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "JELAJAHI LEBIH BANYAK TEMPLATE"
    The [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) contains 250+ templates. Use the filters to find templates matching your specific requirements for language, framework, and Azure services.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya menjamin ketepatan, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber otoritatif. Untuk informasi penting, disarankan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->