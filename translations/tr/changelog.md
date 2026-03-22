# Değişiklik Günlüğü - AZD For Beginners

## Giriş

Bu değişiklik günlüğü AZD For Beginners deposundaki tüm kayda değer değişiklikleri, güncellemeleri ve iyileştirmeleri belgeler. Semantik sürümleme ilkelerini takip ediyoruz ve kullanıcıların sürümler arasındaki farkları anlamalarına yardımcı olmak için bu günlüğü tutuyoruz.

## Öğrenme Hedefleri

Bu değişiklik günlüğünü inceleyerek:
- Yeni özellikler ve içerik eklemeleri hakkında bilgi sahibi olursunuz
- Mevcut dokümantasyonda yapılan iyileştirmeleri anlarsınız
- Doğruluğu sağlamak için hata düzeltmelerini ve düzeltmeleri takip edersiniz
- Öğrenme materyallerinin zaman içindeki evrimini izlersiniz

## Öğrenme Çıktıları

Değişiklik günlüğü girdilerini inceledikten sonra şunları yapabileceksiniz:
- Öğrenme için mevcut olan yeni içerik ve kaynakları tanımlamak
- Hangi bölümlerin güncellendiğini veya iyileştirildiğini anlamak
- En güncel materyallere göre öğrenme yolunuzu planlamak
- Gelecek iyileştirmeler için geri bildirim ve önerilerde bulunmak

## Sürüm Geçmişi

### [v3.18.0] - 2026-03-16

#### AZD AI CLI Komutları, İçerik Doğrulama ve Şablon Genişletme
**Bu sürüm, tüm AI ile ilgili bölümlerde `azd ai`, `azd extension` ve `azd mcp` komut kapsamını ekler, agents.md içindeki bozuk bağlantıları ve kullanımdan kalkmış kodu düzeltir, hızlı başvuru dosyasını günceller ve Örnek Şablonlar bölümünü doğrulanmış açıklamalar ve yeni Azure AI AZD şablonlarıyla baştan düzenler.**

#### Eklendi
- **🤖 AZD AI CLI kapsamı** 7 dosyada (önceden yalnızca Bölüm 8'de):
  - `docs/chapter-01-foundation/azd-basics.md` — Yeni "Extensions and AI Commands" bölümü; `azd extension`, `azd ai agent init` ve `azd mcp` tanıtılıyor
  - `docs/chapter-02-ai-development/agents.md` — Seçenek 4: `azd ai agent init` şablon ile manifest yaklaşımını karşılaştırma tablosu ile
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" ve "Agent-First Deployment" alt bölümleri
  - `docs/chapter-05-multi-agent/README.md` — Hızlı Başlangıç şimdi hem şablon hem de manifest tabanlı dağıtım yollarını gösteriyor
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Dağıtım bölümü artık `azd ai agent init` seçeneğini içeriyor
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" alt bölümü
  - `resources/cheat-sheet.md` — Yeni "AI & Extensions Commands" bölümü; `azd extension`, `azd ai agent init`, `azd mcp` ve `azd infra generate` içeriyor
- **📦 Yeni AZD AI örnek şablonları** `microsoft-foundry-integration.md` içinde:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel ve sesli sohbet desteği ile .NET RAG sohbet
  - **azure-search-openai-demo-java** — ACA/AKS dağıtım seçenekleri ile Langchain4J kullanan Java RAG sohbet
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding ve Prompty kullanan çok ajanlı yaratıcı yazarlık uygulaması
  - **serverless-chat-langchainjs** — Ollama yerel geliştirme desteği ile Azure Functions + LangChain.js + Cosmos DB kullanan sunucusuz RAG
  - **chat-with-your-data-solution-accelerator** — yönetici portalı, Teams entegrasyonu ve PostgreSQL/Cosmos DB seçenekleri içeren kurumsal RAG hızlandırıcısı
  - **azure-ai-travel-agents** — .NET, Python, Java ve TypeScript sunucuları ile çok ajanlı MCP orkestrasyon referans uygulaması
  - **azd-ai-starter** — Minimal Azure AI altyapı Bicep başlangıç şablonu
  - **🔗 Awesome AZD AI Gallery linki** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) referansı (80+ şablon)

