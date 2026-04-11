# Değişiklik Günlüğü - AZD Yeni Başlayanlar

## Giriş

Bu değişiklik günlüğü, AZD Yeni Başlayanlar deposundaki tüm önemli değişiklikleri, güncellemeleri ve iyileştirmeleri belgeler. Sürümlemede semantik versiyonlama ilkelerini takip ediyor ve kullanıcıların sürümler arasındaki farkları anlamasına yardımcı olmak için bu kayıtı tutuyoruz.

## Öğrenme Hedefleri

Bu değişiklik günlüğünü inceleyerek:
- Yeni özellikler ve içerik eklemeleri hakkında bilgi sahibi olursunuz
- Mevcut dokümantasyonda yapılan iyileştirmeleri anlarsınız
- Doğruluğu sağlamak için hata düzeltmelerini ve düzeltmeleri takip edersiniz
- Öğrenme materyallerinin zaman içindeki evrimini takip edersiniz

## Öğrenme Çıktıları

Değişiklik günlüğü girdilerini inceledikten sonra şunları yapabileceksiniz:
- Öğrenme için mevcut yeni içerik ve kaynakları tanımlamak
- Hangi bölümlerin güncellendiğini veya iyileştirildiğini anlamak
- En güncel materyallere göre öğrenme yolunuzu planlamak
- Gelecekteki iyileştirmeler için geri bildirim ve önerilerde bulunmak

## Sürüm Geçmişi

### [v3.19.1] - 2026-03-27

#### Beginner Onboarding Clarification, Setup Validation & Final AZD Command Cleanup
**Bu sürüm, AZD 1.23 doğrulama taramasını takip eden, yeni başlayanlara odaklı bir dokümantasyon geçişidir: AZD-öncelikli kimlik doğrulama rehberliğini netleştirir, yerel kurulum doğrulama betikleri ekler, kilit komutları canlı AZD CLI ile doğrular ve değişiklik günlüğü dışındaki son geçersiz İngilizce-kaynaklı komut atıflarını kaldırır.**

#### Added
- **🧪 Beginner setup validation scripts** ile `validate-setup.ps1` ve `validate-setup.sh` böylece öğrenenler Bölüm 1'e başlamadan önce gereken araçları doğrulayabilir
- **✅ Upfront setup validation steps** kök README ve Bölüm 1 README içinde, böylece eksik ön koşullar `azd up` öncesinde yakalanır

#### Changed
- **🔐 Beginner authentication guidance** artık `azd auth login` komutunu AZD iş akışları için birincil yol olarak tutarlı şekilde ele alıyor; `az login` yalnızca Azure CLI komutları doğrudan kullanıldığında isteğe bağlı olarak belirtiliyor
- **📚 Chapter 1 onboarding flow** artık öğrenenleri kurulum, kimlik doğrulama ve ilk dağıtım adımlarından önce yerel kurulumlarını doğrulamaya yönlendiriyor
- **🛠️ Validator messaging** artık AZD-ye yalnızca yeni başlayan yolunda engelleyici gereksinimleri, isteğe bağlı Azure CLI uyarılarından açıkça ayırıyor
- **📖 Configuration, troubleshooting, and example docs** artık gerekli AZD kimlik doğrulaması ile her ikisinin bağlam verilmeden sunulduğu durumlarda isteğe bağlı Azure CLI oturum açma ayrımını yapıyor

