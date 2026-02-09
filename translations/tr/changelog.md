# Değişiklik Günlüğü - AZD For Beginners

## Giriş

Bu değişiklik günlüğü, AZD For Beginners deposundaki tüm önemli değişiklikleri, güncellemeleri ve iyileştirmeleri belgeler. Semantik sürümleme ilkelerini takip ediyoruz ve kullanıcıların sürümler arasındaki değişiklikleri anlamalarına yardımcı olmak için bu günlük tutuluyor.

## Öğrenme Hedefleri

Bu değişiklik günlüğünü inceleyerek:
- Yeni özellikler ve içerik eklemeleri hakkında güncel kalacaksınız
- Mevcut dokümantasyonda yapılan iyileştirmeleri anlayacaksınız
- Doğruluğu sağlamak için hata düzeltmelerini ve düzeltmeleri takip edeceksiniz
- Öğrenme materyallerinin zaman içindeki evrimini takip edeceksiniz

## Öğrenme Çıktıları

Değişiklik günlüğü girdilerini inceledikten sonra şunları yapabileceksiniz:
- Öğrenme için kullanılabilir yeni içerik ve kaynakları tanımlamak
- Hangi bölümlerin güncellendiğini veya iyileştirildiğini anlamak
- En güncel materyallere göre öğrenme yolunuzu planlamak
- Gelecekteki iyileştirmeler için geri bildirim ve önerilerde bulunmak

## Sürüm Geçmişi

### [v3.17.0] - 2026-02-05

#### Kurs Gezintisi İyileştirmesi
**Bu sürüm, README.md bölüm gezintisini geliştirilmiş bir tablo formatıyla iyileştirir.**