#### Düzeltildi
- **🔗 agents.md gezinme**: Önceki/Sonraki bağlantıları artık Bölüm 2 README ders sırası ile eşleşiyor (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md bozuk bağlantılar**: `production-ai-practices.md` düzeltildi -> `../chapter-08-production/production-ai-practices.md` (3 occurrence)
- **📦 agents.md kullanımdan kalkmış kod**: `opencensus` yerine `azure-monitor-opentelemetry` + OpenTelemetry SDK ile değiştirildi
- **🐛 agents.md geçersiz API**: `max_tokens` artık `create_agent()` yerine `create_run()` içine `max_completion_tokens` olarak taşındı
- **🔢 agents.md token sayımı**: Yaklaşık `len//4` tahmini `tiktoken.encoding_for_model()` ile değiştirildi
- **azure-search-openai-demo**: Hizmetler "Cognitive Search + App Service" yerine "Azure AI Search + Azure Container Apps" olarak düzeltildi (varsayılan host Ekim 2024'te değişti)
- **contoso-chat**: Açıklama Azure AI Foundry + Prompty referans verecek şekilde güncellendi; depo başlığı ve teknoloji yığını ile eşleşiyor

#### Kaldırıldı
- **ai-document-processing**: İşlevsiz şablon referansı kaldırıldı (repo AZD şablonu olarak herkese açık değil)

#### İyileştirildi
- **📝 agents.md alıştırmaları**: Alıştırma 1 artık beklenen çıktıyı ve `azd monitor` adımını gösteriyor; Alıştırma 2 tam `FunctionTool` kayıt kodunu içerir; Alıştırma 3 belirsiz yönlendirmeyi somut `prepdocs.py` komutlarıyla değiştirir
- **📚 agents.md kaynaklar**: Dokümantasyon bağlantıları güncel Azure AI Agent Service dokümanları ve hızlı başlangıca güncellendi
- **📋 agents.md Sonraki Adımlar tablosu**: Tam bölüm kapsaması için AI Workshop Lab bağlantısı eklendi

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

#### Ders Navigasyonu İyileştirmesi
**Bu sürüm, README.md bölüm navigasyonunu geliştirilmiş bir tablo formatı ile iyileştirir.**

#### Değiştirildi
- **Ders Haritası Tablosu**: Doğrudan ders bağlantıları, süre tahminleri ve karmaşıklık derecelendirmeleri ile geliştirildi
- **Klasör Temizliği**: Yinelenen eski klasörler kaldırıldı (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Bağlantı Doğrulama**: Ders Haritası tablosundaki 21+ dahili bağlantı doğrulandı

### [v3.16.0] - 2026-02-05

#### Ürün Adı Güncellemeleri
**Bu sürüm ürün referanslarını güncel Microsoft marka isimlendirmesine göre günceller.**

#### Değiştirildi
- **Microsoft Foundry → Microsoft Foundry**: Tüm referanslar tercüme edilmeyen dosyalar dahil güncellendi
- **Azure AI Agent Service → Foundry Agents**: Hizmet adı mevcut markalamayı yansıtacak şekilde güncellendi

#### Güncellenen Dosyalar
- `README.md` - Ana kurs giriş sayfası
- `changelog.md` - Sürüm geçmişi
- `course-outline.md` - Kurs yapısı
- `docs/chapter-02-ai-development/agents.md` - AI ajan rehberi
- `examples/README.md` - Örnekler dokümantasyonu
- `workshop/README.md` - Atölye giriş sayfası
- `workshop/docs/index.md` - Atölye dizini
- `workshop/docs/instructions/*.md` - Tüm atölye talimat dosyaları

---

### [v3.15.0] - 2026-02-05

#### Büyük Depo Yeniden Yapılandırması: Bölüm Tabanlı Klasör İsimleri
**Bu sürüm dokümantasyonu daha net gezinme için adanmış bölüm klasörlerine yeniden yapılandırır.**

#### Klasör Yeniden Adlandırmaları
Eski klasörler bölüm numaralı klasörlerle değiştirildi:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Yeni eklendi: `docs/chapter-05-multi-agent/`

#### Dosya Taşımaları
| Dosya | From | To |
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
- **📚 Bölüm README dosyaları**: Her bölüm klasörüne README.md oluşturuldu; içerik:
  - Öğrenme hedefleri ve süre
  - Açıklamalı ders tablosu
  - Hızlı başlangıç komutları
  - Diğer bölümlere navigasyon

#### Değiştirildi
- **🔗 Tüm dahili bağlantılar güncellendi**: 78+ yol tüm dokümantasyon dosyalarında güncellendi
- **🗺️ Ana README.md**: Ders Haritası yeni bölüm yapısına göre güncellendi
- **📝 examples/README.md**: Bölüm klasörlerine çapraz referanslar güncellendi

#### Kaldırıldı
- Eski klasör yapısı kaldırıldı (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Depo Yeniden Yapılandırması: Bölüm Navigasyonu
**Bu sürüm bölüm navigasyonu README dosyaları ekledi (v3.15.0 tarafından devre dışı bırakıldı).**

---

### [v3.13.0] - 2026-02-05

#### Yeni AI Ajanları Rehberi
**Bu sürüm Azure Developer CLI ile AI ajanlarını dağıtma için kapsamlı bir rehber ekler.**

#### Eklendi
- **🤖 docs/microsoft-foundry/agents.md**: Aşağıları kapsayan tam kılavuz:
  - AI ajanlarının ne olduğu ve sohbet botlarından nasıl farklılaştıkları
  - Üç hızlı başlangıç ajan şablonu (Foundry Agents, Prompty, RAG)
  - Ajan mimarisi desenleri (tek ajan, RAG, çok ajan)
  - Araç yapılandırma ve özelleştirme
  - İzleme ve metrik takibi
  - Maliyet değerlendirmeleri ve optimizasyon
  - Yaygın hata giderme senaryoları
  - Başarı kriterleri ile üç uygulamalı alıştırma

#### İçerik Yapısı
- **Giriş**: Yeni başlayanlar için ajan kavramları
- **Hızlı Başlangıç**: `azd init --template get-started-with-ai-agents` ile ajan dağıtımı
- **Mimari Desenler**: Ajan desenlerinin görsel diyagramları
- **Yapılandırma**: Araç kurulumu ve ortam değişkenleri
- **İzleme**: Application Insights entegrasyonu
- **Alıştırmalar**: Kademeli uygulamalı öğrenme (her biri 20-45 dakika)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Ortam Güncellemesi
**Bu sürüm geliştirme konteyneri yapılandırmasını modern araçlar ve AZD öğrenme deneyimi için daha iyi varsayılanlarla günceller.**

#### Değiştirildi
- **🐳 Temel İmaj**: `python:3.12-bullseye`'den `python:3.12-bookworm`'a güncellendi (en son Debian kararlı)
- **📛 Konteyner Adı**: Anlaşılırlık için "Python 3"ten "AZD for Beginners" olarak yeniden adlandırıldı

#### Eklendi
- **🔧 Yeni Geliştirici Konteyner Özellikleri**:
  - `azure-cli` Bicep desteği etkin
  - `node:20` (AZD şablonları için LTS sürümü)
  - `github-cli` şablon yönetimi için
  - `docker-in-docker` konteyner uygulama dağıtımları için

- **🔌 Port Yönlendirme**: Ortak geliştirme için ön yapılandırılmış portlar:
  - 8000 (MkDocs önizleme)
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
  - `DavidAnson.vscode-markdownlint` - Markdown linter
  - `bierner.markdown-mermaid` - Mermaid diyagram desteği
  - `redhat.vscode-yaml` - YAML desteği (azure.yaml için)
  - `eamodio.gitlens` - Git görselleştirmesi
  - `mhutchie.git-graph` - Git geçmişi

- **⚙️ VS Code Ayarları**: Python yorumlayıcısı, kaydederken biçimlendirme ve boşluk kırpma için varsayılan ayarlar eklendi

- **📦 requirements-dev.txt Güncellendi**:
  - MkDocs minify eklentisi eklendi
  - Kod kalitesi için pre-commit eklendi
  - Azure SDK paketleri eklendi (azure-identity, azure-mgmt-resource)

#### Düzeltildi
- **Post-Create Komutu**: Konteyner başlatıldığında artık AZD ve Azure CLI kurulumunu doğrular

---

### [v3.11.0] - 2026-02-05

#### Yeni Başlayanlar İçin README Yenilemesi
**Bu sürüm README.md dosyasını yeni başlayanlar için daha erişilebilir hale getirmek üzere önemli ölçüde iyileştirir ve AI geliştiricileri için temel kaynaklar ekler.**

#### Eklendi
- **🆚 Azure CLI ve AZD Karşılaştırması**: Her aracın ne zaman kullanılacağına dair pratik örneklerle net açıklama
- **🌟 Harika AZD Bağlantıları**: Topluluk şablon galerisine ve katkı kaynaklarına doğrudan bağlantılar:
  - [Harika AZD Galerisi](https://azure.github.io/awesome-azd/) - 200+ dağıtıma hazır şablon
  - [Bir Şablon Gönder](https://github.com/Azure/awesome-azd/issues) - Topluluk katkısı
- **🎯 Hızlı Başlangıç Kılavuzu**: Basitleştirilmiş 3 adımlı başlarken bölümü (Kurulum → Giriş → Dağıtım)
- **📊 Deneyime Dayalı Navigasyon Tablosu**: Geliştirici deneyimine göre nereden başlanacağına dair net rehberlik

#### Değiştirildi
- **README Yapısı**: Kademeli açıklama için yeniden düzenlendi - önce ana bilgiler
- **Giriş Bölümü**: Tamamen yeni başlayanlar için "\"`azd up`'ın sihrini\" açıklamak üzere yeniden yazıldı
- **Yinelenen İçerik Kaldırıldı**: Yinelenen sorun giderme bölümü kaldırıldı
- **Sorun Giderme Komutları**: `azd logs` referansı, geçerli `azd monitor --logs` kullanacak şekilde düzeltildi

#### Düzeltildi
- **🔐 Kimlik Doğrulama Komutları**: cheat-sheet.md dosyasına `azd auth login` ve `azd auth logout` eklendi
- **Geçersiz Komut Referansları**: README sorun giderme bölümünden kalan `azd logs` kaldırıldı

#### Notlar
- **Kapsam**: Değişiklikler main README.md ve resources/cheat-sheet.md dosyalarına uygulandı
- **Hedef Kitle**: İyileştirmeler özellikle AZD'ye yeni geliştiricilere yöneliktir

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Komut Doğruluğu Güncellemesi
**Bu sürüm, belgelerdeki var olmayan AZD komutlarını düzelterek tüm kod örneklerinin geçerli Azure Developer CLI sözdizimini kullandığından emin olur.**

#### Düzeltildi
- **🔧 Var Olmayan AZD Komutları Kaldırıldı**: Geçersiz komutların kapsamlı denetimi ve düzeltilmesi:
  - `azd logs` (mevcut değil) → `azd monitor --logs` veya Azure CLI alternatifleri ile değiştirildi
  - `azd service` alt komutları (mevcut değil) → `azd show` ve Azure CLI ile değiştirildi
  - `azd infra import/export/validate` (mevcut değil) → kaldırıldı veya geçerli alternatiflerle değiştirildi
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` bayrakları (mevcut değil) → kaldırıldı
  - `azd provision --what-if/--rollback` bayrakları (mevcut değil) → `--preview` kullanacak şekilde güncellendi
  - `azd config validate` (mevcut değil) → `azd config list` ile değiştirildi
  - `azd info`, `azd history`, `azd metrics` (mevcut değil) → kaldırıldı

- **📚 Komut Düzeltmeleri Yapılan Dosyalar**:
  - `resources/cheat-sheet.md`: Komut referansının kapsamlı yenilemesi
  - `docs/deployment/deployment-guide.md`: Geri alma ve dağıtım stratejileri düzeltildi
  - `docs/troubleshooting/debugging.md`: Günlük analiz bölümleri düzeltildi
  - `docs/troubleshooting/common-issues.md`: Sorun giderme komutları güncellendi
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD hata ayıklama bölümü düzeltildi
  - `docs/getting-started/azd-basics.md`: İzleme komutları düzeltildi
  - `docs/getting-started/first-project.md`: İzleme ve hata ayıklama örnekleri güncellendi
  - `docs/getting-started/installation.md`: Yardım ve sürüm örnekleri düzeltildi
  - `docs/pre-deployment/application-insights.md`: Günlük görüntüleme komutları düzeltildi
  - `docs/pre-deployment/coordination-patterns.md`: Ajan hata ayıklama komutları düzeltildi

#### Değiştirildi
- **Geri Alma Stratejileri**: AZD'nin yerel geri alma özelliği olmadığından belgeler Git tabanlı geri alma kullanacak şekilde güncellendi
- **Günlük Görüntüleme**: `azd logs` referansları `azd monitor --logs`, `azd monitor --live` ve Azure CLI komutları ile değiştirildi
- **Performans Bölümü**: Var olmayan paralel/artımlı dağıtım bayrakları kaldırıldı, geçerli alternatifler sağlandı

#### Teknik Detaylar
- **Geçerli AZD Komutları**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Geçerli azd monitor Bayrakları**: `--live`, `--logs`, `--overview`
- **Kaldırılan Özellikler**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notlar
- **Doğrulama**: Komutlar Azure Developer CLI v1.23.x ile doğrulandı

---

### [v3.9.0] - 2026-02-05

#### Atölye Tamamlama ve Dokümantasyon Kalitesi Güncellemesi
**Bu sürüm, etkileşimli atölye modüllerini tamamlar, tüm kırık dokümantasyon bağlantılarını düzeltir ve Microsoft AZD kullanan AI geliştiricileri için genel içerik kalitesini iyileştirir.**

#### Eklendi
- **📝 CONTRIBUTING.md**: Yeni katkı yönergeleri belgesi ile:
  - Sorun bildirme ve değişiklik önerme için net talimatlar
  - Yeni içerik için dokümantasyon standartları
  - Kod örneği yönergeleri ve commit mesajı konvansiyonları
  - Topluluk katılım bilgileri

#### Tamamlandı
- **🎯 Atölye Modül 7 (Kapanış)**: Tamamıyla tamamlanmış kapanış modülü ile:
  - Atölye başarılarının kapsamlı özeti
  - AZD, şablonlar ve Microsoft Foundry'yi kapsayan edinilen temel kavramlar bölümü
  - Öğrenme yolculuğuna devam önerileri
  - Zorluk derecelendirmeli atölye meydan okuma egzersizleri
  - Topluluk geri bildirimi ve destek bağlantıları

- **📚 Atölye Modül 3 (Yapıyı Çözme)**: Güncellenmiş öğrenme hedefleri ile:
  - MCP sunucuları ile GitHub Copilot etkinleştirme rehberi
  - AZD şablon klasör yapısının anlaşılması
  - Altyapı-as-kod (Bicep) organizasyon desenleri
  - Uygulamalı laboratuvar talimatları

- **🔧 Atölye Modül 6 (Kapatma)**: Tamamlandı, içerik:
  - Kaynak temizleme ve maliyet yönetimi hedefleri
  - Güvenli altyapı kaldırma için `azd down` kullanımı
  - Soft-silinen bilişsel servislerin kurtarılması rehberi
  - GitHub Copilot ve Azure Portal için bonus keşif görevleri

#### Düzeltildi
- **🔗 Kırık Bağlantı Düzeltmeleri**: 15+ dahili dokümantasyon kırık bağlantısı çözüldü:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md yolları düzeltildi
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md ve production-ai-practices.md yolları düzeltildi
  - `docs/getting-started/first-project.md`: mevcut olmayan cicd-integration.md, deployment-guide.md ile değiştirildi
  - `examples/retail-scenario.md`: SSS ve sorun giderme rehberi yolları düzeltildi
  - `examples/container-app/microservices/README.md`: kurs ana sayfası ve dağıtım kılavuzu yolları düzeltildi
  - `resources/faq.md` ve `resources/glossary.md`: AI bölüm referansları güncellendi
  - `course-outline.md`: Eğitmen kılavuzu ve AI atölye laboratuvarı referansları düzeltildi

- **📅 Atölye Durum Afişi**: "Yapım Aşamasında" durumundan aktif atölye durumuna 2026 Şubat tarihiyle güncellendi

- **🔗 Atölye Navigasyonu**: workshop README.md içindeki lab-1-azd-basics klasörüne işaret eden kırık navigasyon bağlantıları düzeltildi

#### Değiştirildi
- **Atölye Sunumu**: "Yapım aşamasında" uyarısı kaldırıldı, atölye artık tamamlandı ve kullanıma hazır
- **Navigasyon Tutarlılığı**: Tüm atölye modüllerinin uygun modüllerarası navigasyona sahip olduğundan emin olundu
- **Öğrenme Yolu Referansları**: Bölüm çapraz referansları doğru microsoft-foundry yollarını kullanacak şekilde güncellendi

#### Doğrulandı
- ✅ Tüm İngilizce markdown dosyalarının dahili bağlantıları geçerlidir
- ✅ 0-7 arası atölye modülleri öğrenme hedefleriyle tamamlandı
- ✅ Bölümler ve modüller arasındaki navigasyon doğru çalışıyor
- ✅ İçerik Microsoft AZD kullanan AI geliştiricileri için uygundur
- ✅ Yeni başlayan dostu dil ve yapı genelinde korundu
- ✅ CONTRIBUTING.md topluluk katkıda bulunanlara net rehberlik sağlar

#### Teknik Uygulama
- **Bağlantı Doğrulama**: Otomatik PowerShell betiği tüm .md dahili bağlantılarını doğruladı
- **İçerik Denetimi**: Atölye tamamlanmışlığı ve yeni başlayan uygunluğu için manuel gözden geçirme
- **Navigasyon Sistemi**: Tutarlı bölüm ve modül navigasyon desenleri uygulandı

#### Notlar
- **Kapsam**: Değişiklikler yalnızca İngilizce dokümantasyona uygulandı
- **Çeviriler**: Çeviri klasörleri bu sürümde güncellenmedi (otomatik çeviri daha sonra senkronize edilecek)
- **Atölye Süresi**: Tamamlanmış atölye şimdi 3-4 saatlik uygulamalı öğrenme sağlar

---

### [v3.8.0] - 2025-11-19

#### İleri Düzey Dokümantasyon: İzleme, Güvenlik ve Çok Ajanlı Desenler
**Bu sürüm, Application Insights entegrasyonu, kimlik doğrulama desenleri ve üretim dağıtımları için çok ajanlı koordinasyon konularında kapsamlı A-seviyesi dersler ekler.**

#### Eklendi
- **📊 Application Insights Entegrasyon Dersi**: `docs/pre-deployment/application-insights.md` içinde:
  - Otomatik provizyonlama ile AZD odaklı dağıtım
  - Application Insights + Log Analytics için eksiksiz Bicep şablonları
  - Özel telemetriye sahip çalışan Python uygulamaları (1,200+ satır)
  - AI/LLM izleme desenleri (Microsoft Foundry Modelleri token/maliyet takibi)
  - 6 Mermaid diyagramı (mimari, dağıtık izleme, telemetri akışı)
  - 3 uygulamalı egzersiz (uyarılar, panolar, AI izleme)
  - Kusto sorgu örnekleri ve maliyet optimizasyon stratejileri
  - Canlı metrik akışı ve gerçek zamanlı hata ayıklama
  - Üretime hazır desenlerle 40-50 dakikalık öğrenme süresi

- **🔐 Kimlik Doğrulama ve Güvenlik Desenleri Dersi**: `docs/getting-started/authsecurity.md` içinde:
  - 3 kimlik doğrulama deseni (bağlantı dizeleri, Key Vault, managed identity)
  - Güvenli dağıtımlar için eksiksiz Bicep altyapı şablonları
  - Azure SDK entegrasyonu ile Node.js uygulama kodu
  - 3 tam egzersiz (managed identity etkinleştirme, user-assigned identity, Key Vault döndürme)
  - Güvenlik en iyi uygulamaları ve RBAC yapılandırmaları
  - Sorun giderme rehberi ve maliyet analizi
  - Üretime hazır şifresiz kimlik doğrulama desenleri

- **🤖 Çok Ajanlı Koordinasyon Desenleri Dersi**: `docs/pre-deployment/coordination-patterns.md` içinde:
  - 5 koordinasyon deseni (ardışık, paralel, hiyerarşik, olay-tabanlı, konsensüs)
  - Tam orkestratör servis uygulaması (Python/Flask, 1,500+ satır)
  - 3 özel ajan uygulaması (Research, Writer, Editor)
  - Mesaj kuyruğu için Service Bus entegrasyonu
  - Dağıtık sistemler için Cosmos DB durum yönetimi
  - Ajan etkileşimlerini gösteren 6 Mermaid diyagramı
  - 3 gelişmiş egzersiz (zaman aşımı yönetimi, tekrar deneme mantığı, devre kesici)
  - Optimizasyon stratejileri ile maliyet dökümü ($240-565/ay)
  - İzleme için Application Insights entegrasyonu

#### Geliştirildi
- **Öndağıtım Bölümü**: Artık kapsamlı izleme ve koordinasyon desenlerini içeriyor
- **Başlarken Bölümü**: Profesyonel kimlik doğrulama desenleriyle geliştirildi
- **Üretime Hazırlık**: Güvenlikten gözlemlenebilirliğe kadar tam kapsam
- **Kurs Taslağı**: Bölüm 3 ve 6'daki yeni derslere referans verecek şekilde güncellendi

#### Değiştirildi
- **Öğrenme İlerleyişi**: Kurs boyunca güvenlik ve izleme daha iyi entegre edildi
- **Dokümantasyon Kalitesi**: Yeni dersler genelinde tutarlı A-düzeyi standartlar (95-97%)
- **Üretim Desenleri**: Kurumsal dağıtımlar için uçtan uca tam kapsama

#### İyileştirildi
- **Developer Experience**: Geliştirmeden üretime izleme için net bir yol
- **Security Standards**: Kimlik doğrulama ve gizli yönetimi için profesyonel kalıplar
- **Observability**: AZD ile eksiksiz Application Insights entegrasyonu
- **AI Workloads**: Microsoft Foundry Modelleri ve çok ajanlı sistemler için özel izleme

#### Doğrulandı
- ✅ Tüm dersler eksiksiz çalışan kod içerir (kod parçacıkları değil)
- ✅ Görsel öğrenme için Mermaid diyagramları (toplam 19, 3 derste)
- ✅ Doğrulama adımlarıyla uygulamalı egzersizler (toplam 9)
- ✅ `azd up` ile dağıtılabilir üretim hazır Bicep şablonları
- ✅ Maliyet analizi ve optimizasyon stratejileri
- ✅ Sorun giderme rehberleri ve en iyi uygulamalar
- ✅ Doğrulama komutlarına sahip bilgi kontrol noktaları

#### Dokümantasyon Değerlendirme Sonuçları
- **docs/pre-deployment/application-insights.md**: - Kapsamlı izleme rehberi
- **docs/getting-started/authsecurity.md**: - Profesyonel güvenlik desenleri
- **docs/pre-deployment/coordination-patterns.md**: - Gelişmiş çok ajanlı mimariler
- **Overall New Content**: - Tutarlı yüksek kalite standartları

#### Teknik Uygulama
- **Application Insights**: Log Analytics + özel telemetri + dağıtık izleme
- **Authentication**: Yönetilen Kimlik + Key Vault + RBAC desenleri
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrasyon
- **Monitoring**: Canlı metrikler + Kusto sorguları + uyarılar + panolar
- **Cost Management**: Örnekleme stratejileri, saklama politikaları, bütçe kontrolleri

### [v3.7.0] - 2025-11-19

#### Dokümantasyon Kalitesi İyileştirmeleri ve Yeni Microsoft Foundry Modelleri Örneği
**Bu sürüm, depo genelinde dokümantasyon kalitesini artırır ve gpt-4.1 sohbet arayüzü ile tam bir Microsoft Foundry Modelleri dağıtım örneği ekler.**

#### Eklendi
- **🤖 Microsoft Foundry Models Chat Example**: `examples/azure-openai-chat/` içinde çalışan uygulama ile tam gpt-4.1 dağıtımı:
  - Tam Microsoft Foundry Modelleri altyapısı (gpt-4.1 model dağıtımı)
  - Konuşma geçmişli Python komut satırı sohbet arayüzü
  - API anahtarlarının güvenli depolanması için Key Vault entegrasyonu
  - Token kullanım takibi ve maliyet tahmini
  - Hız sınırlaması ve hata yönetimi
  - 35-45 dakikalık dağıtım kılavuzuna sahip kapsamlı README
  - 11 üretim hazır dosya (Bicep şablonları, Python uygulaması, yapılandırma)
- **📚 Dokümantasyon Alıştırmaları**: Yapılandırma kılavuzuna uygulamalı alıştırmalar eklendi:
  - Alıştırma 1: Çoklu ortam yapılandırması (15 dakika)
  - Alıştırma 2: Gizli yönetimi uygulaması (10 dakika)
  - Açık başarı kriterleri ve doğrulama adımları
- **✅ Dağıtım Doğrulama**: Dağıtım kılavuzuna doğrulama bölümü eklendi:
  - Sağlık kontrol prosedürleri
  - Başarı kriterleri kontrol listesi
  - Tüm dağıtım komutları için beklenen çıktılar
  - Hızlı sorun giderme başvurusu

#### Geliştirildi
- **examples/README.md**: A-sınıfı kaliteye güncellendi (93%):
  - Tüm ilgili bölümlere azure-openai-chat eklendi
  - Yerel örnek sayısı 3'ten 4'e güncellendi
  - AI Uygulama Örnekleri tablosuna eklendi
  - Orta düzey kullanıcılar için Hızlı Başlangıç'a entegre edildi
  - Microsoft Foundry Şablonları bölümüne eklendi
  - Karşılaştırma Matrisi ve teknoloji bulguları bölümleri güncellendi
- **Dokümantasyon Kalitesi**: docs klasöründe B+ (87%) → A- (92%) olarak geliştirildi:
  - Kritik komut örneklerine beklenen çıktılar eklendi
  - Yapılandırma değişiklikleri için doğrulama adımları eklendi
  - Uygulamalı alıştırmalarla pratik öğrenme güçlendirildi

#### Değiştirildi
- **Learning Progression**: Orta düzey öğrenenler için AI örneklerinin daha iyi entegrasyonu
- **Documentation Structure**: Daha uygulanabilir alıştırmalar ve net sonuçlar
- **Verification Process**: Ana iş akışlarına açık başarı kriterleri eklendi

#### İyileştirildi
- **Developer Experience**: Microsoft Foundry Modelleri dağıtımı artık 35-45 dakika sürüyor (karmaşık alternatiflere göre 60-90 dakika yerine)
- **Cost Transparency**: Microsoft Foundry Modelleri örneği için net maliyet tahminleri ($50-200/ay)
- **Learning Path**: AI geliştiricileri için azure-openai-chat ile net bir giriş noktası sağlandı
- **Documentation Standards**: Tutarlı beklenen çıktılar ve doğrulama adımları

#### Doğrulandı
- ✅ Microsoft Foundry Modelleri örneği `azd up` ile tam işlevsel
- ✅ Tüm 11 uygulama dosyası sözdizimsel olarak doğru
- ✅ README talimatları gerçek dağıtım deneyimiyle eşleşiyor
- ✅ Dokümantasyon bağlantıları 8+ konumda güncellendi
- ✅ Örnekler indeksi 4 yerel örneği doğru şekilde yansıtıyor
- ✅ Tablolarda yinelenen harici bağlantı yok
- ✅ Tüm gezinme referansları doğru

#### Teknik Uygulama
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps deseni
- **Security**: Yönetilen Kimlik hazır, gizli bilgiler Key Vault'ta
- **Monitoring**: Application Insights entegrasyonu
- **Cost Management**: Token takibi ve kullanım optimizasyonu
- **Deployment**: Tam kurulum için tek `azd up` komutu

### [v3.6.0] - 2025-11-19

#### Büyük Güncelleme: Container App Dağıtım Örnekleri
**Bu sürüm, Azure Developer CLI (AZD) kullanarak eksiksiz, üretim hazır konteyner uygulama dağıtım örneklerini, tam dokümantasyon ve öğrenme yoluna entegrasyonla birlikte sunar.**

#### Eklendi
- **🚀 Container App Örnekleri**: `examples/container-app/` içinde yeni yerel örnekler:
  - [Master Guide](examples/container-app/README.md): Konteynerleştirilmiş dağıtımlar için eksiksiz genel bakış, hızlı başlangıç, üretim ve gelişmiş desenler
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Ölçek-sıfıra, sağlık kontrolleri, izleme ve sorun giderme içeren başlangıç dostu REST API
  - [Microservices Architecture](../../examples/container-app/microservices): Üretim hazır çok hizmetli dağıtım (API Gateway, Product, Order, User, Notification), asenkron mesajlaşma, Service Bus, Cosmos DB, Azure SQL, dağıtık izleme, blue-green/canary dağıtımı
- **Best Practices**: Konteynerleştirilmiş iş yükleri için güvenlik, izleme, maliyet optimizasyonu ve CI/CD rehberliği
- **Code Samples**: Tam `azure.yaml`, Bicep şablonları ve çok dilli servis uygulamaları (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: Uçtan uca test senaryoları, izleme komutları, sorun giderme rehberliği

#### Değiştirildi
- **README.md**: Yeni konteyner uygulama örneklerini "Local Examples - Container Applications" altında öne çıkaracak ve bağlayacak şekilde güncellendi
- **examples/README.md**: Konteyner uygulama örneklerini vurgulayacak, karşılaştırma matrisi girdileri ekleyecek ve teknoloji/mimari referanslarını güncelleyecek şekilde güncellendi
- **Course Outline & Study Guide**: İlgili bölümlerde yeni konteyner uygulama örnekleri ve dağıtım desenlerine referans verecek şekilde güncellendi

#### Doğrulandı
- ✅ Tüm yeni örnekler `azd up` ile dağıtılabilir ve en iyi uygulamaları takip eder
- ✅ Dokümantasyon çapraz bağlantıları ve gezinme güncellendi
- ✅ Örnekler başlangıçtan ileri düzeye senaryoları kapsar, üretim mikroservisleri dahil

#### Notlar
- **Scope**: Sadece İngilizce dokümantasyon ve örnekler
- **Next Steps**: Gelecek sürümlerde ek gelişmiş konteyner desenleri ve CI/CD otomasyonu ile genişletme

### [v3.5.0] - 2025-11-19

#### Ürün Yeniden Markalaşması: Microsoft Foundry
**Bu sürüm, Microsoft'ün resmi yeniden markalaşmasını yansıtacak şekilde tüm İngilizce dokümantasyonda ürün adının güncellenmesini uygular.**

#### Değiştirildi
- **🔄 Product Name Update**: Microsoft Foundry ürün adı için kapsamlı yeniden markalaşma
  - İngilizce dokümantasyondaki tüm referanslar `docs/` klasöründe güncellendi
  - Renamed folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renamed file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Toplam: 23 içerik referansı 7 doküman dosyası genelinde güncellendi

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` renamed to `docs/microsoft-foundry/`
  - Tüm çapraz referanslar yeni klasör yapısını yansıtacak şekilde güncellendi
  - Gezinme bağlantıları tüm dokümantasyonda doğrulandı

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tüm dahili bağlantılar yeni dosya adını gösterecek şekilde güncellendi

#### Güncellenen Dosyalar
- **Bölüm Dokümantasyonu** (7 dosya):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 gezinme bağlantısı güncellemesi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ürün adı referansı güncellendi
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Zaten Microsoft Foundry kullanıyor (önceki güncellemelerden)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referans güncellendi (genel bakış, topluluk geri bildirimi, dokümantasyon)
  - `docs/getting-started/azd-basics.md` - 4 çapraz referans bağlantısı güncellendi
  - `docs/getting-started/first-project.md` - 2 bölüm gezinme bağlantısı güncellendi
  - `docs/getting-started/installation.md` - 2 sonraki bölüm bağlantısı güncellendi
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referans güncellendi (gezinme, Discord topluluğu)
  - `docs/troubleshooting/common-issues.md` - 1 gezinme bağlantısı güncellendi
  - `docs/troubleshooting/debugging.md` - 1 gezinme bağlantısı güncellendi

- **Kurs Yapısı Dosyaları** (2 dosya):
  - `README.md` - 17 referans güncellendi (kurs genel bakışı, bölüm başlıkları, şablonlar bölümü, topluluk içgörüleri)
  - `course-outline.md` - 14 referans güncellendi (genel bakış, öğrenme hedefleri, bölüm kaynakları)

#### Doğrulandı
- ✅ İngilizce dokümanlarda kalan 'ai-foundry' klasör yolu referansı sıfır
- ✅ İngilizce dokümanlarda kalan 'Microsoft Foundry' ürün adı referansı sıfır
- ✅ Yeni klasör yapısıyla tüm gezinme bağlantıları çalışır durumda
- ✅ Dosya ve klasör yeniden adlandırmaları başarıyla tamamlandı
- ✅ Bölümler arası çapraz referanslar doğrulandı

#### Notlar
- **Scope**: Değişiklikler yalnızca `docs/` klasöründeki İngilizce dokümantasyona uygulandı
- **Translations**: Çeviri klasörleri (`translations/`) bu sürümde güncellenmedi
- **Workshop**: Workshop materyalleri (`workshop/`) bu sürümde güncellenmedi
- **Examples**: Örnek dosyalar hâlâ eski adlandırmayı referans gösterebilir (gelecek güncellemede ele alınacak)
- **External Links**: Harici URL'ler ve GitHub depo referansları değişmeden kaldı

#### Katkıda Bulunanlar için Geçiş Rehberi
If you have local branches or documentation referencing the old structure:
1. Klasör referanslarını güncelleyin: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Dosya referanslarını güncelleyin: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ürün adını değiştirin: "Microsoft Foundry" → "Microsoft Foundry"
4. Tüm dahili dokümantasyon bağlantılarının hâlâ çalıştığını doğrulayın

---

### [v3.4.0] - 2025-10-24

#### Altyapı Önizlemesi ve Doğrulama İyileştirmeleri
**Bu sürüm, yeni Azure Developer CLI önizleme özelliği için kapsamlı destek sunar ve workshop kullanıcı deneyimini geliştirir.**

#### Eklendi
- **🧪 azd provision --preview Feature Documentation**: Yeni altyapı önizleme yeteneğinin kapsamlı dokümantasyonu
  - Hızlı başvuru sayfasında komut referansı ve kullanım örnekleri
  - Sağlama kılavuzunda kullanım senaryoları ve faydalarıyla detaylı entegrasyon
  - Daha güvenli dağıtım doğrulaması için ön kontrol entegrasyonu
  - Güvenliği önceliklendiren dağıtım uygulamaları ile başlangıç kılavuzu güncellemeleri
- **🚧 Workshop Durum Afişi**: Workshop geliştirme durumunu gösteren profesyonel HTML afişi
  - Gradyan tasarım ve yapım göstergeleri ile net kullanıcı iletişimi
  - Şeffaflık için son güncelleme zaman damgası
  - Tüm cihaz türleri için mobil uyumlu tasarım

#### Geliştirildi
- **Altyapı Güvenliği**: Önizleme işlevselliği dağıtım dokümantasyonunun tamamına entegre edildi
- **Pre-deployment Validation**: Otomatik betikler artık altyapı önizleme testlerini içeriyor
- **Developer Workflow**: Komut dizileri, önizlemeyi en iyi uygulama olarak içerecek şekilde güncellendi
- **Workshop Experience**: Kullanıcılar için içerik geliştirme durumu hakkında net beklentiler belirlendi

#### Değiştirildi
- **Deployment Best Practices**: Önizleme-öncelikli iş akışı artık önerilen yaklaşım
- **Documentation Flow**: Altyapı doğrulaması öğrenme sürecinde daha önce konumlandırıldı
- **Workshop Presentation**: Net geliştirme zaman çizelgesi ile profesyonel durum iletişimi

#### İyileştirildi
- **Safety-First Approach**: Altyapı değişiklikleri artık dağıtımdan önce doğrulanabilir
- **Team Collaboration**: Önizleme sonuçları inceleme ve onay için paylaşılabilir
- **Cost Awareness**: Sağlama öncesinde kaynak maliyetlerinin daha iyi anlaşılması
- **Risk Mitigation**: Ön doğrulama ile dağıtım hatalarının azaltılması

#### Teknik Uygulama
- **Multi-document Integration**: Önizleme özelliği 4 ana dosyada belgelenmiş
- **Command Patterns**: Dokümantasyon genelinde tutarlı sözdizimi ve örnekler
- **Best Practice Integration**: Önizleme doğrulama iş akışları ve betiklerine dahil edildi
- **Visual Indicators**: Keşfedilebilirliği artırmak için yeni özellik işaretlemeleri

#### Atölye Altyapısı
- **Status Communication**: Gradyan stilindeki profesyonel HTML afişi
- **User Experience**: Net geliştirme durumu kafa karışıklığını önler
- **Professional Presentation**: Beklentileri belirlerken depo güvenilirliğini korur
- **Timeline Transparency**: Sorumluluk için Ekim 2025 son güncelleme zaman damgası

### [v3.3.0] - 2025-09-24

#### Geliştirilmiş Atölye Materyalleri ve Etkileşimli Öğrenme Deneyimi
**Bu sürüm, tarayıcı tabanlı etkileşimli kılavuzlar ve yapılandırılmış öğrenme yolları içeren kapsamlı atölye materyalleri sunar.**

#### Eklendi
- **🎥 Etkileşimli Atölye Rehberi**: MkDocs önizleme özelliğiyle tarayıcı tabanlı atölye deneyimi
- **📝 Yapılandırılmış Atölye Talimatları**: Keşiften özelleştirmeye 7 adımlı rehberli öğrenme yolu
  - 0-Introduction: Atölye genel bakışı ve kurulum
  - 1-Select-AI-Template: Şablon keşfi ve seçim süreci
  - 2-Validate-AI-Template: Dağıtım ve doğrulama prosedürleri
  - 3-Deconstruct-AI-Template: Şablon mimarisinin anlaşılması
  - 4-Configure-AI-Template: Konfigürasyon ve özelleştirme
  - 5-Customize-AI-Template: Gelişmiş değişiklikler ve yinelemeler
  - 6-Teardown-Infrastructure: Temizlik ve kaynak yönetimi
  - 7-Wrap-up: Özet ve sonraki adımlar
- **🛠️ Atölye Araçları**: Geliştirilmiş öğrenme deneyimi için Material teması ile MkDocs yapılandırması
- **🎯 Uygulamalı Öğrenme Yolu**: 3 adımlı metodoloji (Keşif → Dağıtım → Özelleştirme)
- **📱 GitHub Codespaces Entegrasyonu**: Kesintisiz geliştirme ortamı kurulumu

#### Enhanced
- **AI Workshop Lab**: Kapsamlı 2-3 saatlik yapılandırılmış öğrenme deneyimi ile genişletildi
- **Workshop Documentation**: Gezinme ve görsel yardımcılarla profesyonel sunum
- **Learning Progression**: Şablon seçiminden üretim dağıtımına kadar net adım adım rehberlik
- **Developer Experience**: Düzgün geliştirme iş akışları için entegre araçlar

#### Improved
- **Accessibility**: Arama, kopyalama işlevi ve tema geçişi olan tarayıcı tabanlı arayüz
- **Self-Paced Learning**: Farklı öğrenme hızlarına uyum sağlayan esnek atölye yapısı
- **Practical Application**: Gerçek dünya AI şablon dağıtım senaryoları
- **Community Integration**: Atölye desteği ve iş birliği için Discord entegrasyonu

#### Workshop Features
- **Built-in Search**: Hızlı anahtar kelime ve ders bulma
- **Copy Code Blocks**: Tüm kod örnekleri için üzerine gelerek kopyalama işlevi
- **Theme Toggle**: Farklı tercihler için koyu/açık mod desteği
- **Visual Assets**: Geliştirilmiş anlayış için ekran görüntüleri ve diyagramlar
- **Help Integration**: Topluluk desteği için doğrudan Discord erişimi

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**Bu sürüm, tüm depo genelinde geliştirilmiş gezinme ile kapsamlı bölüm tabanlı bir öğrenme yapısı tanıtır.**

#### Added
- **📚 Chapter-Based Learning System**: Tüm kursun 8 kademeli öğrenme bölümüne yeniden yapılandırılması
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 dk)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 saat)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 dk)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 saat)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 saat)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 saat)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 saat)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 saat)
- **📚 Comprehensive Navigation System**: Tüm belgelerde tutarlı gezinme başlıkları ve altbilgiler
- **🎯 Progress Tracking**: Kurs tamamlama kontrol listesi ve öğrenme doğrulama sistemi
- **🗺️ Learning Path Guidance**: Farklı deneyim seviyeleri ve hedefler için net giriş noktaları
- **🔗 Cross-Reference Navigation**: İlgili bölümler ve önkoşullar açıkça bağlantılı

