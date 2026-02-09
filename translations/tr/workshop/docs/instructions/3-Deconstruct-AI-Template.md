# 3. Bir Şablonu Parçalarına Ayırma

!!! tip "BU MODÜLÜN SONUNDA ŞUNLARI YAPABİLECEKSİNİZ"

    - [ ] Azure yardımı için MCP sunucularıyla GitHub Copilot'u etkinleştirmek
    - [ ] AZD şablon klasör yapısını ve bileşenlerini anlamak
    - [ ] altyapı-kod olarak (Bicep) düzenleme kalıplarını keşfetmek
    - [ ] **Lab 3:** GitHub Copilot'u kullanarak depoyu keşfetme ve mimarisini anlama

---


With AZD templates and the Azure Developer CLI (`azd`) we can quickly jumpstart our AI development journey with standardized repositories that provide sample code, infrastructure and configuration files - in the form of a ready-to-deploy _starter_ project.

**But now, we need to understand the project structure and codebase - and be able to customize the AZD template - without any prior experience or understanding of AZD!**

---

## 1. GitHub Copilot'u Etkinleştirme

### 1.1 GitHub Copilot Chat'i Yükleyin

It's time to explore [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Now, we can use natural language to describe our task at a high level, and get assistance in execution. For this lab, we'll use the [Copilot Free plan](https://github.com/github-copilot/signup) which has a monthly limit for completions and chat interactions.

The extension can be installed from the marketplace, but should already be available in your Codespaces environment. _Click `Open Chat` from the Copilot icon drop-down - and type a prompt like `What can you do?`_ - you may be prompted to log in. **GitHub Copilot Chat is ready**.

### 1.2. MCP Sunucularını Kurun

For Agent mode to be effective, it needs access to the right tools to help it retrieve knowledge or take actions. This is where MCP servers can help. We'll configure the following servers:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

To activate these:

1. Create a file called `.vscode/mcp.json` if it does not exist
1. Copy the following into that file - and start the servers!
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "npx'in yüklü olmadığına dair bir hata alabilirsiniz (düzeltme için tıklayın)"

      Bu sorunu düzeltmek için, `.devcontainer/devcontainer.json` dosyasını açın ve features bölümüne bu satırı ekleyin. Ardından konteyneri yeniden oluşturun. Artık `npx` yüklü olmalıdır.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. GitHub Copilot Chat'i Test Etme

**İlk olarak VS Code komut satırından Azure'a kimlik doğrulaması yapmak için `az login` kullanın.**

You should now be able to query your Azure subscription status, and ask questions about deployed resources or configuration. Try these prompts:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

You can also ask questions about Azure documentation and get responses grounded in the Microsoft Docs MCP server. Try these prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Or you can ask for code snippets to complete a task. Try this prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

In `Ask` mode, this will provide code that you can copy-paste and try out. In `Agent` mode, this might go a step further and create the relevant resources for you - including setup scripts and documentation - to help you execute that task.

**You are now equipped to start exploring the template repository**

---

## 2. Mimarinin İncelenmesi

??? prompt "SORU: docs/images/architecture.png içindeki uygulama mimarisini 1 paragrafta açıklayın"

      Bu uygulama, Azure üzerinde inşa edilmiş yapay zekâ destekli bir sohbet uygulamasıdır ve modern ajan tabanlı bir mimariyi gösterir. Çözümün merkezinde ana uygulama kodunu barındıran bir Azure Container App bulunur; bu kod kullanıcı girdisini işler ve bir yapay zekâ ajanı aracılığıyla akıllı yanıtlar üretir. 
      
      Mimari, AI yetenekleri için temel olarak Microsoft Foundry Project'i kullanır ve altında yatan dil modellerini (ör. GPT-4o-mini) ve ajan işlevselliğini sağlayan Azure AI Hizmetleri ile bağlantı kurar. Kullanıcı etkileşimleri React tabanlı ön uçtan, AI ajan servisi ile iletişim kuran bir FastAPI arka uca akar ve bağlamsal yanıtlar üretilir. 
      
      Sistem, ajanların yüklenen belgelerden bilgi alıp alıntı yapabilmesini sağlayan dosya araması veya Azure AI Search servisi üzerinden bilgi alma yeteneklerini içerir. Operasyonel mükemmellik için mimari, izleme, iz ve performans optimizasyonu sağlamak amacıyla Application Insights ve Log Analytics Workspace ile kapsamlı izleme entegrasyonuna sahiptir. 
      
      Azure Storage, uygulama verileri ve dosya yüklemeleri için blob depolama sağlar; Managed Identity ise kimlik bilgilerini saklamadan Azure kaynakları arasında güvenli erişim sağlar. Tüm çözüm, talebe göre otomatik ölçeklenen konteyner tabanlı uygulama ile ölçeklenebilirlik ve sürdürülebilirlik göz önünde bulundurularak tasarlanmış olup, yerleşik güvenlik, izleme ve CI/CD yeteneklerini Azure'un yönetilen servis ekosistemi aracılığıyla sunar.

![Mimari](../../../../../translated_images/tr/architecture.48d94861e6e6cdc0.webp)

---

## 3. Depo Yapısı

!!! prompt "SORU: Şablon klasör yapısını açıklayın. Görsel hiyerarşik diyagramla başlayın."

??? info "CEVAP: Görsel Hiyerarşik Diyagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Yapılandırma ve Kurulum
      │   ├── azure.yaml                    # Azure Developer CLI yapılandırması
      │   ├── docker-compose.yaml           # Yerel geliştirme kapsayıcıları
      │   ├── pyproject.toml                # Python proje yapılandırması
      │   ├── requirements-dev.txt          # Geliştirme bağımlılıkları
      │   └── .devcontainer/                # VS Code geliştirici konteyneri ayarı
      │
      ├── 🏗️ Altyapı (infra/)
      │   ├── main.bicep                    # Ana altyapı şablonu
      │   ├── api.bicep                     # API'ye özel kaynaklar
      │   ├── main.parameters.json          # Altyapı parametreleri
      │   └── core/                         # Modüler altyapı bileşenleri
      │       ├── ai/                       # AI hizmeti yapılandırmaları
      │       ├── host/                     # Barındırma altyapısı
      │       ├── monitor/                  # İzleme ve günlükleme
      │       ├── search/                   # Azure AI Search kurulumu
      │       ├── security/                 # Güvenlik ve kimlik
      │       └── storage/                  # Depolama hesabı yapılandırmaları
      │
      ├── 💻 Uygulama Kaynağı (src/)
      │   ├── api/                          # Arka uç API'si
      │   │   ├── main.py                   # FastAPI uygulama girişi
      │   │   ├── routes.py                 # API rota tanımları
      │   │   ├── search_index_manager.py   # Arama işlevselliği
      │   │   ├── data/                     # API veri işleme
      │   │   ├── static/                   # Statik web varlıkları
      │   │   └── templates/                # HTML şablonları
      │   ├── frontend/                     # React/TypeScript ön yüzü
      │   │   ├── package.json              # Node.js bağımlılıkları
      │   │   ├── vite.config.ts            # Vite yapılandırması
      │   │   └── src/                      # Ön yüz kaynak kodu
      │   ├── data/                         # Örnek veri dosyaları
      │   │   └── embeddings.csv            # Önceden hesaplanmış embedding'ler
      │   ├── files/                        # Bilgi tabanı dosyaları
      │   │   ├── customer_info_*.json      # Müşteri veri örnekleri
      │   │   └── product_info_*.md         # Ürün belgeleri
      │   ├── Dockerfile                    # Kapsayıcı yapılandırması
      │   └── requirements.txt              # Python bağımlılıkları
      │
      ├── 🔧 Otomasyon ve Komut Dosyaları (scripts/)
      │   ├── postdeploy.sh/.ps1           # Dağıtımdan sonra kurulum
      │   ├── setup_credential.sh/.ps1     # Kimlik bilgisi yapılandırması
      │   ├── validate_env_vars.sh/.ps1    # Ortam doğrulama
      │   └── resolve_model_quota.sh/.ps1  # Model kota yönetimi
      │
      ├── 🧪 Test & Değerlendirme
      │   ├── tests/                        # Birim ve entegrasyon testleri
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Ajan değerlendirme çerçevesi
      │   │   ├── evaluate.py               # Değerlendirme çalıştırıcısı
      │   │   ├── eval-queries.json         # Test sorguları
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Geliştirme oyun alanı
      │   │   ├── 1-quickstart.py           # Başlangıç örnekleri
      │   │   └── aad-interactive-chat.py   # Kimlik doğrulama örnekleri
      │   └── airedteaming/                 # AI güvenlik değerlendirmesi
      │       └── ai_redteaming.py          # Red team testi
      │
      ├── 📚 Dokümantasyon (docs/)
      │   ├── deployment.md                 # Dağıtım rehberi
      │   ├── local_development.md          # Yerel kurulum talimatları
      │   ├── troubleshooting.md            # Yaygın sorunlar ve çözümler
      │   ├── azure_account_setup.md        # Azure önkoşulları
      │   └── images/                       # Dokümantasyon varlıkları
      │
      └── 📄 Proje Meta Verileri
         ├── README.md                     # Proje genel bakışı
         ├── CODE_OF_CONDUCT.md           # Topluluk yönergeleri
         ├── CONTRIBUTING.md              # Katkıda bulunma rehberi
         ├── LICENSE                      # Lisans koşulları
         └── next-steps.md                # Sonraki adımlar
      ```

### 3.1. Temel Uygulama Mimarisi

This template follows a **full-stack web application** pattern with:

- **Backend**: Azure AI entegrasyonu ile Python FastAPI
- **Frontend**: TypeScript/React ve Vite derleme sistemi
- **Infrastructure**: Azure Bicep şablonları ile bulut kaynakları
- **Containerization**: Tutarlı dağıtım için Docker

### 3.2 Altyapı Kod Olarak (Bicep)

The infrastructure layer uses **Azure Bicep** templates organized modularly:

   - **`main.bicep`**: Tüm Azure kaynaklarını orkestre eder
   - **`core/` modülleri**: Farklı hizmetler için yeniden kullanılabilir bileşenler
      - AI hizmetleri (Azure OpenAI, AI Search)
      - Konteyner barındırma (Azure Container Apps)
      - İzleme (Application Insights, Log Analytics)
      - Güvenlik (Key Vault, Managed Identity)

### 3.3 Uygulama Kaynağı (`src/`)

**Arka Uç API (`src/api/`)**:

- FastAPI tabanlı REST API
- Foundry Agents entegrasyonu
- Bilgi erişimi için arama dizini yönetimi
- Dosya yükleme ve işleme yetenekleri

**Ön Uç (`src/frontend/`)**:

- Modern React/TypeScript SPA
- Hızlı geliştirme ve optimize edilmiş derlemeler için Vite
- Ajan etkileşimleri için sohbet arayüzü

**Bilgi Tabanı (`src/files/`)**:

- Örnek müşteri ve ürün verileri
- Dosya tabanlı bilgi erişimini gösterir
- JSON ve Markdown biçiminde örnekler


### 3.4 DevOps ve Otomasyon

**Komut Dosyaları (`scripts/`)**:

- Platformlar arası PowerShell ve Bash betikleri
- Ortam doğrulama ve kurulum
- Dağıtımdan sonra yapılandırma
- Model kota yönetimi

**Azure Developer CLI Entegrasyonu**:

- `azd` iş akışları için `azure.yaml` yapılandırması
- Otomatik sağlama ve dağıtım
- Ortam değişkeni yönetimi

### 3.5 Test ve Kalite Güvencesi

**Değerlendirme Çerçevesi (`evals/`)**:

- Ajan performans değerlendirmesi
- Sorgu-yanıt kalite testi
- Otomatik değerlendirme boru hattı

**AI Güvenliği (`airedteaming/`)**:

- AI güvenliği için red team testleri
- Güvenlik açığı taraması
- Sorumlu AI uygulamaları

---

## 4. Tebrikler 🏆

You successfully used GitHub Copilot Chat with MCP servers, to explore the repository.

- [X] Azure için GitHub Copilot'u etkinleştirdiniz
- [X] Uygulama mimarisini anladınız
- [X] AZD şablon yapısını incelediniz

This gives you a sense of the _altyapı olarak kod_ varlıkları için bu şablon. Next, we'll look at the configuration file for AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, [Co-op Translator](https://github.com/Azure/co-op-translator) adlı yapay zekâ çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için özen göstersek de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dilindeki sürümü yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanılması sonucu ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->