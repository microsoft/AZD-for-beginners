# Değişiklik Günlüğü - AZD Yeni Başlayanlar İçin

## Giriş

Bu değişiklik günlüğü AZD Yeni Başlayanlar deposundaki tüm kayda değer değişiklikleri, güncellemeleri ve iyileştirmeleri belgelendirir. Semantik sürümleme ilkelerini takip ediyoruz ve kullanıcıların sürümler arasındaki farkları anlamalarına yardımcı olmak için bu günlüğü tutuyoruz.

## Öğrenme Hedefleri

Bu değişiklik günlüğünü inceleyerek:
- Yeni özellikler ve içerik eklemeleri hakkında haberdar olursunuz
- Mevcut belgelerde yapılan iyileştirmeleri anlarsınız
- Doğruluğu sağlamak için hata düzeltmelerini ve düzeltmeleri izlersiniz
- Öğrenme materyallerinin zaman içindeki evrimini takip edersiniz

## Öğrenme Çıktıları

Değişiklik kaydı girdilerini inceledikten sonra şunları yapabileceksiniz:
- Öğrenme için kullanılabilir yeni içerikleri ve kaynakları tanımlamak
- Hangi bölümlerin güncellendiğini veya iyileştirildiğini anlamak
- En güncel materyallere göre öğrenme yolunuzu planlamak
- Gelecekteki iyileştirmeler için geri bildirim ve önerilerde bulunmak

## Sürüm Geçmişi

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**Bu sürüm, azd-coverage analizinin ortaya çıkardığı kalan orta düzey boşlukları kapatır: kendi şablonunuzu nasıl yazıp yayımlayacağınız, tekrarlanabilir dev-container/Codespaces ortamları, Pulumi altyapı sağlayıcısı, bir Azure DevOps CI/CD kılavuzu, servis-prensip kimlik doğrulaması, host-seçimi rehberliği (AKS/Spring Apps), `azd restore`/`azd package` açıklamaları, hook hata işleme ve ekip/paylaşılan ortam uygulamaları.**

#### Eklendi
- **🧱 Yeni Bölüm 4 dersi** `docs/chapter-04-infrastructure/custom-templates.md` — kendi azd şablonunuzu yazma ve yayımlama: gerekli yapı (`azure.yaml`, `infra/`, `src/`), `metadata.template` alanı, altyapıyı `uniqueString()` kaynak tokeni ve `azd-env-name` etiketi ile parametreleştirme, `azd init --template <local-path>` ile yerel test etme, GitHub'a yayınlama ve Awesome AZD galerisine gönderme
- **📦 Yeni Bölüm 1 dersi** `docs/chapter-01-foundation/dev-containers.md` — Dev Containers ve GitHub Codespaces ile tekrarlanabilir azd ortamları: resmi `ghcr.io/azure/azure-dev/azd` özelliğini kullanan minimal `.devcontainer/devcontainer.json`, dil-spesifik özellikler, container hostlar için `docker-in-docker` ve uzak giriş için `azd auth login --use-device-code`
- **🧩 azd ile Pulumi** bölümü `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi klasör düzeni, azd ortamlarına eşlenen stack'ler, gerekli çıktılar/etiketleme ve aynı `azd up` / `azd down` iş akışı
- **🎯 Host-seçimi rehberliği** `docs/chapter-04-infrastructure/provisioning.md` — `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` ve `springapp` için yeni başlayanlara yönelik karşılaştırma ve AKS veya Azure Spring Apps seçmenin ne zaman uygun olduğuna dair rehberlik
- **🛠️ Azure DevOps CI/CD kılavuzu** `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, workload identity federation (OIDC) ile servis bağlantısı, oluşturulan `azure-dev.yml` ve variable-group kurulumu
- **🔑 Servis Prensipleri (Desen 4)** `docs/chapter-03-configuration/authsecurity.md` dosyasına eklendi — `az ad sp create-for-rbac`, istemci sırrı vs. federated/OIDC kimlik bilgileri ile etkileşimsiz `azd auth login`, ne zaman kullanılacağı ve güvenli kimlik bilgisi depolama
- **🪝 Hook hata-işleme** alt bölümü `docs/chapter-04-infrastructure/deployment-guide.md` — çıkış kodları ve `set -e`, `continueOnError`, `azd hooks run` ile hook'ları izole şekilde test etme, OS-spesifik kabuklar ve `--debug`
- **👥 Ekip / paylaşılan ortamlar** bölümü `docs/chapter-03-configuration/configuration.md` — `.azure/` içinde neyin yaşadığı, neyin gitignore yapılacağı, geliştirici başına ortamlar, `azd env list`/`select` ve CI/CD içinde ortam değerleri sağlama
- **🧰 `azd restore` ve genişletilmiş `azd package`** açıklamaları `resources/cheat-sheet.md` — bağımlılıkların geri yüklenmesi ve dağıtılmadan deploy edilebilir bir artefakt oluşturma

#### Değiştirildi
- **🧭 Bölüm 4 ders tablosu** yeni "Kendi Şablonunuzu Yazma" dersini (Ders 3) içerecek şekilde güncellendi
- **🧭 Bölüm 1 ders tablosu** yeni "Dev Containers & Codespaces" dersini (Ders 5) içerecek şekilde güncellendi; `bring-your-own-app.md` ve `dev-containers.md` arasında gezinme altbilgileri bağlandı

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Bu sürüm, eksiksiz bir başlangıç kılavuzu için en büyük boşlukları kapatır: iki yeni uygulamalı ders (dağıtılabilir çok ajanlı bir yürütme ve var olan bir uygulamaya azd ekleme), yeni başlayanlara uygun bir hooks tanıtımı, azd ile Terraform bölümü, adım adım bir GitHub Actions pipeline kılavuzu, yeni önizleme eklentileri için bir açıklama ve açık bir dağıtım doğrulama kontrol listesi eklenmesi.**

#### Eklendi
- **🤝 Yeni Bölüm 5 dersi** `docs/chapter-05-multi-agent/multi-agent-basics.md` — gerçek bir şablon (`contoso-creative-writer`) kullanarak tamamen uygulamalı, dağıtılabilir iki ajanlı bir yürütme (orchestrator + uzmanlar): çok ajan kullanım zamanları, `azd up` iş akışı, dağıtılan kaynakların anlaşılması, ajanlar arası izleme, özelleştirme ve temizlik
- **📦 Yeni Bölüm 1 dersi** `docs/chapter-01-foundation/bring-your-own-app.md` — mevcut bir projeye `azd init` ile azd ekleme ("use code in the current directory"), `azure.yaml` ve `infra/` yapısını anlama, `azd infra generate`, host tespiti ve `azd up` ile dağıtım
- **🌐 azd ile Terraform** bölümü `docs/chapter-04-infrastructure/provisioning.md` eklendi — `infra.provider: terraform` yapılandırması, `.tf` klasör düzeni, gerekli `AZURE_*` çıktılar ve `azd-env-name` etiketleme ve aynı `azd up` / `azd down` iş akışı (Terraform desteğinin iddia edildiği ancak yalnızca Bicep gösterildiği boşluğu kapatır)
- **⚙️ Adım adım GitHub Actions yürütme rehberi** `docs/chapter-08-production/production-ai-practices.md` — GitHub repo'dan otomatik dağıtıma: `azd pipeline config`, saklanan sır olmadan OIDC federated kimlik bilgileri, oluşturulan `azure-dev.yml` ve secrets-vs-variables rehberliği
- **🪝 Yeni başlayanlar için "Hooks'a yeni misiniz?" tanıtımı** `docs/chapter-04-infrastructure/deployment-guide.md` — hook nedir, bir hook-evre tablosu, minimal ilk hook ve `azd hooks run` ile hook'ları elle çalıştırma
- **✅ "Dağıtımınızı Doğrulayın" kontrol listesi** `docs/chapter-01-foundation/first-project.md` içindeki Adım 5'e eklendi — duman testi, sağlık uç noktası kontrolü ve açık başarı kriterleri
- **🧩 Yeni önizleme eklentileri için açıklama** `azure.ai.skills` ve `azure.ai.connections` (ne oldukları ve ne zaman kullanılacakları) `docs/chapter-08-production/production-ai-practices.md` içinde

#### Değiştirildi
- **🧭 Bölüm 5 ders tablosu** düzeltildi: `multi-agent-basics.md` artık Ders 1 (tek tamamen uygulamalı ders) olarak etiketlendi; Ders 2'nin Bölüm 6'da bulunduğuna dair dürüst etiketleme yapıldı ve Perakende senaryosunun bir komutla çalışan şablon değil bir mimari taslak olduğu belirtildi
- **🧭 Bölüm 1 ders tablosu** artık yeni "Bring Your Own App" dersini (Ders 4) içeriyor
- **🔗 Gezinme altbilgileri** güncellendi: `first-project.md` artık ileriye `bring-your-own-app.md` bağlantısı içeriyor

#### Düzeltildi
- **🧱 "İddia edilmiş ancak eksik" Terraform boşluğu kapatıldı** — kurs daha önce Terraform desteğinden söz ediyor ancak bunu göstermiyordu
- **🔀 Yanıltıcı Bölüm 5 çapraz bağlantıları** düzeltildi; bu bağlantılar yalnızca bir mimari taslak varken tam bir çok-ajans uygulamasının var olduğunu ima ediyordu

#### Güncellenen Dosyalar
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(yeni)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(yeni)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Yenileme, Tam Ajan Yaşam Döngüsü Komutları ve Aspire Yeniden Markalaşması
**Bu sürüm kursu `azd` `1.25.6` (Haziran 2026) ve `azure.ai.agents` `0.1.40-preview` eklentisine göre yeniden doğrular, AI rehberliğini "bir ajan iskeletlemekten" komple ajan yaşam döngüsüne (test → değerlendir → optimize et → incele → sil) genişletir, yeni `azure.ai.skills` ve `azure.ai.connections` önizleme eklentilerini ortaya çıkarır ve ".NET Aspire" → "Aspire" ürün yeniden markalaşmasını not eder.**

#### Eklendi
- **🔁 Yeni başlayanlar ve AI mühendisleri için tam ajan yaşam döngüsü kapsamı** dokümanlara eklendi:
  - `docs/chapter-01-foundation/azd-basics.md` — Uzunluk tablosu (scaffold → test → measure → improve → inspect → clean up) Extensions and AI Commands bölümüne eklendi
  - `docs/chapter-08-production/production-ai-practices.md` — `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ve `delete --force` komutlarını kapsayan "Ajan Yaşam Döngüsünü Yönetme" bölümü
  - `resources/cheat-sheet.md` — `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ve `delete --force` ile Genişletilmiş AI Ajan Komutları