#### Enhanced
- **README Structure**: Bölüm tabanlı organizasyon ile yapılandırılmış bir öğrenme platformuna dönüştürüldü
- **Documentation Navigation**: Her sayfa artık bölüm bağlamı ve ilerleme rehberliği içeriyor
- **Template Organization**: Örnekler ve şablonlar uygun öğrenme bölümlerine eşlendi
- **Resource Integration**: Hile sayfaları, SSS ve çalışma rehberleri ilgili bölümlere bağlandı
- **Workshop Integration**: Uygulamalı laboratuvarlar birden fazla bölüm öğrenme hedefiyle eşlendi

#### Changed
- **Learning Progression**: Doğrusal belgelerden esnek bölüm tabanlı öğrenmeye taşındı
- **Configuration Placement**: Daha iyi öğrenme akışı için konfigürasyon rehberi Bölüm 3 olarak yeniden konumlandırıldı
- **AI Content Integration**: Öğrenme yolculuğu boyunca AI'ye özgü içeriğin daha iyi entegrasyonu
- **Production Content**: İleri düzey desenler kurumsal öğrenenler için Bölüm 8'de konsolide edildi

#### Improved
- **User Experience**: Net gezinme izleri ve bölüm ilerleme göstergeleri
- **Accessibility**: Dersler arasında daha kolay gezinme için tutarlı gezinme desenleri
- **Professional Presentation**: Akademik ve kurumsal eğitim için uygun üniversite tarzı kurs yapısı
- **Learning Efficiency**: İyileştirilmiş organizasyon sayesinde ilgili içeriği bulma süresinin azaltılması

