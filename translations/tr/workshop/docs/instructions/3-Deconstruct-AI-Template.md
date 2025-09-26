<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4e403f041411361140d6beb88ab2a181",
  "translation_date": "2025-09-24T14:59:19+00:00",
  "source_file": "workshop/docs/instructions/3-Deconstruct-AI-Template.md",
  "language_code": "tr"
}
-->
# 3. Bir Şablonu Parçalarına Ayırma

!!! tip "BU MODÜLÜN SONUNDA ŞUNLARI YAPABİLECEKSİNİZ"

    - [ ] Madde
    - [ ] Madde
    - [ ] Madde
    - [ ] **Lab 3:** 

---

AZD şablonları ve Azure Developer CLI (`azd`) ile, örnek kod, altyapı ve yapılandırma dosyaları sağlayan standartlaştırılmış depolarla - hazır bir _başlangıç_ projesi şeklinde - AI geliştirme yolculuğumuza hızlı bir başlangıç yapabiliriz.

**Ancak şimdi, proje yapısını ve kod tabanını anlamamız ve AZD şablonunu özelleştirebilmemiz gerekiyor - önceden herhangi bir deneyim veya AZD hakkında bilgi sahibi olmadan!**

---

## 1. GitHub Copilot'u Etkinleştirme

### 1.1 GitHub Copilot Chat'i Yükleme

