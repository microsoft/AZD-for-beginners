# 3. Bir Şablonu Parçalarına Ayırma

!!! tip "BU MODÜLÜN SONUNDA ŞUNLARI YAPABİLECEKSİNİZ"

    - [ ] Azure yardımı için MCP sunucularıyla GitHub Copilot'u etkinleştirin
    - [ ] AZD şablon klasör yapısını ve bileşenlerini anlayın
    - [ ] Altyapı olarak kod (Bicep) organizasyon desenlerini keşfedin
    - [ ] **Laboratuvar 3:** GitHub Copilot'u kullanarak depo mimarisini keşfedin ve anlayın

---


AZD şablonları ve Azure Developer CLI (`azd`) ile örnek kod, altyapı ve yapılandırma dosyaları sağlayan, dağıtıma hazır bir _başlangıç_ projesi biçiminde standartlaştırılmış depolarla AI geliştirme yolculuğumuza hızlı bir başlangıç yapabiliriz.

**Ancak şimdi, proje yapısını ve kod tabanını anlamamız ve AZD şablonunu herhangi bir ön deneyim veya AZD bilgisi olmadan özelleştirebilmemiz gerekiyor!**

---

## 1. GitHub Copilot'u Etkinleştirin

### 1.1 GitHub Copilot Chat'i Yükleyin