#### Technical Implementation
- **Navigation Headers**: 40+ belge dosyasında standartlaştırılmış bölüm gezinmesi
- **Footer Navigation**: Tutarlı ilerleme rehberliği ve bölüm tamamlama göstergeleri
- **Cross-Linking**: İlgili kavramları bağlayan kapsamlı dahili bağlantı sistemi
- **Chapter Mapping**: Şablonlar ve örnekler öğrenme hedefleriyle açıkça ilişkilendirildi

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Çalışma rehberi 8 bölüm sistemine uyacak şekilde yeniden yapılandırıldı
- **🎯 Chapter-Based Assessment**: Her bölümde belirli öğrenme hedefleri ve uygulamalı egzersizler bulunuyor
- **📋 Progress Tracking**: Ölçülebilir sonuçlar ve tamamlama kontrol listeleri ile haftalık öğrenme programı
- **❓ Assessment Questions**: Her bölüm için profesyonel çıktılara yönelik bilgi doğrulama soruları
- **🛠️ Practical Exercises**: Gerçek dağıtım senaryoları ve sorun giderme içeren uygulamalı aktiviteler
- **📊 Skill Progression**: Temel kavramlardan kurumsal desenlere kadar net ilerleme ve kariyer gelişimi odaklı yapı
- **🎓 Certification Framework**: Profesyonel gelişim çıktıları ve topluluk tanıma sistemi
- **⏱️ Timeline Management**: Kilit taş doğrulaması ile yapılandırılmış 10 haftalık öğrenme planı

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Bu sürüm, çok ajanlı perakende çözümünü daha iyi ajan adlandırması ve geliştirilmiş dokümantasyon ile iyileştirir.**

