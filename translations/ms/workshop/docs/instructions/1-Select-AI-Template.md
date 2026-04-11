# 1. Pilih Template

!!! tip "PADA AKHIR MODUL INI ANDA AKAN MAMPU UNTUK"

    - [ ] Terangkan apa itu template AZD
    - [ ] Temui dan gunakan template AZD untuk AI
    - [ ] Mulakan dengan template AI Agents
    - [ ] **Makmal 1:** AZD Quickstart di Codespaces atau kontena pembangunan

---

## 1. Analogi Pembina

Membina aplikasi AI yang moden dan siap untuk perusahaan _dari awal_ boleh menjadi sesuatu yang menakutkan. Ia sedikit seperti membina rumah baru sendiri, bata demi bata. Ya, ia boleh dilakukan! Tetapi itu bukan cara yang paling berkesan untuk mendapatkan hasil akhir yang diingini!

Sebaliknya, kami selalunya bermula dengan _rancangan reka bentuk_ sedia ada, dan bekerjasama dengan arkitek untuk menyesuaikannya mengikut keperluan peribadi kami. Dan itulah pendekatan yang perlu diambil ketika membina aplikasi pintar. Pertama, cari seni bina reka bentuk yang baik yang sesuai dengan ruang masalah anda. Kemudian bekerjasama dengan arkitek penyelesaian untuk menyesuaikan dan membangunkan penyelesaian untuk senario khusus anda.

Tetapi di manakah kita boleh mendapatkan rancangan reka bentuk ini? Dan bagaimana kami menemui arkitek yang sedia mengajar kami bagaimana untuk menyesuaikan dan menyebarkan rancangan ini sendiri? Dalam bengkel ini, kami menjawab soalan-soalan tersebut dengan memperkenalkan anda kepada tiga teknologi:

1. [Azure Developer CLI](https://aka.ms/azd) - alat sumber terbuka yang mempercepat laluan pembangun dari pembangunan tempatan (bina) ke penyebaran awan (hantar).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - repositori sumber terbuka piawai yang mengandungi kod contoh, fail infrastruktur dan konfigurasi untuk menyebarkan seni bina penyelesaian AI.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - ejen pengkodan berasaskan pengetahuan Azure, yang boleh membimbing kami dalam menavigasi pangkalan kod dan melakukan perubahan - menggunakan bahasa semula jadi.

Dengan alat-alat ini dalam tangan, kami kini boleh _menemui_ template yang betul, _menyebarkannya_ untuk mengesahkan ia berfungsi, dan _menyesuaikannya_ supaya sesuai dengan senario khusus kami. Mari kita selami dan belajar bagaimana ia berfungsi.

---

## 2. Azure Developer CLI

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (atau `azd`) adalah alat baris perintah sumber terbuka yang dapat mempercepat perjalanan kod-ke-awan anda dengan set arahan mesra pembangun yang berfungsi secara konsisten di seluruh IDE (pembangunan) dan persekitaran CI/CD (devops) anda.

Dengan `azd`, perjalanan penyebaran anda boleh menjadi sesederhana:

- `azd init` - Memulakan projek AI baru dari template AZD sedia ada.
- `azd up` - Menyediakan infrastruktur dan menyebarkan aplikasi anda dalam satu langkah.
- `azd monitor` - Dapatkan pemantauan masa nyata dan diagnostik untuk aplikasi yang disebarkan.
- `azd pipeline config` - Sediakan saluran CI/CD untuk mengautomasikan penyebaran ke Azure.

**🎯 | LATIHAN**: <br/> Terokai alat baris perintah `azd` dalam persekitaran bengkel anda sekarang. Ini boleh jadi GitHub Codespaces, kontena pembangunan, atau klon tempatan dengan keperluan yang dipasang. Mula dengan menaip arahan ini untuk melihat apa yang alat ini boleh lakukan:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/ms/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. Template AZD

Untuk `azd` mencapai ini, ia perlu tahu infrastruktur yang perlu disediakan, tetapan konfigurasi yang perlu dikuatkuasakan, dan aplikasi untuk disebarkan. Di sinilah [template AZD](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) masuk.

Template AZD adalah repositori sumber terbuka yang menggabungkan kod contoh dengan fail infrastruktur dan konfigurasi yang diperlukan untuk menyebarkan seni bina penyelesaian.
Dengan menggunakan pendekatan _Infrastructure-as-Code_ (IaC), ia membenarkan definisi sumber template dan tetapan konfigurasi dikendalikan versi (seperti kod sumber aplikasi) - mewujudkan aliran kerja yang boleh digunakan semula dan konsisten di kalangan pengguna projek tersebut.

Apabila membuat atau menggunakan semula template AZD untuk senario _anda_, pertimbangkan soalan-soalan ini:

1. Apa yang anda bina? → Adakah terdapat template yang mempunyai kod permulaan untuk senario itu?
1. Bagaimana penyelesaian anda direka? → Adakah terdapat template yang mempunyai sumber yang diperlukan?
1. Bagaimana penyelesaian anda disebarkan? → Fikirkan `azd deploy` dengan kaitan pra/pasca pemprosesan!
1. Bagaimana anda boleh mengoptimumkannya lagi? → Fikirkan pemantauan terbina dalam dan saluran automasi!

**🎯 | LATIHAN**: <br/> 
Lawati galeri [Awesome AZD](https://azure.github.io/awesome-azd/) dan gunakan penapis untuk meneroka lebih 250 template yang kini tersedia. Lihat jika anda boleh menemui satu yang selaras dengan keperluan senario _anda_.

![Code](../../../../../translated_images/ms/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. Template Aplikasi AI

Untuk aplikasi berkuasa AI, Microsoft menyediakan template khusus yang menampilkan **Microsoft Foundry** dan **Foundry Agents**. Template ini mempercepat laluan anda membina aplikasi pintar yang siap untuk produksi.

### Template Microsoft Foundry & Foundry Agents

Pilih template di bawah untuk disebarkan. Setiap template tersedia di [Awesome AZD](https://azure.github.io/awesome-azd/) dan boleh dimulakan dengan satu arahan.

| Template | Penerangan | Arahan Penyebaran |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Aplikasi chat dengan Penghasilan Bertambah Pemulihan menggunakan Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Bina ejen AI dengan Foundry Agents untuk pelaksanaan tugasan autonomi | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Koordinasi pelbagai Foundry Agents untuk aliran kerja kompleks | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Ekstrak dan analisa dokumen dengan model Microsoft Foundry | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Bina chatbot pintar dengan integrasi Microsoft Foundry | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Jana imej menggunakan DALL-E melalui Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Ejen AI menggunakan Semantic Kernel dengan Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Sistem multi-ejen menggunakan rangka kerja AutoGen | `azd init -t azure-samples/autogen-multi-agent` |

### Mula Pantas

1. **Semak templat**: Lawati [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) dan tapis mengikut `AI`, `Agents`, atau `Microsoft Foundry`
2. **Pilih template anda**: Pilih satu yang sesuai dengan kes penggunaan anda
3. **Mulakan**: Jalankan arahan `azd init` untuk template pilihan anda
4. **Sebarkan**: Jalankan `azd up` untuk menyediakan dan menyebarkan

**🎯 | LATIHAN**: <br/>
Pilih salah satu template di atas berdasarkan senario anda:

- **Membangunkan chatbot?** → Mula dengan **AI Chat with RAG** atau **Conversational AI Bot**
- **Perlukan ejen autonomi?** → Cuba **Foundry Agent Service Starter** atau **Multi-Agent Orchestration**
- **Memproses dokumen?** → Gunakan **AI Document Intelligence**
- **Mahukan bantuan pengkodan AI?** → Terokai **Semantic Kernel Agent** atau **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Terokai Lebih Banyak Template"
    Galeri [Awesome AZD](https://azure.github.io/awesome-azd/) mengandungi lebih 250 template. Gunakan penapis untuk mencari template yang sesuai dengan keperluan khusus anda untuk bahasa, rangka kerja, dan perkhidmatan Azure.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsiran yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->