#### Değişiklikler
- **Course Map Table**: Doğrudan ders bağlantıları, süre tahminleri ve karmaşıklık derecelendirmeleri ile geliştirildi
- **Folder Cleanup**: Gereksiz eski klasörler kaldırıldı (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Course Map tablosundaki 21+ dahili bağlantı doğrulandı

### [v3.16.0] - 2026-02-05

#### Ürün Adı Güncellemeleri
**Bu sürüm, ürün referanslarını güncel Microsoft markalamasına göre günceller.**

#### Değişiklikler
- **Azure AI Foundry → Microsoft Foundry**: Tüm referanslar çeviri dışı dosyalarda güncellendi
- **Azure AI Agent Service → Foundry Agents**: Hizmet adı güncel markalamayı yansıtacak şekilde güncellendi

#### Güncellenen Dosyalar
- `README.md` - Ana kurs açılış sayfası
- `changelog.md` - Sürüm geçmişi
- `course-outline.md` - Kurs yapısı
- `docs/chapter-02-ai-development/agents.md` - AI ajanları rehberi
- `examples/README.md` - Örnekler dokümantasyonu
- `workshop/README.md` - Atölye açılış sayfası
- `workshop/docs/index.md` - Atölye indeksi
- `workshop/docs/instructions/*.md` - Tüm atölye talimat dosyaları

---

### [v3.15.0] - 2026-02-05

#### Büyük Depo Yeniden Yapılandırması: Bölüm Tabanlı Klasör İsimleri
**Bu sürüm, daha net gezinme için dokümantasyonu ayrı bölüm klasörlerine yeniden yapılandırır.**

#### Klasör Yeniden Adlandırmaları
Eski klasörler bölüm numaralı klasörlerle değiştirildi:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Dosya Taşımaları
| Dosya | Nereden | Nereye |
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

#### Eklenenler
- **📚 Chapter README files**: Her bölüm klasörüne README.md oluşturuldu ve şu içerikler eklendi:
  - Öğrenme hedefleri ve süre
  - Açıklamalı ders tablosu
  - Hızlı başlangıç komutları
  - Diğer bölümlere gezinme

#### Değişiklikler
- **🔗 Updated all internal links**: 78+ yol tüm dokümantasyon dosyalarında güncellendi
- **🗺️ Main README.md**: Ana README.md, yeni bölüm yapısıyla Course Map'i güncelledi
- **📝 examples/README.md**: Örneklerin bölüm klasörlerine olan çapraz referansları güncellendi

#### Kaldırıldı
- Eski klasör yapısı (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Depo Yeniden Yapılandırması: Bölüm Navigasyonu
**Bu sürüm bölüm gezinti README dosyaları ekledi (v3.15.0 tarafından geçersiz kılındı).**

---

### [v3.13.0] - 2026-02-05

#### Yeni AI Ajanları Rehberi
**Bu sürüm, Azure Developer CLI ile AI ajanlarını dağıtmak için kapsamlı bir rehber ekler.**

#### Eklenenler
- **🤖 docs/microsoft-foundry/agents.md**: Aşağıları kapsayan tam rehber:
  - AI ajanlarının ne olduğu ve sohbet botlarından nasıl farklılaştığı
  - Üç hızlı başlangıç ajan şablonu (Foundry Agents, Prompty, RAG)
  - Ajan mimarisi desenleri (tek ajan, RAG, çoklu ajan)
  - Araç yapılandırması ve özelleştirme
  - İzleme ve metrik takibi
  - Maliyet değerlendirmeleri ve optimizasyon
  - Yaygın sorun giderme senaryoları
  - Başarı kriterlerine sahip üç uygulamalı egzersiz

#### İçerik Yapısı
- **Introduction**: Yeni başlayanlar için ajan kavramları
- **Quick Start**: Ajanları `azd init --template get-started-with-ai-agents` ile dağıtın
- **Architecture Patterns**: Ajan desenlerinin görsel diyagramları
- **Configuration**: Araç kurulumu ve ortam değişkenleri
- **Monitoring**: Application Insights entegrasyonu
- **Exercises**: Kademeli uygulamalı öğrenme (her biri 20-45 dakika)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Ortam Güncellemesi
**Bu sürüm, AZD öğrenme deneyimi için geliştirilmiş araçlar ve daha iyi varsayılanlarla geliştirme konteyneri yapılandırmasını günceller.**

#### Değişiklikler
- **🐳 Base Image**: `python:3.12-bullseye`'den `python:3.12-bookworm`'a (en son Debian stable) güncellendi
- **📛 Container Name**: Açıklık için "Python 3"ten "AZD for Beginners" olarak yeniden adlandırıldı

#### Eklenenler
- **🔧 Yeni Dev Container Özellikleri**:
  - `azure-cli` Bicep desteği etkinleştirildi
  - `node:20` (AZD şablonları için LTS sürüm)
  - `github-cli` şablon yönetimi için
  - `docker-in-docker` konteyner uygulama dağıtımları için

- **🔌 Port Forwarding**: Yaygın geliştirme için ön yapılandırılmış portlar:
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
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diyagram desteği
  - `redhat.vscode-yaml` - YAML desteği (azure.yaml için)
  - `eamodio.gitlens` - Git görselleştirme
  - `mhutchie.git-graph` - Git geçmişi

- **⚙️ VS Code Settings**: Python yorumlayıcısı, kaydetmede biçimlendirme ve boşluk temizleme için varsayılan ayarlar eklendi

- **📦 requirements-dev.txt Güncellendi**:
  - MkDocs minify eklentisi eklendi
  - Kod kalitesi için pre-commit eklendi
  - Azure SDK paketleri eklendi (azure-identity, azure-mgmt-resource)

#### Düzeltildi
- **Post-Create Command**: Konteyner başlatıldığında artık AZD ve Azure CLI kurulumunu doğrular

---

### [v3.11.0] - 2026-02-05

#### Yeni Başlayanlara Uygun README Yenilemesi
**Bu sürüm README.md dosyasını yeni başlayanlar için önemli ölçüde erişilebilir hale getirir ve AI geliştiricileri için gerekli kaynakları ekler.**

#### Eklenenler
- **🆚 Azure CLI vs AZD Karşılaştırması**: Hangi aracın ne zaman kullanılacağını pratik örneklerle açıklayan net bir karşılaştırma
- **🌟 Harika AZD Bağlantıları**: Topluluk şablon galerisi ve katkı kaynaklarına doğrudan bağlantılar:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ dağıtıma hazır şablon
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Topluluk katkısı
- **🎯 Hızlı Başlangıç Kılavuzu**: Basitleştirilmiş 3 adımlı başlangıç bölümü (Install → Login → Deploy)
- **📊 Deneyime Dayalı Gezinme Tablosu**: Nereden başlayacağınız konusunda geliştirici deneyimine göre net rehberlik

#### Değişiklikler
- **README Yapısı**: Kademeli açıklama için yeniden düzenlendi - önemli bilgiler ilk
- **Giriş Bölümü**: Tamamen yeni başlayanlar için "The Magic of `azd up`"i açıklamak üzere yeniden yazıldı
- **Duplicate İçerik Kaldırıldı**: Yinelenen sorun giderme bölümü kaldırıldı
- **Sorun Giderme Komutları**: `azd logs` referansı geçerli `azd monitor --logs` ile düzeltildi

#### Düzeltildi
- **🔐 Authentication Commands**: `azd auth login` ve `azd auth logout` cheat-sheet.md dosyasına eklendi
- **Invalid Command References**: README sorun giderme bölümündeki kalan `azd logs` referansları kaldırıldı

#### Notlar
- **Kapsam**: Değişiklikler ana README.md ve resources/cheat-sheet.md dosyalarına uygulandı
- **Hedef Kitle**: İyileştirmeler özellikle AZD'ye yeni olan geliştiricilere yöneliktir

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Komut Doğruluğu Güncellemesi
**Bu sürüm, dokümantasyondaki var olmayan AZD komutlarını düzeltir ve tüm kod örneklerinin geçerli Azure Developer CLI sözdizimini kullanmasını sağlar.**

#### Düzeltildi
- **🔧 Var Olmayan AZD Komutları Kaldırıldı**: Geçersiz komutların kapsamlı denetimi ve düzeltilmesi:
  - `azd logs` (yok) → `azd monitor --logs` veya Azure CLI alternatifleri ile değiştirildi
  - `azd service` alt komutları (yok) → `azd show` ve Azure CLI ile değiştirildi
  - `azd infra import/export/validate` (yok) → kaldırıldı veya geçerli alternatiflerle değiştirildi
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` bayrakları (yok) → kaldırıldı
  - `azd provision --what-if/--rollback` bayrakları (yok) → `--preview` kullanacak şekilde güncellendi
  - `azd config validate` (yok) → `azd config list` ile değiştirildi
  - `azd info`, `azd history`, `azd metrics` (yok) → kaldırıldı

- **📚 Komut Düzeltmeleriyle Güncellenen Dosyalar**:
  - `resources/cheat-sheet.md`: Komut referansının büyük ölçüde elden geçirilmesi
  - `docs/deployment/deployment-guide.md`: Geri alma ve dağıtım stratejilerinin düzeltilmesi
  - `docs/troubleshooting/debugging.md`: Log analizi bölümlerinin düzeltilmesi
  - `docs/troubleshooting/common-issues.md`: Sorun giderme komutlarının güncellenmesi
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD hata ayıklama bölümünün düzeltilmesi
  - `docs/getting-started/azd-basics.md`: İzleme komutlarının düzeltilmesi
  - `docs/getting-started/first-project.md`: İzleme ve hata ayıklama örneklerinin güncellenmesi
  - `docs/getting-started/installation.md`: Yardım ve sürüm örneklerinin düzeltilmesi
  - `docs/pre-deployment/application-insights.md`: Log görüntüleme komutlarının düzeltilmesi
  - `docs/pre-deployment/coordination-patterns.md`: Ajan hata ayıklama komutlarının düzeltilmesi

- **📝 Sürüm Referansı Güncellendi**:
  - `docs/getting-started/installation.md`: Sabitlenmiş `1.5.0` sürümü, genel `1.x.x` ile değiştirildi ve sürümlere bağlantı eklendi

#### Değiştirildi
- **Rollback Strategies**: AZD'nin yerel geri alma özelliği olmadığı için dokümantasyon Git tabanlı geri alma kullanacak şekilde güncellendi
- **Log Viewing**: `azd logs` referansları `azd monitor --logs`, `azd monitor --live` ve Azure CLI komutları ile değiştirildi
- **Performance Section**: Var olmayan paralel/inkremental dağıtım bayrakları kaldırıldı ve geçerli alternatifler sağlandı

#### Teknik Detaylar
- **Geçerli AZD Komutları**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Geçerli azd monitor Bayrakları**: `--live`, `--logs`, `--overview`
- **Kaldırılmış Özellikler**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notlar
- **Doğrulama**: Komutlar Azure Developer CLI v1.23.x ile doğrulandı

---

### [v3.9.0] - 2026-02-05

#### Atölye Tamamlama ve Dokümantasyon Kalitesi Güncellemesi
**Bu sürüm, etkileşimli atölye modüllerini tamamlar, tüm kırık dokümantasyon bağlantılarını düzeltir ve Microsoft AZD kullanan AI geliştiricileri için genel içerik kalitesini iyileştirir.**

#### Eklendi
- **📝 CONTRIBUTING.md**: Yeni katkı rehberi belgesi ile:
  - Sorun bildirme ve değişiklik önerme için net talimatlar
  - Yeni içerik için dokümantasyon standartları
  - Kod örneği yönergeleri ve commit mesajı konvansiyonları
  - Topluluk katılım bilgileri

#### Tamamlandı
- **🎯 Atölye Modülü 7 (Kapanış)**: Tamamlanmış kapanış modülü ile:
  - Atölye başarılarının kapsamlı özeti
  - AZD, şablonlar ve AI Foundry hakkında edinilen temel kavramlar bölümü
  - Öğrenme yolculuğuna devam önerileri
  - Zorluk dereceleri ile atölye meydan okuma egzersizleri
  - Topluluk geri bildirimi ve destek bağlantıları

- **📚 Atölye Modülü 3 (Parçalama)**: Güncellenmiş öğrenme hedefleri ile:
  - GitHub Copilot ile MCP sunucularının etkinleştirilmesi rehberi
  - AZD şablon klasör yapısının anlaşılması
  - Altyapı-kod olarak (Bicep) organizasyon desenleri
  - Uygulamalı laboratuvar talimatları

- **🔧 Atölye Modülü 6 (Kaldırma)**: Tamamlandı ve:
  - Kaynak temizleme ve maliyet yönetimi hedefleri
  - Güvenli altyapı kaldırma için `azd down` kullanımı
  - Yumuşak silinmiş bilişsel hizmetlerin kurtarılması rehberi
  - GitHub Copilot ve Azure Portal için bonus keşif yönergeleri

#### Düzeltildi
- **🔗 Kırık Bağlantı Düzeltmeleri**: 15+ dahili dokümantasyon bağlantısı çözüldü:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md yolları düzeltildi
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md ve production-ai-practices.md yolları düzeltildi
  - `docs/getting-started/first-project.md`: mevcut olmayan cicd-integration.md yerine deployment-guide.md konuldu
  - `examples/retail-scenario.md`: SSS ve sorun giderme kılavuzu yolları düzeltildi
  - `examples/container-app/microservices/README.md`: Ders ana sayfası ve dağıtım kılavuzu yolları düzeltildi
  - `resources/faq.md` ve `resources/glossary.md`: AI bölüm referansları güncellendi
  - `course-outline.md`: Eğitmen rehberi ve AI atölye lab referansları düzeltildi

- **📅 Atölye Durum Afişi**: "Under Construction" uyarısından aktif atölye durumuna, Şubat 2026 tarihiyle güncellendi

- **🔗 Atölye Navigasyonu**: README.md içindeki lab-1-azd-basics olmayan klasöre işaret eden kırık navigasyon bağlantıları düzeltildi

#### Değiştirildi
- **Atölye Sunumu**: "under construction" uyarısı kaldırıldı; atölye artık tamamlandı ve kullanıma hazır
- **Navigasyon Tutarlılığı**: Tüm atölye modüllerinin uygun modüller arası navigasyona sahip olması sağlandı
- **Öğrenme Yolu Referansları**: Bölümler arası referanslar doğru microsoft-foundry yollarını kullanacak şekilde güncellendi

#### Doğrulandı
- ✅ Tüm İngilizce markdown dosyalarının dahili bağlantıları geçerlidir
- ✅ Atölye modülleri 0-7 öğrenme hedefleriyle tamamlandı
- ✅ Bölümler ve modüller arasındaki navigasyon doğru çalışmaktadır
- ✅ İçerik Microsoft AZD kullanan AI geliştiricileri için uygundur
- ✅ Yeni başlayanlar için uygun dil ve yapı korunmuştur
- ✅ CONTRIBUTING.md topluluk katkıcıları için net rehberlik sağlar

#### Teknik Uygulama
- **Bağlantı Doğrulama**: Otomatik PowerShell betiği tüm .md dahili bağlantılarını doğruladı
- **İçerik Denetimi**: Atölye tamamlanmışlığı ve yeni başlayan uygunluğu manuel olarak incelendi
- **Navigasyon Sistemi**: Tutarlı bölüm ve modül navigasyon desenleri uygulandı

#### Notlar
- **Kapsam**: Değişiklikler yalnızca İngilizce dokümantasyona uygulanmıştır
- **Çeviriler**: Bu sürümde çeviri klasörleri güncellenmedi (otomatik çeviri daha sonra senkronize edilecektir)
- **Atölye Süresi**: Tamamlanmış atölye artık 3-4 saatlik uygulamalı öğrenim sağlar

---

### [v3.8.0] - 2025-11-19

#### Gelişmiş Dokümantasyon: İzleme, Güvenlik ve Çok Ajanlı Desenler
**Bu sürüm, Application Insights entegrasyonu, kimlik doğrulama desenleri ve üretim dağıtımları için çok ajanlı koordinasyon üzerine kapsamlı A-seviyesi dersler ekler.**

#### Eklendi
- **📊 Application Insights Entegrasyonu Dersi**: `docs/pre-deployment/application-insights.md` içinde:
  - AZD odaklı dağıtım ile otomatik sağlama
  - Application Insights + Log Analytics için tam Bicep şablonları
  - Özel telemetri ile çalışan Python uygulamaları (1.200+ satır)
  - AI/LLM izleme desenleri (Azure OpenAI token/maliyet takibi)
  - 6 Mermaid diyagramı (mimari, dağıtık izleme, telemetri akışı)
  - 3 uygulamalı egzersiz (uyarılar, panolar, AI izleme)
  - Kusto sorgu örnekleri ve maliyet optimizasyon stratejileri
  - Canlı metrik akışı ve gerçek zamanlı hata ayıklama
  - Üretime hazır desenlerle 40-50 dakikalık öğrenme süresi

- **🔐 Kimlik Doğrulama & Güvenlik Desenleri Dersi**: `docs/getting-started/authsecurity.md` içinde:
  - 3 kimlik doğrulama deseni (bağlantı dizeleri, Key Vault, yönetilen kimlik)
  - Güvenli dağıtımlar için tam Bicep altyapı şablonları
  - Azure SDK entegrasyonlu Node.js uygulama kodu
  - 3 tam egzersiz (yönetilen kimliği etkinleştirme, kullanıcı atanmış kimlik, Key Vault rotasyonu)
  - Güvenlik en iyi uygulamaları ve RBAC yapılandırmaları
  - Sorun giderme rehberi ve maliyet analizi
  - Üretime hazır parola olmadan kimlik doğrulama desenleri

- **🤖 Çok-Ajan Koordinasyon Desenleri Dersi**: `docs/pre-deployment/coordination-patterns.md` içinde:
  - 5 koordinasyon deseni (ardışık, paralel, hiyerarşik, olay-tabanlı, konsensüs)
  - Tam orkestratör servis uygulaması (Python/Flask, 1.500+ satır)
  - 3 uzmanlaşmış ajan uygulaması (Araştırma, Yazar, Editör)
  - Mesaj kuyruğu için Service Bus entegrasyonu
  - Dağıtık sistemler için Cosmos DB durum yönetimi
  - Ajan etkileşimlerini gösteren 6 Mermaid diyagramı
  - 3 ileri seviye egzersiz (zaman aşımı yönetimi, yeniden deneme mantığı, devre kesici)
  - Optimizasyon stratejileriyle maliyet dökümü ($240-565/ay)
  - İzleme için Application Insights entegrasyonu

#### Geliştirildi
- **Ön-dağıtım Bölümü**: Artık kapsamlı izleme ve koordinasyon desenlerini içeriyor
- **Başlangıç Bölümü**: Profesyonel kimlik doğrulama desenleri ile geliştirildi
- **Üretime Hazırlık**: Güvenlikten gözlemlenebilirliğe kadar tam kapsam
- **Kurs İçeriği**: Bölüm 3 ve 6'da yeni derslere referans verecek şekilde güncellendi

#### Değiştirildi
- **Öğrenme İlerlemesi**: Güvenlik ve izleme derslerinin kurs boyunca daha iyi entegrasyonu
- **Dokümantasyon Kalitesi**: Yeni derslerde tutarlı A-seviye standartlar (yüzde 95-97)
- **Üretim Desenleri**: Kurumsal dağıtımlar için uçtan uca tam kapsama

#### İyileştirildi
- **Geliştirici Deneyimi**: Geliştirmeden üretime izleme için net yol
- **Güvenlik Standartları**: Kimlik doğrulama ve gizli yönetimi için profesyonel desenler
- **Gözlemlenebilirlik**: AZD ile tam Application Insights entegrasyonu
- **AI İş Yükleri**: Azure OpenAI ve çok-ajan sistemler için uzmanlaşmış izleme

#### Doğrulandı
- ✅ Tüm dersler tam çalışan kod içeriyor (kod parçacıkları değil)
- ✅ Görsel öğrenme için Mermaid diyagramları (3 derste toplam 19)
- ✅ Doğrulama adımları olan uygulamalı egzersizler (toplam 9)
- ✅ `azd up` ile dağıtılabilir üretime hazır Bicep şablonları
- ✅ Maliyet analizi ve optimizasyon stratejileri
- ✅ Sorun giderme rehberleri ve en iyi uygulamalar
- ✅ Doğrulama komutlarıyla bilgi kontrol noktaları

#### Dokümantasyon Notları
- **docs/pre-deployment/application-insights.md**: - Kapsamlı izleme rehberi
- **docs/getting-started/authsecurity.md**: - Profesyonel güvenlik desenleri
- **docs/pre-deployment/coordination-patterns.md**: - Gelişmiş çok-ajan mimarileri
- **Genel Yeni İçerik**: - Tutarlı yüksek kaliteli standartlar

#### Teknik Uygulama
- **Application Insights**: Log Analytics + özel telemetri + dağıtık izleme
- **Kimlik Doğrulama**: Yönetilen Kimlik + Key Vault + RBAC desenleri
- **Çok-Ajan**: Service Bus + Cosmos DB + Container Apps + orkestrasyon
- **İzleme**: Canlı metrikler + Kusto sorguları + uyarılar + panolar
- **Maliyet Yönetimi**: Örnekleme stratejileri, saklama politikaları, bütçe kontrolleri

### [v3.7.0] - 2025-11-19

#### Dokümantasyon Kalitesi İyileştirmeleri ve Yeni Azure OpenAI Örneği
**Bu sürüm, depo genelinde dokümantasyon kalitesini artırır ve GPT-4 sohbet arayüzü ile eksiksiz bir Azure OpenAI dağıtım örneği ekler.**

#### Eklendi
- **🤖 Azure OpenAI Sohbet Örneği**: `examples/azure-openai-chat/` içinde çalışan GPT-4 dağıtımı:
  - Tam Azure OpenAI altyapısı (GPT-4 model dağıtımı)
  - Konuşma geçmişi ile Python komut satırı sohbet arayüzü
  - Güvenli API anahtarı depolama için Key Vault entegrasyonu
  - Jeton kullanım takibi ve maliyet tahmini
  - Hız sınırlama ve hata yönetimi
  - 35-45 dakikalık dağıtım rehberi içeren kapsamlı README
  - 11 üretime hazır dosya (Bicep şablonları, Python uygulaması, yapılandırma)
- **📚 Dokümantasyon Alıştırmaları**: Yapılandırma kılavuzuna uygulamalı alıştırmalar eklendi:
  - Alıştırma 1: Çok ortamlı yapılandırma (15 dakika)
  - Alıştırma 2: Gizli yönetimi uygulaması (10 dakika)
  - Net başarı kriterleri ve doğrulama adımları
- **✅ Dağıtım Doğrulama**: Dağıtım kılavuzuna doğrulama bölümü eklendi:
  - Sağlık kontrol prosedürleri
  - Başarı kriterleri kontrol listesi
  - Tüm dağıtım komutları için beklenen çıktılar
  - Hızlı sorun giderme başvurusu

#### Geliştirildi
- **examples/README.md**: A-seviye kalitesine (yüzde 93) güncellendi:
  - azure-openai-chat tüm ilgili bölümlere eklendi
  - Yerel örnek sayısı 3'ten 4'e güncellendi
  - AI Uygulama Örnekleri tablosuna eklendi
  - Orta seviye kullanıcılar için Hızlı Başlangıç'a entegre edildi
  - Microsoft Foundry Şablonları bölümüne eklendi
  - Karşılaştırma Matrisi ve teknoloji bulguları bölümleri güncellendi
- **Dokümantasyon Kalitesi**: docs klasöründe B+ (87%) → A- (92%) iyileşti:
  - Kritik komut örneklerine beklenen çıktılar eklendi
  - Yapılandırma değişiklikleri için doğrulama adımları eklendi
  - Uygulamalı öğrenme güçlendirildi, pratik egzersizler eklendi

#### Değiştirildi
- **Öğrenme İlerlemesi**: Orta düzey öğrenenler için AI örneklerinin daha iyi entegrasyonu
- **Dokümantasyon Yapısı**: Açık sonuçlarla daha uygulanabilir egzersizler
- **Doğrulama Süreci**: Ana iş akışlarına açık başarı kriterleri eklendi

#### İyileştirildi
- **Geliştirici Deneyimi**: Azure OpenAI dağıtımı şimdi 35-45 dakika sürüyor (karmaşık alternatiflerde 60-90 dakika yerine)
- **Maliyet Şeffaflığı**: Azure OpenAI örneği için net maliyet tahminleri ($50-200/ay)
- **Öğrenme Yolu**: AI geliştiricileri için azure-openai-chat ile net bir giriş noktası
- **Dokümantasyon Standartları**: Tutarlı beklenen çıktılar ve doğrulama adımları

#### Doğrulandı
- ✅ Azure OpenAI örneği `azd up` ile tam işlevsel
- ✅ Tüm 11 uygulama dosyası sözdizimsel olarak doğru
- ✅ README talimatları gerçek dağıtım deneyimi ile uyumlu
- ✅ Dokümantasyon bağlantıları 8+ yerde güncellendi
- ✅ Örnekler indeksi 4 yerel örneği doğru yansıtıyor
- ✅ Tablolarda yinelenen dış bağlantı yok
- ✅ Tüm navigasyon referansları doğru

#### Teknik Uygulama
- **Azure OpenAI Mimarisi**: GPT-4 + Key Vault + Container Apps deseni
- **Güvenlik**: Yönetilen Kimlik hazır, gizli bilgiler Key Vault'ta
- **İzleme**: Application Insights entegrasyonu
- **Maliyet Yönetimi**: Jeton takibi ve kullanım optimizasyonu
- **Dağıtım**: Tam kurulum için tek `azd up` komutu

### [v3.6.0] - 2025-11-19

#### Büyük Güncelleme: Container App Dağıtım Örnekleri
**Bu sürüm, Azure Developer CLI (AZD) kullanarak kapsayıcı uygulama dağıtımları için kapsamlı, üretime hazır örnekler tanıtır; tam dokümantasyon ve öğrenme yoluna entegrasyon içerir.**

#### Eklendi
- **🚀 Container App Örnekleri**: `examples/container-app/` içinde yeni yerel örnekler:
  - [Ana Kılavuz](examples/container-app/README.md): Kapsayıcı dağıtımların tam genel görünümü, hızlı başlangıç, üretim ve ileri desenler
  - [Basit Flask API](../../examples/container-app/simple-flask-api): Ölçeğe sıfıra inme, sağlık kontrolleri, izleme ve sorun giderme içeren yeni başlayan dostu REST API
  - [Mikroservis Mimarisi](../../examples/container-app/microservices): Üretime hazır çoklu servis dağıtımı (API Gateway, Product, Order, User, Notification), asenkron mesajlaşma, Service Bus, Cosmos DB, Azure SQL, dağıtık izleme, mavi-yeşil/canary dağıtım
- **En İyi Uygulamalar**: Güvenlik, izleme, maliyet optimizasyonu ve CI/CD rehberliği kapsayıcı iş yükleri için
- **Kod Örnekleri**: Tam `azure.yaml`, Bicep şablonları ve çok dilli servis uygulamaları (Python, Node.js, C#, Go)
- **Test & Sorun Giderme**: Uçtan uca test senaryoları, izleme komutları, sorun giderme rehberliği

#### Değiştirildi
- **README.md**: Yeni container app örneklerini vurgulamak ve "Local Examples - Container Applications" altında bağlantılamak için güncellendi
- **examples/README.md**: Container app örneklerini öne çıkarmak, karşılaştırma matrisi girdileri eklemek ve teknoloji/mimari referansları güncellemek üzere güncellendi
- **Kurs İçeriği & Çalışma Rehberi**: İlgili bölümlerde yeni konteyner uygulama örneklerine ve dağıtım desenlerine referans verecek şekilde güncellendi

#### Doğrulandı
- ✅ Tüm yeni örnekler `azd up` ile dağıtılabilir ve en iyi uygulamaları izler
- ✅ Dokümantasyon çapraz bağlantıları ve gezinme güncellendi
- ✅ Örnekler başlangıçtan ileri seviyeye, üretim mikroservisleri dahil, senaryoları kapsar

#### Notlar
- **Kapsam**: Yalnızca İngilizce dokümantasyon ve örnekler
- **Sonraki Adımlar**: Gelecek sürümlerde ek gelişmiş konteyner desenleri ve CI/CD otomasyonu ile genişletilecek

### [v3.5.0] - 2025-11-19

#### Ürün Yeniden Markalaştırma: Microsoft Foundry
**Bu sürüm, Microsoft'un resmi yeniden markalaştırmasını yansıtacak şekilde tüm İngilizce dokümantasyonda "Microsoft Foundry" adlı ürünün kapsamlı isim değişikliğini uygular.**

#### Değiştirildi
- **🔄 Ürün Adı Güncellemesi**: "Microsoft Foundry"dan "Microsoft Foundry"e tam yeniden markalaştırma
  - İngilizce dokümantasyonun `docs/` klasöründeki tüm referanslar güncellendi
  - Klasör yeniden adlandırıldı: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Dosya yeniden adlandırıldı: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Toplam: 7 dokümantasyon dosyasında 23 içerik referansı güncellendi

- **📁 Klasör Yapısı Değişiklikleri**:
  - `docs/ai-foundry/` klasörü `docs/microsoft-foundry/` olarak yeniden adlandırıldı
  - Yeni klasör yapısını yansıtacak şekilde tüm çapraz referanslar güncellendi
  - Tüm dokümantasyonda gezinme bağlantıları doğrulandı

- **📄 Dosya Yeniden Adlandırmaları**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tüm dahili bağlantılar yeni dosya adını referans verecek şekilde güncellendi

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
- ✅ İngilizce dokümanlarda kalan "ai-foundry" klasör yolu referansı yok
- ✅ İngilizce dokümanlarda kalan "Microsoft Foundry" ürün adı referansı yok
- ✅ Tüm gezinme bağlantıları yeni klasör yapısıyla çalışır durumda
- ✅ Dosya ve klasör yeniden adlandırmaları başarıyla tamamlandı
- ✅ Bölümler arası çapraz referanslar doğrulandı

#### Notlar
- **Kapsam**: Değişiklikler yalnızca `docs/` klasöründeki İngilizce dokümantasyona uygulandı
- **Çeviriler**: Çeviri klasörleri (`translations/`) bu sürümde güncellenmedi
- **Atölye**: Atölye materyalleri (`workshop/`) bu sürümde güncellenmedi
- **Örnekler**: Örnek dosyalar hala eski adlandırmaya referans verebilir (gelecek güncellemede ele alınacak)
- **Dış Bağlantılar**: Harici URL'ler ve GitHub depo referansları değişmeden kaldı

#### Katkıda Bulunanlar için Geçiş Rehberi
Yerel dallarınız veya eski yapıya referans veren dokümantasyonunuz varsa:
1. Klasör referanslarını güncelleyin: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Dosya referanslarını güncelleyin: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ürün adını değiştirin: "Microsoft Foundry" → "Microsoft Foundry"
4. Tüm dahili dokümantasyon bağlantılarının hala çalıştığını doğrulayın

---

### [v3.4.0] - 2025-10-24

#### Altyapı Önizleme ve Doğrulama İyileştirmeleri
**Bu sürüm, yeni Azure Developer CLI önizleme özelliği için kapsamlı destek sunar ve atölye kullanıcı deneyimini geliştirir.**

#### Eklendi
- **🧪 azd provision --preview Özelliği Dokümantasyonu**: Yeni altyapı önizleme yeteneğinin kapsamlı anlatımı
  - Komut referansı ve kullanım örnekleri hızlı başvuru sayfasında
  - Kullanım senaryoları ve faydalarıyla birlikte sağlama kılavuzunda detaylı entegrasyon
  - Daha güvenli dağıtım doğrulaması için ön kontrolde entegrasyon
  - Güvenlik öncelikli dağıtım uygulamalarıyla başlangıç kılavuzu güncellemeleri
- **🚧 Atölye Durum Banner'ı**: Atölye geliştirme durumunu belirten profesyonel HTML banner
  - Net kullanıcı iletişimi için yapım aşaması göstergelerine sahip gradyan tasarım
  - Şeffaflık için son güncelleme zaman damgası
  - Tüm cihaz türleri için mobil uyumlu tasarım

#### Geliştirildi
- **Altyapı Güvenliği**: Önizleme işlevselliği dağıtım dokümantasyonunun tamamına entegre edildi
- **Ön dağıtım Doğrulama**: Otomatikleştirilmiş betikler artık altyapı önizleme testini içeriyor
- **Geliştirici İş Akışı**: En iyi uygulama olarak önizlemeyi içerecek şekilde komut sıraları güncellendi
- **Atölye Deneyimi**: İçerik geliştirme durumu hakkında kullanıcılara net beklentiler sunuldu

#### Değiştirildi
- **Dağıtım En İyi Uygulamaları**: Önizleme-öncelikli iş akışı artık önerilen yaklaşım
- **Dokümantasyon Akışı**: Altyapı doğrulaması öğrenme sürecinde daha erken bir aşamaya taşındı
- **Atölye Sunumu**: Net geliştirme zaman çizelgesi ile profesyonel durum iletişimi

#### İyileştirildi
- **Güvenlik-Öncelikli Yaklaşım**: Altyapı değişiklikleri artık dağıtımdan önce doğrulanabilir
- **Ekip İşbirliği**: Önizleme sonuçları inceleme ve onay için paylaşılabilir
- **Maliyet Farkındalığı**: Sağlama öncesinde kaynak maliyetlerinin daha iyi anlaşılması
- **Risk Azaltma**: Ön doğrulama sayesinde dağıtım hatalarının azaltılması

#### Teknik Uygulama
- **Çoklu belge Entegrasyonu**: Önizleme özelliği 4 ana dosyada belgelenmiştir
- **Komut Kalıpları**: Dokümantasyon genelinde tutarlı sözdizimi ve örnekler
- **En İyi Uygulama Entegrasyonu**: Önizleme doğrulama iş akışları ve betiklerine dahil edildi
- **Görsel Göstergeler**: Keşfedilebilirlik için NET YENİ özellik işaretlemeleri

#### Atölye Altyapısı
- **Durum İletişimi**: Gradyan stilinde profesyonel HTML banner
- **Kullanıcı Deneyimi**: Net geliştirme durumu karışıklığı önler
- **Profesyonel Sunum**: Beklentileri belirlerken depo güvenilirliğini korur
- **Zaman Çizelgesi Şeffaflığı**: Ekim 2025 son güncelleme zaman damgası hesap verebilirlik için

### [v3.3.0] - 2025-09-24

#### Geliştirilmiş Atölye Materyalleri ve Etkileşimli Öğrenme Deneyimi
**Bu sürüm, tarayıcı tabanlı etkileşimli rehberler ve yapılandırılmış öğrenme yolları ile kapsamlı atölye materyalleri sunar.**

#### Eklendi
- **🎥 Etkileşimli Atölye Rehberi**: MkDocs önizleme yeteneğine sahip tarayıcı tabanlı atölye deneyimi
- **📝 Yapılandırılmış Atölye Talimatları**: Keşiften özelleştirmeye 7 adımlı rehberli öğrenme yolu
  - 0-Introduction: Atölye genel bakışı ve kurulum
  - 1-Select-AI-Template: Şablon keşfi ve seçme süreci
  - 2-Validate-AI-Template: Dağıtım ve doğrulama prosedürleri
  - 3-Deconstruct-AI-Template: Şablon mimarisini anlama
  - 4-Configure-AI-Template: Yapılandırma ve özelleştirme
  - 5-Customize-AI-Template: İleri düzey değişiklikler ve yinelemeler
  - 6-Teardown-Infrastructure: Temizlik ve kaynak yönetimi
  - 7-Wrap-up: Özet ve sonraki adımlar
- **🛠️ Atölye Araçları**: Geliştirilmiş öğrenme deneyimi için Material teması ile MkDocs yapılandırması
- **🎯 Uygulamalı Öğrenme Yolu**: 3 adımlı metodoloji (Keşif → Dağıtım → Özelleştirme)
- **📱 GitHub Codespaces Entegrasyonu**: Kesintisiz geliştirme ortamı kurulumu

#### Geliştirildi
- **AI Atölye Lab**: Kapsamlı 2-3 saatlik yapılandırılmış öğrenme deneyimi ile genişletildi
- **Atölye Dokümantasyonu**: Gezinme ve görsel yardımcılarla profesyonel sunum
- **Öğrenme İlerleyişi**: Şablon seçiminden üretim dağıtımına kadar adım adım net rehberlik
- **Geliştirici Deneyimi**: Sadeleştirilmiş geliştirme iş akışları için entegre araçlar

#### İyileştirildi
- **Erişilebilirlik**: Arama, kopyalama işlevselliği ve tema geçişi ile tarayıcı tabanlı arayüz
- **Kendi Hızında Öğrenme**: Farklı öğrenme hızlarını karşılayan esnek atölye yapısı
- **Pratik Uygulama**: Gerçek dünya AI şablon dağıtım senaryoları
- **Topluluk Entegrasyonu**: Atölye desteği ve işbirliği için Discord entegrasyonu

#### Atölye Özellikleri
- **Yerleşik Arama**: Hızlı anahtar kelime ve ders keşfi
- **Kod Bloklarını Kopyalama**: Tüm kod örnekleri için üzerine gelince kopyalama işlevi
- **Tema Geçişi**: Farklı tercihler için karanlık/açık mod desteği
- **Görsel Varlıklar**: Artırılmış anlayış için ekran görüntüleri ve diyagramlar
- **Yardım Entegrasyonu**: Topluluk desteği için doğrudan Discord erişimi

### [v3.2.0] - 2025-09-17

#### Büyük Gezinti Yeniden Yapılandırması ve Bölüm Tabanlı Öğrenme Sistemi
**Bu sürüm, tüm depo genelinde geliştirilmiş gezinme ile kapsamlı bir bölüm tabanlı öğrenme yapısı sunar.**

#### Eklendi
- **📚 Bölüm Tabanlı Öğrenme Sistemi**: Tüm kurs 8 ilerleyici öğrenme bölümüne yeniden yapılandırıldı
  - Chapter 1: Temel & Hızlı Başlangıç (⭐ - 30-45 dk)
  - Chapter 2: AI-Öncelikli Geliştirme (⭐⭐ - 1-2 saat)
  - Chapter 3: Yapılandırma & Kimlik Doğrulama (⭐⭐ - 45-60 dk)
  - Chapter 4: Altyapı olarak Kod & Dağıtım (⭐⭐⭐ - 1-1.5 saat)
  - Chapter 5: Çoklu Ajan AI Çözümleri (⭐⭐⭐⭐ - 2-3 saat)
  - Chapter 6: Ön Dağıtım Doğrulama & Planlama (⭐⭐ - 1 saat)
  - Chapter 7: Sorun Giderme & Hata Ayıklama (⭐⭐ - 1-1.5 saat)
  - Chapter 8: Üretim & Kurumsal Desenler (⭐⭐⭐⭐ - 2-3 saat)
- **📚 Kapsamlı Gezinti Sistemi**: Tüm dokümantasyonda tutarlı gezinme başlıkları ve altbilgiler
- **🎯 İlerleme Takibi**: Kurs tamamlama kontrol listesi ve öğrenme doğrulama sistemi
- **🗺️ Öğrenme Yolu Rehberliği**: Farklı deneyim seviyeleri ve hedefler için net giriş noktaları
- **🔗 Çapraz Referans Gezintisi**: İlgili bölümler ve önkoşullar açıkça bağlandı

#### Geliştirildi
- **README Yapısı**: Bölüm tabanlı organizasyon ile yapılandırılmış bir öğrenme platformuna dönüştürüldü
- **Dokümantasyon Gezintisi**: Her sayfa artık bölüm bağlamı ve ilerleme rehberliği içeriyor
- **Şablon Organizasyonu**: Örnekler ve şablonlar uygun öğrenme bölümlerine eşlendi
- **Kaynak Entegrasyonu**: Hızlı başvuru, SSS ve çalışma rehberleri ilgili bölümlere bağlandı
- **Atölye Entegrasyonu**: Uygulamalı laboratuvarlar birden fazla bölüm öğrenme hedefiyle eşlendi

#### Değiştirildi
- **Öğrenme İlerleyişi**: Doğrusal dokümantasyondan esnek bölüm tabanlı öğrenmeye taşındı
- **Yapılandırma Yerleşimi**: Daha iyi öğrenme akışı için yapılandırma kılavuzu Bölüm 3 olarak yeniden konumlandırıldı
- **AI İçerik Entegrasyonu**: Öğrenme yolculuğu boyunca AI'ya özgü içeriğin daha iyi entegrasyonu
- **Üretim İçeriği**: İleri düzey desenler kurumsal öğrenenler için Bölüm 8'de birleştirildi

#### İyileştirildi
- **Kullanıcı Deneyimi**: Net gezinme izleri ve bölüm ilerleme göstergeleri
- **Erişilebilirlik**: Kurs içinde daha kolay gezinme için tutarlı gezinme desenleri
- **Profesyonel Sunum**: Akademik ve kurumsal eğitim için uygun üniversite tarzı kurs yapısı
- **Öğrenme Verimliliği**: Geliştirilmiş organizasyon sayesinde ilgili içeriği bulma süresi azaltıldı

#### Teknik Uygulama
- **Gezinti Başlıkları**: 40+ dokümantasyon dosyası genelinde standartlaştırılmış bölüm gezintisi
- **Altbilgi Gezintisi**: Tutarlı ilerleme rehberliği ve bölüm tamamlama göstergeleri
- **Çapraz Linkleme**: İlgili kavramları birbirine bağlayan kapsamlı iç bağlantı sistemi
- **Bölüm Eşlemesi**: Şablonlar ve örnekler öğrenme hedefleriyle açıkça ilişkilendirildi

#### Çalışma Rehberi Geliştirmesi
- **📚 Kapsamlı Öğrenme Hedefleri**: Çalışma rehberi 8 bölümlük sistemle uyumlu olacak şekilde yeniden yapılandırıldı
- **🎯 Bölüm Tabanlı Değerlendirme**: Her bölüm belirli öğrenme hedefleri ve pratik egzersizler içerir
- **📋 İlerleme Takibi**: Ölçülebilir çıktılar ve tamamlama kontrol listeleri ile haftalık öğrenme programı
- **❓ Değerlendirme Soruları**: Her bölüm için profesyonel sonuçlara yönelik bilgi doğrulama soruları
- **🛠️ Pratik Egzersizler**: Gerçek dağıtım senaryoları ve sorun giderme ile uygulamalı etkinlikler
- **📊 Beceri İlerleyişi**: Temel kavramlardan kurumsal desenlere kadar kariyer gelişimine odaklı net ilerleme
- **🎓 Sertifikasyon Çerçevesi**: Profesyonel gelişim çıktıları ve topluluk tanıma sistemi
- **⏱️ Zaman Çizelgesi Yönetimi**: Kilometre taşı doğrulaması ile yapılandırılmış 10 haftalık öğrenme planı

### [v3.1.0] - 2025-09-17

#### Geliştirilmiş Çoklu Ajan AI Çözümleri
**Bu sürüm, daha iyi ajan adlandırması ve geliştirilmiş dokümantasyon ile çoklu ajan perakende çözümünü iyileştirir.**

#### Değiştirildi
- **Çoklu Ajan Terminolojisi**: Daha açık anlaşılma için perakende çoklu ajan çözümünde "Cora agent" yerine "Customer agent" kullanıldı
- **Ajan Mimarisi**: Tutarlı "Customer agent" adlandırmasını kullanmak için tüm dokümantasyon, ARM şablonları ve kod örnekleri güncellendi
- **Yapılandırma Örnekleri**: Güncellenmiş adlandırma konvansiyonları ile ajan yapılandırma kalıpları modernize edildi
- **Dokümantasyon Tutarlılığı**: Tüm referansların profesyonel, açıklayıcı ajan adları kullandığından emin olundu

#### Geliştirildi
- **ARM Şablon Paketi**: retail-multiagent-arm-template, Customer agent referansları ile güncellendi
- **Mimari Diyagramlar**: Güncellenmiş ajan adlandırması ile Mermaid diyagramları yenilendi
- **Kod Örnekleri**: Python sınıfları ve uygulama örnekleri artık CustomerAgent adlandırmasını kullanıyor
- **Ortam Değişkenleri**: Tüm dağıtım betikleri CUSTOMER_AGENT_NAME konvansiyonunu kullanacak şekilde güncellendi

#### İyileştirildi
- **Geliştirici Deneyimi**: Belgelerde ajan rolleri ve sorumluluklarının daha net olması
- **Üretime Hazırlık**: Kurumsal adlandırma gelenekleriyle daha iyi uyum
- **Öğrenme Materyalleri**: Eğitim amaçlı daha sezgisel ajan adlandırması
- **Şablon Kullanılabilirliği**: Ajan işlevleri ve dağıtım desenlerinin basitleştirilmiş anlaşılması

#### Teknik Detaylar
- Mermaid mimari diyagramları CustomerAgent referansları ile güncellendi
- Python örneklerinde CoraAgent sınıf adları CustomerAgent ile değiştirildi
- ARM şablonu JSON yapılandırmaları "customer" ajan türünü kullanacak şekilde değiştirildi
- Ortam değişkenleri CORA_AGENT_*'ten CUSTOMER_AGENT_* desenlerine güncellendi
- Tüm dağıtım komutları ve konteyner yapılandırmaları güncellendi

### [v3.0.0] - 2025-09-12

#### Önemli Değişiklikler - AI Geliştirici Odaklı ve Microsoft Foundry Entegrasyonu
**Bu sürüm, depoyu Microsoft Foundry entegrasyonuyla kapsamlı, AI odaklı bir öğrenme kaynağına dönüştürür.**

#### Eklendi
- **🤖 AI-İlk Öğrenme Yolu**: AI geliştiricileri ve mühendislerini önceliklendiren tam bir yeniden yapılandırma
- **Microsoft Foundry Entegrasyon Kılavuzu**: AZD'nin Microsoft Foundry servisleriyle bağlanması için kapsamlı dokümantasyon
- **AI Modeli Dağıtım Desenleri**: Model seçimi, yapılandırma ve üretim dağıtım stratejilerini kapsayan ayrıntılı rehber
- **AI Atölye Laboratuvarı**: AI uygulamalarını AZD dağıtılabilir çözümlere dönüştürmek için 2-3 saatlik uygulamalı atölye
- **Üretim AI En İyi Uygulamaları**: AI iş yüklerini ölçeklendirme, izleme ve güvence altına alma için kurumsal hazır desenler
- **AI'ye Özgü Sorun Giderme Kılavuzu**: Azure OpenAI, Cognitive Services ve AI dağıtım sorunları için kapsamlı sorun giderme
- **AI Şablon Galerisi**: Zorluk dereceleriyle öne çıkan Microsoft Foundry şablon koleksiyonu
- **Atölye Materyalleri**: Uygulamalı laboratuvarlar ve referans materyallerle eksiksiz atölye yapısı

#### Geliştirilenler
- **README Yapısı**: AI geliştirici odaklı, Microsoft Foundry Discord'dan %45 topluluk ilgisi verisi ile
- **Öğrenme Yolları**: Öğrenciler ve DevOps mühendisleri için geleneksel yolların yanında ayrılmış AI geliştirici yolculuğu
- **Şablon Önerileri**: azure-search-openai-demo, contoso-chat ve openai-chat-app-quickstart dahil öne çıkan AI şablonları
- **Topluluk Entegrasyonu**: AI'ye özel kanallar ve tartışmalarla Discord topluluk desteği geliştirildi

#### Güvenlik ve Üretim Odaklılık
- **Yönetilen Kimlik Desenleri**: AI'ye özgü kimlik doğrulama ve güvenlik yapılandırmaları
- **Maliyet Optimizasyonu**: AI iş yükleri için token kullanım takibi ve bütçe kontrolleri
- **Çok Bölgeli Dağıtım**: Küresel AI uygulama dağıtımı için stratejiler
- **Performans İzleme**: AI'ye özgü metrikler ve Application Insights entegrasyonu

#### Dokümantasyon Kalitesi
- **Doğrusal Ders Yapısı**: Başlangıçtan ileri düzeye AI dağıtım desenlerine mantıksal ilerleyiş
- **Doğrulanmış URL'ler**: Tüm harici depo bağlantıları doğrulandı ve erişilebilir
- **Tam Referans**: Tüm dahili dokümantasyon bağlantıları doğrulandı ve işlevsel
- **Üretime Hazır**: Gerçek dünya örnekleriyle kurumsal dağıtım desenleri

### [v2.0.0] - 2025-09-09

#### Önemli Değişiklikler - Depo Yeniden Yapılandırması ve Profesyonel İyileştirme
**Bu sürüm, depo yapısında ve içerik sunumunda önemli bir revizyonu temsil eder.**

#### Eklendi
- **Yapılandırılmış Öğrenme Çerçevesi**: Tüm dokümantasyon sayfaları artık Giriş, Öğrenme Hedefleri ve Öğrenme Çıktıları bölümlerini içerir
- **Navigasyon Sistemi**: Rehberli öğrenme ilerlemesi için tüm dokümantasyon boyunca Önceki/Sonraki ders bağlantıları eklendi
- **Çalışma Rehberi**: Öğrenme hedefleri, uygulama alıştırmaları ve değerlendirme materyalleri içeren kapsamlı study-guide.md
- **Profesyonel Sunum**: Erişilebilirlik ve profesyonel görünüm için tüm emoji simgeleri kaldırıldı
- **Geliştirilmiş İçerik Yapısı**: Öğrenme materyallerinin organizasyonu ve akışı iyileştirildi

#### Değiştirildi
- **Dokümantasyon Formatı**: Tüm dokümantasyon tutarlı öğrenme odaklı yapıyla standartlaştırıldı
- **Navigasyon Akışı**: Tüm öğrenme materyalleri için mantıksal ilerleyiş uygulandı
- **İçerik Sunumu**: Açık, profesyonel biçimlendirme lehine dekoratif öğeler kaldırıldı
- **Bağlantı Yapısı**: Yeni navigasyon sistemini desteklemek için tüm dahili bağlantılar güncellendi

#### İyileştirildi
- **Erişilebilirlik**: Ekran okuyucu uyumluluğunu artırmak için emoji bağımlılıkları kaldırıldı
- **Profesyonel Görünüm**: Kurumsal öğrenmeye uygun, temiz, akademik tarzda sunum
- **Öğrenme Deneyimi**: Her ders için net hedefler ve sonuçlarla yapılandırılmış yaklaşım
- **İçerik Organizasyonu**: İlgili konular arasında daha iyi mantıksal akış ve bağlantı

### [v1.0.0] - 2025-09-09

#### İlk Sürüm - Kapsamlı AZD Öğrenme Deposu

#### Eklendi
- **Temel Dokümantasyon Yapısı**
  - Eksiksiz başlarken kılavuzu serisi
  - Kapsamlı dağıtım ve sağlama dokümantasyonu
  - Ayrıntılı sorun giderme kaynakları ve hata ayıklama kılavuzları
  - Dağıtımdan önce doğrulama araçları ve prosedürleri

- **Getting Started Module**
  - AZD Temelleri: Temel kavramlar ve terminoloji
  - Kurulum Kılavuzu: Platforma özel kurulum talimatları
  - Yapılandırma Kılavuzu: Ortam kurulumu ve kimlik doğrulama
  - İlk Proje Eğitimi: Adım adım uygulamalı öğrenme

- **Deployment and Provisioning Module**
  - Dağıtım Kılavuzu: Tam iş akışı dokümantasyonu
  - Sağlama Kılavuzu: Bicep ile Altyapı Kod Olarak
  - Üretim dağıtımları için en iyi uygulamalar
  - Çok hizmetli mimari desenleri

- **Pre-deployment Validation Module**
  - Kapasite Planlaması: Azure kaynak kullanılabilirliği doğrulaması
  - SKU Seçimi: Kapsamlı hizmet katmanı rehberi
  - Ön Uçuş Kontrolleri: Otomatik doğrulama betikleri (PowerShell ve Bash)
  - Maliyet tahmini ve bütçe planlama araçları

- **Troubleshooting Module**
  - Yaygın Sorunlar: Sık karşılaşılan problemler ve çözümleri
  - Hata Ayıklama Kılavuzu: Sistematik sorun giderme metodolojileri
  - Gelişmiş teşhis teknikleri ve araçlar
  - Performans izleme ve optimizasyon

- **Resources and References**
  - Komut Hızlı Başvuru: Temel komutlar için hızlı başvuru
  - Sözlük: Kapsamlı terim ve kısaltma tanımları
  - SSS: Yaygın sorulara ayrıntılı cevaplar
  - Harici kaynak bağlantıları ve topluluk bağlantıları

- **Examples and Templates**
  - Basit Web Uygulaması örneği
  - Statik Web Sitesi dağıtım şablonu
  - Konteyner Uygulama yapılandırması
  - Veritabanı entegrasyon desenleri
  - Mikroservis mimari örnekleri
  - Sunucusuz işlev uygulamaları

#### Özellikler
- **Çoklu Platform Desteği**: Windows, macOS ve Linux için kurulum ve yapılandırma kılavuzları
- **Çoklu Yetenek Seviyeleri**: İçerik öğrencilerden profesyonel geliştiricilere kadar tasarlanmıştır
- **Pratik Odak**: Uygulamalı örnekler ve gerçek dünya senaryoları
- **Kapsamlı Kapsam**: Temel kavramlardan ileri düzey kurumsal desenlere kadar
- **Güvenlik Öncelikli Yaklaşım**: Güvenlik en iyi uygulamaları tüm içerikte entegre edilmiştir
- **Maliyet Optimizasyonu**: Maliyet-etkin dağıtımlar ve kaynak yönetimi için rehberlik

#### Dokümantasyon Kalitesi
- **Detaylı Kod Örnekleri**: Pratik, test edilmiş kod örnekleri
- **Adım Adım Talimatlar**: Açık, uygulanabilir rehberlik
- **Kapsamlı Hata Yönetimi**: Yaygın sorunlar için sorun giderme
- **En İyi Uygulamalar Entegrasyonu**: Endüstri standartları ve öneriler
- **Sürüm Uyumluluğu**: En son Azure servisleri ve azd özellikleri ile güncel

## Planlanan Gelecekteki Geliştirmeler

### Sürüm 3.1.0 (Planlanan)
#### AI Platformu Genişlemesi
- **Çok Modelli Destek**: Hugging Face, Azure Machine Learning ve özel modeller için entegrasyon desenleri
- **AI Ajan Çerçeveleri**: LangChain, Semantic Kernel ve AutoGen dağıtımları için şablonlar
- **Gelişmiş RAG Desenleri**: Azure AI Search'in ötesinde vektör veritabanı seçenekleri (Pinecone, Weaviate, vb.)
- **AI Gözlemlenebilirliği**: Model performansı, token kullanımı ve cevap kalitesi için geliştirilmiş izleme

#### Geliştirici Deneyimi
- **VS Code Eklentisi**: Entegre AZD + AI Foundry geliştirme deneyimi
- **GitHub Copilot Entegrasyonu**: AI destekli AZD şablon oluşturma
- **Etkileşimli Eğitimler**: AI senaryoları için otomatik doğrulama ile uygulamalı kodlama egzersizleri
- **Video İçerik**: AI dağıtımlarına odaklanan görsel öğrenenler için tamamlayıcı video öğreticiler

### Sürüm 4.0.0 (Planlanan)
#### Kurumsal AI Desenleri
- **Yönetim Çerçevesi**: AI model yönetimi, uyumluluk ve denetim izleri
- **Çok Kiracılı AI**: İzole AI servisleriyle birden fazla müşteriye hizmet verme desenleri
- **Edge AI Dağıtımı**: Azure IoT Edge ve konteyner örnekleri ile entegrasyon
- **Hibrit Bulut AI**: AI iş yükleri için çoklu bulut ve hibrit dağıtım desenleri

#### Gelişmiş Özellikler
- **AI Boru Hattı Otomasyonu**: Azure Machine Learning boru hatları ile MLOps entegrasyonu
- **Gelişmiş Güvenlik**: Sıfır-güven desenleri, özel uç noktalar ve gelişmiş tehdit koruması
- **Performans Optimizasyonu**: Yüksek verimli AI uygulamaları için gelişmiş ayarlama ve ölçeklendirme stratejileri
- **Küresel Dağıtım**: AI uygulamaları için içerik dağıtım ve edge önbellekleme desenleri

### Sürüm 3.0.0 (Planlanan) - Mevcut Sürüm Tarafından Yerine Geçildi
#### Önerilen Eklemeler - Şimdi v3.0.0'de Uygulandı
- ✅ **AI Odaklı İçerik**: Kapsamlı Microsoft Foundry entegrasyonu (Tamamlandı)
- ✅ **Etkileşimli Eğitimler**: Uygulamalı AI atölye laboratuvarı (Tamamlandı)
- ✅ **Gelişmiş Güvenlik Modülü**: AI'ye özgü güvenlik desenleri (Tamamlandı)
- ✅ **Performans Optimizasyonu**: AI iş yükü ayarlama stratejileri (Tamamlandı)

### Sürüm 2.1.0 (Planlanan) - Kısmen v3.0.0'de Uygulandı
#### Küçük İyileştirmeler - Bazıları Mevcut Sürümde Tamamlandı
- ✅ **Ek Örnekler**: AI odaklı dağıtım senaryoları (Tamamlandı)
- ✅ **Genişletilmiş SSS**: AI'ye özgü sorular ve sorun giderme (Tamamlandı)
- **Araç Entegrasyonu**: Geliştirilmiş IDE ve editör entegrasyon kılavuzları
- ✅ **İzleme Genişletmesi**: AI'ye özgü izleme ve uyarı desenleri (Tamamlandı)

#### Gelecekteki Sürümler İçin Hâlâ Planlanıyor
- **Mobil Dostu Dokümantasyon**: Mobil öğrenme için duyarlı tasarım
- **Çevrimdışı Erişim**: İndirilebilir dokümantasyon paketleri
- **Geliştirilmiş IDE Entegrasyonu**: AZD + AI iş akışları için VS Code uzantısı
- **Topluluk Panosu**: Gerçek zamanlı topluluk metrikleri ve katkı izleme

## Değişiklik Günlüğüne Katkıda Bulunma

### Değişiklik Bildirme
Bu depoya katkıda bulunurken, lütfen değişiklik günlüğü girdilerinin şunları içerdiğinden emin olun:

1. **Sürüm Numarası**: Semantik sürümlendirmeyi izleyerek (major.minor.patch)
2. **Tarih**: Yayın veya güncelleme tarihi YYYY-MM-DD formatında
3. **Kategori**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Açık Açıklama**: Ne değiştiğine dair kısa açıklama
5. **Etkililik Değerlendirmesi**: Değişikliklerin mevcut kullanıcıları nasıl etkilediği

### Değişiklik Kategorileri

#### Eklendi
- Yeni özellikler, dokümantasyon bölümleri veya yetenekler
- Yeni örnekler, şablonlar veya öğrenme kaynakları
- Ek araçlar, betikler veya yardımcı programlar

#### Değiştirildi
- Mevcut işlevsellik veya dokümantasyonda yapılan değişiklikler
- Anlaşılırlık veya doğruluk iyileştirmeleri için güncellemeler
- İçerik veya organizasyonun yeniden yapılandırılması

#### Kullanımdan Kaldırıldı
- Aşamalı olarak kaldırılan özellikler veya yaklaşımlar
- Kaldırılması planlanan dokümantasyon bölümleri
- Daha iyi alternatifleri olan yöntemler

#### Kaldırıldı
- Artık geçerli olmayan özellikler, dokümantasyon veya örnekler
- Eski bilgiler veya kullanımdan kaldırılmış yaklaşımlar
- Yinelenen veya birleştirilmiş içerik

#### Düzeltildi
- Dokümantasyon veya koddaki hataların düzeltilmesi
- Bildirilmiş sorunların veya problemlerin çözümü
- Doğruluk veya işlevsellik iyileştirmeleri

#### Güvenlik
- Güvenlikle ilgili iyileştirmeler veya düzeltmeler
- Güvenlik en iyi uygulamalarına ilişkin güncellemeler
- Güvenlik açıklarının giderilmesi

### Semantik Sürümleme Yönergeleri

#### Ana Sürüm (X.0.0)
- Kullanıcı müdahalesi gerektiren geriye dönük uyumsuz değişiklikler
- İçerik veya organizasyonun önemli yeniden yapılandırılması
- Temel yaklaşımı veya yöntemi değiştiren değişiklikler

#### Küçük Sürüm (X.Y.0)
- Yeni özellikler veya içerik eklemeleri
- Geriye dönük uyumluluğu koruyan geliştirmeler
- Ek örnekler, araçlar veya kaynaklar

#### Yama Sürümü (X.Y.Z)
- Hata düzeltmeleri ve düzeltmeler
- Mevcut içeriğe yönelik küçük iyileştirmeler
- Açıklamalar ve küçük geliştirmeler

## Topluluk Geri Bildirimi ve Öneriler

Bu öğrenme kaynağını geliştirmek için topluluk geri bildirimlerini aktif olarak teşvik ediyoruz:

### Geri Bildirim Nasıl Sağlanır
- **GitHub Issues**: Sorunları bildirin veya iyileştirme önerin (AI'ye özgü sorunlar memnuniyetle karşılanır)
- **Discord Discussions**: Fikirleri paylaşın ve Microsoft Foundry topluluğuyla etkileşimde bulunun
- **Pull Requests**: İçeriğe doğrudan iyileştirmeler katkıda bulunun, özellikle AI şablonları ve kılavuzlar
- **Microsoft Foundry Discord**: AZD + AI tartışmaları için #Azure kanalına katılın
- **Topluluk Forumları**: Daha geniş Azure geliştirici tartışmalarına katılın

### Geri Bildirim Kategorileri
- **AI İçerik Doğruluğu**: AI servis entegrasyonu ve dağıtım bilgilerine ilişkin düzeltmeler
- **Öğrenme Deneyimi**: AI geliştirici öğrenme akışının iyileştirilmesine yönelik öneriler
- **Eksik AI İçeriği**: Ek AI şablonları, desenleri veya örnekleri talepleri
- **Erişilebilirlik**: Çeşitli öğrenme ihtiyaçları için iyileştirmeler
- **AI Araç Entegrasyonu**: Daha iyi AI geliştirme iş akışı entegrasyonu için öneriler
- **Üretim AI Desenleri**: Kurumsal AI dağıtım deseni talepleri

### Yanıt Taahhüdü
- **Sorun Yanıtı**: Bildirilen problemler için 48 saat içinde
- **Özellik Talepleri**: Bir hafta içinde değerlendirme
- **Topluluk Katkıları**: Bir hafta içinde inceleme
- **Güvenlik Sorunları**: Öncelikli olarak hızlı yanıt

## Bakım Takvimi

### Düzenli Güncellemeler
- **Aylık İncelemeler**: İçerik doğruluğu ve bağlantı doğrulaması
- **Üç Aylık Güncellemeler**: Önemli içerik eklemeleri ve geliştirmeler
- **Yarı Yıllık İncelemeler**: Kapsamlı yeniden yapılandırma ve iyileştirme
- **Yıllık Sürümler**: Önemli iyileştirmelerle büyük sürüm güncellemeleri

### İzleme ve Kalite Güvencesi
- **Otomatik Testler**: Kod örnekleri ve bağlantıların düzenli doğrulanması
- **Topluluk Geri Bildirimi Entegrasyonu**: Kullanıcı önerilerinin düzenli olarak dahil edilmesi
- **Teknoloji Güncellemeleri**: En son Azure servisleri ve azd sürümleriyle uyum
- **Erişilebilirlik Denetimleri**: Kapsayıcı tasarım ilkeleri için düzenli inceleme

## Sürüm Destek Politikası

### Mevcut Sürüm Desteği
- **En Son Ana Sürüm**: Düzenli güncellemelerle tam destek
- **Önceki Ana Sürüm**: 12 ay boyunca güvenlik güncellemeleri ve kritik düzeltmeler
- **Eski Sürümler**: Sadece topluluk desteği, resmi güncelleme yok

### Migration Guidance
Ana sürümler yayınlandığında, sunarız:
- **Geçiş Kılavuzları**: Adım adım geçiş talimatları
- **Uyumluluk Notları**: Kırıcı değişikliklerle ilgili ayrıntılar
- **Araç Desteği**: Geçişe yardımcı olacak betikler veya yardımcı araçlar
- **Topluluk Desteği**: Geçişle ilgili sorular için özel forumlar

---

**Gezinme**
- **Önceki Ders**: [Çalışma Rehberi](resources/study-guide.md)
- **Sonraki Ders**: [Ana README](README.md) dosyasına geri dönün

**Güncel Kalın**: Yeni sürümler ve öğretim materyallerindeki önemli güncellemeler hakkında bildirimler için bu depoyu izleyin.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi ana dilindeki sürümü esas alınarak yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek herhangi bir yanlış anlaşılma veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->