#### Changed
- **Multi-Agent Terminology**: Perakende çok ajanlı çözüm genelinde "Cora agent" yerine "Customer agent" kullanımıyla değiştirildi
- **Agent Architecture**: Tüm dokümantasyon, ARM şablonları ve kod örnekleri tutarlı "Customer agent" adlandırmasını kullanacak şekilde güncellendi
- **Configuration Examples**: Güncellenmiş adlandırma ile modernize edilmiş ajan yapılandırma desenleri
- **Documentation Consistency**: Tüm referansların profesyonel, tanımlayıcı ajan adlarını kullanması sağlandı

#### Enhanced
- **ARM Template Package**: retail-multiagent-arm-template, Customer agent referansları ile güncellendi
- **Architecture Diagrams**: Güncellenmiş ajan adlandırmasıyla yenilenmiş Mermaid diyagramları
- **Code Examples**: Python sınıfları ve uygulama örnekleri artık CustomerAgent adlandırmasını kullanıyor
- **Environment Variables**: Tüm dağıtım betiklerinde CUSTOMER_AGENT_NAME konvansiyonları kullanılması için güncelleme

#### Improved
- **Developer Experience**: Dokümantasyonda daha net ajan rolleri ve sorumlulukları
- **Production Readiness**: Kurumsal adlandırma konvansiyonlarıyla daha iyi hizalama
- **Learning Materials**: Eğitim amaçlı daha sezgisel ajan adlandırması
- **Template Usability**: Ajan işlevleri ve dağıtım desenlerinin daha basit anlaşılması

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**Bu sürüm, depoyu kapsamlı bir AI odaklı öğrenme kaynağına Microsoft Foundry entegrasyonu ile dönüştürür.**