- **🧩 Yeni önizleme eklentileri** belgelendi: tekrar kullanılabilir ajan becerileri için `azure.ai.skills` ve Foundry bağlantıları için `azure.ai.connections` eklendi; bunlar eklentiler tablosu ve cheat sheet'e dahil edildi
- **⏱️ Yanıt-zamanı rehberliği** — `azd ai agent invoke` örnekleri artık toplam gecikmeyi ve ilk bayta kadar geçen süreyi (time-to-first-byte) belirtir
- **📌 Sürüm banner'ı** kök README'de öğrenenleri `azd version` ve `azd upgrade` komutlarına yönlendirir

#### Değiştirildi
- **✅ Doğrulama temel çizgisi** tüm bölüm README'leri ve atölye dokümanlarında `azd 1.23.12` (Mart 2026) yerine `azd 1.25.6` (Haziran 2026) olarak güncellendi
- **🤖 Bölüm 2 eklenti notu** `azure.ai.agents` `0.1.18-preview`'den `0.1.40-preview`'a güncellendi
- **🧪 Atölye doğrulama örneği** (`azd version` çıktısı) `1.25.6` olarak güncellendi
- **🧭 README "Az bugün azd'de ne yeni"** azam yaşam döngüsünü, yeni AI eklentilerini ve son kalite iyileştirmelerini ( `azd init` idempotency, `azd auth login` stale-token temizleme, `azd tool` ilk çalıştırma istemi) vurgulayacak şekilde yenilendi
- **📖 Bölüm 2 agents.md (Seçenek 4)** artık öğrencilere dağıtım sonrası yaşam döngüsü komutlarına yönlendiriyor; `azd up` ile durmak yerine devam eden komutlara işaret ediyor

#### Düzeltildi
- **🏷️ Ürün isimlendirmesi** — Aspire yeniden markalaşma notu eklendi (".NET Aspire" artık yalnızca "Aspire"); azd'nin Aspire desteği değişmedi
- **🔎 Canlı sürüm doğrulaması** Azure Developer CLI sürüm beslemesine karşı doğrulandı: kararlı CLI `1.25.6` (2026-06-12) ve `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Güncellenen Dosyalar
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### Yeni Başlayan Oryantasyonu Açıklaması, Kurulum Doğrulama & Son AZD Komut Temizliği
**Bu sürüm, AZD 1.23 doğrulama taramasını takiben yeni başlayan odaklı dokümantasyon güncellemesi uygular: AZD-öncelikli kimlik doğrulama yönergelerini netleştirir, yerel kurulum doğrulama betikleri ekler, ana komutları canlı AZD CLI ile doğrular ve değişiklik günlüğü dışındaki son geçersiz İngilizce kaynaklı komut başvurularını kaldırır.**

#### Eklendi
- **🧪 Yeni başlayan kurulum doğrulama betikleri** `validate-setup.ps1` ve `validate-setup.sh` ile öğrenenlerin Bölüm 1'e başlamadan önce gerekli araçları doğrulamasını sağlar
- **✅ Önceden kurulum doğrulama adımları** kök README ve Bölüm 1 README dosyalarına eklendi, böylece eksik önkoşullar `azd up` öncesinde yakalanır

#### Değiştirildi
- **🔐 Yeni başlayan kimlik doğrulama yönergeleri** artık `azd auth login` komutunu AZD iş akışları için birincil yol olarak tutarlı şekilde ele alır; `az login` yalnızca Azure CLI komutları doğrudan kullanıldığında isteğe bağlı olarak belirtilir
- **📚 Bölüm 1 oryantasyon akışı** artık öğrenenleri kurulum, kimlik doğrulama ve ilk dağıtım adımlarından önce yerel kurulumlarını doğrulamaya yönlendirir
- **🛠️ Doğrulayıcı mesajlaşması** artık AZD-özel yeni başlayan yolu için engelleyici gereksinimleri isteğe bağlı Azure CLI uyarılarından açıkça ayırır
- **📖 Yapılandırma, sorun giderme ve örnek belgeler** artık gerekli AZD kimlik doğrulaması ile isteğe bağlı Azure CLI oturumu arasında bağlam sağlamak için ayrım yapmaktadır

#### Düzeltildi
- **📋 Kalan İngilizce kaynaklı komut başvuruları** mevcut AZD biçimlerine güncellendi; komutlar arasında cheat sheet içindeki `azd config show` ve Azure Portal genel bakış kılaveti amaçlandığında `azd monitor --overview` bulunmaktadır
- **🧭 Bölüm 1'deki yeni başlayan iddiaları** tüm şablonlar ve Azure kaynakları için garanti edilen sıfır-hata veya geri alma davranışı vaat etmeyecek şekilde yumuşatıldı
- **🔎 Canlı CLI doğrulaması** `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` ve `azd down --force --purge` için mevcut desteği doğruladı

#### Güncellenen Dosyalar
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

#### AZD 1.23.12 Doğrulaması, Atölye Ortamı Genişletmesi & Yapay Zeka Modeli Yenilemesi
**Bu sürüm, dokümantasyonu `azd` `1.23.12` ile bir doğrulama taramasından geçirir, eski AZD komut örneklerini günceller, yapay zeka model yönergelerini güncel varsayılanlara yeniler ve atölye talimatlarını GitHub Codespaces dışına genişleterek geliştirici konteynerleri ve yerel klonları da destekler.**

#### Eklendi
- **✅ Çekirdek bölümler ve atölye belgeleri genelinde doğrulama notları** böylece daha yeni veya eski CLI sürümleri kullanan öğrenenler için test edilen AZD tabanı açıkça belirtilir
- **⏱️ Uzun süren AI uygulama dağıtımları için zaman aşımı yönergesi** `azd deploy --timeout 1800` kullanımıyla
- **🔎 Uzantı inceleme adımları** AI iş akışı belgelerinde `azd extension show azure.ai.agents` ile
- **🌐 Daha geniş atölye ortamı yönergeleri** GitHub Codespaces, geliştirici konteynerleri ve MkDocs ile yerel klonları kapsayacak şekilde

#### Değiştirildi
- **📚 Bölüm giriş README dosyaları** artık temel bölümler, yapılandırma, altyapı, çoklu ajan, ön-dağıtım, sorun giderme ve üretim bölümleri genelinde `azd 1.23.12` ile doğrulandığını tutarlı şekilde belirtir
- **🛠️ AZD komut referansları** belgeler genelinde güncel biçimlere uyarlandı:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` veya bağlama bağlı olarak `azd env get-value(s)`
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → Application Insights genel bakışı amaçlandığında `azd monitor --overview`
- **🧪 Önizleme sağlama örnekleri** `azd provision --preview` ve `azd provision --preview -e production` gibi mevcut desteklenen kullanımlara basitleştirildi
- **🧭 Atölye akışı** artık öğrenenlerin laboratuvarları Codespaces'te, bir geliştirici konteynerinde veya yerel bir klonda tamamlayabileceğini belirtecek şekilde güncellendi
- **🔐 Kimlik doğrulama yönergeleri** artık AZD iş akışları için `azd auth login`i tercih eder, `az login` yalnızca Azure CLI komutları doğrudan kullanıldığında isteğe bağlı olarak konumlandırılır

#### Düzeltildi
- **🪟 Windows kurulum komutları** kurulum kılavuzunda mevcut `winget` paket yazımına normalleştirildi
- **🐧 Linux kurulum yönergeleri** desteklenmeyen dağıtım-a özgü `azd` paket yöneticisi talimatlarından kaçınacak şekilde düzeltildi ve gerektiğinde sürüm varlıklarına yönlendirildi
- **📦 Yapay zeka model örnekleri** `gpt-35-turbo` ve `text-embedding-ada-002` gibi eski varsayılanlardan `gpt-4.1-mini`, `gpt-4.1` ve `text-embedding-3-large` gibi güncel örneklere yenilendi
- **📋 Dağıtım ve teşhis parçacıkları** günlükler, betikler ve sorun giderme adımlarında güncel ortam ve durum komutlarını kullanacak şekilde düzeltildi
- **⚙️ GitHub Actions yönergeleri** `Azure/setup-azd@v1.0.0`'den `Azure/setup-azd@v2`'ye güncellendi
- **🤖 MCP/Copilot onay yönergeleri** `azd mcp consent`'ten `azd copilot consent list`'e güncellendi

#### İyileştirildi
- **🧠 AI bölümü yönergeleri** artık önizleme-duyarlı `azd ai` davranışını, kiracıya özgü oturum açmayı, mevcut uzantı kullanımını ve güncel model dağıtım önerilerini daha iyi açıklar
- **🧪 Atölye talimatları** gerçekçi sürüm örnekleri ve uygulamalı laboratuvarlar için daha net ortam kurulum dili kullanır
- **📈 Üretim ve sorun giderme belgeleri** şimdi mevcut izleme, yedek model ve maliyet katmanı örnekleri ile daha iyi hizalanmıştır

#### Güncellenen Dosyalar
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

#### AZD AI CLI Komutları, İçerik Doğrulama & Şablon Genişletme
**Bu sürüm `azd ai`, `azd extension` ve `azd mcp` komut kapsamını tüm AI ile ilgili bölümlere ekler, agents.md içindeki kırık bağlantıları ve kullanımdan kaldırılmış kodu düzeltir, cheat sheet'i günceller ve Doğrulanmış açıklamalar ve yeni Azure AI AZD şablonları ile Örnek Şablonlar bölümünü baştan düzenler.**

#### Eklendi
- **🤖 AZD AI CLI kapsamı** 7 dosya genelinde (önceden yalnızca Bölüm 8'deydi):
  - `docs/chapter-01-foundation/azd-basics.md` — `azd extension`, `azd ai agent init` ve `azd mcp`'yi tanıtan yeni "Uzantılar ve AI Komutları" bölümü
  - `docs/chapter-02-ai-development/agents.md` — Seçenek 4: `azd ai agent init` ile şablon ve manifest yaklaşımı karşılaştırma tablosu
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "Foundry için AZD Uzantıları" ve "Ajan-Öncelikli Dağıtım" alt bölümleri
  - `docs/chapter-05-multi-agent/README.md` — Hızlı Başlangıç artık hem şablon hem de manifest tabanlı dağıtım yollarını gösterir
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Dağıtım bölümü artık `azd ai agent init` seçeneğini içerir
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "Teşhis için AZD AI Uzantı Komutları" alt bölümü
  - `resources/cheat-sheet.md` — `azd extension`, `azd ai agent init`, `azd mcp` ve `azd infra generate` içeren yeni "AI & Uzantılar Komutları" bölümü
- **📦 Yeni AZD AI örnek şablonları** `microsoft-foundry-integration.md` içinde:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel ve sesli sohbet desteği ile .NET RAG sohbet
  - **azure-search-openai-demo-java** — ACA/AKS dağıtım seçenekleriyle Langchain4J kullanan Java RAG sohbet
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding ve Prompty kullanan çoklu ajan yaratıcı yazım uygulaması
  - **serverless-chat-langchainjs** — Ollama yerel geliştirme desteği ile Azure Functions + LangChain.js + Cosmos DB kullanan serverless RAG
  - **chat-with-your-data-solution-accelerator** — yönetici portalı, Teams entegrasyonu ve PostgreSQL/Cosmos DB seçenekleri ile kurumsal RAG hızlandırıcı
  - **azure-ai-travel-agents** — .NET, Python, Java ve TypeScript ile sunucular içeren çoklu ajan MCP orkestrasyon referans uygulaması
  - **azd-ai-starter** — Minimal Azure AI altyapı Bicep başlangıç şablonu
  - **🔗 Awesome AZD AI Gallery linki** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) referansı (80+ şablon)