[GitHub Copilot'un Agent Modu](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) ile tanışma zamanı. Artık görevimizi yüksek seviyede doğal dilde tanımlayabilir ve yürütme konusunda yardım alabiliriz. Bu laboratuvar için, tamamlamalar ve sohbet etkileşimleri için aylık bir sınırı olan [Copilot Ücretsiz planını](https://github.com/github-copilot/signup) kullanacağız.

Eklenti, marketplace üzerinden yüklenebilir, ancak Codespaces ortamınızda zaten mevcut olmalıdır. _Copilot simgesinin açılır menüsünden `Open Chat` seçeneğine tıklayın ve `What can you do?` gibi bir komut yazın_ - giriş yapmanız istenebilir. **GitHub Copilot Chat hazır.**

### 1.2 MCP Sunucularını Yükleme

Agent modunun etkili olabilmesi için, bilgi almasına veya eylemler gerçekleştirmesine yardımcı olacak doğru araçlara erişmesi gerekir. İşte MCP sunucuları burada devreye giriyor. Aşağıdaki sunucuları yapılandıracağız:

1. [Azure MCP Sunucusu](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Sunucusu](../../../../../workshop/docs/instructions)

Bunları etkinleştirmek için:

1. `.vscode/mcp.json` adlı bir dosya oluşturun (eğer yoksa)
1. Aşağıdaki kodu bu dosyaya kopyalayın - ve sunucuları başlatın!
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

??? warning "`npx` yüklü değil hatası alabilirsiniz (düzeltme için tıklayın)"

      Bunu düzeltmek için `.devcontainer/devcontainer.json` dosyasını açın ve özellikler bölümüne şu satırı ekleyin. Ardından konteyneri yeniden oluşturun. Artık `npx` yüklü olmalıdır.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3 GitHub Copilot Chat'i Test Etme

**Öncelikle `az login` komutunu kullanarak VS Code komut satırından Azure'a kimlik doğrulaması yapın.**

Artık Azure abonelik durumunuzu sorgulayabilir ve dağıtılmış kaynaklar veya yapılandırma hakkında sorular sorabilirsiniz. Şu komutları deneyin:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Ayrıca Azure belgeleri hakkında sorular sorabilir ve Microsoft Docs MCP sunucusundan yanıtlar alabilirsiniz. Şu komutları deneyin:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Ya da bir görevi tamamlamak için kod parçacıkları isteyebilirsiniz. Şu komutu deneyin:

1. `Give me a Python code example that uses AAD for an interactive chat client`

`Ask` modunda, kopyalayıp yapıştırabileceğiniz kod sağlar. `Agent` modunda ise bir adım daha ileri giderek ilgili kaynakları - kurulum betikleri ve belgeler dahil - oluşturabilir ve bu görevi gerçekleştirmenize yardımcı olabilir.

**Artık şablon deposunu keşfetmeye hazırsınız.**

---

## 2. Mimariyi Parçalarına Ayırma

??? prompt "SOR: docs/images/architecture.png dosyasındaki uygulama mimarisini 1 paragrafta açıklayın"

      Bu uygulama, Azure üzerinde modern bir agent tabanlı mimariyi sergileyen AI destekli bir sohbet uygulamasıdır. Çözüm, kullanıcı girdilerini işleyen ve bir AI agent aracılığıyla akıllı yanıtlar üreten ana uygulama kodunu barındıran bir Azure Container App etrafında şekillenmiştir. 
      
      Mimari, AI yetenekleri için temel olarak Azure AI Foundry Projesi'ni kullanır ve GPT-4o-mini gibi dil modelleri ve agent işlevselliği sağlayan Azure AI Hizmetlerine bağlanır. Kullanıcı etkileşimleri, bir React tabanlı ön uçtan, bağlamsal yanıtlar oluşturmak için AI agent hizmetiyle iletişim kuran bir FastAPI arka ucuna akar. 
      
      Sistem, dosya arama veya Azure AI Search hizmeti aracılığıyla bilgi alma yeteneklerini içerir ve agent'ın yüklenen belgelerden bilgi almasına ve alıntı yapmasına olanak tanır. Operasyonel mükemmellik için mimari, izleme, günlük kaydı ve performans optimizasyonu için Application Insights ve Log Analytics Workspace aracılığıyla kapsamlı bir izleme içerir. 
      
      Azure Storage, uygulama verileri ve dosya yüklemeleri için blob depolama sağlar, Managed Identity ise kimlik bilgilerini saklamadan Azure kaynakları arasında güvenli erişim sağlar. Tüm çözüm, talebe göre otomatik olarak ölçeklenen ve Azure'un yönetilen hizmetler ekosistemi aracılığıyla yerleşik güvenlik, izleme ve CI/CD yetenekleri sağlayan konteynerleştirilmiş uygulama ile ölçeklenebilirlik ve sürdürülebilirlik için tasarlanmıştır.

![Mimari](../../../../../translated_images/architecture.48d94861e6e6cdc000edd4d7e2a5020cf2e97a97dbe353789ae9da48c946ccd0.tr.png)

---

## 3. Depo Yapısı

!!! prompt "SOR: Şablon klasör yapısını açıklayın. Görsel bir hiyerarşik diyagramla başlayın."

??? info "CEVAP: Görsel Hiyerarşik Diyagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Yapılandırma ve Kurulum
      │   ├── azure.yaml                    # Azure Developer CLI yapılandırması
      │   ├── docker-compose.yaml           # Yerel geliştirme konteynerleri
      │   ├── pyproject.toml                # Python proje yapılandırması
      │   ├── requirements-dev.txt          # Geliştirme bağımlılıkları
      │   └── .devcontainer/                # VS Code geliştirme konteyneri kurulumu
      │
      ├── 🏗️ Altyapı (infra/)
      │   ├── main.bicep                    # Ana altyapı şablonu
      │   ├── api.bicep                     # API'ye özel kaynaklar
      │   ├── main.parameters.json          # Altyapı parametreleri
      │   └── core/                         # Modüler altyapı bileşenleri
      │       ├── ai/                       # AI hizmet yapılandırmaları
      │       ├── host/                     # Barındırma altyapısı
      │       ├── monitor/                  # İzleme ve günlük kaydı
      │       ├── search/                   # Azure AI Search kurulumu
      │       ├── security/                 # Güvenlik ve kimlik
      │       └── storage/                  # Depolama hesabı yapılandırmaları
      │
      ├── 💻 Uygulama Kaynağı (src/)
      │   ├── api/                          # Arka uç API
      │   │   ├── main.py                   # FastAPI uygulama giriş noktası
      │   │   ├── routes.py                 # API rota tanımları
      │   │   ├── search_index_manager.py   # Arama işlevselliği
      │   │   ├── data/                     # API veri işleme
      │   │   ├── static/                   # Statik web varlıkları
      │   │   └── templates/                # HTML şablonları
      │   ├── frontend/                     # React/TypeScript ön uç
      │   │   ├── package.json              # Node.js bağımlılıkları
      │   │   ├── vite.config.ts            # Vite yapılandırması
      │   │   └── src/                      # Ön uç kaynak kodu
      │   ├── data/                         # Örnek veri dosyaları
      │   │   └── embeddings.csv            # Önceden hesaplanmış gömme verileri
      │   ├── files/                        # Bilgi tabanı dosyaları
      │   │   ├── customer_info_*.json      # Müşteri veri örnekleri
      │   │   └── product_info_*.md         # Ürün belgeleri
      │   ├── Dockerfile                    # Konteyner yapılandırması
      │   └── requirements.txt              # Python bağımlılıkları
      │
      ├── 🔧 Otomasyon ve Betikler (scripts/)
      │   ├── postdeploy.sh/.ps1           # Dağıtım sonrası kurulum
      │   ├── setup_credential.sh/.ps1     # Kimlik bilgisi yapılandırması
      │   ├── validate_env_vars.sh/.ps1    # Ortam doğrulaması
      │   └── resolve_model_quota.sh/.ps1  # Model kota yönetimi
      │
      ├── 🧪 Test ve Değerlendirme
      │   ├── tests/                        # Birim ve entegrasyon testleri
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agent değerlendirme çerçevesi
      │   │   ├── evaluate.py               # Değerlendirme çalıştırıcısı
      │   │   ├── eval-queries.json         # Test sorguları
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Geliştirme alanı
      │   │   ├── 1-quickstart.py           # Hızlı başlangıç örnekleri
      │   │   └── aad-interactive-chat.py   # Kimlik doğrulama örnekleri
      │   └── airedteaming/                 # AI güvenlik değerlendirmesi
      │       └── ai_redteaming.py          # Red team testleri
      │
      ├── 📚 Belgeler (docs/)
      │   ├── deployment.md                 # Dağıtım rehberi
      │   ├── local_development.md          # Yerel kurulum talimatları
      │   ├── troubleshooting.md            # Yaygın sorunlar ve çözümleri
      │   ├── azure_account_setup.md        # Azure ön koşulları
      │   └── images/                       # Belge varlıkları
      │
      └── 📄 Proje Meta Verileri
         ├── README.md                     # Proje genel bakışı
         ├── CODE_OF_CONDUCT.md           # Topluluk kuralları
         ├── CONTRIBUTING.md              # Katkı rehberi
         ├── LICENSE                      # Lisans şartları
         └── next-steps.md                # Dağıtım sonrası rehber
      ```

### 3.1. Temel Uygulama Mimarisi

Bu şablon, **tam yığın web uygulaması** modelini takip eder:

- **Arka Uç**: Azure AI entegrasyonu ile Python FastAPI
- **Ön Uç**: Vite yapı sistemi ile TypeScript/React
- **Altyapı**: Bulut kaynakları için Azure Bicep şablonları
- **Konteynerleştirme**: Tutarlı dağıtım için Docker

### 3.2 Kod Olarak Altyapı (bicep)

Altyapı katmanı, modüler olarak düzenlenmiş **Azure Bicep** şablonlarını kullanır:

   - **`main.bicep`**: Tüm Azure kaynaklarını düzenler
   - **`core/` modülleri**: Farklı hizmetler için yeniden kullanılabilir bileşenler
      - AI hizmetleri (Azure OpenAI, AI Search)
      - Konteyner barındırma (Azure Container Apps)
      - İzleme (Application Insights, Log Analytics)
      - Güvenlik (Key Vault, Managed Identity)

### 3.3 Uygulama Kaynağı (`src/`)

**Arka Uç API (`src/api/`)**:

- FastAPI tabanlı REST API
- Azure AI Agent hizmeti entegrasyonu
- Bilgi alma için arama dizini yönetimi
- Dosya yükleme ve işleme yetenekleri

**Ön Uç (`src/frontend/`)**:

- Modern React/TypeScript SPA
- Hızlı geliştirme ve optimize edilmiş yapılar için Vite
- Agent etkileşimleri için sohbet arayüzü

**Bilgi Tabanı (`src/files/`)**:

- Örnek müşteri ve ürün verileri
- Dosya tabanlı bilgi almayı gösterir
- JSON ve Markdown formatı örnekleri

### 3.4 DevOps ve Otomasyon

**Betikler (`scripts/`)**:

- Platformlar arası PowerShell ve Bash betikleri
- Ortam doğrulama ve kurulum
- Dağıtım sonrası yapılandırma
- Model kota yönetimi

**Azure Developer CLI Entegrasyonu**:

- `azure.yaml` yapılandırması ile `azd` iş akışları
- Otomatik kaynak sağlama ve dağıtım
- Ortam değişkeni yönetimi

### 3.5 Test ve Kalite Güvencesi

**Değerlendirme Çerçevesi (`evals/`)**:

- Agent performans değerlendirmesi
- Sorgu-yanıt kalite testi
- Otomatik değerlendirme hattı

**AI Güvenliği (`airedteaming/`)**:

- AI güvenliği için Red team testleri
- Güvenlik açığı taraması
- Sorumlu AI uygulamaları

---

## 4. Tebrikler 🏆

GitHub Copilot Chat'i MCP sunucularıyla birlikte başarıyla kullandınız ve depoyu keşfettiniz.

- [X] GitHub Copilot'u Azure için etkinleştirdiniz
- [X] Uygulama Mimarisini Anladınız
- [X] AZD şablon yapısını keşfettiniz

Bu, bu şablon için _kod olarak altyapı_ varlıklarını anlamanızı sağlar. Şimdi, AZD için yapılandırma dosyasına bakacağız.

---