#### Added
- **🤖 AI-First Learning Path**: AI geliştiricileri ve mühendisleri önceliklendiren tam bir yeniden yapılandırma
- **Microsoft Foundry Integration Guide**: AZD'yi Microsoft Foundry servisleriyle bağlama için kapsamlı dokümantasyon
- **AI Model Deployment Patterns**: Model seçimi, konfigürasyon ve üretim dağıtım stratejilerini kapsayan ayrıntılı rehber
- **AI Workshop Lab**: AI uygulamalarını AZD ile dağıtılabilir çözümlere dönüştürmek için 2-3 saatlik uygulamalı atölye
- **Production AI Best Practices**: AI iş yüklerini ölçeklendirme, izleme ve güvence altına alma için kurumsal düzeyde desenler
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry Modelleri, Cognitive Services ve AI dağıtım sorunları için kapsamlı sorun giderme
- **AI Template Gallery**: Karmaşıklık dereceleri ile öne çıkan Microsoft Foundry şablon koleksiyonu
- **Workshop Materials**: Uygulamalı laboratuvarlar ve referans materyalleri ile eksiksiz atölye yapısı

#### Enhanced
- **README Structure**: Microsoft Foundry Discord'dan %45 topluluk ilgi verisiyle AI geliştirici odaklı içerik
- **Learning Paths**: Öğrenciler ve DevOps mühendisleri için geleneksel yollarla birlikte ayrılmış AI geliştirici yolculuğu
- **Template Recommendations**: azure-search-openai-demo, contoso-chat ve openai-chat-app-quickstart gibi öne çıkan AI şablonları
- **Community Integration**: AI'ye özgü kanallar ve tartışmalar ile geliştirilmiş Discord topluluk desteği