#### Düzeltildi
- **🔗 agents.md gezinmesi**: Önceki/Sonraki bağlantıları artık Bölüm 2 README ders sırasına uygun (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md kırık bağlantıları**: `production-ai-practices.md` 3 örnekte `../chapter-08-production/production-ai-practices.md` olarak düzeltildi
- **📦 agents.md kullanımdan kaldırılmış kod**: `opencensus` `azure-monitor-opentelemetry` + OpenTelemetry SDK ile değiştirildi
- **🐛 agents.md geçersiz API**: `max_tokens` `create_agent()`'den `create_run()` içine `max_completion_tokens` olarak taşındı
- **🔢 agents.md token sayımı**: Yaklaşık `len//4` tahmini `tiktoken.encoding_for_model()` ile değiştirildi
- **azure-search-openai-demo**: Hizmetler varsayılan olarak Ekim 2024'ten itibaren değişen hosta göre "Cognitive Search + App Service" yerine "Azure AI Search + Azure Container Apps" olarak düzeltildi
- **contoso-chat**: Açıklama, depo başlığını ve teknoloji yığınına uyması için Azure AI Foundry + Prompty referansını içerecek şekilde güncellendi

#### Kaldırıldı
- **ai-document-processing**: İşlevsel olmayan şablon referansı (depo herkese açık olarak AZD şablonu olarak erişilebilir değil) kaldırıldı

#### İyileştirildi
- **📝 agents.md alıştırmaları**: Alıştırma 1 artık beklenen çıktıyı ve `azd monitor` adımını gösterir; Alıştırma 2 tam `FunctionTool` kayıt kodunu içerir; Alıştırma 3 belirsiz yönergeyi somut `prepdocs.py` komutlarıyla değiştirir
- **📚 agents.md kaynakları**: Dokümantasyon bağlantıları güncel Azure AI Agent Service belgeleri ve hızlı başlangıç ile güncellendi
- **📋 agents.md Sonraki Adımlar tablosu**: Tam bölüm kapsaması için AI Atölye Laboratuvarı bağlantısı eklendi

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
#### Kurs Gezinme İyileştirmesi
**Bu sürüm, geliştirilmiş bir tablo formatı ile README.md bölüm gezinmesini iyileştirir.**

#### Değiştirildi
- **Kurs Haritası Tablosu**: Doğrudan ders bağlantıları, süre tahminleri ve karmaşıklık dereceleri ile geliştirildi
- **Klasör Temizliği**: Gereksiz eski klasörler kaldırıldı (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Bağlantı Doğrulama**: Kurs Haritası tablosundaki 21+ dahili bağlantının tamamı doğrulandı

### [v3.16.0] - 2026-02-05

#### Ürün Adı Güncellemeleri
**Bu sürüm, ürün referanslarını mevcut Microsoft marka kimliğine günceller.**

#### Değiştirildi
- **Microsoft Foundry → Microsoft Foundry**: Tüm referanslar çeviri dışı dosyalar genelinde güncellendi
- **Azure AI Agent Service → Foundry Agents**: Hizmet adı mevcut marka kimliğini yansıtacak şekilde güncellendi

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

#### Eklendi
- **📚 Chapter README files**: Her bölüm klasöründe README.md oluşturuldu, içinde:
  - Öğrenme hedefleri ve süre
  - Açıklamalı ders tablosu
  - Hızlı başlangıç komutları
  - Diğer bölümlere gezinme

#### Değiştirildi
- **🔗 Tüm dahili bağlantılar güncellendi**: Tüm dokümantasyon dosyalarında 78+ yol güncellendi
- **🗺️ Ana README.md**: Yeni bölüm yapısı ile Kurs Haritası güncellendi
- **📝 examples/README.md**: Bölüm klasörlerine çapraz referanslar güncellendi

#### Kaldırıldı
- Eski klasör yapısı (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Depo Yeniden Yapılandırması: Bölüm Gezinmesi
**Bu sürüm bölüm gezinme README dosyaları ekledi (v3.15.0 tarafından geçersiz kılındı).**

---

### [v3.13.0] - 2026-02-05

#### Yeni AI Ajanları Rehberi
**Bu sürüm, Azure Developer CLI ile AI ajanlarını dağıtmaya yönelik kapsamlı bir rehber ekler.**

#### Eklendi
- **🤖 docs/microsoft-foundry/agents.md**: Kapsayan eksiksiz rehber:
  - AI ajanlarının ne olduğu ve sohbet botlarından nasıl farklılaştıkları
  - Üç hızlı başlangıç ajan şablonu (Foundry Agents, Prompty, RAG)
  - Ajan mimarisi desenleri (tek ajan, RAG, çoklu ajan)
  - Araç yapılandırması ve özelleştirme
  - İzleme ve metrik takibi
  - Maliyet değerlendirmeleri ve optimizasyon
  - Yaygın sorun giderme senaryoları
  - Başarı kriterleri olan üç uygulamalı egzersiz

#### İçerik Yapısı
- **Giriş**: Başlangıç seviyesindekiler için ajan kavramları
- **Hızlı Başlangıç**: Ajanları `azd init --template get-started-with-ai-agents` ile dağıtın
- **Mimari Desenler**: Ajan desenlerinin görsel diyagramları
- **Yapılandırma**: Araç kurulumu ve ortam değişkenleri
- **İzleme**: Application Insights entegrasyonu
- **Egzersizler**: Aşamalı uygulamalı öğrenme (her biri 20-45 dakika)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Ortam Güncellemesi
**Bu sürüm, AZD öğrenme deneyimi için geliştirilmiş varsayılanlarla modern araçları içerecek şekilde geliştirme konteyneri yapılandırmasını günceller.**

#### Değiştirildi
- **🐳 Temel İmaj**: `python:3.12-bullseye`'den `python:3.12-bookworm`'a güncellendi (en son Debian kararlı sürümü)
- **📛 Konteyner Adı**: Anlaşılırlık için "Python 3"ten "AZD for Beginners" olarak yeniden adlandırıldı

#### Eklendi
- **🔧 Yeni Dev Container Özellikleri**:
  - `azure-cli` Bicep desteği etkin olarak eklendi
  - `node:20` (AZD şablonları için LTS sürümü)
  - `github-cli` şablon yönetimi için
  - `docker-in-docker` konteyner uygulama dağıtımları için

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
  - `DavidAnson.vscode-markdownlint` - Markdown lintleme
  - `bierner.markdown-mermaid` - Mermaid diyagram desteği
  - `redhat.vscode-yaml` - YAML desteği (azure.yaml için)
  - `eamodio.gitlens` - Git görselleştirmesi
  - `mhutchie.git-graph` - Git geçmişi

- **⚙️ VS Code Ayarları**: Python yorumlayıcısı, kaydederken biçimlendirme ve boşluk kırpmaya yönelik varsayılan ayarlar eklendi

- **📦 requirements-dev.txt Güncellendi**:
  - MkDocs minify eklentisi eklendi
  - Kod kalitesi için pre-commit eklendi
  - Azure SDK paketleri eklendi (azure-identity, azure-mgmt-resource)

#### Düzeltildi
- **Post-Create Komutu**: Artık konteyner başlatıldığında AZD ve Azure CLI kurulumunu doğrular

---

### [v3.11.0] - 2026-02-05

#### Yeni Başlayanlara Uygun README Yenilemesi
**Bu sürüm README.md'yi yeni başlayanlar için daha erişilebilir hale getirir ve AI geliştiriciler için gerekli kaynakları ekler.**

#### Eklendi
- **🆚 Azure CLI vs AZD Karşılaştırması**: Hangi aracı ne zaman kullanacağınıza dair net açıklama ve pratik örnekler
- **🌟 Harika AZD Bağlantıları**: Topluluk şablon galerisi ve katkı kaynaklarına doğrudan bağlantılar:
  - [Harika AZD Galerisi](https://azure.github.io/awesome-azd/) - Dağıtıma hazır 200+ şablon
  - [Bir Şablon Gönder](https://github.com/Azure/awesome-azd/issues) - Topluluk katkısı
- **🎯 Hızlı Başlangıç Rehberi**: Basitleştirilmiş 3 adımlı başlangıç bölümü (Yükle → Oturum Aç → Dağıt)
- **📊 Deneyime Dayalı Gezinme Tablosu**: Geliştirici deneyimine göre nereden başlayacağınıza dair net rehber

#### Değiştirildi
- **README Yapısı**: Kademeli açıklama için yeniden düzenlendi - önemli bilgiler ilk
- **Giriş Bölümü**: Tamamen yeni başlayanlar için "The Magic of `azd up`"ı açıklayacak şekilde yeniden yazıldı
- **Yinelenen İçerik Kaldırıldı**: Yinelenen sorun giderme bölümü kaldırıldı
- **Sorun Giderme Komutları**: `azd logs` referansı, geçerli `azd monitor --logs` ile düzeltildi

#### Düzeltildi
- **🔐 Kimlik Doğrulama Komutları**: `azd auth login` ve `azd auth logout` cheat-sheet.md'ye eklendi
- **Geçersiz Komut Referansları**: README sorun giderme bölümündeki kalan `azd logs` kaldırıldı

#### Notlar
- **Kapsam**: Değişiklikler ana README.md ve resources/cheat-sheet.md'ye uygulandı
- **Hedef Kitle**: İyileştirmeler özellikle AZD'ye yeni olan geliştiricilere yöneliktir

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Komut Doğruluğu Güncellemesi
**Bu sürüm, dokümantasyondaki var olmayan AZD komutlarını düzeltir ve tüm kod örneklerinin geçerli Azure Developer CLI sözdizimini kullandığından emin olur.**

#### Düzeltildi
- **🔧 Var Olmayan AZD Komutları Kaldırıldı**: Geçersiz komutların kapsamlı denetimi ve düzeltilmesi:
  - `azd logs` (mevcut değil) → `azd monitor --logs` veya Azure CLI alternatifleri ile değiştirildi
  - `azd service` alt komutları (mevcut değil) → `azd show` ve Azure CLI ile değiştirildi
  - `azd infra import/export/validate` (mevcut değil) → kaldırıldı veya geçerli alternatiflerle değiştirildi
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` bayrakları (mevcut değil) → kaldırıldı
  - `azd provision --what-if/--rollback` bayrakları (mevcut değil) → `--preview` kullanacak şekilde güncellendi
  - `azd config validate` (mevcut değil) → `azd config list` ile değiştirildi
  - `azd info`, `azd history`, `azd metrics` (mevcut değil) → kaldırıldı

- **📚 Komut Düzeltmeleriyle Güncellenen Dosyalar**:
  - `resources/cheat-sheet.md`: Komut referansının kapsamlı yenilenmesi
  - `docs/deployment/deployment-guide.md`: Geri alma ve dağıtım stratejileri düzeltildi
  - `docs/troubleshooting/debugging.md`: Log analiz bölümleri düzeltildi
  - `docs/troubleshooting/common-issues.md`: Sorun giderme komutları güncellendi
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD hata ayıklama bölümü düzeltildi
  - `docs/getting-started/azd-basics.md`: İzleme komutları düzeltildi
  - `docs/getting-started/first-project.md`: İzleme ve hata ayıklama örnekleri güncellendi
  - `docs/getting-started/installation.md`: Yardım ve sürüm örnekleri düzeltildi
  - `docs/pre-deployment/application-insights.md`: Log görüntüleme komutları düzeltildi
  - `docs/pre-deployment/coordination-patterns.md`: Ajan hata ayıklama komutları düzeltildi

#### Değiştirildi
- **Geri Alma Stratejileri**: AZD'nin yerel geri alma yeteneği olmadığından, belge Git tabanlı geri alma kullanacak şekilde güncellendi
- **Log Görüntüleme**: `azd logs` referansları `azd monitor --logs`, `azd monitor --live` ve Azure CLI komutları ile değiştirildi
- **Performans Bölümü**: Mevcut olmayan paralel/artımlı dağıtım bayrakları kaldırıldı, geçerli alternatifler sağlandı

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
- **📝 CONTRIBUTING.md**: Aşağıları içeren yeni katkı yönergeleri belgesi:
  - Sorun bildirme ve değişiklik önerme için net talimatlar
  - Yeni içerik için dokümantasyon standartları
  - Kod örneği yönergeleri ve commit mesajı kuralları
  - Topluluk katılım bilgileri

#### Tamamlandı
- **🎯 Workshop Module 7 (Wrap-up)**: Tamamlanan kapanış modülü ile:
  - Çalıştay başarılarının kapsamlı özeti
  - AZD, şablonlar ve Microsoft Foundry'yi kapsayan edinilen temel kavramlar bölümü
  - Öğrenme yolculuğuna devam önerileri
  - Zorluk dereceli çalıştay meydan okuma alıştırmaları
  - Topluluk geri bildirimi ve destek bağlantıları

- **📚 Workshop Module 3 (Deconstruct)**: Güncellenmiş öğrenme hedefleri ile:
  - MCP sunucuları ile GitHub Copilot etkinleştirme rehberi
  - AZD şablon klasör yapısının anlaşılması
  - Altyapı olarak kod (Bicep) organizasyon kalıpları
  - Uygulamalı laboratuvar talimatları

- **🔧 Workshop Module 6 (Teardown)**: Tamamlandı:
  - Kaynak temizleme ve maliyet yönetimi hedefleri
  - `azd down` kullanımı ile güvenli altyapı iptali
  - Soft-silinmiş Cognitive Services kurtarma rehberi
  - GitHub Copilot ve Azure Portal için bonus keşif yönlendirmeleri

#### Düzeltildi
- **🔗 Kırık Bağlantı Düzeltmeleri**: 15+ kırık dahili dokümantasyon bağlantısı çözüldü:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md yolları düzeltildi
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md ve production-ai-practices.md yolları düzeltildi
  - `docs/getting-started/first-project.md`: mevcut olmayan cicd-integration.md, deployment-guide.md ile değiştirildi
  - `examples/retail-scenario.md`: SSS ve sorun giderme kılavuzu yolları düzeltildi
  - `examples/container-app/microservices/README.md`: kurs ana sayfası ve dağıtım rehberi yolları düzeltildi
  - `resources/faq.md` ve `resources/glossary.md`: AI bölüm referansları güncellendi
  - `course-outline.md`: eğitmen kılavuzu ve AI çalıştay laboratuvarı referansları düzeltildi

- **📅 Workshop Durum Bannerı**: "Under Construction" durumundan aktif çalıştay durumu olarak Şubat 2026 tarihiyle güncellendi

- **🔗 Workshop Gezinme**: workshop README.md içindeki var olmayan lab-1-azd-basics klasörüne işaret eden kırık gezinme bağlantıları düzeltildi

#### Değiştirildi
- **Workshop Sunumu**: "under construction" uyarısı kaldırıldı, çalıştay artık tamamlandı ve kullanıma hazır
- **Gezinme Tutarlılığı**: Tüm çalıştay modüllerinin uygun modüller arası gezinmeye sahip olması sağlandı
- **Öğrenme Yolu Referansları**: Bölümler arası çapraz referanslar doğru microsoft-foundry yollarını kullanacak şekilde güncellendi

#### Doğrulandı
- ✅ Tüm İngilizce markdown dosyalarının geçerli dahili bağlantıları var
- ✅ Çalıştay modülleri 0-7 öğrenme hedefleriyle tamamlandı
- ✅ Bölümler ve modüller arasındaki gezinme düzgün çalışıyor
- ✅ İçerik Microsoft AZD kullanan AI geliştiricileri için uygun
- ✅ Başlangıç düzeyi dostu dil ve yapı korundu
- ✅ CONTRIBUTING.md topluluk katkıcıları için net rehberlik sağlar

#### Teknik Uygulama
- **Bağlantı Doğrulama**: Otomatik PowerShell betiği tüm .md dahili bağlantılarını doğruladı
- **İçerik Denetimi**: Çalıştayın bütünlüğü ve başlangıç uygunluğu elle incelendi
- **Gezinti Sistemi**: Tutarlı bölüm ve modül gezinme desenleri uygulandı

#### Notlar
- **Kapsam**: Değişiklikler yalnızca İngilizce belgelerde uygulandı
- **Çeviriler**: Bu sürümde çeviri klasörleri güncellenmedi (otomatik çeviri daha sonra senkronize edilecektir)
- **Çalıştay Süresi**: Tamamlanmış çalıştay artık 3-4 saatlik uygulamalı öğrenim sunmaktadır

---

### [v3.8.0] - 2025-11-19

#### Gelişmiş Belgeler: İzleme, Güvenlik ve Çok Ajanlı Kalıplar
**Bu sürüm, Application Insights entegrasyonu, kimlik doğrulama kalıpları ve üretim dağıtımları için çok-ajanslı koordinasyon üzerine kapsamlı A-seviyesi dersler ekler.**

#### Eklendi
- **📊 Application Insights Entegrasyonu Dersi**: `docs/pre-deployment/application-insights.md` içinde:
  - AZD odaklı dağıtım ile otomatik kaynak sağlama
  - Application Insights + Log Analytics için tam Bicep şablonları
  - Özel telemetri içeren çalışan Python uygulamaları (1.200+ satır)
  - AI/LLM izleme kalıpları (Microsoft Foundry Models token/maliyet takibi)
  - 6 Mermaid diyagramı (mimari, dağıtık izleme, telemetri akışı)
  - 3 uygulamalı egzersiz (alarmlar, panolar, AI izleme)
  - Kusto sorgu örnekleri ve maliyet optimizasyon stratejileri
  - Canlı metrik akışı ve gerçek zamanlı hata ayıklama
  - Üretime hazır kalıplarla 40-50 dakikalık öğrenme süresi

- **🔐 Kimlik Doğrulama ve Güvenlik Kalıpları Dersi**: `docs/getting-started/authsecurity.md` içinde:
  - 3 kimlik doğrulama kalıbı (connection strings, Key Vault, managed identity)
  - Güvenli dağıtımlar için tam Bicep altyapı şablonları
  - Azure SDK entegrasyonlu Node.js uygulama kodu
  - 3 tam egzersiz (managed identity etkinleştirme, user-assigned identity, Key Vault rotasyonu)
  - Güvenlik en iyi uygulamaları ve RBAC yapılandırmaları
  - Sorun giderme rehberi ve maliyet analizi
  - Üretime hazır parola gerektirmeyen kimlik doğrulama kalıpları

- **🤖 Çok-Ajan Koordinasyon Kalıpları Dersi**: `docs/pre-deployment/coordination-patterns.md` içinde:
  - 5 koordinasyon kalıbı (sequential, parallel, hierarchical, event-driven, consensus)
  - Tam orkestratör servis uygulaması (Python/Flask, 1.500+ satır)
  - 3 uzmanlaşmış ajan uygulaması (Research, Writer, Editor)
  - Mesaj kuyruğu için Service Bus entegrasyonu
  - Dağıtık sistemler için Cosmos DB durum yönetimi
  - Ajan etkileşimlerini gösteren 6 Mermaid diyagramı
  - 3 ileri seviye egzersiz (zaman aşımı yönetimi, yeniden deneme mantığı, devre kesici)
  - Maliyet dökümü ($240-565/month) ve optimizasyon stratejileri
  - İzleme için Application Insights entegrasyonu

#### Geliştirildi
- **Pre-deployment Bölümü**: Artık kapsamlı izleme ve koordinasyon kalıplarını içerir
- **Getting Started Bölümü**: Profesyonel kimlik doğrulama kalıpları ile geliştirildi
- **Üretime Hazırlık**: Güvenlikten gözlemlenebilirliğe kadar tam kapsam
- **Ders Planı**: Bölüm 3 ve 6'da yeni derslere referans için güncellendi

#### Değiştirildi
- **Öğrenme İlerleyişi**: Güvenlik ve izleme kurs boyunca daha iyi entegre edildi
- **Dokümantasyon Kalitesi**: Yeni dersler boyunca tutarlı A-seviyesi standartlar (yüzde 95-97)
- **Üretim Kalıpları**: Kurumsal dağıtımlar için uçtan uca kapsam

#### İyileştirildi
- **Geliştirici Deneyimi**: Geliştirmeden üretim izlemeye net yol
- **Güvenlik Standartları**: Kimlik doğrulama ve sır yönetimi için profesyonel kalıplar
- **Gözlemlenebilirlik**: AZD ile tam Application Insights entegrasyonu
- **AI İş Yükleri**: Microsoft Foundry Models ve çok-ajanslı sistemler için özelleşmiş izleme

#### Doğrulandı
- ✅ Tüm dersler tam çalışan kod içerir (kısa parçalar değil)
- ✅ Görsel öğrenme için Mermaid diyagramları (toplam 19, 3 derste)
- ✅ Doğrulama adımlarıyla uygulamalı egzersizler (toplam 9)
- ✅ `azd up` ile dağıtılabilir üretime hazır Bicep şablonları
- ✅ Maliyet analizi ve optimizasyon stratejileri
- ✅ Sorun giderme rehberleri ve en iyi uygulamalar
- ✅ Doğrulama komutları ile bilgi kontrol noktaları

#### Dokümantasyon Notlandırma Sonuçları
- **docs/pre-deployment/application-insights.md**: - Kapsamlı izleme rehberi
- **docs/getting-started/authsecurity.md**: - Profesyonel güvenlik kalıpları
- **docs/pre-deployment/coordination-patterns.md**: - Gelişmiş çok-ajanslı mimariler
- **Genel Yeni İçerik**: - Tutarlı yüksek kalite standartları

#### Teknik Uygulama
- **Application Insights**: Log Analytics + özel telemetri + dağıtık izleme
- **Kimlik Doğrulama**: Managed Identity + Key Vault + RBAC kalıpları
- **Çok-Ajan**: Service Bus + Cosmos DB + Container Apps + orkestrasyon
- **İzleme**: Canlı metrikler + Kusto sorguları + alarmlar + panolar
- **Maliyet Yönetimi**: Örnekleme stratejileri, saklama politikaları, bütçe kontrolleri

### [v3.7.0] - 2025-11-19

#### Dokümantasyon Kalitesi İyileştirmeleri ve Yeni Microsoft Foundry Models Örneği
**Bu sürüm, depo genelinde dokümantasyon kalitesini artırır ve gpt-4.1 sohbet arayüzü ile eksiksiz bir Microsoft Foundry Models dağıtım örneği ekler.**

#### Eklendi
- **🤖 Microsoft Foundry Models Chat Örneği**: `examples/azure-openai-chat/` içinde eksiksiz gpt-4.1 dağıtımı:
  - Tam Microsoft Foundry Models altyapısı (gpt-4.1 model dağıtımı)
  - Konuşma geçmişi olan Python komut satırı sohbet arayüzü
  - Güvenli API anahtarı depolama için Key Vault entegrasyonu
  - Token kullanım takibi ve maliyet tahmini
  - Hız sınırlama ve hata işleme
  - 35-45 dakikalık dağıtım rehberi içeren kapsamlı README
  - 11 üretime hazır dosya (Bicep şablonları, Python uygulama, yapılandırma)
- **📚 Dokümantasyon Egzersizleri**: Yapılandırma kılavuzuna uygulamalı alıştırmalar eklendi:
  - Egzersiz 1: Çok ortamlı yapılandırma (15 dakika)
  - Egzersiz 2: Sır yönetimi pratikleri (10 dakika)
  - Net başarı kriterleri ve doğrulama adımları
- **✅ Dağıtım Doğrulama**: Dağıtım kılavuzuna doğrulama bölümü eklendi:
  - Sağlık kontrol prosedürleri
  - Başarı kriterleri kontrol listesi
  - Tüm dağıtım komutları için beklenen çıktılar
  - Hızlı sorun giderme başvurusu

#### Geliştirildi
- **examples/README.md**: A-seviyesi kaliteye güncellendi ( %93):
  - azure-openai-chat tüm ilgili bölümlere eklendi
  - yerel örnek sayısı 3'ten 4'e güncellendi
  - AI Uygulama Örnekleri tablosuna eklendi
  - Orta düzey kullanıcılar için Hızlı Başlangıç'a entegre edildi
  - Microsoft Foundry Şablonları bölümüne eklendi
  - Karşılaştırma Matrisi ve teknoloji bulma bölümleri güncellendi
- **Dokümantasyon Kalitesi**: docs klasörü genelinde B+ (87%) → A- (92%) iyileşti:
  - Kritik komut örneklerine beklenen çıktılar eklendi
  - Yapılandırma değişiklikleri için doğrulama adımları eklendi
  - Uygulamalı öğrenme pratik egzersizlerle geliştirildi

#### Değiştirildi
- **Öğrenme İlerleyişi**: Orta düzey öğrenenler için AI örneklerinin entegrasyonu iyileştirildi
- **Dokümantasyon Yapısı**: Daha eyleme geçirilebilir egzersizler ve net sonuçlar
- **Doğrulama Süreci**: Kritik iş akışlarına açık başarı kriterleri eklendi

#### İyileştirildi
- **Geliştirici Deneyimi**: Microsoft Foundry Models dağıtımı artık 35-45 dakika sürer (karmaşık alternatifler için 60-90'a karşı)
- **Maliyet Şeffaflığı**: Microsoft Foundry Models örneği için net maliyet tahminleri ($50-200/month)
- **Öğrenme Yolu**: AI geliştiriciler için azure-openai-chat ile net giriş noktası
- **Dokümantasyon Standartları**: Tutarlı beklenen çıktılar ve doğrulama adımları

#### Doğrulandı
- ✅ Microsoft Foundry Models örneği `azd up` ile tam işlevsel
- ✅ Tüm 11 uygulama dosyası sözdizimsel olarak doğru
- ✅ README talimatları gerçek dağıtım deneyimiyle eşleşiyor
- ✅ Dokümantasyon bağlantıları 8+ konumda güncellendi
- ✅ Örnekler dizini 4 yerel örneği doğru yansıtıyor
- ✅ Tablo içinde yinelenen dış bağlantı yok
- ✅ Tüm gezinme referansları doğru

#### Teknik Uygulama
- **Microsoft Foundry Models Mimarisi**: gpt-4.1 + Key Vault + Container Apps deseni
- **Güvenlik**: Managed Identity hazır, sırlar Key Vault'ta
- **İzleme**: Application Insights entegrasyonu
- **Maliyet Yönetimi**: Token takibi ve kullanım optimizasyonu
- **Dağıtım**: Tam kurulum için tek `azd up` komutu

### [v3.6.0] - 2025-11-19

#### Büyük Güncelleme: Container Uygulama Dağıtım Örnekleri
**Bu sürüm, Azure Developer CLI (AZD) kullanılarak kapsamlı, üretime hazır container uygulama dağıtım örneklerini, tam dokümantasyon ve öğrenme yoluna entegrasyonla sunar.**

#### Eklendi
- **🚀 Container Uygulama Örnekleri**: Yeni yerel örnekler `examples/container-app/` içinde:
  - [Ana Rehber](examples/container-app/README.md): Kapsamlı konteyner dağıtımları genel bakışı, hızlı başlangıç, üretim ve gelişmiş kalıplar
  - [Basit Flask API](../../examples/container-app/simple-flask-api): Başlangıç dostu REST API; scale-to-zero, sağlık kontrolleri, izleme ve sorun giderme
  - [Mikroservis Mimarisi](../../examples/container-app/microservices): Üretime hazır çok servisli dağıtım (API Gateway, Product, Order, User, Notification), asenkron mesajlaşma, Service Bus, Cosmos DB, Azure SQL, dağıtık izleme, blue-green/canary dağıtım
- **En İyi Uygulamalar**: Güvenlik, izleme, maliyet optimizasyonu ve CI/CD rehberliği container iş yükleri için
- **Kod Örnekleri**: Tam `azure.yaml`, Bicep şablonları ve çok dilli servis uygulamaları (Python, Node.js, C#, Go)
- **Test & Sorun Giderme**: Uçtan uca test senaryoları, izleme komutları, sorun giderme rehberi

#### Değiştirildi
- **README.md**: Yeni container uygulama örneklerini "Local Examples - Container Applications" altında gösterecek ve bağlayacak şekilde güncellendi
- **examples/README.md**: Container uygulama örneklerini vurgulayacak, karşılaştırma matrisi girdileri ekleyecek ve teknoloji/mimari referanslarını güncelledi
- **Kurs Taslağı & Çalışma Rehberi**: İlgili bölümlerde yeni container uygulama örnekleri ve dağıtım kalıplarına referans verecek şekilde güncellendi

#### Doğrulandı
- ✅ Tüm yeni örnekler `azd up` ile dağıtılabilir ve en iyi uygulamaları takip eder
- ✅ Dokümantasyon çapraz bağlantıları ve gezinme güncellendi
- ✅ Örnekler başlangıçtan ileri senaryolara kadar, üretim mikroservislerini kapsıyor

#### Notlar
- **Kapsam**: Yalnızca İngilizce dokümantasyon ve örnekler
- **Sonraki Adımlar**: Gelecek sürümlerde ek gelişmiş container kalıpları ve CI/CD otomasyonu ile genişletme

### [v3.5.0] - 2025-11-19

#### Ürün Yeniden Markalaşması: Microsoft Foundry
**Bu sürüm, tüm İngilizce dokümantasyonda "Microsoft Foundry" ürün adının kapsamlı bir şekilde güncellenmesini uygular.**

#### Değiştirildi
- **🔄 Ürün Adı Güncellemesi**: "Microsoft Foundry"den "Microsoft Foundry"e tam yeniden markalaşma
  - İngilizce dokümantasyondaki tüm referanslar `docs/` klasöründe güncellendi
  - Klasör yeniden adlandırıldı: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Yeniden adlandırılan dosya: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Toplam: 7 dokümantasyon dosyası genelinde 23 içerik referansı güncellendi

- **📁 Klasör Yapısı Değişiklikleri**:
  - `docs/ai-foundry/` → `docs/microsoft-foundry/` olarak yeniden adlandırıldı
  - Tüm çapraz referanslar yeni klasör yapısını yansıtacak şekilde güncellendi
  - Tüm dokümantasyonda gezinme bağlantıları doğrulandı

- **📄 Dosya Yeniden Adlandırmaları**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tüm dahili bağlantılar yeni dosya adını gösterecek şekilde güncellendi

#### Güncellenen Dosyalar
- **Bölüm Dokümantasyonu** (7 dosya):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 gezinme bağlantısı güncellemesi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ürün adı referansı güncellendi
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Önceki güncellemelerden dolayı zaten Microsoft Foundry kullanıyor
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
- ✅ Yeni klasör yapısıyla tüm gezinme bağlantıları çalışıyor
- ✅ Dosya ve klasör yeniden adlandırmaları başarıyla tamamlandı
- ✅ Bölümler arasındaki çapraz referanslar doğrulandı

#### Notlar
- **Kapsam**: Değişiklikler yalnızca `docs/` klasöründeki İngilizce dokümantasyona uygulandı
- **Çeviriler**: Çeviri klasörleri (`translations/`) bu sürümde güncellenmedi
- **Atölye**: Atölye materyalleri (`workshop/`) bu sürümde güncellenmedi
- **Örnekler**: Örnek dosyalar hâlâ eski isimlendirmeyi referans gösterebilir (gelecek güncellemede ele alınacak)
- **Harici Bağlantılar**: Harici URL'ler ve GitHub depo referansları değişmedi

#### Katkıda Bulunanlar İçin Taşıma Rehberi
Eğer yerel dallarınız veya dokümantasyonunuz eski yapıya referans veriyorsa:
1. Klasör referanslarını güncelleyin: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Dosya referanslarını güncelleyin: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ürün adını değiştirin: "Microsoft Foundry" → "Microsoft Foundry"
4. Tüm dahili dokümantasyon bağlantılarının çalıştığını doğrulayın

---

### [v3.4.0] - 2025-10-24

#### Altyapı Önizleme ve Doğrulama İyileştirmeleri
**Bu sürüm, yeni Azure Developer CLI önizleme özelliği için kapsamlı destek sunar ve atölye kullanıcı deneyimini geliştirir.**

#### Eklendi
- **🧪 azd provision --preview Özellik Belgeleri**: Yeni altyapı önizleme yeteneğinin kapsamlı açıklaması
  - Komut referansı ve kullanım örnekleri hile sayfasında
  - Sağlayıcı rehberinde kullanım senaryoları ve faydalar ile detaylı entegrasyon
  - Daha güvenli dağıtım doğrulaması için pre-flight kontrol entegrasyonu
  - Güvenlik öncelikli dağıtım uygulamalarıyla başlayanlar için kılavuz güncellemeleri
- **🚧 Atölye Durum Bayrağı**: Atölye geliştirme durumunu gösteren profesyonel HTML banner
  - Net kullanıcı iletişimi için inşaat göstergeli gradyan tasarım
  - Şeffaflık için son güncelleme zaman damgası
  - Tüm cihaz türleri için mobil duyarlı tasarım

#### Geliştirildi
- **Altyapı Güvenliği**: Önizleme işlevselliği dağıtım belgelerinin tamamına entegre edildi
- **Dağıtım Öncesi Doğrulama**: Otomatik betikler artık altyapı önizleme testlerini içeriyor
- **Geliştirici İş Akışı**: Komut dizileri en iyi uygulama olarak önizlemeyi içercek şekilde güncellendi
- **Atölye Deneyimi**: Kullanıcılara içerik geliştirme durumu hakkında net beklentiler sunuldu

#### Değiştirildi
- **Dağıtım En İyi Uygulamaları**: Önizleme-öncelikli iş akışı artık önerilen yaklaşım
- **Dokümantasyon Akışı**: Altyapı doğrulaması öğrenme sürecinde daha erken bir konuma taşındı
- **Atölye Sunumu**: Gelişim zaman çizelgesi ile profesyonel durum iletişimi eklendi

#### İyileştirildi
- **Güvenlik-Öncelikli Yaklaşım**: Altyapı değişiklikleri dağıtımdan önce doğrulanabilir hale geldi
- **Ekip İşbirliği**: Önizleme sonuçları inceleme ve onay için paylaşılabilir
- **Maliyet Bilinci**: Sağlayıcı öncesi kaynak maliyetleri hakkında daha iyi farkındalık
- **Risk Azaltma**: Önceden doğrulama ile dağıtım hataları azaltıldı

#### Teknik Uygulama
- **Çoklu Belge Entegrasyonu**: Önizleme özelliği 4 ana dosyada belgelenmiştir
- **Komut Kalıpları**: Belgelerde tutarlı sözdizimi ve örnekler
- **En İyi Uygulama Entegrasyonu**: Önizleme, doğrulama iş akışlarına ve betiklere dahil edildi
- **Görsel Göstergeler**: Yeni özelliğin keşfedilebilirliği için NET işaretlemeleri

#### Atölye Altyapısı
- **Durum İletişimi**: Gradyan stilinde profesyonel HTML banner
- **Kullanıcı Deneyimi**: Geliştirme durumu net olarak belirtilerek kafa karışıklığı önlenir
- **Profesyonel Sunum**: Depo güvenilirliğini korurken beklentileri ayarlar
- **Zaman Çizelgesi Şeffaflığı**: Sorumluluk için Ekim 2025 son güncelleme zaman damgası

### [v3.3.0] - 2025-09-24

#### Geliştirilmiş Atölye Materyalleri ve Etkileşimli Öğrenme Deneyimi
**Bu sürüm, tarayıcı tabanlı etkileşimli rehberler ve yapılandırılmış öğrenme yollarıyla kapsamlı atölye materyalleri sunar.**

#### Eklendi
- **🎥 Etkileşimli Atölye Rehberi**: MkDocs önizleme yeteneği ile tarayıcı tabanlı atölye deneyimi
- **📝 Yapılandırılmış Atölye Talimatları**: Keşiften özelleştirmeye 7 adımlı rehber öğrenme yolu
  - 0-Introduction: Atölye genel bakışı ve kurulum
  - 1-Select-AI-Template: Şablon keşfi ve seçim süreci
  - 2-Validate-AI-Template: Dağıtım ve doğrulama prosedürleri
  - 3-Deconstruct-AI-Template: Şablon mimarisinin anlaşılması
  - 4-Configure-AI-Template: Yapılandırma ve özelleştirme
  - 5-Customize-AI-Template: İleri düzey değişiklikler ve yinelemeler
  - 6-Teardown-Infrastructure: Temizlik ve kaynak yönetimi
  - 7-Wrap-up: Özet ve sonraki adımlar
- **🛠️ Atölye Araçları**: Geliştirilmiş öğrenme deneyimi için Material temalı MkDocs yapılandırması
- **🎯 Uygulamalı Öğrenme Yolu**: 3 adımlı metodoloji (Keşif → Dağıtım → Özelleştirme)
- **📱 GitHub Codespaces Entegrasyonu**: Sorunsuz geliştirme ortamı kurulumu

#### Geliştirildi
- **AI Atölye Laboratuvarı**: 2-3 saatlik kapsamlı yapılandırılmış öğrenme deneyimi ile genişletildi
- **Atölye Dokümantasyonu**: Gezinti ve görsel yardımcılarla profesyonel sunum
- **Öğrenme İlerlemesi**: Şablon seçiminden üretime dağıtıma kadar net adım adım rehberlik
- **Geliştirici Deneyimi**: Düzenlenmiş iş akışları için entegre araçlar

#### İyileştirildi
- **Erişilebilirlik**: Arama, kopyala işlevi ve tema anahtarı ile tarayıcı tabanlı arayüz
- **Kendi Hızında Öğrenme**: Farklı öğrenme hızlarına uyum sağlayan esnek atölye yapısı
- **Pratik Uygulama**: Gerçek dünya AI şablonu dağıtım senaryoları
- **Topluluk Entegrasyonu**: Atölye desteği ve işbirliği için Discord entegrasyonu

#### Atölye Özellikleri
- **Yerleşik Arama**: Hızlı anahtar kelime ve ders keşfi
- **Kod Bloklarını Kopyala**: Tüm kod örnekleri için hover-to-copy işlevselliği
- **Tema Anahtarı**: Farklı tercihler için karanlık/açık mod desteği
- **Görsel Varlıklar**: Gelişmiş anlayış için ekran görüntüleri ve diyagramlar
- **Yardım Entegrasyonu**: Topluluk desteği için doğrudan Discord erişimi

### [v3.2.0] - 2025-09-17

#### Büyük Gezinme Yeniden Yapılandırması ve Bölüm Tabanlı Öğrenme Sistemi
**Bu sürüm, tüm depo genelinde geliştirilmiş gezinme ile kapsamlı bölüm tabanlı öğrenme yapısı sunar.**

#### Eklendi
- **📚 Bölüm Tabanlı Öğrenme Sistemi**: Tüm kursu 8 ilerleyici öğrenme bölümüne yeniden yapılandırıldı
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Kapsamlı Gezinme Sistemi**: Tüm dokümantasyonda tutarlı gezinme başlıkları ve altbilgiler
- **🎯 İlerleme Takibi**: Kurs tamamlama kontrol listesi ve öğrenme doğrulama sistemi
- **🗺️ Öğrenme Yolu Rehberliği**: Farklı deneyim seviyeleri ve hedefler için net giriş noktaları
- **🔗 Çapraz Referans Gezinmesi**: İlgili bölümler ve önkoşullar açıkça bağlı

#### Geliştirildi
- **README Yapısı**: Bölüm bazlı organizasyon ile yapılandırılmış öğrenme platformuna dönüştürüldü
- **Dokümantasyon Gezintisi**: Her sayfa artık bölüm bağlamı ve ilerleme rehberliği içeriyor
- **Şablon Organizasyonu**: Örnekler ve şablonlar uygun öğrenme bölümlerine eşlendi
- **Kaynak Entegrasyonu**: Hile sayfaları, SSS ve çalışma kılavuzları ilgili bölümlere bağlandı
- **Atölye Entegrasyonu**: Uygulamalı laboratuvarlar birden çok bölüm öğrenme hedefiyle eşlendi

#### Değiştirildi
- **Öğrenme İlerleyişi**: Doğrusal dokümantasyondan esnek bölüm tabanlı öğrenmeye geçirildi
- **Yapılandırma Yerleşimi**: Daha iyi öğrenme akışı için yapılandırma rehberi Bölüm 3 olarak yeniden konumlandırıldı
- **AI İçerik Entegrasyonu**: AI'ya özel içerik öğrenme yolculuğu boyunca daha iyi entegre edildi
- **Üretim İçeriği**: İleri düzey kalıplar Kurumsal öğreniciler için Bölüm 8'de konsolide edildi

#### İyileştirildi
- **Kullanıcı Deneyimi**: Net gezinme kırıntıları ve bölüm ilerleme göstergeleri
- **Erişilebilirlik**: Kolay kurs dolaşımı için tutarlı gezinme örüntüleri
- **Profesyonel Sunum**: Akademik ve kurumsal eğitim için uygun üniversite stili kurs yapısı
- **Öğrenme Verimliliği**: Geliştirilmiş organizasyon sayesinde ilgili içeriği bulma süresi azaldı

#### Teknik Uygulama
- **Gezinme Başlıkları**: 40+ doküman dosyasında standartlaştırılmış bölüm gezinmesi
- **Altbilgi Gezinmesi**: Tutarlı ilerleme rehberliği ve bölüm tamamlama göstergeleri
- **Çapraz Bağlantılama**: İlgili kavramları birbirine bağlayan kapsamlı dahili bağlantı sistemi
- **Bölüm Eşlemesi**: Şablonlar ve örnekler öğrenme hedefleriyle net şekilde ilişkilendirildi

#### Çalışma Kılavuzu Geliştirmesi
- **📚 Kapsamlı Öğrenme Hedefleri**: Çalışma kılavuzu 8-bölümlü sisteme uygun şekilde yeniden yapılandırıldı
- **🎯 Bölüm Bazlı Değerlendirme**: Her bölüm belirli öğrenme hedefleri ve pratik egzersizler içerir
- **📋 İlerleme Takibi**: Ölçülebilir çıktılar ve tamamlama kontrol listeleriyle haftalık öğrenme takvimi
- **❓ Değerlendirme Soruları**: Her bölüm için profesyonel sonuçlar hedefleyen bilgi doğrulama soruları
- **🛠️ Pratik Egzersizler**: Gerçek dağıtım senaryoları ve hata ayıklama ile uygulamalı aktiviteler
- **📊 Beceri İlerlemesi**: Temel kavramlardan kurumsal kalıplara kadar net bir ilerleme yolu ve kariyer odaklı gelişim
- **🎓 Sertifikasyon Çerçevesi**: Profesyonel gelişim çıktıları ve topluluk tanıma sistemi
- **⏱️ Zaman Çizelgesi Yönetimi**: Kilit doğrulamalarla yapılandırılmış 10 haftalık öğrenme planı

### [v3.1.0] - 2025-09-17

#### Geliştirilmiş Çok Ajanlı AI Çözümleri
**Bu sürüm, çok ajanlı perakende çözümünü daha iyi ajan adlandırması ve geliştirilmiş dokümantasyon ile iyileştirir.**

#### Değiştirildi
- **Çok Ajanlı Terminoloji**: Perakende çok ajanlı çözümünde daha net anlayış için "Cora agent" yerine "Customer agent" kullanıldı
- **Ajan Mimarisi**: Tüm dokümantasyon, ARM şablonları ve kod örnekleri tutarlı "Customer agent" adlandırmasını kullanacak şekilde güncellendi
- **Yapılandırma Örnekleri**: Güncellenmiş adlandırma standartları ile modern ajan yapılandırma kalıpları
- **Dokümantasyon Tutarlılığı**: Tüm referansların profesyonel, tanımlayıcı ajan adlarını kullanması sağlandı

#### Geliştirildi
- **ARM Şablon Paketi**: Customer agent referansları ile retail-multiagent-arm-template güncellendi
- **Mimari Diyagramlar**: Güncellenmiş ajan adlandırmasıyla Mermaid diyagramları yenilendi
- **Kod Örnekleri**: Python sınıfları ve uygulama örnekleri artık CustomerAgent adlandırmasını kullanıyor
- **Ortam Değişkenleri**: Tüm dağıtım betikleri CUSTOMER_AGENT_NAME konvansiyonunu kullanacak şekilde güncellendi

#### İyileştirildi
- **Geliştirici Deneyimi**: Dokümantasyonda daha net ajan rollerı ve sorumlulukları
- **Üretime Hazırlık**: Kurumsal adlandırma konvansiyonlarıyla daha iyi uyum
- **Öğrenme Materyalleri**: Eğitim amaçlı daha sezgisel ajan adlandırması
- **Şablon Kullanılabilirliği**: Ajan fonksiyonlarının ve dağıtım kalıplarının anlaşılması basitleşti

#### Teknik Detaylar
- Mermaid mimari diyagramları CustomerAgent referansları ile güncellendi
- Python örneklerinde CoraAgent sınıf adları CustomerAgent ile değiştirildi
- ARM şablon JSON konfigürasyonları "customer" ajan türünü kullanacak şekilde değiştirildi
- Ortam değişkenleri CORA_AGENT_*'den CUSTOMER_AGENT_* desenine güncellendi
- Tüm dağıtım komutları ve konteyner konfigürasyonları yenilendi

### [v3.0.0] - 2025-09-12

#### Büyük Değişiklikler - AI Geliştirici Odaklı ve Microsoft Foundry Entegrasyonu
**Bu sürüm, depoyu Microsoft Foundry entegrasyonlu kapsamlı bir AI odaklı öğrenme kaynağına dönüştürür.**

#### Eklendi
- **🤖 AI-İlk Öğrenme Yolu**: AI geliştiricileri ve mühendisleri önceliklendiren tam yeniden yapılandırma
- **Microsoft Foundry Entegrasyon Kılavuzu**: AZD'yi Microsoft Foundry servislerine bağlama için kapsamlı dokümantasyon
- **AI Modeli Dağıtım Kalıpları**: Model seçimi, yapılandırma ve üretime dağıtım stratejilerini kapsayan detaylı rehber
- **AI Workshop Lab**: AZD dağıtılabilir çözümlere dönüştürme için 2-3 saatlik uygulamalı atölye
- **Production AI Best Practices**: AI iş yüklerini ölçeklendirme, izleme ve güvence altına alma için kurumsal seviyeye hazır desenler
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry Modelleri, Cognitive Services ve AI dağıtım sorunları için kapsamlı sorun giderme
- **AI Template Gallery**: Karmaşıklık derecelendirmeleriyle öne çıkan Microsoft Foundry şablon koleksiyonu
- **Workshop Materials**: Uygulamalı laboratuvarlar ve referans materyalleri içeren eksiksiz atölye yapısı

#### Geliştirilmiş
- **README Structure**: Microsoft Foundry Discord'tan alınan %45 topluluk ilgi verisi ile AI geliştirici odaklı
- **Learning Paths**: Öğrenciler ve DevOps mühendisleri için geleneksel yolların yanında özel AI geliştirici yolculuğu
- **Template Recommendations**: Azure-search-openai-demo, contoso-chat ve openai-chat-app-quickstart dahil öne çıkan AI şablonları
- **Community Integration**: AI'ye özel kanallar ve tartışmalarla geliştirilmiş Discord topluluk desteği

#### Güvenlik ve Üretim Odaklı
- **Managed Identity Patterns**: AI'ye özgü kimlik doğrulama ve güvenlik yapılandırmaları
- **Cost Optimization**: AI iş yükleri için token kullanımı takibi ve bütçe kontrolleri
- **Multi-Region Deployment**: Küresel AI uygulama dağıtımı için stratejiler
- **Performance Monitoring**: AI'ye özgü metrikler ve Application Insights entegrasyonu

#### Dokümantasyon Kalitesi
- **Linear Course Structure**: Başlangıçtan ileri düzey AI dağıtım desenlerine mantıklı ilerleme
- **Validated URLs**: Tüm harici depo bağlantıları doğrulandı ve erişilebilir
- **Complete Reference**: Tüm dahili dokümantasyon bağlantıları doğrulandı ve işlevsel
- **Production Ready**: Gerçek dünya örnekleriyle kurumsal dağıtım desenleri

### [v2.0.0] - 2025-09-09

#### Büyük Değişiklikler - Depo Yeniden Yapılandırması ve Profesyonel İyileştirmeler
**Bu sürüm, depo yapısında ve içerik sunumunda önemli bir revizyonu temsil eder.**

#### Eklendi
- **Structured Learning Framework**: Tüm dokümantasyon sayfaları artık Giriş, Öğrenme Hedefleri ve Öğrenme Çıktıları bölümlerini içerir
- **Navigation System**: Rehberli öğrenme ilerlemesi için tüm dokümantasyonda Önceki/Sonraki ders bağlantıları eklendi
- **Study Guide**: Öğrenme hedefleri, uygulama alıştırmaları ve değerlendirme materyalleri içeren kapsamlı study-guide.md
- **Professional Presentation**: Erişilebilirliği ve profesyonel görünümü iyileştirmek için tüm emoji simgeleri kaldırıldı
- **Enhanced Content Structure**: Öğrenme materyallerinin organizasyonu ve akışı geliştirildi

#### Değiştirildi
- **Documentation Format**: Tüm dokümantasyon tutarlı, öğrenme odaklı yapıyla standartlaştırıldı
- **Navigation Flow**: Tüm öğrenme materyalleri boyunca mantıksal ilerleme uygulandı
- **Content Presentation**: Açık, profesyonel format lehine dekoratif öğeler kaldırıldı
- **Link Structure**: Yeni gezinme sistemini destekleyecek şekilde tüm dahili bağlantılar güncellendi

#### İyileştirildi
- **Accessibility**: Ekran okuyucu uyumluluğunu artırmak için emoji bağımlılıkları kaldırıldı
- **Professional Appearance**: Kurumsal öğrenme için uygun temiz, akademik tarzda sunum
- **Learning Experience**: Her ders için net hedefler ve çıktılarla yapılandırılmış yaklaşım
- **Content Organization**: İlişkili konular arasında daha iyi mantıksal akış ve bağlantı

### [v1.0.0] - 2025-09-09

#### İlk Sürüm - Kapsamlı AZD Öğrenme Deposu

#### Eklendi
- **Core Documentation Structure**
  - Eksiksiz başlangıç kılavuzu serisi
  - Kapsamlı dağıtım ve sağlayım dokümantasyonu
  - Detaylı sorun giderme kaynakları ve hata ayıklama kılavuzları
  - Ön dağıtım doğrulama araçları ve prosedürleri

- **Getting Started Module**
  - AZD Temelleri: Temel kavramlar ve terminoloji
  - Kurulum Kılavuzu: Platforma özel kurulum talimatları
  - Yapılandırma Kılavuzu: Ortam kurulumu ve kimlik doğrulama
  - İlk Proje Eğitimi: Adım adım uygulamalı öğrenme

- **Deployment and Provisioning Module**
  - Dağıtım Kılavuzu: Tam iş akışı dokümantasyonu
  - Sağlayım Kılavuzu: Bicep ile Altyapı olarak Kod
  - Üretim dağıtımları için en iyi uygulamalar
  - Çok-servisli mimari desenleri

- **Pre-deployment Validation Module**
  - Kapasite Planlaması: Azure kaynak kullanılabilirliği doğrulama
  - SKU Seçimi: Kapsamlı servis katmanı rehberliği
  - Uçuş Öncesi Kontroller: Otomatik doğrulama betikleri (PowerShell ve Bash)
  - Maliyet tahmini ve bütçe planlama araçları

- **Troubleshooting Module**
  - Yaygın Sorunlar: Sık karşılaşılan problemler ve çözümleri
  - Hata Ayıklama Kılavuzu: Sistematik sorun giderme metodolojileri
  - Gelişmiş tanılama teknikleri ve araçlar
  - Performans izleme ve optimizasyon

- **Resources and References**
  - Komut Hile Sayfası: Temel komutlar için hızlı başvuru
  - Sözlük: Kapsamlı terim ve kısaltma tanımları
  - SSS: Yaygın sorulara detaylı cevaplar
  - Harici kaynak bağlantıları ve topluluk bağlantıları

- **Examples and Templates**
  - Basit Web Uygulaması örneği
  - Statik Web Sitesi dağıtım şablonu
  - Konteyner Uygulama yapılandırması
  - Veritabanı entegrasyon desenleri
  - Mikroservis mimarisi örnekleri
  - Sunucusuz fonksiyon uygulamaları

#### Özellikler
- **Multi-Platform Support**: Windows, macOS ve Linux için kurulum ve yapılandırma kılavuzları
- **Multiple Skill Levels**: İçerik öğrencilerden profesyonel geliştiricilere kadar tasarlandı
- **Practical Focus**: Uygulamalı örnekler ve gerçek dünya senaryoları
- **Comprehensive Coverage**: Temel kavramlardan gelişmiş kurumsal desenlere kadar
- **Security-First Approach**: Güvenlik en iyi uygulamaları her yerde entegre edildi
- **Cost Optimization**: Maliyet-etkin dağıtımlar ve kaynak yönetimi için rehberlik

#### Dokümantasyon Kalitesi
- **Detailed Code Examples**: Pratik, test edilmiş kod örnekleri
- **Step-by-Step Instructions**: Net, uygulanabilir rehberlik
- **Comprehensive Error Handling**: Yaygın sorunlar için sorun giderme
- **Best Practices Integration**: Sektör standartları ve önerileri
- **Version Compatibility**: En son Azure hizmetleri ve azd özellikleri ile güncel

## Planlanmış Gelecek İyileştirmeler

### Sürüm 3.1.0 (Planlandı)
#### AI Platform Genişletmesi
- **Multi-Model Support**: Hugging Face, Azure Machine Learning ve özel modeller için entegrasyon desenleri
- **AI Agent Frameworks**: LangChain, Semantic Kernel ve AutoGen dağıtımları için şablonlar
- **Advanced RAG Patterns**: Azure AI Search'in ötesinde vektör veritabanı seçenekleri (Pinecone, Weaviate vb.)
- **AI Observability**: Model performansı, token kullanımı ve yanıt kalitesi için geliştirilmiş izleme

#### Geliştirici Deneyimi
- **VS Code Extension**: Entegre AZD + Microsoft Foundry geliştirme deneyimi
- **GitHub Copilot Integration**: AI destekli AZD şablon oluşturma
- **Interactive Tutorials**: AI senaryoları için otomatik doğrulamaya sahip uygulamalı kodlama alıştırmaları
- **Video Content**: AI dağıtımlarına odaklanan görsel öğrenenler için ek video eğitimleri

### Sürüm 4.0.0 (Planlandı)
#### Kurumsal AI Desenleri
- **Governance Framework**: AI model yönetişimi, uyumluluk ve denetim izleri
- **Multi-Tenant AI**: İzole AI hizmetleriyle birden fazla müşteriye hizmet verme desenleri
- **Edge AI Deployment**: Azure IoT Edge ve konteyner örnekleriyle entegrasyon
- **Hybrid Cloud AI**: AI iş yükleri için çoklu bulut ve hibrit dağıtım desenleri

#### Gelişmiş Özellikler
- **AI Pipeline Automation**: Azure Machine Learning boru hatları ile MLOps entegrasyonu
- **Advanced Security**: Sıfır güven deseni, özel uç noktalar ve gelişmiş tehdit koruması
- **Performance Optimization**: Yüksek verimli AI uygulamaları için gelişmiş ayarlama ve ölçeklendirme stratejileri
- **Global Distribution**: AI uygulamaları için içerik teslimi ve kenar önbellekleme desenleri

### Sürüm 3.0.0 (Planlandı) - Mevcut Sürüm Tarafından Geçersiz Kılındı
#### Önerilen Eklemeler - Artık v3.0.0'te Uygulandı
- ✅ **AI-Odaklı İçerik**: Kapsamlı Microsoft Foundry entegrasyonu (Tamamlandı)
- ✅ **Etkileşimli Eğitimler**: Uygulamalı AI atölye laboratuvarı (Tamamlandı)
- ✅ **Gelişmiş Güvenlik Modülü**: AI'ye özgü güvenlik desenleri (Tamamlandı)
- ✅ **Performans Optimizasyonu**: AI iş yükü ayarlama stratejileri (Tamamlandı)

### Sürüm 2.1.0 (Planlandı) - kısmen v3.0.0'te Uygulandı
#### Küçük İyileştirmeler - Bazıları Mevcut Sürümde Tamamlandı
- ✅ **Ek Örnekler**: AI odaklı dağıtım senaryoları (Tamamlandı)
- ✅ **Genişletilmiş SSS**: AI'ye özgü sorular ve sorun giderme (Tamamlandı)
- **Tool Integration**: Geliştirilmiş IDE ve editör entegrasyon kılavuzları
- ✅ **Monitoring Expansion**: AI'ye özgü izleme ve alarmlama desenleri (Tamamlandı)

#### Gelecek Sürüm İçin Hâlâ Planlanmış
- **Mobile-Friendly Documentation**: Mobil öğrenme için duyarlı tasarım
- **Offline Access**: İndirilebilir dokümantasyon paketleri
- **Enhanced IDE Integration**: AZD + AI iş akışları için VS Code uzantısı
- **Community Dashboard**: Gerçek zamanlı topluluk metrikleri ve katkı izleme

## Değişiklik Günlüğüne Katkıda Bulunma

### Değişiklik Bildirme
Bu depoya katkıda bulunurken, lütfen değişiklik günlüğü girdilerinin şunları içerdiğinden emin olun:

1. **Sürüm Numarası**: Semantik versiyonlamayı takip ederek (major.minor.patch)
2. **Tarih**: Yayın veya güncelleme tarihi YYYY-MM-DD formatında
3. **Kategori**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Açık Açıklama**: Yapılan değişikliğin özlü açıklaması
5. **Etkisinin Değerlendirilmesi**: Değişikliklerin mevcut kullanıcıları nasıl etkilediği

### Değişiklik Kategorileri

#### Eklendi
- Yeni özellikler, dokümantasyon bölümleri veya yetenekler
- Yeni örnekler, şablonlar veya öğrenme kaynakları
- Ek araçlar, betikler veya yardımcı programlar

#### Değiştirildi
- Mevcut işlevsellik veya dokümantasyondaki değişiklikler
- Netlik veya doğruluk artırmak için güncellemeler
- İçerik veya organizasyonun yeniden yapılandırılması

#### Kullanım Dışı Bırakıldı
- Aşamalı olarak kaldırılan özellikler veya yaklaşımlar
- Kaldırılma planlanan dokümantasyon bölümleri
- Daha iyi alternatifleri olan yöntemler

#### Kaldırıldı
- Artık ilgili olmayan özellikler, dokümantasyon veya örnekler
- Eski bilgiler veya kullanım dışı bırakılan yaklaşımlar
- Yinelenen veya birleştirilmiş içerik

#### Düzeltildi
- Dokümantasyon veya koddaki hataların düzeltmeleri
- Rapor edilen sorunların veya problemlerin çözümü
- Doğruluk veya işlevsellik iyileştirmeleri

#### Güvenlik
- Güvenlikle ilgili iyileştirmeler veya düzeltmeler
- Güvenlik en iyi uygulamalarına güncellemeler
- Güvenlik açıklarının giderilmesi

### Semantik Versiyonlama Rehberi

#### Büyük Sürüm (X.0.0)
- Kullanıcı müdahalesi gerektiren geriye dönük uyumsuz değişiklikler
- İçerik veya organizasyonun önemli ölçüde yeniden yapılandırılması
- Temel yaklaşımı veya metodolojiyi değiştiren değişiklikler

#### Küçük Sürüm (X.Y.0)
- Yeni özellikler veya içerik eklemeleri
- Geriye dönük uyumluluğu koruyan geliştirmeler
- Ek örnekler, araçlar veya kaynaklar

#### Yama Sürümü (X.Y.Z)
- Hata düzeltmeleri ve düzeltmeler
- Mevcut içeriğe yapılan küçük iyileştirmeler
- Açıklamalar ve küçük geliştirmeler

## Topluluk Geri Bildirimi ve Öneriler

Bu öğrenme kaynağını geliştirmek için topluluk geri bildirimlerini aktif olarak teşvik ediyoruz:

### Geri Bildirim Nasıl Sağlanır
- **GitHub Issues**: Sorunları bildirin veya iyileştirme önerin (AI'ye özgü sorunlar memnuniyetle karşılanır)
- **Discord Discussions**: Fikirleri paylaşın ve Microsoft Foundry topluluğuyla etkileşime geçin
- **Pull Requests**: İçeriğe doğrudan iyileştirmeler katkıda bulunun, özellikle AI şablonları ve kılavuzları
- **Microsoft Foundry Discord**: AZD + AI tartışmaları için #Azure kanalına katılın
- **Community Forums**: Daha geniş Azure geliştirici tartışmalarına katılın

### Geri Bildirim Kategorileri
- **AI Content Accuracy**: AI servis entegrasyonu ve dağıtım bilgilerine yönelik düzeltmeler
- **Learning Experience**: İyileştirilmiş AI geliştirici öğrenme akışı için öneriler
- **Missing AI Content**: Ek AI şablonları, desenler veya örnekler talepleri
- **Accessibility**: Çeşitli öğrenme ihtiyaçları için iyileştirmeler
- **AI Tool Integration**: Daha iyi AI geliştirme iş akışı entegrasyonu için öneriler
- **Production AI Patterns**: Kurumsal AI dağıtım deseni talepleri

### Yanıt Taahhüdü
- **Issue Response**: Bildirilen sorunlar için 48 saat içinde
- **Feature Requests**: Bir hafta içinde değerlendirme
- **Community Contributions**: Bir hafta içinde inceleme
- **Security Issues**: Hızlandırılmış yanıt ile öncelikli işlem

## Bakım Takvimi

### Düzenli Güncellemeler
- **Monthly Reviews**: İçerik doğruluğu ve bağlantı doğrulaması
- **Quarterly Updates**: Önemli içerik eklemeleri ve iyileştirmeler
- **Semi-Annual Reviews**: Kapsamlı yeniden yapılandırma ve iyileştirmeler
- **Annual Releases**: Önemli iyileştirmelerle büyük sürüm güncellemeleri

### İzleme ve Kalite Güvencesi
- **Automated Testing**: Kod örnekleri ve bağlantıların düzenli doğrulanması
- **Community Feedback Integration**: Kullanıcı önerilerinin düzenli olarak dahil edilmesi
- **Technology Updates**: En son Azure hizmetleri ve azd sürümleri ile uyum
- **Accessibility Audits**: Kapsayıcı tasarım ilkeleri için düzenli inceleme

## Sürüm Destek Politikası

### Mevcut Sürüm Desteği
- **Latest Major Version**: Düzenli güncellemelerle tam destek
- **Previous Major Version**: 12 ay boyunca güvenlik güncellemeleri ve kritik düzeltmeler
- **Legacy Versions**: Yalnızca topluluk desteği, resmi güncelleme yok

### Geçiş Rehberliği
Büyük sürümler yayınlandığında, şunları sağlarız:
- **Migration Guides**: Adım adım geçiş talimatları
- **Compatibility Notes**: Geriye dönük uyumsuz değişikliklerle ilgili ayrıntılar
- **Tool Support**: Geçişe yardımcı betikler veya yardımcı programlar
- **Community Support**: Geçiş soruları için ayrılmış forumlar

---

**Gezinme**
- **Önceki Ders**: [Çalışma Rehberi](resources/study-guide.md)
- **Sonraki Ders**: [Ana README](README.md) sayfasına geri dön

**Güncel Kalın**: Öğrenme materyallerine yönelik yeni sürümler ve önemli güncellemeler hakkında bildirimler için bu depoyu izleyin.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->