Şimdi [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) özelliğini keşfetme zamanı. Artık doğal dil kullanarak görevimizi üst düzeyde tanımlayabilir ve yürütme konusunda yardım alabiliriz. Bu laboratuvar için, tamamlamalar ve sohbet etkileşimleri için aylık sınırı olan [Copilot Free plan](https://github.com/github-copilot/signup)'ı kullanacağız.

Eklenti marketten yüklenebilir, ancak Codespaces ortamınızda zaten kullanılabilir olmalıdır. _Copilot simgesi açılır menüsünden `Open Chat`e tıklayın - ve `What can you do?` gibi bir istem yazın_ - oturum açmanız istenebilir. **GitHub Copilot Chat hazır.**

### 1.2. MCP Sunucularını Yükleyin

Agent modu etkili olabilmesi için, bilgiyi alma veya işlem yapma konusunda ona yardımcı olacak doğru araçlara erişmesi gerekir. İşte burada MCP sunucuları yardımcı olabilir. Aşağıdaki sunucuları yapılandıracağız:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Bunları etkinleştirmek için:

1. `.vscode/mcp.json` adında bir dosya oluşturun (yoksa)
1. Aşağıdakileri bu dosyaya kopyalayın - ve sunucuları başlatın!
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

??? warning "`npx` yüklü olmadığına dair bir hata alabilirsiniz (düzeltme için genişletmek üzere tıklayın)"

      Bu sorunu düzeltmek için, `.devcontainer/devcontainer.json` dosyasını açın ve features bölümüne bu satırı ekleyin. Ardından kapsayıcıyı yeniden oluşturun. Artık `npx` yüklü olmalıdır.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. GitHub Copilot Chat'i Test Edin

**İlk olarak VS Code komut satırından Azure ile kimlik doğrulaması yapmak için `az login` kullanın.**

Artık Azure abonelik durumunuzu sorgulayabilir ve dağıtılmış kaynaklar veya yapılandırma hakkında sorular sorabilirsiniz. Bu istemleri deneyin:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Ayrıca Azure dokümantasyonu hakkında sorular sorabilir ve Microsoft Docs MCP sunucusuna dayalı yanıtlar alabilirsiniz. Bu istemleri deneyin:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Ya da bir görevi tamamlamak için kod parçacıkları isteyebilirsiniz. Bu istemi deneyin.

1. `Give me a Python code example that uses AAD for an interactive chat client`

`Ask` modunda, bunu kopyalayıp yapıştırabileceğiniz kod sağlayacaktır. `Agent` modunda ise bu, ilgili kaynakları sizin için oluşturma - yapılandırma betikleri ve dokümantasyon dahil - adımına kadar gidebilir ve görevi yürütmenize yardımcı olabilir.

**Artık şablon deposunu keşfetmeye başlamaya hazırsınız**

---

## 2. Mimarinin Parçalarına Ayırılması

??? prompt "SORU: docs/images/architecture.png içindeki uygulama mimarisini 1 paragrafta açıklayın"

      Bu uygulama, modern ajan tabanlı bir mimariyi gösteren Azure üzerinde çalışan AI destekli bir sohbet uygulamasıdır. Çözüm, kullanıcı girdilerini işleyen ve bir AI ajanı aracılığıyla akıllı yanıtlar üreten ana uygulama kodunu barındıran bir Azure Container App etrafında şekillenir. 
      
      Mimari, AI yetenekleri için temel olarak Microsoft Foundry Project'i kullanır ve altyapı dil modelleri (ör. gpt-4.1-mini) ve ajan işlevselliği sağlayan Azure AI Hizmetleri ile bağlantı kurar. Kullanıcı etkileşimleri, bir React tabanlı ön uçtan FastAPI arka uçuna akar; arka uç, bağlamsal yanıtlar üretmek için AI ajan hizmeti ile iletişim kurar. 
      
      Sistem, ajanın yüklenen belgelerden bilgi almasına ve alıntı yapmasına olanak tanıyan dosya araması veya Azure AI Search hizmeti aracılığıyla bilgi alma yeteneklerini içerir. Operasyonel mükemmellik için mimari, izleme, günlükleme ve performans optimizasyonu için Application Insights ve Log Analytics Workspace aracılığıyla kapsamlı izleme içerir. 
      
      Azure Storage, uygulama verileri ve dosya yüklemeleri için blob depolama sağlar; Managed Identity ise Azure kaynakları arasında kimlik bilgileri saklamadan güvenli erişim sağlar. Tüm çözüm, talebe göre otomatik ölçeklenen konteynerize uygulama ile ölçeklenebilirlik ve sürdürülebilirlik göz önünde bulundurularak tasarlanmıştır; ayrıca Azure'un yönetilen hizmetleri ekosistemi aracılığıyla yerleşik güvenlik, izleme ve CI/CD yetenekleri sunar.

![Mimari](../../../../../translated_images/tr/architecture.48d94861e6e6cdc0.webp)

---

## 3. Depo Yapısı

!!! prompt "SORMA: Şablon klasör yapısını açıklayın. Görsel hiyerarşik diyagramla başlayın."

??? info "CEVAP: Görsel Hiyerarşik Diyagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Azure Developer CLI configuration
      │   ├── docker-compose.yaml           # Local development containers
      │   ├── pyproject.toml                # Python project configuration
      │   ├── requirements-dev.txt          # Development dependencies
      │   └── .devcontainer/                # VS Code dev container setup
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # Main infrastructure template
      │   ├── api.bicep                     # API-specific resources
      │   ├── main.parameters.json          # Infrastructure parameters
      │   └── core/                         # Modular infrastructure components
      │       ├── ai/                       # AI service configurations
      │       ├── host/                     # Hosting infrastructure
      │       ├── monitor/                  # Monitoring and logging
      │       ├── search/                   # Azure AI Search setup
      │       ├── security/                 # Security and identity
      │       └── storage/                  # Storage account configs
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # FastAPI application entry
      │   │   ├── routes.py                 # API route definitions
      │   │   ├── search_index_manager.py   # Search functionality
      │   │   ├── data/                     # API data handling
      │   │   ├── static/                   # Static web assets
      │   │   └── templates/                # HTML templates
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js dependencies
      │   │   ├── vite.config.ts            # Vite build configuration
      │   │   └── src/                      # Frontend source code
      │   ├── data/                         # Sample data files
      │   │   └── embeddings.csv            # Pre-computed embeddings
      │   ├── files/                        # Knowledge base files
      │   │   ├── customer_info_*.json      # Customer data samples
      │   │   └── product_info_*.md         # Product documentation
      │   ├── Dockerfile                    # Container configuration
      │   └── requirements.txt              # Python dependencies
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Post-deployment setup
      │   ├── setup_credential.sh/.ps1     # Credential configuration
      │   ├── validate_env_vars.sh/.ps1    # Environment validation
      │   └── resolve_model_quota.sh/.ps1  # Model quota management
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # Unit and integration tests
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agent evaluation framework
      │   │   ├── evaluate.py               # Evaluation runner
      │   │   ├── eval-queries.json         # Test queries
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Development playground
      │   │   ├── 1-quickstart.py           # Getting started examples
      │   │   └── aad-interactive-chat.py   # Authentication examples
      │   └── airedteaming/                 # AI safety evaluation
      │       └── ai_redteaming.py          # Red team testing
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # Deployment guide
      │   ├── local_development.md          # Local setup instructions
      │   ├── troubleshooting.md            # Common issues & fixes
      │   ├── azure_account_setup.md        # Azure prerequisites
      │   └── images/                       # Documentation assets
      │
      └── 📄 Project Metadata
         ├── README.md                     # Project overview
         ├── CODE_OF_CONDUCT.md           # Community guidelines
         ├── CONTRIBUTING.md              # Contribution guide
         ├── LICENSE                      # License terms
         └── next-steps.md                # Post-deployment guidance
      ```

### 3.1. Temel Uygulama Mimarisi

Bu şablon, şu bileşenlere sahip bir **tam yığın web uygulaması** desenini izler:

- **Arka Uç (Backend)**: Python FastAPI ve Azure AI entegrasyonu
- **Ön Uç (Frontend)**: TypeScript/React ve Vite derleme sistemi
- **Altyapı**: Bulut kaynakları için Azure Bicep şablonları
- **Konteynerleştirme**: Tutarlı dağıtım için Docker

### 3.2 Altyapı Olarak Kod (bicep)

Altyapı katmanı, modüler olarak düzenlenmiş **Azure Bicep** şablonlarını kullanır:

   - **`main.bicep`**: Tüm Azure kaynaklarını orkestrasyon eder
   - **`core/` modülleri**: Farklı hizmetler için yeniden kullanılabilir bileşenler
      - AI hizmetleri (Microsoft Foundry Modelleri, AI Search)
      - Konteyner barındırma (Azure Container Apps)
      - İzleme (Application Insights, Log Analytics)
      - Güvenlik (Key Vault, Managed Identity)

### 3.3 Uygulama Kaynağı (`src/`)

**Arka Uç API (`src/api/`)**:

- FastAPI tabanlı REST API
- Foundry Agents entegrasyonu
- Bilgi alma için arama dizini yönetimi
- Dosya yükleme ve işleme yetenekleri

**Ön Uç (`src/frontend/`)**:

- Modern React/TypeScript tek sayfa uygulaması (SPA)
- Hızlı geliştirme ve optimize edilmiş derlemeler için Vite
- Ajan etkileşimleri için sohbet arayüzü

**Bilgi Tabanı (`src/files/`)**:

- Örnek müşteri ve ürün verileri
- Dosya tabanlı bilgi alma örnekleri
- JSON ve Markdown formatı örnekleri


### 3.4 DevOps & Otomasyon

**Betikler (`scripts/`)**:

- Platformlar arası PowerShell ve Bash betikleri
- Ortam doğrulama ve kurulum
- Dağıtımdan sonra yapılandırma
- Model kota yönetimi

**Azure Developer CLI Entegrasyonu**:

- `azure.yaml` `azd` iş akışları için konfigürasyon
- Otomatik sağlama ve dağıtım
- Ortam değişkenleri yönetimi

### 3.5 Test & Kalite Güvencesi

**Değerlendirme Çerçevesi (`evals/`)**:

- Ajan performans değerlendirmesi
- Sorgu-cevap kalite testi
- Otomatik değerlendirme hattı

**Yapay Zeka Güvenliği (`airedteaming/`)**:

- AI güvenliği için red team testleri
- Güvenlik açığı taramaları
- Sorumlu AI uygulamaları

---

## 4. Tebrikler 🏆

GitHub Copilot Chat ile MCP sunucularını başarıyla kullanarak depoyu keşfettiniz.

- [X] GitHub Copilot for Azure etkinleştirildi
- [X] Uygulama Mimarisi anlaşıldı
- [X] AZD şablon yapısı keşfedildi

Bu, bu şablon için _altyapı olarak kod_ varlıklarına dair bir fikir verir. Bir sonraki adımda AZD için yapılandırma dosyasına bakacağız.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğinin farkında olun. Orijinal belge, kendi dilindeki yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucunda ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumlamadan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->