#### Security & Production Focus
- **Managed Identity Patterns**: AI'ye özgü kimlik doğrulama ve güvenlik yapılandırmaları
- **Cost Optimization**: AI iş yükleri için token kullanım izleme ve bütçe kontrolleri
- **Multi-Region Deployment**: Küresel AI uygulama dağıtımı stratejileri
- **Performance Monitoring**: AI'ye özgü metrikler ve Application Insights entegrasyonu

#### Documentation Quality
- **Linear Course Structure**: Başlangıçtan ileri düzeye mantıksal ilerleme
- **Validated URLs**: Tüm harici depo bağlantıları doğrulanmış ve erişilebilir
- **Complete Reference**: Tüm dahili dokümantasyon bağlantıları doğrulanmış ve çalışır durumda
- **Production Ready**: Gerçek dünya örnekleriyle kurumsal dağıtım desenleri

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Bu sürüm, depo yapısının ve içerik sunumunun önemli bir revizyonunu temsil eder.**

#### Added
- **Structured Learning Framework**: Tüm doküman sayfaları artık Giriş, Öğrenme Hedefleri ve Öğrenme Çıktıları bölümlerini içerir
- **Navigation System**: Rehberli öğrenme ilerlemesi için tüm dokümantasyonda Önceki/Sonraki ders bağlantıları eklendi
- **Study Guide**: Öğrenme hedefleri, uygulama egzersizleri ve değerlendirme materyalleri içeren kapsamlı study-guide.md
- **Professional Presentation**: Erişilebilirlik ve profesyonel görünüm için tüm emoji simgeleri kaldırıldı
- **Enhanced Content Structure**: Öğrenme materyallerinin geliştirilmiş organizasyonu ve akışı

#### Changed
- **Documentation Format**: Tutarlı öğrenme odaklı yapı ile tüm dokümantasyon standartlaştırıldı
- **Navigation Flow**: Tüm öğrenme materyalleri arasında mantıklı ilerleme uygulandı
- **Content Presentation**: Açık, profesyonel formatlama lehine dekoratif öğeler kaldırıldı
- **Link Structure**: Yeni gezinme sistemini destekleyecek şekilde tüm dahili bağlantılar güncellendi

#### Improved
- **Accessibility**: Ekran okuyucu uyumluluğu için emoji bağımlılıkları kaldırıldı
- **Professional Appearance**: Kurumsal öğrenim için uygun temiz, akademik tarz sunum
- **Learning Experience**: Her ders için net hedefler ve çıktılar ile yapılandırılmış yaklaşım
- **Content Organization**: İlgili konular arasında daha iyi mantıksal akış ve bağlantı

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
- **Çoklu Model Desteği**: Hugging Face, Azure Machine Learning ve özel modeller için entegrasyon desenleri
- **Yapay Zeka Ajan Çerçeveleri**: LangChain, Semantic Kernel ve AutoGen dağıtımları için şablonlar
- **Gelişmiş RAG Desenleri**: Azure AI Search'in ötesinde vektör veritabanı seçenekleri (Pinecone, Weaviate vb.)
- **Yapay Zeka Gözlemlenebilirliği**: Model performansı, token kullanımı ve yanıt kalitesi için geliştirilmiş izleme

#### Geliştirici Deneyimi
- **VS Code Uzantısı**: Entegre AZD + Microsoft Foundry geliştirme deneyimi
- **GitHub Copilot Entegrasyonu**: Yapay zeka destekli AZD şablon oluşturma
- **Etkileşimli Eğitimler**: Yapay zeka senaryoları için otomatik doğrulamalı pratik kodlama egzersizleri
- **Video İçeriği**: Görsel öğrenenler için AI dağıtımlarına odaklanan tamamlayıcı video eğitimleri

### Sürüm 4.0.0 (Planlanan)
#### Kurumsal Yapay Zeka Desenleri
- **Yönetişim Çerçevesi**: Yapay zeka model yönetişimi, uyumluluk ve denetim izleri
- **Çok Kiracılı Yapay Zeka**: İzole yapay zeka hizmetleriyle birden çok müşteriye hizmet verme desenleri
- **Edge Yapay Zeka Dağıtımı**: Azure IoT Edge ve konteyner örnekleri ile entegrasyon
- **Hibrit Bulut Yapay Zeka**: Yapay zeka iş yükleri için çoklu bulut ve hibrit dağıtım desenleri

#### Gelişmiş Özellikler
- **Yapay Zeka Boru Hattı Otomasyonu**: Azure Machine Learning boru hatlarıyla MLOps entegrasyonu
- **Gelişmiş Güvenlik**: Sıfır-güven desenleri, özel uç noktalar ve gelişmiş tehdit koruması
- **Performans Optimizasyonu**: Yüksek verimli yapay zeka uygulamaları için gelişmiş ayarlama ve ölçeklendirme stratejileri
- **Küresel Dağıtım**: Yapay zeka uygulamaları için içerik teslimi ve edge önbellekleme desenleri

### Sürüm 3.0.0 (Planlanan) - Mevcut Sürüm Tarafından Yer Değiştirildi
#### Önerilen Eklemeler - Şimdi v3.0.0'da Uygulandı
- ✅ **Yapay Zeka Odaklı İçerik**: Kapsamlı Microsoft Foundry entegrasyonu (Tamamlandı)
- ✅ **Etkileşimli Eğitimler**: Uygulamalı yapay zeka atölye laboratuvarı (Tamamlandı)
- ✅ **Gelişmiş Güvenlik Modülü**: Yapay zeka özelinde güvenlik desenleri (Tamamlandı)
- ✅ **Performans Optimizasyonu**: Yapay zeka iş yükü ayarlama stratejileri (Tamamlandı)