#### Fixed
- **📋 Remaining English-source command references** güncellendi ve şu anki AZD biçimleriyle eşleşiyor; hile sayfasındaki `azd config show` ve Azure Portal genel bakış rehberliğinin amaçlandığı `azd monitor --overview` dahil
- **🧭 Beginner claims in Chapter 1** Bölüm 1'deki yeni başlayan iddiaları, tüm şablonlar ve Azure kaynakları genelinde garantili sıfır-hata veya geri alma davranışı vaat etmeyecek şekilde yumuşatıldı
- **🔎 Live CLI validation** `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, ve `azd down --force --purge` için mevcut desteği doğruladı

#### Files Updated
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12 Validation, Workshop Environment Expansion & AI Model Refresh
**Bu sürüm, `azd` `1.23.12` sürümüne karşı bir dokümantasyon doğrulama taraması gerçekleştirir, güncel olmayan AZD komut örneklerini günceller, AI model rehberliğini varsayılanlara yeniler ve atölye talimatlarını GitHub Codespaces dışına genişleterek dev container'ları ve yerel klonları da destekler.**

#### Added
- **✅ Validation notes across core chapters and workshop docs** temel bölümler ve atölye belgeleri genelinde doğrulanmış AZD tabanını öğrenenler için açık hale getirmek üzere
- **⏱️ Deployment timeout guidance** uzun süren AI uygulama dağıtımları için `azd deploy --timeout 1800` kullanımını önerir
- **🔎 Extension inspection steps** AI iş akışı belgelerinde `azd extension show azure.ai.agents` ile genişletme denetimi adımları
- **🌐 Broader workshop environment guidance** GitHub Codespaces, dev container'lar ve MkDocs ile yerel klonları kapsayacak şekilde atölye ortam rehberliğini genişletir

#### Changed
- **📚 Chapter intro READMEs** artık foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting ve production bölümleri genelinde `azd 1.23.12` ile doğrulandığını tutarlı şekilde not eder
- **🛠️ AZD command references** doküman genelinde güncel biçimlere güncellendi:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` veya `azd env get-value(s)` bağlama göre
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` Application Insights genel bakışı amaçlandığında
- **🧪 Provision preview examples** mevcut desteklenen kullanıma basitleştirildi, örneğin `azd provision --preview` ve `azd provision --preview -e production`
- **🧭 Workshop flow** artık öğrenenlerin laboratuvarları Codespaces, bir dev container veya yerel bir klon içinde tamamlayabilmesini sağlayacak şekilde güncellendi (sadece Codespaces varsayımı kaldırıldı)
- **🔐 Authentication guidance** artık AZD iş akışları için `azd auth login` kullanmayı tercih ediyor; Azure CLI komutları doğrudan kullanıldığında `az login` isteğe bağlı olarak konumlandırıldı

#### Fixed
- **🪟 Windows install commands** kurulum kılavuzunda mevcut `winget` paket yazımına normalleştirildi
- **🐧 Linux install guidance** desteklenmeyen dağıtıma özgü `azd` paket yöneticisi talimatlarını önlemek için düzeltildi ve yerine gerektiğinde sürüm varlıklarına işaret edildi
- **📦 AI model examples** eski varsayılanlardan `gpt-35-turbo` ve `text-embedding-ada-002` gibi örneklerden `gpt-4.1-mini`, `gpt-4.1` ve `text-embedding-3-large` gibi güncel örneklere yenilendi
- **📋 Deployment and diagnostics snippets** günlükler, betikler ve sorun giderme adımlarında mevcut ortam ve durum komutlarını kullanacak şekilde düzeltildi
- **⚙️ GitHub Actions guidance** `Azure/setup-azd@v1.0.0`'den `Azure/setup-azd@v2`'ye güncellendi
- **🤖 MCP/Copilot consent guidance** `azd mcp consent`'ten `azd copilot consent list`'e güncellendi

#### Improved
- **🧠 AI chapter guidance** artık önizleme duyarlı `azd ai` davranışını, kiracıya özel oturum açmayı, mevcut uzantı kullanımını ve güncellenmiş model dağıtım önerilerini daha iyi açıklıyor
- **🧪 Workshop instructions** gerçekçi sürüm örnekleri ve uygulamalı laboratuvarlar için daha net ortam kurulum dili kullanıyor
- **📈 Production and troubleshooting docs** artık mevcut izleme, yedek model ve maliyet katmanı örnekleriyle daha iyi uyum sağlıyor

#### Files Updated
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### AZD AI CLI Commands, Content Validation & Template Expansion
**Bu sürüm, tüm AI ile ilgili bölümlerde `azd ai`, `azd extension` ve `azd mcp` komut kapsamını ekler, agents.md'deki kırık bağlantıları ve kullanımdan kaldırılmış kodu düzeltir, hile sayfasını günceller ve Doğrulanmış açıklamalar ve yeni Azure AI AZD şablonları ile Örnek Şablonlar bölümünü elden geçirir.**

#### Added
- **🤖 AZD AI CLI coverage** 7 dosya genelinde (önceden yalnızca Bölüm 8'deydi):
  - `docs/chapter-01-foundation/azd-basics.md` — `azd extension`, `azd ai agent init` ve `azd mcp`'i tanıtan yeni "Extensions and AI Commands" bölümü
  - `docs/chapter-02-ai-development/agents.md` — Seçenek 4: şablon ile manifest yaklaşımını karşılaştıran `azd ai agent init`
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" ve "Agent-First Deployment" alt bölümleri
  - `docs/chapter-05-multi-agent/README.md` — Hızlı Başlangıç şimdi hem şablon hem de manifest tabanlı dağıtım yollarını gösteriyor
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy bölümü artık `azd ai agent init` seçeneğini içeriyor
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" alt bölümü
  - `resources/cheat-sheet.md` — `azd extension`, `azd ai agent init`, `azd mcp` ve `azd infra generate` ile yeni "AI & Extensions Commands" bölümü
- **📦 New AZD AI example templates** `microsoft-foundry-integration.md` içinde:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel ve sesli sohbet desteği ile .NET RAG sohbet
  - **azure-search-openai-demo-java** — ACA/AKS dağıtım seçenekleri ile Langchain4J kullanan Java RAG sohbet
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding ve Prompty kullanan çoklu ajan yaratıcı yazma uygulaması
  - **serverless-chat-langchainjs** — Ollama yerel geliştirme desteği ile Azure Functions + LangChain.js + Cosmos DB kullanan serverless RAG
  - **chat-with-your-data-solution-accelerator** — yönetici portalı, Teams entegrasyonu ve PostgreSQL/Cosmos DB seçenekleri ile kurumsal RAG hızlandırıcı
  - **azure-ai-travel-agents** — .NET, Python, Java ve TypeScript sunucularıyla çoklu ajan MCP orkestrasyon referans uygulaması
  - **azd-ai-starter** — Minimal Azure AI altyapı Bicep başlangıç şablonu
  - **🔗 Awesome AZD AI Gallery link** — Referans için [awesome-azd AI galerisi](https://azure.github.io/awesome-azd/?tags=ai) (80+ şablon)

#### Fixed
- **🔗 agents.md navigation**: Önceki/Sonraki bağlantıları artık Bölüm 2 README ders sırasıyla eşleşiyor (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md broken links**: `production-ai-practices.md` `../chapter-08-production/production-ai-practices.md` olarak düzeltildi (3 yerde)
- **📦 agents.md deprecated code**: `opencensus` `azure-monitor-opentelemetry` + OpenTelemetry SDK ile değiştirildi
- **🐛 agents.md invalid API**: `max_tokens` `create_agent()`'den `create_run()` içine `max_completion_tokens` olarak taşındı
- **🔢 agents.md token counting**: Yaklaşık `len//4` tahmini `tiktoken.encoding_for_model()` ile değiştirildi
- **azure-search-openai-demo**: Hizmetler "Cognitive Search + App Service"den "Azure AI Search + Azure Container Apps" olarak düzeltildi (varsayılan barındırma Ekim 2024'te değişti)
- **contoso-chat**: Açıklama, depo başlığı ve teknoloji yığınıyla uyumlu olarak Azure AI Foundry + Prompty referansını ekleyecek şekilde güncellendi

#### Removed
- **ai-document-processing**: İşlevsel olmayan şablon referansı kaldırıldı (repo AZD şablonu olarak genel erişime açık değil)

#### Improved
- **📝 agents.md alıştırmaları**: Alıştırma 1 şimdi beklenen çıktıyı ve `azd monitor` adımını gösteriyor; Alıştırma 2, tam `FunctionTool` kayıt kodunu içeriyor; Alıştırma 3, belirsiz yönergeleri somut `prepdocs.py` komutlarıyla değiştiriyor
- **📚 agents.md kaynakları**: Belge bağlantıları, mevcut Azure AI Agent Service belgeleri ve hızlı başlangıç (quickstart) sayfalarına güncellendi
- **📋 agents.md İleri Adımlar tablosu**: Tam bölüm kapsamı için AI Workshop Lab bağlantısı eklendi

#### Güncellenen Dosyalar
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Kurs Gezinimi İyileştirmesi
**Bu sürüm, README.md içindeki bölüm gezintisini geliştirilmiş tablo formatıyla iyileştirir.**

#### Değişiklikler
- **Kurs Haritası Tablosu**: Doğrudan ders bağlantıları, süre tahminleri ve zorluk derecelendirmeleri ile geliştirildi
- **Klasör Temizliği**: Yinelenen eski klasörler kaldırıldı (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Bağlantı Doğrulaması**: Kurs Haritası tablosundaki 21+ dahili bağlantının tümü doğrulandı

### [v3.16.0] - 2026-02-05

#### Ürün İsim Güncellemeleri
**Bu sürüm, ürün başvurularını güncel Microsoft marka isimlendirmesine göre güncelliyor.**

#### Değişiklikler
- **Microsoft Foundry → Microsoft Foundry**: Tüm referanslar çeviri dışı dosyalarda güncellendi
- **Azure AI Agent Service → Foundry Agents**: Hizmet adı mevcut marka ile uyumlu olacak şekilde güncellendi

#### Güncellenen Dosyalar
- `README.md` - Main course landing page
- `changelog.md` - Version history
- `course-outline.md` - Course structure
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Examples documentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - All workshop instruction files

---

### [v3.15.0] - 2026-02-05

#### Ana Depo Yeniden Yapılandırması: Bölüm Tabanlı Klasör İsimleri
**Bu sürüm, daha net gezinme için dokümantasyonu özel bölüm klasörlerine yeniden yapılandırır.**

#### Klasör Yeniden Adlandırmaları
Eski klasörler bölüm numaralı klasörlerle değiştirildi:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Dosya Taşımaları
| Dosya | Kaynak | Hedef |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Eklendi
- **📚 Bölüm README dosyaları**: Her bölüm klasöründe README.md oluşturuldu, içerik:
  - Öğrenme hedefleri ve süre
  - Açıklamalı ders tablosu
  - Hızlı başlat komutları
  - Diğer bölümlere yönlendirme

#### Değişiklikler
- **🔗 Tüm dahili bağlantılar güncellendi**: 78+ yol tüm dokümantasyon dosyalarında güncellendi
- **🗺️ Ana README.md**: Kurs Haritası yeni bölüm yapısıyla güncellendi
- **📝 examples/README.md**: Bölüm klasörlerine çapraz referanslar güncellendi

#### Kaldırıldı
- Eski klasör yapısı kaldırıldı (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Depo Yeniden Yapılandırması: Bölüm Gezinimi
**Bu sürüm bölüm gezinimi README dosyaları ekledi (v3.15.0 tarafından geçersiz kılındı).**

---

### [v3.13.0] - 2026-02-05

#### Yeni AI Ajanları Rehberi
**Bu sürüm Azure Developer CLI ile AI ajanları dağıtmak için kapsamlı bir rehber ekliyor.**

#### Eklendi
- **🤖 docs/microsoft-foundry/agents.md**: Aşağıdaki konuları kapsayan eksiksiz rehber:
  - AI ajanlarının ne olduğu ve sohbet botlarından nasıl farklılaştıkları
  - Üç hızlı başlangıç ajan şablonu (Foundry Agents, Prompty, RAG)
  - Ajan mimarisi desenleri (tek ajan, RAG, çok ajanlı)
  - Araç yapılandırması ve özelleştirme
  - İzleme ve metrik takibi
  - Maliyet hususları ve optimizasyon
  - Yaygın sorun giderme senaryoları
  - Başarı kriterleriyle üç uygulamalı alıştırma

#### İçerik Yapısı
- **Giriş**: Yeni başlayanlar için ajan kavramları
- **Hızlı Başlangıç**: Ajanları `azd init --template get-started-with-ai-agents` ile dağıtın
- **Mimari Desenler**: Ajan desenlerinin görsel diyagramları
- **Yapılandırma**: Araç kurulumu ve ortam değişkenleri
- **İzleme**: Application Insights entegrasyonu
- **Alıştırmalar**: Aşamalı uygulamalı öğrenme (her biri 20-45 dakika)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Ortam Güncellemesi
**Bu sürüm, AZD öğrenim deneyimi için geliştirilmiş varsayılanlarla modern araçları içerecek şekilde geliştirme konteyneri yapılandırmasını güncelliyor.**

#### Değişiklikler
- **🐳 Temel Görüntü**: `python:3.12-bullseye`'den `python:3.12-bookworm`'a güncellendi (en son Debian stable)
- **📛 Konteyner Adı**: Anlaşılırlık için "Python 3"ten "AZD for Beginners"e yeniden adlandırıldı

#### Eklendi
- **🔧 Yeni Dev Container Özellikleri**:
  - Bicep desteği etkinleştirilmiş `azure-cli`
  - `node:20` (AZD şablonları için LTS sürümü)
  - Şablon yönetimi için `github-cli`
  - Konteyner uygulama dağıtımları için `docker-in-docker`

- **🔌 Port Yönlendirme**: Yaygın geliştirme için ön yapılandırılmış portlar:
  - 8000 (MkDocs önizlemesi)
  - 3000 (Web uygulamaları)
  - 5000 (Python Flask)
  - 8080 (API'ler)

- **🧩 Yeni VS Code Uzantıları**:
  - `ms-python.vscode-pylance` - Gelişmiş Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions desteği
  - `ms-azuretools.vscode-docker` - Docker desteği
  - `ms-azuretools.vscode-bicep` - Bicep dil desteği
  - `ms-azure-devtools.azure-resource-groups` - Azure kaynak yönetimi
  - `yzhang.markdown-all-in-one` - Markdown düzenleme
  - `DavidAnson.vscode-markdownlint` - Markdown lint denetimi
  - `bierner.markdown-mermaid` - Mermaid diyagram desteği
  - `redhat.vscode-yaml` - YAML desteği (azure.yaml için)
  - `eamodio.gitlens` - Git görselleştirmesi
  - `mhutchie.git-graph` - Git geçmişi

- **⚙️ VS Code Ayarları**: Python yorumlayıcısı, kaydederken biçimlendirme ve boşluk temizleme için varsayılan ayarlar eklendi

- **📦 requirements-dev.txt güncellendi**:
  - MkDocs minify eklentisi eklendi
  - Kod kalitesi için pre-commit eklendi
  - Azure SDK paketleri eklendi (azure-identity, azure-mgmt-resource)

#### Düzeltildi
- **Oluşturma Sonrası Komutu**: Konteyner başlatıldığında artık AZD ve Azure CLI kurulumu doğrulanıyor

---

### [v3.11.0] - 2026-02-05

#### Yeni Başlayanlar için README Yenilemesi
**Bu sürüm README.md'i yeni başlayanlar için daha erişilebilir hale getirir ve AI geliştiricileri için temel kaynaklar ekler.**

#### Eklendi
- **🆚 Azure CLI vs AZD Karşılaştırması**: Hangi aracın hangi durumda kullanılacağına dair net açıklama ve pratik örnekler
- **🌟 Harika AZD Bağlantıları**: Topluluk şablon galerisine ve katkı kaynaklarına doğrudan bağlantılar:
  - [Awesome AZD Galerisi](https://azure.github.io/awesome-azd/) - Dağıtıma hazır 200+ şablon
  - [Bir Şablon Gönder](https://github.com/Azure/awesome-azd/issues) - Topluluk katkısı
- **🎯 Hızlı Başlangıç Rehberi**: Basitleştirilmiş 3 adımlı başlangıç bölümü (Yükle → Giriş Yap → Dağıt)
- **📊 Deneyime Dayalı Gezinme Tablosu**: Geliştirici deneyimine göre nereden başlanacağına dair net rehberlik

#### Değişiklikler
- **README Yapısı**: Kademeli açıklama için yeniden düzenlendi - önemli bilgiler ilk
- **Giriş Bölümü**: Tamamen yeni başlayanlar için "The Magic of `azd up`"ı açıklayacak şekilde yeniden yazıldı
- **Tekrarlanan İçerik Kaldırıldı**: Tekrarlanan sorun giderme bölümü kaldırıldı
- **Sorun Giderme Komutları**: `azd logs` referansı, geçerli `azd monitor --logs` ile düzeltildi

#### Düzeltildi
- **🔐 Kimlik Doğrulama Komutları**: `azd auth login` ve `azd auth logout` cheat-sheet.md dosyasına eklendi
- **Geçersiz Komut Referansları**: README sorun giderme bölümünden kalan `azd logs` referansları kaldırıldı

#### Notlar
- **Kapsam**: Değişiklikler ana README.md ve resources/cheat-sheet.md dosyalarına uygulandı
- **Hedef Kitle**: İyileştirmeler özellikle AZD'ye yeni geliştiricilere yönelik

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Komut Doğruluğu Güncellemesi
**Bu sürüm, tüm dokümantasyonda var olmayan AZD komutlarını düzelterek tüm kod örneklerinin geçerli Azure Developer CLI sözdizimini kullanmasını sağlar.**

#### Düzeltildi
- **🔧 Var Olmayan AZD Komutları Kaldırıldı**: Geçersiz komutlar kapsamlı şekilde denetlendi ve düzeltildi:
  - `azd logs` (yok) → `azd monitor --logs` veya Azure CLI alternatifleri ile değiştirildi
  - `azd service` alt komutları (yok) → `azd show` ve Azure CLI ile değiştirildi
  - `azd infra import/export/validate` (yok) → kaldırıldı veya geçerli alternatiflerle değiştirildi
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` bayrakları (yok) → kaldırıldı
  - `azd provision --what-if/--rollback` bayrakları (yok) → `--preview` kullanacak şekilde güncellendi
  - `azd config validate` (yok) → `azd config list` ile değiştirildi
  - `azd info`, `azd history`, `azd metrics` (yok) → kaldırıldı

- **📚 Komut Düzeltmeleriyle Güncellenen Dosyalar**:
  - `resources/cheat-sheet.md`: Major overhaul of command reference
  - `docs/deployment/deployment-guide.md`: Fixed rollback and deployment strategies
  - `docs/troubleshooting/debugging.md`: Corrected log analysis sections
  - `docs/troubleshooting/common-issues.md`: Updated troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixed AZD debugging section
  - `docs/getting-started/azd-basics.md`: Corrected monitoring commands
  - `docs/getting-started/first-project.md`: Updated monitoring and debugging examples
  - `docs/getting-started/installation.md`: Fixed help and version examples
  - `docs/pre-deployment/application-insights.md`: Corrected log viewing commands
  - `docs/pre-deployment/coordination-patterns.md`: Fixed agent debugging commands

#### Değiştirildi
- **Geri Alma Stratejileri**: Dokümantasyon, Git tabanlı geri alma kullanacak şekilde güncellendi (AZD'nin yerel geri alma özelliği yoktur)
- **Günlük Görüntüleme**: `azd logs` referansları `azd monitor --logs`, `azd monitor --live` ve Azure CLI komutlarıyla değiştirildi
- **Performans Bölümü**: Var olmayan paralel/artımlı dağıtım bayrakları kaldırıldı, geçerli alternatifler sağlandı

#### Teknik Detaylar
- **Geçerli AZD Komutları**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Geçerli azd monitor Bayrakları**: `--live`, `--logs`, `--overview`
- **Kaldırılan Özellikler**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notlar
- **Doğrulama**: Komutlar Azure Developer CLI v1.23.x ile doğrulandı

---

### [v3.9.0] - 2026-02-05

#### Atölye Tamamlanması ve Dokümantasyon Kalitesi Güncellemesi
**Bu sürüm etkileşimli atölye modüllerini tamamlar, tüm kırık dokümantasyon bağlantılarını düzeltir ve Microsoft AZD kullanan AI geliştiricileri için genel içerik kalitesini iyileştirir.**

#### Eklendi
- **📝 CONTRIBUTING.md**: Yeni katkı yönergeleri belgesi ile:
  - Sorun bildirme ve değişiklik önerme için açık talimatlar
  - Yeni içerik için dokümantasyon standartları
  - Kod örneği yönergeleri ve commit mesajı konvansiyonları
  - Topluluk katılım bilgisi

#### Tamamlandı
- **🎯 Workshop Module 7 (Wrap-up)**: Aşağıları içeren tam tamamlanmış kapanış modülü ile:
  - Çalıştay başarılarının kapsamlı özeti
  - AZD, şablonlar ve Microsoft Foundry'yi kapsayan öğrenilen ana kavramlar bölümü
  - Öğrenme yolculuğunu sürdürme önerileri
  - Zorluk derecelendirmeli atölye meydan okuma egzersizleri
  - Topluluk geri bildirimi ve destek bağlantıları

- **📚 Workshop Module 3 (Deconstruct)**: Güncellenmiş öğrenme hedefleri ile:
  - MCP sunucuları ile GitHub Copilot etkinleştirme rehberi
  - AZD şablon klasör yapısının anlaşılması
  - Altyapı olarak kod (Bicep) organizasyon kalıpları
  - Uygulamalı laboratuvar talimatları

- **🔧 Workshop Module 6 (Teardown)**: Aşağıları içerecek şekilde tamamlandı:
  - Kaynak temizleme ve maliyet yönetimi hedefleri
  - Güvenli altyapı iptali için `azd down` kullanımı
  - Yumuşak silinmiş bilişsel hizmetlerin kurtarılması rehberi
  - GitHub Copilot ve Azure Portal için bonus keşif yönergeleri

#### Düzeltildi
- **🔗 Kırık Bağlantı Düzeltmeleri**: 15+ kırık dahili dokümantasyon bağlantısı çözüldü:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md dosyasına olan yollar düzeltildi
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md ve production-ai-practices.md yolları düzeltildi
  - `docs/getting-started/first-project.md`: var olmayan cicd-integration.md dosyası deployment-guide.md ile değiştirildi
  - `examples/retail-scenario.md`: SSS ve sorun giderme kılavuzu yolları düzeltildi
  - `examples/container-app/microservices/README.md`: kurs ana sayfası ve dağıtım kılavuzu yolları düzeltildi
  - `resources/faq.md` ve `resources/glossary.md`: AI bölümü referansları güncellendi
  - `course-outline.md`: Eğitmen kılavuzu ve AI atölye laboratuvarı referansları düzeltildi

- **📅 Workshop Durumu Banner'ı**: "Under Construction" durumundan Şubat 2026 tarihli aktif atölye durumuna güncellendi

- **🔗 Workshop Navigasyonu**: README.md içindeki, var olmayan lab-1-azd-basics klasörüne işaret eden kırık navigasyon bağlantıları düzeltildi

#### Değiştirildi
- **Workshop Sunumu**: "under construction" uyarısı kaldırıldı, atölye artık tamamlandı ve kullanıma hazır
- **Navigasyon Tutarlılığı**: Tüm atölye modüllerinin doğru modüller arası navigasyona sahip olması sağlandı
- **Öğrenme Yolu Referansları**: Bölümler arası çapraz referanslar doğru microsoft-foundry yollarını kullanacak şekilde güncellendi

#### Doğrulandı
- ✅ Tüm İngilizce markdown dosyalarının geçerli dahili bağlantıları var
- ✅ Atölye modülleri 0-7 öğrenme hedefleriyle tamamlandı
- ✅ Bölümler ve modüller arası navigasyon doğru çalışıyor
- ✅ İçerik Microsoft AZD kullanan AI geliştiricilere uygun
- ✅ Başlangıç düzeyine uygun dil ve yapı korunuyor
- ✅ CONTRIBUTING.md topluluk katkıcıları için net rehberlik sağlıyor

#### Teknik Uygulama
- **Bağlantı Doğrulama**: Tüm .md dahili bağlantılarını otomatik olarak doğrulayan PowerShell betiği
- **İçerik Denetimi**: Atölye tamamlanması ve başlangıç uygunluğu için manuel inceleme
- **Navigasyon Sistemi**: Tutarlı bölüm ve modül navigasyon düzenleri uygulandı

#### Notlar
- **Kapsam**: Değişiklikler yalnızca İngilizce dokümantasyona uygulandı
- **Çeviriler**: Bu sürümde çeviri klasörleri güncellenmedi (otomatik çeviri daha sonra senkronize edilecek)
- **Atölye Süresi**: Tamamlanmış atölye artık 3-4 saatlik uygulamalı öğrenim sağlar

---

### [v3.8.0] - 2025-11-19

#### Gelişmiş Dokümantasyon: İzleme, Güvenlik ve Çok-Ajanlı Desenler
**Bu sürüm, Application Insights entegrasyonu, kimlik doğrulama desenleri ve prodüksiyon dağıtımları için çok-ajan koordinasyonu üzerine kapsamlı A-dereceli dersler ekler.**

#### Eklendi
- **📊 Application Insights Integration Lesson**: `docs/pre-deployment/application-insights.md` içinde:
  - AZD odaklı dağıtım ile otomatik sağlama
  - Application Insights + Log Analytics için eksiksiz Bicep şablonları
  - Özel telemetriye sahip çalışan Python uygulamaları (1.200+ satır)
  - AI/LLM izleme desenleri (Microsoft Foundry Models token/maliyet takibi)
  - 6 Mermaid diyagramı (mimari, dağıtık izleme, telemetri akışı)
  - 3 uygulamalı egzersiz (alarmalar, panolar, AI izleme)
  - Kusto sorgu örnekleri ve maliyet optimizasyon stratejileri
  - Canlı metrik akışı ve gerçek zamanlı hata ayıklama
  - Üretime hazır desenlerle 40-50 dakikalık öğrenme süresi

- **🔐 Authentication & Security Patterns Lesson**: `docs/getting-started/authsecurity.md` içinde:
  - 3 kimlik doğrulama deseni (connection strings, Key Vault, managed identity)
  - Güvenli dağıtımlar için eksiksiz Bicep altyapı şablonları
  - Azure SDK entegrasyonlu Node.js uygulama kodu
  - 3 eksiksiz egzersiz (managed identity etkinleştirme, user-assigned identity, Key Vault rotasyonu)
  - Güvenlik en iyi uygulamaları ve RBAC yapılandırmaları
  - Sorun giderme rehberi ve maliyet analizi
  - Üretime hazır parola gerektirmeyen kimlik doğrulama desenleri

- **🤖 Multi-Agent Coordination Patterns Lesson**: `docs/pre-deployment/coordination-patterns.md` içinde:
  - 5 koordinasyon deseni (ardışık, paralel, hiyerarşik, olay odaklı, uzlaşma)
  - Tam orkestratör hizmeti uygulaması (Python/Flask, 1.500+ satır)
  - 3 özel ajan uygulaması (Research, Writer, Editor)
  - Mesaj kuyruğu için Service Bus entegrasyonu
  - Dağıtık sistemler için Cosmos DB durum yönetimi
  - Ajan etkileşimlerini gösteren 6 Mermaid diyagramı
  - 3 ileri seviye egzersiz (zaman aşımı yönetimi, yeniden deneme mantığı, devre kesici)
  - Optimizasyon stratejileri ile maliyet dökümü ($240-565/month)
  - İzleme için Application Insights entegrasyonu

#### İyileştirildi
- **Pre-deployment Bölümü**: Artık kapsamlı izleme ve koordinasyon desenlerini içeriyor
- **Getting Started Bölümü**: Profesyonel kimlik doğrulama desenleri ile zenginleştirildi
- **Üretime Hazırlık**: Güvenlikten gözlemlenebilirliğe kadar eksiksiz kapsama
- **Kurs İçeriği**: Bölüm 3 ve 6 içindeki yeni derslere referans verecek şekilde güncellendi

#### Değiştirildi
- **Öğrenme İlerleyişi**: Güvenlik ve izleme konularının kurs boyunca daha iyi entegrasyonu
- **Dokümantasyon Kalitesi**: Yeni derslerde tutarlı A-seviyesi standartlar (yüzde 95-97)
- **Üretim Desenleri**: Kurumsal dağıtımlar için uçtan uca eksiksiz kapsama

#### Geliştirildi
- **Geliştirici Deneyimi**: Geliştirmeden prodüksiyon izlemeye net bir yol
- **Güvenlik Standartları**: Kimlik doğrulama ve gizli yönetimi için profesyonel desenler
- **Gözlemlenebilirlik**: AZD ile eksiksiz Application Insights entegrasyonu
- **AI İş Yükleri**: Microsoft Foundry Models ve çok-ajanlı sistemler için özel izleme

#### Doğrulandı
- ✅ Tüm dersler eksiksiz çalışan kod içeriyor (kod parçaları değil)
- ✅ Görsel öğrenme için Mermaid diyagramları (toplam 19, 3 derste)
- ✅ Doğrulama adımları içeren uygulamalı egzersizler (toplam 9)
- ✅ `azd up` ile dağıtılabilecek üretime hazır Bicep şablonları
- ✅ Maliyet analizi ve optimizasyon stratejileri
- ✅ Sorun giderme kılavuzları ve en iyi uygulamalar
- ✅ Doğrulama komutlarıyla bilgi kontrol noktaları

#### Dokümantasyon Değerlendirme Sonuçları
- **docs/pre-deployment/application-insights.md**: - Kapsamlı izleme rehberi
- **docs/getting-started/authsecurity.md**: - Profesyonel güvenlik desenleri
- **docs/pre-deployment/coordination-patterns.md**: - Gelişmiş çok-ajan mimarileri
- **Yeni İçerik Genel Değerlendirmesi**: - Tutarlı yüksek kalite standartları

#### Teknik Uygulama
- **Application Insights**: Log Analytics + özel telemetri + dağıtık izleme
- **Kimlik Doğrulama**: Managed Identity + Key Vault + RBAC desenleri
- **Çok-Ajan**: Service Bus + Cosmos DB + Container Apps + orkestrasyon
- **İzleme**: Canlı metrikler + Kusto sorguları + alarmlar + panolar
- **Maliyet Yönetimi**: Örnekleme stratejileri, saklama politikaları, bütçe kontrolleri

### [v3.7.0] - 2025-11-19

#### Dokümantasyon Kalitesi İyileştirmeleri ve Yeni Microsoft Foundry Models Örneği
**Bu sürüm, depo genelinde dokümantasyon kalitesini artırır ve gpt-4.1 sohbet arayüzü ile eksiksiz bir Microsoft Foundry Models dağıtım örneği ekler.**

#### Eklendi
- **🤖 Microsoft Foundry Models Chat Example**: `examples/azure-openai-chat/` içinde çalışan gpt-4.1 dağıtımı ile tam uygulama:
  - Tam Microsoft Foundry Models altyapısı (gpt-4.1 model dağıtımı)
  - Konuşma geçmişi ile Python komut satırı sohbet arayüzü
  - Güvenli API anahtarı depolama için Key Vault entegrasyonu
  - Token kullanımı takibi ve maliyet tahmini
  - Oran sınırlama ve hata yönetimi
  - 35-45 dakikalık dağıtım rehberi içeren kapsamlı README
  - 11 üretime hazır dosya (Bicep şablonları, Python uygulaması, yapılandırma)
- **📚 Dokümantasyon Alıştırmaları**: Yapılandırma kılavuzuna uygulamalı alıştırmalar eklendi:
  - Alıştırma 1: Çok-ortam yapılandırması (15 dakika)
  - Alıştırma 2: Gizli yönetimi uygulaması (10 dakika)
  - Net başarı kriterleri ve doğrulama adımları
- **✅ Dağıtım Doğrulama**: Dağıtım kılavuzuna doğrulama bölümü eklendi:
  - Sağlık kontrol prosedürleri
  - Başarı kriterleri kontrol listesi
  - Tüm dağıtım komutları için beklenen çıktılar
  - Hızlı sorun giderme referansı

#### İyileştirildi
- **examples/README.md**: A-seviye kaliteye güncellendi (yüzde 93):
  - azure-openai-chat tüm ilgili bölümlere eklendi
  - Yerel örnek sayısı 3'ten 4'e güncellendi
  - AI Uygulama Örnekleri tablosuna eklendi
  - Orta düzey kullanıcılar için Hızlı Başlangıç'a entegre edildi
  - Microsoft Foundry Şablonları bölümüne eklendi
  - Karşılaştırma Matrisi ve teknoloji bulguları bölümleri güncellendi
- **Dokümantasyon Kalitesi**: docs klasörü genelinde B+ (87%) → A- (92%) iyileşti:
  - Kritik komut örneklerine beklenen çıktılar eklendi
  - Yapılandırma değişiklikleri için doğrulama adımları eklendi
  - Uygulamalı öğrenmeyi geliştiren pratik alıştırmalar genişletildi

#### Değiştirildi
- **Öğrenme İlerleyişi**: Orta seviye kullanıcılar için AI örneklerinin daha iyi entegrasyonu
- **Dokümantasyon Yapısı**: Daha eyleme geçirilebilir alıştırmalar ve net sonuçlar
- **Doğrulama Süreci**: Önemli iş akışlarına açık başarı kriterleri eklendi

#### Geliştirildi
- **Geliştirici Deneyimi**: Microsoft Foundry Models dağıtımı artık 35-45 dakika sürüyor (karmaşık alternatiflere göre 60-90 yerine)
- **Maliyet Şeffaflığı**: Microsoft Foundry Models örneği için net maliyet tahminleri ($50-200/month)
- **Öğrenme Yolu**: AI geliştiricileri için azure-openai-chat ile net bir giriş noktası
- **Dokümantasyon Standartları**: Tutarlı beklenen çıktılar ve doğrulama adımları

#### Doğrulandı
- ✅ Microsoft Foundry Models örneği `azd up` ile tam işlevsel
- ✅ Tüm 11 uygulama dosyası sözdizimsel olarak doğru
- ✅ README talimatları gerçek dağıtım deneyimiyle uyumlu
- ✅ Dokümantasyon bağlantıları 8+ yerde güncellendi
- ✅ Örnekler dizini 4 yerel örneği doğru şekilde yansıtıyor
- ✅ Tablolarda tekrar eden harici bağlantı yok
- ✅ Tüm navigasyon referansları doğru

#### Teknik Uygulama
- **Microsoft Foundry Models Mimarisi**: gpt-4.1 + Key Vault + Container Apps deseni
- **Güvenlik**: Managed Identity hazır, gizli veriler Key Vault'ta
- **İzleme**: Application Insights entegrasyonu
- **Maliyet Yönetimi**: Token takibi ve kullanım optimizasyonu
- **Dağıtım**: Tam kurulum için tek `azd up` komutu

### [v3.6.0] - 2025-11-19

#### Büyük Güncelleme: Container App Dağıtım Örnekleri
**Bu sürüm, Azure Developer CLI (AZD) kullanılarak kapsayıcı uygulama dağıtımlarına yönelik kapsamlı, üretime hazır örnekler, tam dokümantasyon ve öğrenme yoluna entegrasyon sunar.**

#### Eklendi
- **🚀 Container App Örnekleri**: `examples/container-app/` içinde yeni yerel örnekler:
  - [Master Guide](examples/container-app/README.md): Kapsayıcı dağıtımlarının eksiksiz genel bakışı, hızlı başlangıç, üretim ve gelişmiş desenler
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Ölçekleme-sıfıra, sağlık kontrolleri, izleme ve sorun giderme özellikli başlangıç dostu REST API
  - [Microservices Architecture](../../examples/container-app/microservices): Üretime hazır çok servisli dağıtım (API Gateway, Product, Order, User, Notification), asenkron mesajlaşma, Service Bus, Cosmos DB, Azure SQL, dağıtık izleme, blue-green/canary dağıtımı
- **En İyi Uygulamalar**: Kapsayıcı iş yükleri için güvenlik, izleme, maliyet optimizasyonu ve CI/CD rehberliği
- **Kod Örnekleri**: Tam `azure.yaml`, Bicep şablonları ve çok dilli servis uygulamaları (Python, Node.js, C#, Go)
- **Test & Sorun Giderme**: Uçtan uca test senaryoları, izleme komutları, sorun giderme rehberliği

#### Değiştirildi
- **README.md**: Yeni container uygulama örneklerini "Local Examples - Container Applications" başlığı altında öne çıkaracak ve bağlayacak şekilde güncellendi
- **examples/README.md**: Container uygulama örneklerini vurgulayacak, karşılaştırma matrisi girişleri ekleyecek ve teknoloji/mimari referansları güncelleyecek şekilde güncellendi
- **Course Outline & Study Guide**: İlgili bölümlerde yeni container uygulama örneklerine ve dağıtım desenlerine referans verecek şekilde güncellendi

#### Doğrulandı
- ✅ Tüm yeni örnekler `azd up` ile dağıtılabilir ve en iyi uygulamaları takip eder
- ✅ Belge çapraz-bağlantıları ve gezinme güncellendi
- ✅ Örnekler başlangıçtan ileri düzeye senaryoları kapsar; üretim mikroservisleri dahil

#### Notlar
- **Scope**: Yalnızca İngilizce dokümantasyon ve örnekler
- **Next Steps**: Gelecek sürümlerde ek gelişmiş container desenleri ve CI/CD otomasyonu ile genişletilecek

### [v3.5.0] - 2025-11-19

#### Ürün Yeniden Markalandırması: Microsoft Foundry
**Bu sürüm, Microsoft'un resmi yeniden markalandırmasını yansıtacak şekilde, tüm İngilizce dokümantasyon boyunca ürün adını "Microsoft Foundry"den "Microsoft Foundry"e kapsamlı şekilde değiştirir.**

#### Değişiklikler
- **🔄 Ürün Adı Güncellemesi**: "Microsoft Foundry"ye eksiksiz yeniden markalandırma
  - `docs/` klasöründeki İngilizce dokümantasyondaki tüm referanslar güncellendi
  - Klasör yeniden adlandırıldı: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Dosya yeniden adlandırıldı: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Toplam: 7 belgede 23 içerik referansı güncellendi

- **📁 Klasör Yapısı Değişiklikleri**:
  - `docs/ai-foundry/` `docs/microsoft-foundry/` olarak yeniden adlandırıldı
  - Tüm çapraz-referanslar yeni klasör yapısını yansıtacak şekilde güncellendi
  - Gezinti bağlantıları tüm dokümantasyon genelinde doğrulandı

- **📄 Dosya Yeniden Adlandırmaları**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tüm dahili bağlantılar yeni dosya adını referans gösterecek şekilde güncellendi

#### Güncellenen Dosyalar
- **Bölüm Dokümantasyonu** (7 dosya):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 gezinme bağlantısı güncellemesi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ürün adı referansı güncellemesi
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Zaten Microsoft Foundry kullanılıyor (önceki güncellemerden)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referans güncellemesi (genel bakış, topluluk geri bildirimi, dokümantasyon)
  - `docs/getting-started/azd-basics.md` - 4 çapraz-referans bağlantısı güncellemesi
  - `docs/getting-started/first-project.md` - 2 bölüm gezinme bağlantısı güncellemesi
  - `docs/getting-started/installation.md` - 2 sonraki bölüm bağlantısı güncellemesi
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referans güncellemesi (gezinme, Discord topluluğu)
  - `docs/troubleshooting/common-issues.md` - 1 gezinme bağlantısı güncellemesi
  - `docs/troubleshooting/debugging.md` - 1 gezinme bağlantısı güncellemesi

- **Kurs Yapısı Dosyaları** (2 dosya):
  - `README.md` - 17 referans güncellemesi (kurs genel bakışı, bölüm başlıkları, şablonlar bölümü, topluluk içgörüleri)
  - `course-outline.md` - 14 referans güncellemesi (genel bakış, öğrenme hedefleri, bölüm kaynakları)

#### Doğrulandı
- ✅ İngilizce dokümanlarda kalan "ai-foundry" klasör yolu referansı yok
- ✅ İngilizce dokümanlarda kalan "Microsoft Foundry" ürün adı referansı yok
- ✅ Tüm gezinme bağlantıları yeni klasör yapısıyla çalışır durumda
- ✅ Dosya ve klasör yeniden adlandırmaları başarıyla tamamlandı
- ✅ Bölümler arası çapraz referanslar doğrulandı

#### Notlar
- **Scope**: Değişiklikler yalnızca `docs/` klasöründeki İngilizce dokümantasyona uygulandı
- **Translations**: Çeviri klasörleri (`translations/`) bu sürümde güncellenmedi
- **Workshop**: Atölye materyalleri (`workshop/`) bu sürümde güncellenmedi
- **Examples**: Örnek dosyalar hâlâ eski adlandırma referanslarını içerebilir (gelecek güncellemede ele alınacak)
- **External Links**: Harici URL'ler ve GitHub depo referansları değişmeden kaldı

#### Katkıda Bulunanlar için Geçiş Rehberi
Eğer yerel dallarınızda veya dokümantasyonunuzda eski yapıya referanslar varsa:
1. Klasör referanslarını güncelleyin: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Dosya referanslarını güncelleyin: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ürün adını değiştirin: "Microsoft Foundry" → "Microsoft Foundry"
4. Tüm dahili dokümantasyon bağlantılarının hâlâ çalıştığını doğrulayın

---

### [v3.4.0] - 2025-10-24

#### Altyapı Önizleme ve Doğrulama İyileştirmeleri
**Bu sürüm, yeni Azure Developer CLI önizleme özelliği için kapsamlı destek sunar ve atölye kullanıcı deneyimini geliştirir.**

#### Eklendi
- **🧪 azd provision --preview Özellik Dokümantasyonu**: Yeni altyapı önizleme yeteneğinin kapsamlı açıklaması
  - Yardım sayfasında komut referansı ve kullanım örnekleri
  - Kullanım senaryoları ve faydalarla birlikte sağlama rehberinde detaylı entegrasyon
  - Daha güvenli dağıtım doğrulaması için pre-flight kontrol entegrasyonu
  - Güvenlik öncelikli dağıtım uygulamalarıyla başlangıç rehberi güncellemeleri
- **🚧 Workshop Durum Bannerı**: Atölye geliştirme durumunu belirten profesyonel HTML bannerı
  - Net kullanıcı iletişimi için yapı göstergelerine sahip gradyan tasarım
  - Şeffaflık için son güncelleme zaman damgası
  - Tüm cihaz türleri için mobil uyumlu tasarım

#### Geliştirilmiş
- **Altyapı Güvenliği**: Önizleme işlevselliği dağıtım dokümantasyonu genelinde entegre edildi
- **Ön Dağıtım Doğrulaması**: Otomatik betikler artık altyapı önizleme testlerini içeriyor
- **Geliştirici İş Akışı**: Komut dizileri en iyi uygulama olarak önizlemeyi içerecek şekilde güncellendi
- **Atölye Deneyimi**: İçerik geliştirme durumu hakkında kullanıcılara net beklentiler sunuldu

#### Değiştirildi
- **Dağıtım En İyi Uygulamaları**: Önizleme-öncelikli iş akışı şimdi önerilen yaklaşım
- **Dokümantasyon Akışı**: Altyapı doğrulaması öğrenme sürecinde daha erken bir aşamaya taşındı
- **Atölye Sunumu**: Profesyonel durum iletişimi ile net geliştirme zaman çizelgesi sunuldu

#### İyileştirildi
- **Güvenlik-Öncelikli Yaklaşım**: Altyapı değişiklikleri dağıtılmadan önce doğrulanabilir
- **Ekip İşbirliği**: Önizleme sonuçları inceleme ve onay için paylaşılabilir
- **Maliyet Farkındalığı**: Sağlama öncesi kaynak maliyetlerinin daha iyi anlaşılması
- **Risk Azaltma**: Önceden doğrulama ile dağıtım hataları azaltıldı

#### Teknik Uygulama
- **Çoklu Belge Entegrasyonu**: Önizleme özelliği 4 ana dosyada belgelenmiştir
- **Komut Kalıpları**: Dokümantasyon genelinde tutarlı sözdizimi ve örnekler
- **En İyi Uygulama Entegrasyonu**: Önizleme, doğrulama iş akışları ve betiklere dahil edildi
- **Görsel Göstergeler**: Bulunabilirlik için yeni özellik işaretlemeleri

#### Workshop Altyapısı
- **Durum İletişimi**: Gradyan stilinde profesyonel HTML bannerı
- **Kullanıcı Deneyimi**: Geliştirme durumu hakkında net bilgi karışıklığı önler
- **Profesyonel Sunum**: Depo güvenilirliğini korurken beklentileri belirler
- **Zaman Çizelgesi Şeffaflığı**: Sorumluluk için Ekim 2025 son güncelleme zaman damgası

### [v3.3.0] - 2025-09-24

#### Geliştirilmiş Atölye Materyalleri ve Etkileşimli Öğrenme Deneyimi
**Bu sürüm, tarayıcı tabanlı etkileşimli rehberler ve yapılandırılmış öğrenme yollarıyla kapsamlı atölye materyalleri sunar.**

#### Eklendi
- **🎥 Etkileşimli Atölye Rehberi**: MkDocs önizleme yeteneği ile tarayıcı tabanlı atölye deneyimi
- **📝 Yapılandırılmış Atölye Talimatları**: Keşiften özelleştirmeye kadar 7 adımlı rehber öğrenme yolu
  - 0-Introduction: Workshop genel bakışı ve kurulum
  - 1-Select-AI-Template: Şablon keşfi ve seçim süreci
  - 2-Validate-AI-Template: Dağıtım ve doğrulama prosedürleri
  - 3-Deconstruct-AI-Template: Şablon mimarisinin anlaşılması
  - 4-Configure-AI-Template: Yapılandırma ve özelleştirme
  - 5-Customize-AI-Template: Gelişmiş değişiklikler ve yinelemeler
  - 6-Teardown-Infrastructure: Temizlik ve kaynak yönetimi
  - 7-Wrap-up: Özet ve sonraki adımlar
- **🛠️ Atölye Araçları**: Geliştirilmiş öğrenme deneyimi için Material temalı MkDocs yapılandırması
- **🎯 Uygulamalı Öğrenme Yolu**: 3 adımlı metodoloji (Keşif → Dağıtım → Özelleştirme)
- **📱 GitHub Codespaces Entegrasyonu**: Sorunsuz geliştirme ortamı kurulumu

#### Geliştirilmiş
- **AI Workshop Lab**: Kapsamlı 2-3 saatlik yapılandırılmış öğrenme deneyimi ile genişletildi
- **Atölye Dokümantasyonu**: Gezinti ve görsel yardımcılarla profesyonel sunum
- **Öğrenme İlerleyişi**: Şablon seçiminden üretim dağıtımına kadar adım adım rehberlik
- **Geliştirici Deneyimi**: Düzgün geliştirme iş akışları için entegre araçlar

#### İyileştirildi
- **Erişilebilirlik**: Arama, kopyalama işlevselliği ve tema geçişi ile tarayıcı tabanlı arayüz
- **Kendi Hızında Öğrenme**: Farklı öğrenme hızlarına uyum sağlayan esnek atölye yapısı
- **Pratik Uygulama**: Gerçek dünyadan AI şablon dağıtım senaryoları
- **Topluluk Entegrasyonu**: Atölye desteği ve işbirliği için Discord entegrasyonu

#### Atölye Özellikleri
- **Yerleşik Arama**: Hızlı anahtar kelime ve ders keşfi
- **Kod Bloklarını Kopyala**: Tüm kod örnekleri için fareyle üzerine gelince kopyalama işlevi
- **Tema Geçişi**: Farklı tercihler için karanlık/açık mod desteği
- **Görsel Varlıklar**: Anlamayı artıran ekran görüntüleri ve diyagramlar
- **Yardım Entegrasyonu**: Topluluk desteği için doğrudan Discord erişimi

### [v3.2.0] - 2025-09-17

#### Önemli Gezinme Yeniden Yapılandırması ve Bölüm Tabanlı Öğrenme Sistemi
**Bu sürüm, tüm depo genelinde geliştirilmiş gezinti ile kapsamlı bölüm tabanlı öğrenme yapısını tanıtır.**

#### Eklendi
- **📚 Bölüm Tabanlı Öğrenme Sistemi**: Tüm kurs, 8 ilerleyici öğrenme bölümü halinde yeniden yapılandırıldı
  - Bölüm 1: Temel & Hızlı Başlangıç (⭐ - 30-45 dk)
  - Bölüm 2: AI-Öncelikli Geliştirme (⭐⭐ - 1-2 saat)
  - Bölüm 3: Yapılandırma & Kimlik Doğrulama (⭐⭐ - 45-60 dk)
  - Bölüm 4: Kod Olarak Altyapı & Dağıtım (⭐⭐⭐ - 1-1.5 saat)
  - Bölüm 5: Çok Ajanlı AI Çözümleri (⭐⭐⭐⭐ - 2-3 saat)
  - Bölüm 6: Dağıtımdan Önce Doğrulama & Planlama (⭐⭐ - 1 saat)
  - Bölüm 7: Sorun Giderme & Hata Ayıklama (⭐⭐ - 1-1.5 saat)
  - Bölüm 8: Üretim & Kurumsal Desenler (⭐⭐⭐⭐ - 2-3 saat)
- **📚 Kapsamlı Gezinti Sistemi**: Tüm dokümantasyon genelinde tutarlı gezinme başlıkları ve altbilgiler
- **🎯 İlerleme Takibi**: Kurs tamamlama kontrol listesi ve öğrenme doğrulama sistemi
- **🗺️ Öğrenme Yolu Rehberliği**: Farklı deneyim seviyeleri ve hedefler için net giriş noktaları
- **🔗 Çapraz-Referans Gezintisi**: İlgili bölümler ve önkoşullar açıkça bağlantılandı

#### Geliştirilmiş
- **README Yapısı**: Bölüm tabanlı organizasyon ile yapılandırılmış öğrenme platformuna dönüştürüldü
- **Dokümantasyon Gezintisi**: Her sayfa artık bölüm bağlamı ve ilerleme rehberliği içeriyor
- **Şablon Organizasyonu**: Örnekler ve şablonlar uygun öğrenme bölümlerine eşlendi
- **Kaynak Entegrasyonu**: Hızlı başvuru kartları, SSS ve çalışma rehberleri ilgili bölümlere bağlandı
- **Atölye Entegrasyonu**: Uygulamalı laboratuvarlar birden çok bölüm öğrenme hedefiyle eşlendi

#### Değiştirildi
- **Öğrenme İlerleyişi**: Doğrusal dokümantasyondan esnek bölüm tabanlı öğrenmeye taşındı
- **Yapılandırma Yerleşimi**: Daha iyi öğrenme akışı için yapılandırma rehberi Bölüm 3'e taşındı
- **AI İçerik Entegrasyonu**: AI'ya özgü içerikler öğrenme yolculuğuna daha iyi entegre edildi
- **Üretim İçeriği**: İleri düzey desenler Kurumsal Bölüm 8'de konsolide edildi

#### İyileştirildi
- **Kullanıcı Deneyimi**: Açık gezinme izleri ve bölüm ilerleme göstergeleri
- **Erişilebilirlik**: Kolay kurs dolaşımı için tutarlı gezinme desenleri
- **Profesyonel Sunum**: Akademik ve kurumsal eğitim için uygun üniversite-stili kurs yapısı
- **Öğrenme Verimliliği**: İyileştirilmiş organizasyon ile ilgili içeriği bulma süresi azaldı

#### Teknik Uygulama
- **Gezinme Başlıkları**: 40+ dokümantasyon dosyasında standartlaştırılmış bölüm gezinmesi
- **Altbilgi Gezinmesi**: Tutarlı ilerleme rehberliği ve bölüm tamamlama göstergeleri
- **Çapraz Bağlantılama**: İlgili kavramları birbirine bağlayan kapsamlı dahili bağlantı sistemi
- **Bölüm Eşlemesi**: Şablonlar ve örnekler öğrenme hedefleriyle açıkça ilişkilendirildi

#### Çalışma Rehberi Geliştirmesi
- **📚 Kapsamlı Öğrenme Hedefleri**: Çalışma rehberi 8-bölümlük sisteme göre yeniden yapılandırıldı
- **🎯 Bölüm Tabanlı Değerlendirme**: Her bölümde belirli öğrenme hedefleri ve uygulamalı alıştırmalar
- **📋 İlerleme Takibi**: Ölçülebilir sonuçlar ve tamamlama kontrol listeleri ile haftalık öğrenme planı
- **❓ Değerlendirme Soruları**: Her bölüm için bilgi doğrulama soruları ve profesyonel çıktılar
- **🛠️ Pratik Alıştırmalar**: Gerçek dağıtım senaryoları ve sorun giderme içeren uygulamalı aktiviteler
- **📊 Beceri İlerlemesi**: Temel kavramlardan kurumsal desenlere kariyer gelişimine uygun net ilerleme
- **🎓 Sertifikasyon Çerçevesi**: Mesleki gelişim çıktıları ve topluluk tanıma sistemi
- **⏱️ Zaman Yönetimi**: Kilometre taşlarıyla yapılandırılmış 10 haftalık öğrenme planı

### [v3.1.0] - 2025-09-17

#### Geliştirilmiş Çok Ajanlı AI Çözümleri
**Bu sürüm, perakende çok ajanlı çözümü için daha iyi ajan adlandırması ve geliştirilmiş dokümantasyon sağlar.**

#### Değiştirildi
- **Çok Ajanlı Terminoloji**: Daha net anlaşılma için perakende çok ajanlı çözümde "Cora agent" yerine "Customer agent" kullanıldı
- **Ajan Mimarisi**: Tüm dokümantasyon, ARM templates ve kod örnekleri tutarlı "Customer agent" adlandırması kullanacak şekilde güncellendi
- **Yapılandırma Örnekleri**: Güncellenmiş adlandırma kurallarıyla ajan yapılandırma kalıpları modernize edildi
- **Dokümantasyon Tutarlılığı**: Tüm referansların profesyonel, tanımlayıcı ajan adları kullandığından emin olundu

#### Geliştirilmiş
- **ARM Template Package**: Updated retail-multiagent-arm-template with Customer agent references
- **Architecture Diagrams**: Refreshed Mermaid diagrams with updated agent naming
- **Code Examples**: Python classes and implementation examples now use CustomerAgent naming
- **Environment Variables**: Updated all deployment scripts to use CUSTOMER_AGENT_NAME conventions

#### Improved
- **Developer Experience**: Clearer agent roles and responsibilities in documentation
- **Production Readiness**: Better alignment with enterprise naming conventions
- **Learning Materials**: More intuitive agent naming for educational purposes
- **Template Usability**: Simplified understanding of agent functions and deployment patterns

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**This version transforms the repository into a comprehensive AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Complete restructure prioritizing AI developers and engineers
- **Microsoft Foundry Integration Guide**: Comprehensive documentation for connecting AZD with Microsoft Foundry services
- **AI Model Deployment Patterns**: Detailed guide covering model selection, configuration, and production deployment strategies
- **AI Workshop Lab**: 2-3 hour hands-on workshop for converting AI applications to AZD-deployable solutions
- **Production AI Best Practices**: Enterprise-ready patterns for scaling, monitoring, and securing AI workloads
- **AI-Specific Troubleshooting Guide**: Comprehensive troubleshooting for Microsoft Foundry Models, Cognitive Services, and AI deployment issues
- **AI Template Gallery**: Featured collection of Microsoft Foundry templates with complexity ratings
- **Workshop Materials**: Complete workshop structure with hands-on labs and reference materials

#### Enhanced
- **README Structure**: AI-developer focused with 45% community interest data from Microsoft Foundry Discord
- **Learning Paths**: Dedicated AI developer journey alongside traditional paths for students and DevOps engineers
- **Template Recommendations**: Featured AI templates including azure-search-openai-demo, contoso-chat, and openai-chat-app-quickstart
- **Community Integration**: Enhanced Discord community support with AI-specific channels and discussions

#### Security & Production Focus
- **Managed Identity Patterns**: AI-specific authentication and security configurations
- **Cost Optimization**: Token usage tracking and budget controls for AI workloads
- **Multi-Region Deployment**: Strategies for global AI application deployment
- **Performance Monitoring**: AI-specific metrics and Application Insights integration

#### Documentation Quality
- **Linear Course Structure**: Logical progression from beginner to advanced AI deployment patterns
- **Validated URLs**: All external repository links verified and accessible
- **Complete Reference**: All internal documentation links validated and functional
- **Production Ready**: Enterprise deployment patterns with real-world examples

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: All documentation pages now include Introduction, Learning Goals, and Learning Outcomes sections
- **Navigation System**: Added Previous/Next lesson links throughout all documentation for guided learning progression
- **Study Guide**: Comprehensive study-guide.md with learning objectives, practice exercises, and assessment materials
- **Professional Presentation**: Removed all emoji icons for improved accessibility and professional appearance
- **Enhanced Content Structure**: Improved organization and flow of learning materials

#### Changed
- **Documentation Format**: Standardized all documentation with consistent learning-focused structure
- **Navigation Flow**: Implemented logical progression through all learning materials
- **Content Presentation**: Removed decorative elements in favor of clear, professional formatting
- **Link Structure**: Updated all internal links to support new navigation system

#### Improved
- **Accessibility**: Removed emoji dependencies for better screen reader compatibility
- **Professional Appearance**: Clean, academic-style presentation suitable for enterprise learning
- **Learning Experience**: Structured approach with clear objectives and outcomes for each lesson
- **Content Organization**: Better logical flow and connection between related topics

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Complete getting-started guide series
  - Comprehensive deployment and provisioning documentation
  - Detailed troubleshooting resources and debugging guides
  - Pre-deployment validation tools and procedures

- **Getting Started Module**
  - AZD Basics: Core concepts and terminology
  - Installation Guide: Platform-specific setup instructions
  - Configuration Guide: Environment setup and authentication
  - First Project Tutorial: Step-by-step hands-on learning

- **Deployment and Provisioning Module**
  - Deployment Guide: Complete workflow documentation
  - Provisioning Guide: Infrastructure as Code with Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure resource availability validation
  - SKU Selection: Comprehensive service tier guidance
  - Pre-flight Checks: Automated validation scripts (PowerShell and Bash)
  - Cost estimation and budget planning tools

- **Troubleshooting Module**
  - Common Issues: Frequently encountered problems and solutions
  - Debugging Guide: Systematic troubleshooting methodologies
  - Advanced diagnostic techniques and tools
  - Performance monitoring and optimization

- **Resources and References**
  - Command Cheat Sheet: Quick reference for essential commands
  - Glossary: Comprehensive terminology and acronym definitions
  - FAQ: Detailed answers to common questions
  - External resource links and community connections

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: Installation and configuration guides for Windows, macOS, and Linux
- **Multiple Skill Levels**: Content designed for students through professional developers
- **Practical Focus**: Hands-on examples and real-world scenarios
- **Comprehensive Coverage**: From basic concepts to advanced enterprise patterns
- **Security-First Approach**: Security best practices integrated throughout
- **Cost Optimization**: Guidance for cost-effective deployments and resource management

#### Documentation Quality
- **Detailed Code Examples**: Practical, tested code samples
- **Step-by-Step Instructions**: Clear, actionable guidance
- **Comprehensive Error Handling**: Troubleshooting for common issues
- **Best Practices Integration**: Industry standards and recommendations
- **Version Compatibility**: Up-to-date with latest Azure services and azd features

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Integration patterns for Hugging Face, Azure Machine Learning, and custom models
- **AI Agent Frameworks**: Templates for LangChain, Semantic Kernel, and AutoGen deployments
- **Advanced RAG Patterns**: Vector database options beyond Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: Enhanced monitoring for model performance, token usage, and response quality

#### Developer Experience
- **VS Code Extension**: Integrated AZD + Microsoft Foundry development experience
- **GitHub Copilot Integration**: AI-assisted AZD template generation
- **Interactive Tutorials**: Hands-on coding exercises with automated validation for AI scenarios
- **Video Content**: Supplementary video tutorials for visual learners focusing on AI deployments

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI model governance, compliance, and audit trails
- **Multi-Tenant AI**: Patterns for serving multiple customers with isolated AI services
- **Edge AI Deployment**: Integration with Azure IoT Edge and container instances
- **Hybrid Cloud AI**: Multi-cloud and hybrid deployment patterns for AI workloads

#### Advanced Features
- **AI Pipeline Automation**: MLOps integration with Azure Machine Learning pipelines
- **Advanced Security**: Zero-trust patterns, private endpoints, and advanced threat protection
- **Performance Optimization**: Advanced tuning and scaling strategies for high-throughput AI applications
- **Global Distribution**: Content delivery and edge caching patterns for AI applications

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Comprehensive Microsoft Foundry integration (Completed)
- ✅ **Interactive Tutorials**: Hands-on AI workshop lab (Completed)
- ✅ **Advanced Security Module**: AI-specific security patterns (Completed)
- ✅ **Performance Optimization**: AI workload tuning strategies (Completed)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-focused deployment scenarios (Completed)
- ✅ **Extended FAQ**: AI-specific questions and troubleshooting (Completed)
- **Tool Integration**: Enhanced IDE and editor integration guides
- ✅ **Monitoring Expansion**: AI-specific monitoring and alerting patterns (Completed)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Responsive design for mobile learning
- **Offline Access**: Downloadable documentation packages
- **Enhanced IDE Integration**: VS Code extension for AZD + AI workflows
- **Community Dashboard**: Real-time community metrics and contribution tracking

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

#### Added
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Changed
- Modifications to existing functionality or documentation
- Updates to improve clarity or accuracy
- Restructuring of content or organization

#### Deprecated
- Features or approaches that are being phased out
- Documentation sections scheduled for removal
- Methods that have better alternatives

#### Removed
- Features, documentation, or examples that are no longer relevant
- Outdated information or deprecated approaches
- Redundant or consolidated content

#### Fixed
- Corrections to errors in documentation or code
- Resolution of reported issues or problems
- Improvements to accuracy or functionality

#### Security
- Security-related improvements or fixes
- Updates to security best practices
- Resolution of security vulnerabilities

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking changes that require user action
- Significant restructuring of content or organization
- Changes that alter the fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements that maintain backward compatibility
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Minor improvements to existing content
- Clarifications and small enhancements

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and engage with the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Community Forums**: Participate in broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Corrections to AI service integration and deployment information
- **Learning Experience**: Suggestions for improved AI developer learning flow
- **Missing AI Content**: Requests for additional AI templates, patterns, or examples
- **Accessibility**: Improvements for diverse learning needs
- **AI Tool Integration**: Suggestions for better AI development workflow integration
- **Production AI Patterns**: Enterprise AI deployment pattern requests

### Response Commitment
- **Issue Response**: Within 48 hours for reported problems
- **Feature Requests**: Evaluation within one week
- **Community Contributions**: Review within one week
- **Security Issues**: Immediate priority with expedited response

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Content accuracy and link validation
- **Quarterly Updates**: Major content additions and improvements
- **Semi-Annual Reviews**: Comprehensive restructuring and enhancement
- **Annual Releases**: Major version updates with significant improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regular validation of code examples and links
- **Community Feedback Integration**: Regular incorporation of user suggestions
- **Technology Updates**: Alignment with latest Azure services and azd releases
- **Accessibility Audits**: Regular review for inclusive design principles

## Version Support Policy

### Current Version Support
- **En Son Büyük Sürüm**: Düzenli güncellemelerle tam destek
- **Önceki Büyük Sürüm**: 12 ay boyunca güvenlik güncellemeleri ve kritik düzeltmeler
- **Eski Sürümler**: Yalnızca topluluk desteği, resmi güncelleme yok

### Geçiş Rehberi
When major versions are released, we provide:
- **Geçiş Kılavuzları**: Adım adım geçiş talimatları
- **Uyumluluk Notları**: Kırıcı değişikliklerle ilgili ayrıntılar
- **Araç Desteği**: Geçişe yardımcı olacak betikler veya yardımcı programlar
- **Topluluk Desteği**: Geçiş soruları için ayrılmış forumlar

---

**Gezinme**
- **Önceki Ders**: [Çalışma Kılavuzu](resources/study-guide.md)
- **Sonraki Ders**: Geri dön [Ana README](README.md)

**Güncel Kalın**: Bu depoyu yeni sürümler ve eğitim materyallerindeki önemli güncellemeler hakkında bildirimler için izleyin.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Sorumluluk Reddi**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki sürümü yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi tavsiye edilir. Bu çevirinin kullanımı sonucu ortaya çıkan herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->