### Sürüm 2.1.0 (Planlanan) - v3.0.0'da Kısmen Uygulandı
#### Küçük İyileştirmeler - Bazıları Mevcut Sürümde Tamamlandı
- ✅ **Ek Örnekler**: Yapay zeka odaklı dağıtım senaryoları (Tamamlandı)
- ✅ **Genişletilmiş SSS**: Yapay zeka ile ilgili sorular ve sorun giderme (Tamamlandı)
- **Araç Entegrasyonu**: Geliştirilmiş IDE ve editör entegrasyon kılavuzları
- ✅ **İzleme Genişletmesi**: Yapay zeka özelinde izleme ve uyarı desenleri (Tamamlandı)

#### Gelecek Sürümler İçin Hâlâ Planlanıyor
- **Mobil Dostu Dokümantasyon**: Mobil öğrenme için duyarlı tasarım
- **Çevrimdışı Erişim**: İndirilebilir dokümantasyon paketleri
- **Geliştirilmiş IDE Entegrasyonu**: AZD + AI iş akışları için VS Code uzantısı
- **Topluluk Panosu**: Gerçek zamanlı topluluk metrikleri ve katkı izleme

## Değişiklik Günlüğüne Katkıda Bulunma

### Değişiklik Bildirimi
Bu depoya katkıda bulunurken, lütfen değişiklik günlüğü girdilerinin şunları içerdiğinden emin olun:

1. **Sürüm Numarası**: Semantik sürümlendirmeyi takip ederek (major.minor.patch)
2. **Tarih**: Yayın veya güncelleme tarihi YYYY-MM-DD formatında
3. **Kategori**: Eklendi, Değiştirildi, Kullanımdan Kaldırıldı, Kaldırıldı, Düzeltildi, Güvenlik
4. **Açık Açıklama**: Ne değiştiğine dair özlü açıklama
5. **Etkilerinin Değerlendirmesi**: Değişikliklerin mevcut kullanıcıları nasıl etkilediği

### Değişiklik Kategorileri

#### Eklendi
- Yeni özellikler, dokümantasyon bölümleri veya yetenekler
- Yeni örnekler, şablonlar veya öğrenme kaynakları
- Ek araçlar, betikler veya yardımcı programlar

#### Değiştirildi
- Mevcut işlevsellik veya dokümantasyonda yapılan değişiklikler
- Netlik veya doğruluğu artırmaya yönelik güncellemeler
- İçeriğin veya organizasyonun yeniden yapılandırılması

#### Kullanımdan Kaldırıldı
- Aşamalı olarak kaldırılan özellikler veya yaklaşımlar
- Kaldırılmak üzere planlanmış dokümantasyon bölümleri
- Daha iyi alternatifleri olan yöntemler

#### Kaldırıldı
- Artık geçerli olmayan özellikler, dokümantasyon veya örnekler
- Güncelliğini yitirmiş bilgiler veya kullanımdan kaldırılmış yaklaşımlar
- Yinelenen veya birleştirilmiş içerik

#### Düzeltildi
- Dokümantasyon veya koddaki hataların düzeltilmesi
- Bildirilen sorunların veya problemlerinin çözümü
- Doğruluk veya işlevselliğin iyileştirilmesi

#### Güvenlik
- Güvenlikle ilgili iyileştirmeler veya düzeltmeler
- Güvenlik en iyi uygulamalarına yönelik güncellemeler
- Güvenlik açıklarının giderilmesi

### Semantik Sürümleme Rehberi

#### Ana Sürüm (X.0.0)
- Kullanıcı eylemi gerektiren geriye dönük uyumsuz değişiklikler
- İçerik veya organizasyonun önemli ölçüde yeniden yapılandırılması
- Temel yaklaşımı veya metodolojiyi değiştiren değişiklikler

#### Küçük Sürüm (X.Y.0)
- Yeni özellikler veya içerik eklemeleri
- Geriye dönük uyumluluğu koruyan geliştirmeler
- Ek örnekler, araçlar veya kaynaklar

#### Yama Sürümü (X.Y.Z)
- Hata düzeltmeleri ve düzeltmeler
- Mevcut içeriğe küçük iyileştirmeler
- Açıklamalar ve küçük geliştirmeler

## Topluluk Geri Bildirimi ve Öneriler

Bu öğrenme kaynağını geliştirmek için topluluk geri bildirimlerini aktif olarak teşvik ediyoruz:

### Geri Bildirim Nasıl Verilir
- **GitHub Issues**: Sorunları bildirin veya iyileştirme önerin (Yapay zeka ile ilgili sorunlar memnuniyetle karşılanır)
- **Discord Tartışmaları**: Fikirlerinizi paylaşın ve Microsoft Foundry topluluğuyla etkileşime geçin
- **Pull Request'ler**: İçeriğe doğrudan iyileştirmeler katkıda bulunun, özellikle yapay zeka şablonları ve kılavuzlar
- **Microsoft Foundry Discord**: AZD + AI tartışmaları için #Azure kanalına katılın
- **Topluluk Forumları**: Daha geniş Azure geliştirici tartışmalarına katılın

### Geri Bildirim Kategorileri
- **Yapay Zeka İçerik Doğruluğu**: Yapay zeka hizmet entegrasyonu ve dağıtım bilgilerine yönelik düzeltmeler
- **Öğrenme Deneyimi**: Yapay zeka geliştirici öğrenme akışının iyileştirilmesine yönelik öneriler
- **Eksik Yapay Zeka İçeriği**: Ek yapay zeka şablonları, desenleri veya örnekleri talepleri
- **Erişilebilirlik**: Çeşitli öğrenme ihtiyaçları için iyileştirmeler
- **Yapay Zeka Araç Entegrasyonu**: Daha iyi yapay zeka geliştirme iş akışı entegrasyonu için öneriler
- **Üretim Yapay Zeka Desenleri**: Kurumsal yapay zeka dağıtım desenleri talepleri

### Yanıt Taahhüdü
- **Sorun Yanıtı**: Bildirilen problemler için 48 saat içinde
- **Özellik Talepleri**: Bir hafta içinde değerlendirme
- **Topluluk Katkıları**: Bir hafta içinde inceleme
- **Güvenlik Konuları**: Öncelikli olarak ve hızlandırılmış yanıt

## Bakım Takvimi

### Düzenli Güncellemeler
- **Aylık İncelemeler**: İçerik doğruluğu ve bağlantı doğrulama
- **Üç Aylık Güncellemeler**: Önemli içerik eklemeleri ve iyileştirmeler
- **Yarı Yıllık İncelemeler**: Kapsamlı yeniden yapılandırma ve geliştirme
- **Yıllık Sürümler**: Önemli iyileştirmelerle ana sürüm güncellemeleri

### İzleme ve Kalite Güvencesi
- **Otomatik Testler**: Kod örnekleri ve bağlantıların düzenli doğrulanması
- **Topluluk Geri Bildirim Entegrasyonu**: Kullanıcı önerilerinin düzenli olarak dahil edilmesi
- **Teknoloji Güncellemeleri**: En son Azure hizmetleri ve azd sürümleri ile uyum
- **Erişilebilirlik Denetimleri**: Kapsayıcı tasarım ilkeleri için düzenli inceleme

## Sürüm Destek Politikası

### Mevcut Sürüm Desteği
- **En Son Ana Sürüm**: Düzenli güncellemelerle tam destek
- **Önceki Ana Sürüm**: 12 ay boyunca güvenlik güncellemeleri ve kritik düzeltmeler
- **Eski Sürümler**: Sadece topluluk desteği, resmi güncellemeler yok

### Geçiş Rehberliği
Ana sürümler yayınlandığında, sağlıyoruz:
- **Geçiş Kılavuzları**: Adım adım geçiş talimatları
- **Uyumluluk Notları**: Geriye dönük uyumsuz değişiklikler hakkında ayrıntılar
- **Araç Desteği**: Geçişe yardımcı olacak betikler veya yardımcı programlar
- **Topluluk Desteği**: Geçiş soruları için ayrılmış forumlar

---

**Gezinme**
- **Önceki Ders**: [Çalışma Rehberi](resources/study-guide.md)
- **Sonraki Ders**: Geri dön [Ana README](README.md)

**Güncel Kalın**: Yeni sürümler ve öğrenme materyallerindeki önemli güncellemeler hakkında bildirimler için bu depoyu izleyin.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Bu belge AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Orijinal belge kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->