# Değişiklik Kaydı - AZD Yeni Başlayanlar İçin

## Giriş

Bu değişiklik kaydı, AZD Yeni Başlayanlar deposundaki tüm önemli değişiklikleri, güncellemeleri ve iyileştirmeleri belgelendirir. Semantik sürümleme prensiplerine uyar ve kullanıcıların sürümler arasındaki değişiklikleri anlamalarına yardımcı olmak için bu kaydı tutarız.

## Öğrenme Hedefleri

Bu değişiklik kaydını inceleyerek:
- Yeni özellikler ve içerik eklemeleri hakkında güncel kalacaksınız
- Mevcut belgelerde yapılan iyileştirmeleri anlayacaksınız
- Doğruluğu sağlamak için hata düzeltmelerini ve düzeltmeleri takip edeceksiniz
- Öğrenme materyallerinin zaman içindeki evrimini takip edeceksiniz

## Öğrenme Çıktıları

Değişiklik kaydı girdilerini inceledikten sonra:
- Öğrenme için mevcut yeni içerik ve kaynakları tanımlayabileceksiniz
- Hangi bölümlerin güncellendiğini veya iyileştirildiğini anlayabileceksiniz
- En güncel materyallere dayanarak öğrenme yolunuzu planlayabileceksiniz
- Gelecekteki iyileştirmeler için geri bildirim ve önerilerde bulunabileceksiniz

## Sürüm Geçmişi

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Güncellemesi: Sürüm Geçerliliği Güncellemesi
**Bu sürüm, kursu `azd` `1.27.1` (Temmuz 2026, en son kararlı sürüm) ve mevcut önizleme AI ajan eklentisi `azure.ai.agents` `1.0.0-beta.5` ile yeniden doğrular; 1.26.0, 1.27.0 ve 1.27.1 sürümlerinden sonra her "doğrulandı" afişini güncel hale getirir.**

#### Değiştirilenler
- **✅ Doğrulama tabanı güncellendi** `azd 1.25.6` (Haziran 2026) sürümünden `azd 1.27.1` (Temmuz 2026) sürümüne tüm kök README, tüm bölüm README dosyaları, Bölüm 1 dev-container dersi (sabitlenmiş sürüm örnekleri dahil), Bölüm 4 özel şablonlar dersi, Bölüm 5 çoklu ajan dersi ve atölye dokümanlarında
- **🤖 Bölüm 2 tabanı yenilendi** `azd 1.23.12` (Mart 2026) sürümünden `azd 1.27.1` sürümüne `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` ve `microsoft-foundry-integration.md` dosyalarında; doğrulama notu tarihleri 2026-07-13 olarak güncellendi
- **🧩 AI ajan eklentisi yükseltildi** Bölüm 2 README ve `agents.md` dosyalarında `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` sürümlerinden mevcut `1.0.0-beta.5` sürümüne
- **🧪 Atölye doğrulama örneği** (`azd version` çıktısı) `1.27.1` sürümüne güncellendi

#### İlgili azd sürümleri hakkında notlar (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Azure Functions için Flex Consumption desteği, `azd config sub-filter` kiracı bazında abonelik filtreleri, kendi içinde bağımsız eklenti paketleri (`azd x pack --bundle`) ve `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Azure AI Foundry projeleri/ajanlarının doğrudan `azure.yaml`'da modellenmesi (Bicep'siz/Terraform'suz başlatma), App Service için konteyner dağıtımı desteği (`host: appservice` + `language: docker`), `azd extension` komutları için doğrudan `-s/--source`, ve `azd tool uninstall`
- **1.27.1 (2026-07-09):** `azd extension install` için `--no-dependencies` bayrağı, varsayılan olarak katalog/kota istemlerinden çıkarılan kullanım dışı modeller ve çeşitli hata düzeltmeleri

#### Güncellenen Dosyalar
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Yeni Başlayan Boşluk Doldurma #2: Şablon Yazımı, Dev Konteynerler, Pulumi, Azure DevOps, Hizmet İlkeleri ve Daha Fazlası
**Bu sürüm, azd-kapsam analiziyle ortaya çıkan kalan ara boşlukları kapatır: kendi şablonunuzu nasıl yazıp yayınlayacağınız, yeniden üretilebilir dev-container/Codespaces ortamları, Pulumi altyapı sağlayıcısı, Azure DevOps CI/CD anlatımı, hizmet-prensip doğrulaması, host seçimi rehberi (AKS/Spring Apps), `azd restore`/`azd package` açıklamaları, kanca hata işleme ve takım/paylaşılan ortam uygulamaları.**

#### Eklendi
- **🧱 Yeni Bölüm 4 dersi** `docs/chapter-04-infrastructure/custom-templates.md` — kendi azd şablonunuzu yazmak: gereken yapı (`azure.yaml`, `infra/`, `src/`), `metadata.template` alanı, altyapıyı `uniqueString()` kaynak jetonu ve `azd-env-name` etiketi ile parametrelendirme, yerelde test etme `azd init --template <local-path>` ile, GitHub'a yayınlama ve Awesome AZD galerisine gönderme
- **📦 Yeni Bölüm 1 dersi** `docs/chapter-01-foundation/dev-containers.md` — Dev Containers ve GitHub Codespaces ile yeniden üretilebilir azd ortamları: resmi `ghcr.io/azure/azure-dev/azd` özelliğini kullanan minimal `.devcontainer/devcontainer.json`, dil özgü özellikler, konteyner hostları için `docker-in-docker` ve uzak oturum açma için `azd auth login --use-device-code`
- **🧩 Pulumi azd ile** bölümü `docs/chapter-04-infrastructure/provisioning.md` içinde — `infra.provider: pulumi`, Pulumi klasör düzeni, azd ortamlarıyla eşlenen stack’ler, gereken çıktılar/etiketlendirme ve aynı `azd up` / `azd down` iş akışı
- **🎯 Host seçimi rehberi** `docs/chapter-04-infrastructure/provisioning.md` içinde — yeni başlayan dostu `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` ve `springapp` karşılaştırması, AKS veya Azure Spring Apps seçimi için rehberlik
- **🛠️ Azure DevOps CI/CD anlatımı** `docs/chapter-08-production/production-ai-practices.md` içinde — `azd pipeline config --provider azdo`, yük iş yükü kimlik federasyonu (OIDC) ile servis bağlantısı, oluşturulan `azure-dev.yml` dosyası ve değişken grubu ayarları
- **🔑 Hizmet İlkeleri (Desen 4)** `docs/chapter-03-configuration/authsecurity.md` dosyasına eklendi — `az ad sp create-for-rbac`, istemci sırrı ile etkileşimsiz `azd auth login` ve federasyonlu/OIDC kimlik bilgileri, ne zaman kullanılacağı ve güvenli kimlik bilgisi saklama
- **🪝 Kanca hata işleme** alt bölümü `docs/chapter-04-infrastructure/deployment-guide.md` içinde — çıkış kodları ve `set -e`, `continueOnError`, kancaları izole şekilde test etme `azd hooks run` ile, OS’ye özgü kabuklar ve `--debug`
- **👥 Takım / paylaşılan ortamlar** bölümü `docs/chapter-03-configuration/configuration.md` içinde — `.azure/` içeriği, gitignore edilecekler, geliştirici bazlı ortamlar, `azd env list`/`select` ve CI/CD’de ortam değerlerini sağlama
- **🧰 `azd restore` ve genişletilmiş `azd package`** açıklamaları `resources/cheat-sheet.md` içinde — bağımlılıkları geri yükleme ve dağıtılabilir bir artefakt oluşturma (dağıtmadan)

#### Değiştirilenler
- **🧭 Bölüm 4 ders tablosu** yeni "Kendi Şablonunu Yazma" dersini (Ders 3) içerecek şekilde güncellendi
- **🧭 Bölüm 1 ders tablosu** yeni "Dev Containers ve Codespaces" dersini (Ders 5) eklemek için güncellendi; gezinme altbilgileri `bring-your-own-app.md` ile `dev-containers.md` arasında bağlandı

### [v3.21.0] - 2026-06-16

#### Yeni Başlayan Boşluk Doldurma: Uygulamalı Çoklu Ajan Dersi, "Kendi Uygulamanı Getir," Terraform ve CI/CD Anlatımı
**Bu sürüm, eksiksiz bir yeni başlayan rehberi için en büyük boşlukları kapatır; iki yeni uygulamalı ders (dağıtılabilir çoklu ajan anlatımı ve mevcut bir uygulamaya azd ekleme), yeni başlayan dostu kanca tanıtımı, Terraform ile azd bölümü, adım adım GitHub Actions pipeline anlatımı, yeni önizleme eklentilerine açıklama ve açık dağıtım doğrulama kontrol listesi.**

#### Eklendi
- **🤝 Yeni Bölüm 5 dersi** `docs/chapter-05-multi-agent/multi-agent-basics.md` — gerçek bir şablon (`contoso-creative-writer`) kullanarak tamamen uygulamalı, dağıtılabilir iki ajan anlatımı (orchestrator + uzmanlar); çoklu ajan ne zaman kullanılır, `azd up` iş akışı, dağıtılmış kaynakları anlama, ajanlar arası izleme, özelleştirme ve temizleme
- **📦 Yeni Bölüm 1 dersi** `docs/chapter-01-foundation/bring-your-own-app.md` — mevcut bir projeye azd nasıl eklenir `azd init` ("mevcut dizindeki kodu kullan") ile, `azure.yaml` ve `infra/` kavrama, `azd infra generate`, barındırıcı tespiti ve `azd up` ile dağıtma
- **🌐 Terraform ile azd** bölümü eklendi `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` yapılandırması, `.tf` klasör düzeni, gereken `AZURE_*` çıktılar ve `azd-env-name` etiketi, aynı `azd up` / `azd down` iş akışı (Terraform desteğinin iddia edildiği ancak sadece Bicep gösterildiği boşluğu kapatır)
- **⚙️ Adım adım GitHub Actions anlatımı** `docs/chapter-08-production/production-ai-practices.md` — GitHub deposundan otomatik dağıtıma: `azd pipeline config`, OIDC federasyona dayalı kimlik bilgileri (kayıtlı gizli bilgiler yok), oluşturulan `azure-dev.yml` ve gizli değişken rehberi
- **🪝 Yeni başlayanlar için "Kancalar yeni mi?" tanıtımı** `docs/chapter-04-infrastructure/deployment-guide.md` — kanca nedir, kanca aşamaları tablosu, minimal ilk kanca ve manuel kanca çalıştırma `azd hooks run` ile
- **✅ "Dağıtımınızı Doğrulayın" kontrol listesi** `docs/chapter-01-foundation/first-project.md` 5. Adım'a eklendi — duman testi, sağlık uç noktası kontrolü ve açık başarı kriterleri
- **🧩 Yeni önizleme eklentilerine açıklama** `azure.ai.skills` ve `azure.ai.connections` (ne oldukları ve ne zaman kullanılacakları) `docs/chapter-08-production/production-ai-practices.md` içinde

#### Değiştirilenler
- **🧭 Bölüm 5 ders tablosu** düzeltildi: `multi-agent-basics.md` şimdi Ders 1 (tek tam uygulamalı ders) olarak işaretlendi, Ders 2’nin Bölüm 6’da olduğu dürüstçe belirtildi ve Retail senaryosu mimari plan olup tek komut şablonu değildir
- **🧭 Bölüm 1 ders tablosu** yeni "Kendi Uygulamanı Getir" dersi (Ders 4) dahil edildi
- **🔗 Gezinme altbilgileri** güncellendi: `first-project.md` artık ileriye `bring-your-own-app.md` bağlantısı içermektedir

#### Düzeltildi
- **🧱 "İddiada bulunan ama eksik" Terraform boşluğu kapatıldı** — kurs önceden Terraform desteğini belirtmiş ancak göstermemişti
- **🔀 Yanıltıcı Bölüm 5 çapraz bağlantıları düzeltildi** — yalnızca bir mimari planken tam çoklu ajan uygulaması varmış gibi yapılan bağlantılar

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

#### AZD 1.25.6 Yenilemesi, Tam Ajan Yaşam Döngüsü Komutları & Aspire Yeniden Markalama

**Bu sürüm, kursu `azd` `1.25.6` (Haziran 2026) ve `azure.ai.agents` `0.1.40-preview` uzantısına karşı yeniden doğrular, yapay zeka rehberliğini "bir ajan iskeletini oluşturmak"tan tam ajan yaşam döngüsüne (test → değerlendirme → optimize etme → inceleme → silme) genişletir, yeni `azure.ai.skills` ve `azure.ai.connections` önizleme uzantılarını görünür kılar ve ".NET Aspire" → "Aspire" ürün yeniden markalaşmasını not eder.**

#### Eklendi
- **🔁 Yeni başlayanlar ve AI mühendisleri için tüm ajan yaşam döngüsü kapsamı** belgelerde:
  - `docs/chapter-01-foundation/azd-basics.md` — Uzantılar ve AI Komutları bölümüne yaşam döngüsü tablosu (iskelet oluştur → test et → ölç → iyileştir → incele → temizle) eklendi
  - `docs/chapter-08-production/production-ai-practices.md` — `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, ve `delete --force` komutlarını kapsayan yeni "Ajan Yaşam Döngüsünü Yönetme" bölümü
  - `resources/cheat-sheet.md` — `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, ve `delete --force` ile genişletilmiş AI Ajan Komutları
- **🧩 Yeni önizleme uzantıları** belgelenmiş: Uzantılar tablosuna ve cheat sheet’e `azure.ai.skills` (yeniden kullanılabilir ajan yetenekleri) ve `azure.ai.connections` (Foundry bağlantıları) eklendi
- **⏱️ Yanıt zamanlama rehberi** — `azd ai agent invoke` örnekleri artık toplam gecikmeyi ve ilk byte zamanını yazdırdığını not eder
- **📌 Sürüm afişi** ana README'de, öğrenenlerin `azd version` ve `azd upgrade` komutlarına yönlendirilmesi

#### Değiştirildi
- **✅ Doğrulama temel çizgisi güncellendi** tüm bölüm README'larında ve atölye belgelerinde `azd 1.23.12` (Mart 2026) den `azd 1.25.6` (Haziran 2026)'ya
- **🤖 Bölüm 2 uzantı notu güncellendi** `azure.ai.agents` `0.1.18-preview`'den `0.1.40-preview`'a
- **🧪 Atölye doğrulama örneği** (`azd version` çıktısı) `1.25.6` olarak güncellendi
- **🧭 README "Bugün azd'de Neler Yeni"** bitişten uca ajan yaşam döngüsünü, yeni AI uzantılarını ve son kalite iyileştirmelerini (azd init idempotentliği, azd auth login stale-token temizliği, azd tool ilk çalıştırma istemi) vurgulayacak şekilde yenilendi
- **📖 Bölüm 2 agents.md (Seçenek 4)** şimdi öğrenenleri `azd up` ile durmak yerine dağıtımdan sonra yaşam döngüsü komutlarına yönlendiriyor

#### Düzeltildi
- **🏷️ Ürün ismi** — Aspire yeniden markalaşma notu eklendi (".NET Aspire" artık sadece "Aspire"); azd'nin Aspire desteği değişmedi
- **🔎 Canlı sürüm doğrulaması** Azure Developer CLI sürüm akışına karşı doğrulandı: stabil CLI `1.25.6` (2026-06-12) ve `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Yeni Başlayan Katılımı Açıklaması, Kurulum Doğrulaması ve Son AZD Komut Temizliği
**Bu sürüm, AZD 1.23 doğrulama turunun ardından yeni başlayanlara odaklı bir dokümantasyon geçişi yapar: AZD öncelikli kimlik doğrulama rehberliğini netleştirir, yerel kurulum doğrulama betikleri ekler, önemli komutları canlı AZD CLI ile doğrular ve değişiklik günlüğü dışında kalan son eski İngilizce kaynaklı komut referanslarını kaldırır.**

#### Eklendi
- **🧪 Yeni başlayanlar için kurulum doğrulama betikleri** `validate-setup.ps1` ve `validate-setup.sh` ile öğrenenlerin Bölüm 1'e başlamadan önce gerekli araçları doğrulamaları sağlandı
- **✅ Önceden kurulum doğrulama adımları** ana README ve Bölüm 1 README'de `azd up` öncesinde eksik önkoşulların yakalanması için eklendi

#### Değiştirildi
- **🔐 Yeni başlayan kimlik doğrulama rehberi** artık `azd auth login` komutunu AZD iş akışları için birincil yol olarak tutarlı bir şekilde ele alıyor, `az login` ise sadece doğrudan Azure CLI komutları kullanılıyorsa isteğe bağlı olarak belirtiliyor
- **📚 Bölüm 1 katılım akışı** artık öğrenenlere kurulum, kimlik doğrulama ve ilk dağıtım adımlarından önce yerel kurulumlarını doğrurmalarını işaret ediyor
- **🛠️ Doğrulayıcı mesajları** artık AZD için yalnızca yeni başlayan yolu için engelleyici gereksinimleri Azure CLI uyarılarından net şekilde ayırıyor
- **📖 Yapılandırma, hata ayıklama ve örnek belgeleri** artık hem gerekli AZD kimlik doğrulaması hem de isteğe bağlı Azure CLI oturum açması arasındaki farkı bağlam olmadan gösterilen yerlerden ayırıyor

#### Düzeltildi
- **📋 Kalan İngilizce kaynaklı komut referansları** güncel AZD formlarına çevrildi, cheat sheet'te `azd config show` ve Azure Portal genel bakışı için amaçlanan yerlerde `azd monitor --overview` dahildir
- **🧭 Bölüm 1 yeni başlayan iddiaları** tüm şablonlar ve Azure kaynakları genelinde sıfır hata veya geri alma gibi kesin garantileri aşamalı olarak zayıflattı
- **🔎 Canlı CLI doğrulaması** şunlar için mevcut destek doğrulandı: `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, ve `azd down --force --purge`

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

#### AZD 1.23.12 Doğrulaması, Atölye Ortamı Genişletmesi ve AI Model Yenilemesi
**Bu sürüm, `azd` `1.23.12` sürümüne yönelik bir dokümantasyon doğrulama turu yapar, eski AZD komut örneklerini günceller, AI model rehberliğini güncel varsayılanlara yeniler ve atölye talimatlarını GitHub Codespaces dışına genişleterek dev konteynerleri ve yerel klonları da destekler.**

#### Eklendi
- **✅ Kritik bölümler ve atölye belgelerinde doğrulama notları** yeni veya eski CLI sürümlerini kullanan öğrenenler için doğrulanmış AZD temel çizgisini açıklar
- **⏱️ Uzun süren AI uygulama dağıtımları için zaman aşımı rehberi** `azd deploy --timeout 1800` komutunu kapsar
- **🔎 AI iş akışı belgelerinde uzantı inceleme adımları** `azd extension show azure.ai.agents` komutuyla
- **🌐 Atölye ortamı rehberi genişletildi** GitHub Codespaces, dev konteynerler ve yerel klonlarla MkDocs kapsamı artırıldı

#### Değiştirildi
- **📚 Bölüm intro README'leri** şimdi Foundation, yapılandırma, altyapı, çoklu ajan, ön dağıtım, hata ayıklama ve üretim bölümlerinde `azd 1.23.12` doğrulamasını tutarlı şekilde belirtir
- **🛠️ AZD komut referansları** belgeler genelinde güncellendi:
  - `azd config list` → `azd config show`
  - `azd env show` → bağlama bağlı olarak `azd env list` veya `azd env get-value(s)`
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → Application Insights genel bakışı amaçlandığında `azd monitor --overview`
- **🧪 Önizleme sağlayıcı örnekleri** `azd provision --preview` ve `azd provision --preview -e production` gibi mevcut desteklenen kullanıma basitleştirildi
- **🧭 Atölye akışı** kod alanları dışında dev konteyner veya yerel klonlarda laboratuvarların tamamlanabileceği şekilde güncellendi
- **🔐 Kimlik doğrulama rehberi** artık AZD işlemleri için `azd auth login` tercih eder, doğrudan Azure CLI komutları kullanılıyorsa `az login` isteğe bağlı gösterilir

#### Düzeltildi
- **🪟 Windows kurulum komutları** kurulum kılavuzunda mevcut `winget` paket büyük/küçük harfi biçimine uyarlanarak standartlaştırıldı
- **🐧 Linux kurulum rehberi** desteklenmeyen dağıtım özelinde `azd` paket yöneticisi talimatları yerine uygun sürüm varlıklarına yönlendirme şeklinde düzeltildi
- **📦 AI model örnekleri** `gpt-35-turbo` ve `text-embedding-ada-002` gibi eski varsayılanlardan `gpt-4.1-mini`, `gpt-4.1` ve `text-embedding-3-large` gibi güncel örneklere yenilendi
- **📋 Dağıtım ve tanıma parçacıkları** günlükler, betikler ve sorun giderme adımlarında mevcut ortam ve durum komutlarıyla düzeltildi
- **⚙️ GitHub Actions rehberi** `Azure/setup-azd@v1.0.0`'den `Azure/setup-azd@v2`'ye güncellendi
- **🤖 MCP/Copilot onay rehberi** `azd mcp consent`'ten `azd copilot consent list`'e güncellendi

#### Geliştirildi
- **🧠 AI bölüm rehberi** artık önizleme hassas `azd ai` davranışını, kiracı bazlı oturum açmayı, güncel uzantı kullanımını ve model dağıtım önerilerini daha iyi açıklar
- **🧪 Atölye talimatları** artık daha gerçekçi sürüm örnekleri ve uygulamalı laboratuvarlar için daha net ortam kurulum dili kullanır
- **📈 Üretim ve hata giderme belgeleri** mevcut izleme, geri dönüş modeli ve maliyet kademeleri örnekleriyle daha iyi hizalanır

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

#### AZD AI CLI Komutları, İçerik Doğrulaması ve Şablon Genişletme
**Bu sürüm, `azd ai`, `azd extension` ve `azd mcp` komut kapsamını tüm AI ile ilgili bölümlerde ekler, agents.md'deki bozuk bağlantılar ve kullanım dışı kalan kodları düzeltir, cheat sheet'i günceller ve Örnek Şablonlar bölümünü doğrulanmış açıklamalar ve yeni Azure AI AZD şablonları ile baştan düzenler.**

#### Eklendi
- **🤖 AZD AI CLI kapsamı** 7 dosya genelinde (önceden sadece Bölüm 8'deydi):
  - `docs/chapter-01-foundation/azd-basics.md` — Yeni "Uzantılar ve AI Komutları" bölümü, `azd extension`, `azd ai agent init` ve `azd mcp` tanıtımı
  - `docs/chapter-02-ai-development/agents.md` — Seçenek 4: `azd ai agent init` karşılaştırma tablosu ile (şablon vs manifesto yaklaşımı)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "Foundry için AZD Uzantıları" ve "Ajan-Öncelikli Dağıtım" alt bölümleri

  - `docs/chapter-05-multi-agent/README.md` — Hızlı Başlangıç artık hem şablon hem de manifest tabanlı dağıtım yollarını gösteriyor
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Dağıtım bölümü artık `azd ai agent init` seçeneğini içeriyor
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "Tanı için AZD AI Uzantı Komutları" alt bölümü
  - `resources/cheat-sheet.md` — Yeni "AI & Uzantılar Komutları" bölümü `azd extension`, `azd ai agent init`, `azd mcp` ve `azd infra generate` ile
- **📦 Yeni AZD AI örnek şablonları** `microsoft-foundry-integration.md` içinde:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel ve sesli sohbet desteğiyle .NET RAG sohbeti
  - **azure-search-openai-demo-java** — ACA/AKS dağıtım seçenekleriyle Langchain4J kullanan Java RAG sohbeti
  - **contoso-creative-writer** — Azure AI Agent Servisi, Bing Grounding ve Prompty kullanan Çoklu ajan yaratıcı yazarlık uygulaması
  - **serverless-chat-langchainjs** — Ollama yerel geliştirme desteğiyle Azure Functions + LangChain.js + Cosmos DB kullanan sunucusuz RAG
  - **chat-with-your-data-solution-accelerator** — Yönetici portalı, Teams entegrasyonu ve PostgreSQL/Cosmos DB seçenekleriyle Kurumsal RAG hızlandırıcı
  - **azure-ai-travel-agents** — .NET, Python, Java ve TypeScript sunucularıyla Çoklu ajan MCP orkestrasyon referans uygulaması
  - **azd-ai-starter** — Minimal Azure AI altyapı Bicep başlangıç şablonu
  - **🔗 Harika AZD AI Galeri bağlantısı** — [harika-azd AI galerisi](https://azure.github.io/awesome-azd/?tags=ai) referansı (80+ şablon)

#### Düzeltildi
- **🔗 agents.md navigasyonu**: Önceki/Sonraki bağlantılar artık Bölüm 2 README ders sırasına uyuyor (Microsoft Foundry Entegrasyonu → Ajanlar → AI Model Dağıtımı)
- **🔗 agents.md bozuk bağlantılar**: `production-ai-practices.md` `../chapter-08-production/production-ai-practices.md` olarak düzeltildi (3 kez)
- **📦 agents.md kullanımdan kaldırılan kod**: `opencensus` `azure-monitor-opentelemetry` + OpenTelemetry SDK ile değiştirildi
- **🐛 agents.md geçersiz API**: `max_tokens` `create_agent()`'den `create_run()` içine `max_completion_tokens` olarak taşındı
- **🔢 agents.md token sayımı**: Yaklaşık `len//4` tahmini yerine `tiktoken.encoding_for_model()` kullanıldı
- **azure-search-openai-demo**: Servisler "Cognitive Search + App Service"den "Azure AI Search + Azure Container Apps" olarak düzeltildi (varsayılan sunucu Ekim 2024'te değişti)
- **contoso-chat**: Açıklama Azure AI Foundry + Prompty ile güncellendi, depo başlığı ve teknoloji yığınına uydu

#### Kaldırıldı
- **ai-document-processing**: İşlevsel olmayan şablon referansı kaldırıldı (depo AZD şablonu olarak herkese açık değil)

#### İyileştirildi
- **📝 agents.md alıştırmalar**: Alıştırma 1 beklenen çıktıyı ve `azd monitor` adımını gösteriyor; Alıştırma 2 tam `FunctionTool` kayıt kodunu içeriyor; Alıştırma 3 belirsiz yönlendirmeyi somut `prepdocs.py` komutlarıyla değiştirdi
- **📚 agents.md kaynaklar**: Belgeleme bağlantıları güncellendi, güncel Azure AI Agent Servisi dokümanları ve hızlı başlangıca yönlendiriliyor
- **📋 agents.md Sonraki Adımlar tablosu**: Bölüm kapsamını tamamlayan AI Atölyesi Laboratuvar bağlantısı eklendi

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

#### Kurs Navigasyon İyileştirmesi
**Bu sürüm, README.md bölüm navigasyonunu geliştirilmiş bir tablo formatıyla geliştirir.**

#### Değiştirildi
- **Kurs Haritası Tablosu**: Doğrudan ders bağlantıları, süre tahminleri ve karmaşıklık değerlendirmeleri eklendi
- **Klasör Temizliği**: Gereksiz eski klasörler kaldırıldı (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Bağlantı Doğrulaması**: Kurs Haritası tablosundaki 21+ dahili bağlantı doğrulandı

### [v3.16.0] - 2026-02-05

#### Ürün Adı Güncellemeleri
**Bu sürüm ürün referanslarını güncel Microsoft markasıyla yeniler.**

#### Değiştirildi
- **Microsoft Foundry → Microsoft Foundry**: Tüm referanslar çeviri dışı dosyalarda güncellendi
- **Azure AI Agent Service → Foundry Agents**: Hizmet adı mevcut markaya uyacak şekilde güncellendi

#### Güncellenen Dosyalar
- `README.md` - Ana kurs karşılama sayfası
- `changelog.md` - Sürüm geçmişi
- `course-outline.md` - Kurs yapısı
- `docs/chapter-02-ai-development/agents.md` - AI ajanlar rehberi
- `examples/README.md` - Örnekler belgelemesi
- `workshop/README.md` - Atölye karşılama sayfası
- `workshop/docs/index.md` - Atölye dizin
- `workshop/docs/instructions/*.md` - Tüm atölye talimat dosyaları

---

### [v3.15.0] - 2026-02-05

#### Büyük Depo Yapılandırması: Bölüm Bazlı Klasör İsimleri
**Bu sürüm, dokümantasyonu daha net navigasyon için bölüm klasörlerine ayırır.**

#### Klasör Yeniden Adlandırmaları
Eski klasörler, bölüm numaralı klasörlerle değiştirildi:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Yeni eklendi: `docs/chapter-05-multi-agent/`

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
| Tüm ön dağıtım dosyaları | pre-deployment/ | chapter-06-pre-deployment/ |
| Tüm sorun giderme dosyaları | troubleshooting/ | chapter-07-troubleshooting/ |

#### Eklendi
- **📚 Bölüm README dosyaları**: Her bölüm klasörüne README.md eklendi, içinde:
  - Öğrenme hedefleri ve süre
  - Ders tablosu açıklamalarla
  - Hızlı başlangıç komutları
  - Diğer bölümlere navigasyon

#### Değiştirildi
- **🔗 Tüm dahili bağlantılar güncellendi**: 78+ yol belge dosyalarında güncellendi
- **🗺️ Ana README.md**: Kurs Haritası yeni bölüm yapısına göre güncellendi
- **📝 examples/README.md**: Bölüm klasörlerine çapraz referanslar güncellendi

#### Kaldırıldı
- Eski klasör yapısı (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Depo Yapılandırması: Bölüm Navigasyonu
**Bu sürüm bölüm navigasyon README dosyaları ekledi (v3.15.0 ile güncellendi).**

---

### [v3.13.0] - 2026-02-05

#### Yeni AI Ajanları Rehberi
**Bu sürüm Azure Developer CLI ile AI ajanlarını dağıtmak için kapsamlı bir rehber ekler.**

#### Eklendi
- **🤖 docs/microsoft-foundry/agents.md**: Kapsamlı rehber, içeriği:
  - AI ajanları nedir ve sohbet botlarından farkları
  - Üç hızlı başlangıç ajan şablonu (Foundry Agents, Prompty, RAG)
  - Ajan mimari desenleri (tek ajan, RAG, çoklu ajan)
  - Araç yapılandırması ve özelleştirme
  - İzleme ve metrik takibi
  - Maliyet değerlendirmeleri ve optimizasyon
  - Yaygın sorun giderme senaryoları
  - Başarı kriterleri olan üç uygulamalı alıştırma

#### İçerik Yapısı
- **Giriş**: Yeni başlayanlar için ajan kavramları
- **Hızlı Başlangıç**: `azd init --template get-started-with-ai-agents` ile ajan dağıtımı
- **Mimari Desenler**: Ajan desenlerinin görsel diyagramları
- **Yapılandırma**: Araç kurulumu ve ortam değişkenleri
- **İzleme**: Application Insights entegrasyonu
- **Alıştırmalar**: Kademeli uygulamalı öğrenme (20-45 dakika her biri)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Ortam Güncellemesi
**Bu sürüm, AZD öğrenme deneyimi için modern araçlar ve daha iyi varsayılanlarla geliştirilmiş geliştirme konteyneri yapılandırması sağlar.**

#### Değiştirildi
- **🐳 Taban İmaj**: `python:3.12-bullseye`'den `python:3.12-bookworm`'a güncellendi (en son Debian kararlı)
- **📛 Konteyner Adı**: Anlaşılır olması için "Python 3"den "AZD for Beginners"a değiştirildi

#### Eklendi
- **🔧 Yeni Dev Container Özellikleri**:
  - Bicep desteği etkin `azure-cli`
  - `node:20` (AZD şablonları için LTS sürümü)
  - Şablon yönetimi için `github-cli`
  - Konteyner uygulama dağıtımları için `docker-in-docker`

- **🔌 Port Yönlendirme**: Yaygın geliştirme için ön yapılandırılmış portlar:
  - 8000 (MkDocs önizleme)
  - 3000 (Web uygulamaları)
  - 5000 (Python Flask)
  - 8080 (API’ler)

- **🧩 Yeni VS Code Uzantıları**:
  - `ms-python.vscode-pylance` - Gelişmiş Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions desteği
  - `ms-azuretools.vscode-docker` - Docker desteği
  - `ms-azuretools.vscode-bicep` - Bicep dil desteği
  - `ms-azure-devtools.azure-resource-groups` - Azure kaynak yönetimi
  - `yzhang.markdown-all-in-one` - Markdown düzenleme
  - `DavidAnson.vscode-markdownlint` - Markdown doğrulama
  - `bierner.markdown-mermaid` - Mermaid diyagram desteği
  - `redhat.vscode-yaml` - YAML desteği (azure.yaml için)
  - `eamodio.gitlens` - Git görselleştirme
  - `mhutchie.git-graph` - Git geçmişi

- **⚙️ VS Code Ayarları**: Python yorumlayıcı, kaydetmede biçimlendirme ve boşluk kırpma için varsayılan ayarlar eklendi

- **📦 Güncellenen requirements-dev.txt**:
  - MkDocs minify eklentisi eklendi
  - Kod kalitesi için pre-commit eklendi
  - Azure SDK paketleri eklendi (azure-identity, azure-mgmt-resource)

#### Düzeltildi
- **Oluştan Sonra Komutu**: Konteyner başlatıldığında AZD ve Azure CLI yüklemesini doğruluyor

---

### [v3.11.0] - 2026-02-05

#### Yeni Başlayanlar Dostu README Yenilemesi
**Bu sürüm, README.md dosyasını yeni başlayanlar için daha erişilebilir hale getirir ve AI geliştiricileri için temel kaynaklar ekler.**

#### Eklendi
- **🆚 Azure CLI ve AZD Karşılaştırması**: Hangi aracın ne zaman kullanılacağına dair net açıklamalar ve pratik örnekler
- **🌟 Harika AZD Bağlantıları**: Topluluk şablon galerisi ve katkı kaynaklarına doğrudan bağlantılar:
  - [Harika AZD Galerisi](https://azure.github.io/awesome-azd/) - Dağıtıma hazır 200+ şablon
  - [Şablon Gönder](https://github.com/Azure/awesome-azd/issues) - Topluluk katkısı
- **🎯 Hızlı Başlangıç Kılavuzu**: Basitleştirilmiş 3 adımlı başlangıç bölümü (Yükle → Giriş Yap → Dağıt)
- **📊 Deneyime Dayalı Navigasyon Tablosu**: Geliştirici deneyimine göre nereden başlanacağına dair net rehberlik

#### Değiştirildi
- **README Yapısı**: Bilgilerin kademeli açığa çıkarılması için yeniden düzenlendi - önemli bilgiler ilk
- **Giriş Bölümü**: Yeni başlayanlar için “`azd up` Büyüsü” anlatımı yeniden yazıldı
- **Çift İçerik Kaldırıldı**: Yinelenen sorun giderme bölümü kaldırıldı
- **Sorun Giderme Komutları**: `azd logs` geçerli `azd monitor --logs` olarak düzeltildi

#### Düzeltildi

- **🔐 Kimlik Doğrulama Komutları**: cheat-sheet.md dosyasına `azd auth login` ve `azd auth logout` eklendi
- **Geçersiz Komut Referansları**: README sorun giderme bölümünden kalan `azd logs` kaldırıldı

#### Notlar
- **Kapsam**: Değişiklikler ana README.md ve resources/cheat-sheet.md dosyalarına uygulandı
- **Hedef Kitle**: Özellikle AZD'ye yeni başlayan geliştiricilere yönelik iyileştirmeler

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Komut Doğruluğu Güncellemesi
**Bu sürüm, belgelerde bulunan var olmayan AZD komutlarını düzelterek tüm kod örneklerinin geçerli Azure Developer CLI sözdizimini kullanmasını sağlar.**

#### Düzeltildi
- **🔧 Var Olmayan AZD Komutları Kaldırıldı**: Geçersiz komutların kapsamlı denetimi ve düzeltilmesi:
  - `azd logs` (var olmayan) → `azd monitor --logs` veya Azure CLI alternatifleri ile değiştirildi
  - `azd service` alt komutları (var olmayan) → `azd show` ve Azure CLI ile değiştirildi
  - `azd infra import/export/validate` (var olmayan) → kaldırıldı veya geçerli alternatiflerle değiştirildi
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` bayrakları (var olmayan) → kaldırıldı
  - `azd provision --what-if/--rollback` bayrakları (var olmayan) → `--preview` kullanacak şekilde güncellendi
  - `azd config validate` (var olmayan) → `azd config list` ile değiştirildi
  - `azd info`, `azd history`, `azd metrics` (var olmayan) → kaldırıldı

- **📚 Komut Düzeltmeleriyle Güncellenen Dosyalar**:
  - `resources/cheat-sheet.md`: Komut referanslarında kapsamlı yenileme
  - `docs/deployment/deployment-guide.md`: Rollback ve dağıtım stratejilerinde düzeltmeler
  - `docs/troubleshooting/debugging.md`: Log analiz bölümlerinde düzeltmeler
  - `docs/troubleshooting/common-issues.md`: Sorun giderme komutlarında güncellemeler
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD hata ayıklama bölümü düzeltildi
  - `docs/getting-started/azd-basics.md`: İzleme komutları düzeltildi
  - `docs/getting-started/first-project.md`: İzleme ve hata ayıklama örnekleri güncellendi
  - `docs/getting-started/installation.md`: Yardım ve sürüm örnekleri düzeltildi
  - `docs/pre-deployment/application-insights.md`: Log görüntüleme komutları düzeltildi
  - `docs/pre-deployment/coordination-patterns.md`: Agent hata ayıklama komutları düzeltildi

- **📝 Sürüm Referansı Güncellendi**: 
  - `docs/getting-started/installation.md`: Sabit kodlanmış `1.5.0` sürümü, sürümlere bağlantı ile genel `1.x.x` olarak değiştirildi

#### Değiştirildi
- **Rollback Stratejileri**: AZD'nin yerel rollback özelliği olmaması nedeniyle dokümantasyon, Git tabanlı rollback kullanacak şekilde güncellendi
- **Log Görüntüleme**: `azd logs` referansları `azd monitor --logs`, `azd monitor --live` ve Azure CLI komutları ile değiştirildi
- **Performans Bölümü**: Var olmayan paralel/artımlı dağıtım bayrakları kaldırıldı, geçerli alternatifler sunuldu

#### Teknik Detaylar
- **Geçerli AZD Komutları**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Geçerli azd monitor Bayrakları**: `--live`, `--logs`, `--overview`
- **Kaldırılan Özellikler**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notlar
- **Doğrulama**: Komutlar Azure Developer CLI v1.23.x sürümüne karşı doğrulandı

---

### [v3.9.0] - 2026-02-05

#### Atölye Tamamlama ve Dokümantasyon Kalitesi Güncellemesi
**Bu sürüm, etkileşimli atölye modüllerini tamamlar, tüm kırık dokümantasyon bağlantılarını düzeltir ve Microsoft AZD kullanan yapay zeka geliştiricileri için içerik kalitesini artırır.**

#### Eklendi
- **📝 CONTRIBUTING.md**: Yeni katkı yönergeleri belgesi ile:
  - Sorun bildirme ve değişiklik önerme için net talimatlar
  - Yeni içerik için dokümantasyon standartları
  - Kod örneği yönergeleri ve commit mesajı kuralları
  - Topluluk katılım bilgileri

#### Tamamlandı
- **🎯 Atölye Modülü 7 (Kapanış)**: Tamamlanmış kapanış modülü ile:
  - Atölye başarılarının kapsamlı özeti
  - AZD, şablonlar ve Microsoft Foundry konularını kapsayan ana kavramlar bölümü
  - Öğrenme yolculuğu devam tavsiyeleri
  - Zorluk dereceleriyle atölye meydan okuma egzersizleri
  - Topluluk geri bildirimi ve destek bağlantıları

- **📚 Atölye Modülü 3 (Parçala)**: Öğrenme hedefleri güncellendi:
  - GitHub Copilot MCP sunucuları aktivasyon rehberi
  - AZD şablon klasör yapısı anlayışı
  - Altyapı olarak kod (Bicep) organizasyon desenleri
  - Uygulamalı laboratuvar talimatları

- **🔧 Atölye Modülü 6 (Sökme)**: Tamamlandı:
  - Kaynak temizleme ve maliyet yönetimi hedefleri
  - Altyapıyı güvenli kaldırmak için `azd down` kullanımı
  - Yumuşak silinmiş bilişsel hizmetlerin geri kazanımı rehberi
  - GitHub Copilot ve Azure Portal bonus keşif yönlendirmeleri

#### Düzeltildi
- **🔗 Kırık Bağlantı Düzeltmeleri**: 15+ dahili dokümantasyon bağlantısı düzeltildi:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md yolları düzeltildi
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md ve production-ai-practices.md yolları düzeltildi
  - `docs/getting-started/first-project.md`: var olmayan cicd-integration.md deployment-guide.md ile değiştirildi
  - `examples/retail-scenario.md`: SSS ve sorun giderme kılavuzu yolları düzeltildi
  - `examples/container-app/microservices/README.md`: Kurs ana sayfası ve dağıtım kılavuzu yolları düzeltildi
  - `resources/faq.md` ve `resources/glossary.md`: Yapay zeka bölümü referansları güncellendi
  - `course-outline.md`: Eğitmen rehberi ve yapay zeka atölyesi laboratuvar referansları düzeltildi

- **📅 Atölye Durum Afişi**: "Yapım Aşamasında" ibaresi kaldırılarak aktif atölye durumu ve Şubat 2026 tarihi eklendi

- **🔗 Atölye Navigasyonu**: workshop README.md içindeki var olmayan lab-1-azd-basics klasörüne işaret eden kırık navigasyon bağlantıları düzeltildi

#### Değiştirildi
- **Atölye Sunumu**: "Yapım aşamasında" uyarısı kaldırıldı, atölye tamamlandı ve kullanıma hazır hale getirildi
- **Navigasyon Tutarlılığı**: Tüm atölye modülleri için modüller arası düzgün navigasyon sağlandı
- **Öğrenme Yolu Referansları**: Bölüm çapraz referansları doğru microsoft-foundry yolları kullanacak şekilde güncellendi

#### Doğrulandı
- ✅ Tüm İngilizce markdown dosyalarında geçerli dahili bağlantılar var
- ✅ Atölye modülleri 0-7 öğrenme hedefleri ile tamamlandı
- ✅ Bölümler ve modüller arası navigasyon doğru çalışıyor
- ✅ İçerik, Microsoft AZD kullanan yapay zeka geliştiricileri için uygun
- ✅ Başlangıç seviyesine uygun dil ve yapı tüm belgelerde korundu
- ✅ CONTRIBUTING.md, topluluk katkıcıları için net rehberlik sağlıyor

#### Teknik Uygulama
- **Bağlantı Doğrulama**: Otomatik PowerShell betiği tüm .md dahili bağlantılarını doğruladı
- **İçerik Denetimi**: Atölye tamamlığı ve başlangıç seviyesi uygunluğu manuel olarak incelendi
- **Navigasyon Sistemi**: Tutarlı bölüm ve modül navigasyon kalıpları uygulandı

#### Notlar
- **Kapsam**: Değişiklikler yalnızca İngilizce dokümantasyona uygulandı
- **Çeviriler**: Bu sürümde çeviri klasörleri güncellenmedi (otomatik çeviri daha sonra eşlenecek)
- **Atölye Süresi**: Tamamlanmış atölye artık 3-4 saat uygulamalı öğrenim sağlıyor

---

### [v3.8.0] - 2025-11-19

#### Gelişmiş Dokümantasyon: İzleme, Güvenlik ve Çoklu Ajan Desenleri
**Bu sürüm, üretim dağıtımları için Application Insights entegrasyonu, kimlik doğrulama desenleri ve çoklu ajan koordinasyonunu içeren kapsamlı A seviyesi dersler ekler.**

#### Eklendi
- **📊 Application Insights Entegrasyon Dersi**: `docs/pre-deployment/application-insights.md` içinde:
  - Otomatik sağlama ile AZD odaklı dağıtım
  - Application Insights + Log Analytics için tam Bicep şablonları
  - Özel telemetri ile çalışan Python uygulamaları (1.200+ satır)
  - AI/LLM izleme desenleri (Microsoft Foundry Modelleri token/maliyet takibi)
  - 6 Mermaid diyagramı (mimari, dağıtılmış izleme, telemetri akışı)
  - 3 uygulamalı egzersiz (alarm, panolar, AI izlemesi)
  - Kusto sorgu örnekleri ve maliyet optimizasyon stratejileri
  - Canlı metrik akışı ve gerçek zamanlı hata ayıklama
  - 40-50 dakika öğrenme süresi ile üretim hazır desenler

- **🔐 Kimlik Doğrulama & Güvenlik Desenleri Dersi**: `docs/getting-started/authsecurity.md` içinde:
  - 3 kimlik doğrulama deseni (bağlantı dizeleri, Key Vault, yönetilen kimlik)
  - Güvenli dağıtımlar için tam Bicep altyapı şablonları
  - Azure SDK entegrasyonlu Node.js uygulama kodu
  - 3 tam egzersiz (yönetilen kimlik etkinleştirme, kullanıcı atanmış kimlik, Key Vault döndürme)
  - Güvenlik en iyi uygulamaları ve RBAC yapılandırmaları
  - Sorun giderme kılavuzu ve maliyet analizi
  - Üretim hazır parola gerektirmeyen kimlik doğrulama desenleri

- **🤖 Çoklu Ajan Koordinasyon Desenleri Dersi**: `docs/pre-deployment/coordination-patterns.md` içinde:
  - 5 koordinasyon deseni (ardışık, paralel, hiyerarşik, olay tetiklemeli, konsensüs)
  - Tam orkestratör servis uygulaması (Python/Flask, 1.500+ satır)
  - 3 uzmanlaşmış ajan uygulaması (Araştırma, Yazma, Düzenleme)
  - Mesaj kuyruğu için Service Bus entegrasyonu
  - Dağıtılmış sistemler için Cosmos DB durum yönetimi
  - Ajan etkileşimlerini gösteren 6 Mermaid diyagramı
  - 3 gelişmiş egzersiz (zaman aşımı yönetimi, yeniden deneme mantığı, devre kesici)
  - Maliyet dökümü (aylık 240-565$) ve optimizasyon stratejileri
  - İzleme için Application Insights entegrasyonu

#### Geliştirildi
- **Dağıtım Öncesi Bölüm**: Kapsamlı izleme ve koordinasyon desenleri eklendi
- **Başlangıç Bölümü**: Profesyonel kimlik doğrulama desenleri ile geliştirildi
- **Üretime Hazırlık**: Güvenlikten gözlemlenebilirliğe tam kapsam
- **Kurs Taslağı**: 3 ve 6. Bölümlerde yeni derslere referanslar güncellendi

#### Değiştirildi
- **Öğrenme İlerlemesi**: Kurs boyunca güvenlik ve izleme daha iyi entegre edildi
- **Dokümantasyon Kalitesi**: Yeni derslerde tutarlı A seviyesi standartlar (%95-97)
- **Üretim Desenleri**: Kurumsal dağıtımlar için uçtan uca tam kapsam

#### İyileştirildi
- **Geliştirici Deneyimi**: Geliştirmeden üretim izlemeye net yol haritası
- **Güvenlik Standartları**: Kimlik doğrulama ve gizli yönetimi için profesyonel desenler
- **Gözlemlenebilirlik**: AZD ile tam Application Insights entegrasyonu
- **Yapay Zeka İş Yükleri**: Microsoft Foundry Modelleri ve çoklu ajan sistemleri için özel izleme

#### Doğrulandı
- ✅ Tüm derslerde eksiksiz çalışan kod (snippet değil)
- ✅ Görsel öğrenim için Mermaid diyagramları (toplam 19, 3 derste)
- ✅ Doğrulama adımlı uygulamalı egzersizler (toplam 9)
- ✅ `azd up` ile dağıtılabilir üretim hazır Bicep şablonları
- ✅ Maliyet analizleri ve optimizasyon stratejileri
- ✅ Sorun giderme rehberleri ve en iyi uygulamalar
- ✅ Doğrulama komutlarıyla bilgi kontrol noktaları

#### Dokümantasyon Puanlama Sonuçları
- **docs/pre-deployment/application-insights.md**: - Kapsamlı izleme rehberi
- **docs/getting-started/authsecurity.md**: - Profesyonel güvenlik desenleri
- **docs/pre-deployment/coordination-patterns.md**: - Gelişmiş çoklu ajan mimarileri
- **Genel Yeni İçerik**: - Tutarlı yüksek kalite standartları

#### Teknik Uygulama
- **Application Insights**: Log Analytics + özel telemetri + dağıtılmış izleme
- **Kimlik Doğrulama**: Yönetilen Kimlik + Key Vault + RBAC desenleri
- **Çoklu Ajan**: Service Bus + Cosmos DB + Container Apps + orkestrasyon
- **İzleme**: Canlı metrikler + Kusto sorguları + alarmlar + panolar
- **Maliyet Yönetimi**: Örnekleme stratejileri, saklama politikaları, bütçe kontrolleri

### [v3.7.0] - 2025-11-19

#### Dokümantasyon Kalitesi İyileştirmeleri ve Yeni Microsoft Foundry Modelleri Örneği
**Bu sürüm, depo genelinde dokümantasyon kalitesini artırır ve gpt-4.1 sohbet arayüzüyle tam Microsoft Foundry Modelleri dağıtım örneği ekler.**

#### Eklendi
- **🤖 Microsoft Foundry Modelleri Sohbet Örneği**: `examples/azure-openai-chat/` içinde çalışan ve eksiksiz gpt-4.1 dağıtımı:
  - Tam Microsoft Foundry Modelleri altyapısı (gpt-4.1 model dağıtımı)
  - Konuşma geçmişi ile Python komut satırı sohbet arayüzü
  - Güvenli API anahtarı depolama için Key Vault entegrasyonu
  - Token kullanımı takibi ve maliyet tahmini
  - Hız sınırlandırma ve hata yönetimi
  - 35-45 dakikalık dağıtım rehberi içeren kapsamlı README
  - 11 üretim hazır dosya (Bicep şablonları, Python uygulaması, yapılandırma)
- **📚 Dokümantasyon Egzersizleri**: Yapılandırma kılavuzuna uygulamalı egzersizler eklendi:
  - Egzersiz 1: Çok ortamlı yapılandırma (15 dakika)
  - Egzersiz 2: Gizli yönetimi uygulaması (10 dakika)
  - Açık başarı kriterleri ve doğrulama adımları
- **✅ Dağıtım Doğrulaması**: Dağıtım kılavuzuna doğrulama bölümü eklendi:
  - Sağlık kontrolü prosedürleri
  - Başarı kriterleri kontrol listesi
  - Tüm dağıtım komutlarının beklenen çıktıları
  - Sorun giderme hızlı başvuru

#### Geliştirildi
- **examples/README.md**: A seviyesi kaliteye güncellendi (%93):
  - Tüm ilgili bölümlere azure-openai-chat eklendi
  - Yerel örnek sayısı 3'ten 4'e çıkarıldı
  - Yapay Zeka Uygulama Örnekleri tablosuna eklendi
  - Orta seviye kullanıcılar için Hızlı Başlangıç'a entegre edildi
  - Microsoft Foundry Şablonları bölümüne eklendi
  - Karşılaştırma Matrisi ve teknoloji bulma bölümleri güncellendi
- **Dokümantasyon Kalitesi**: docs klasöründe B+ (%87) → A- (%92) şeklinde iyileştirildi

  - Kritik komut örneklerine beklenen çıktıların eklenmesi
  - Konfigürasyon değişiklikleri için doğrulama adımlarının dahil edilmesi
  - Pratik egzersizlerle uygulamalı öğrenmenin geliştirilmesi

#### Değiştirildi
- **Öğrenme İlerlemesi**: Orta seviye öğrenciler için AI örneklerinin daha iyi entegrasyonu
- **Dokümantasyon Yapısı**: Belirgin sonuçlar ile daha uygulanabilir egzersizler
- **Doğrulama Süreci**: Ana iş akışlarına açık başarı kriterlerinin eklenmesi

#### Geliştirildi
- **Geliştirici Deneyimi**: Microsoft Foundry Modelleri dağıtımı artık 35-45 dakika sürüyor (karmaşık alternatifler için 60-90 dakika yerine)
- **Maliyet Şeffaflığı**: Microsoft Foundry Modelleri örneği için net maliyet tahminleri (aylık 50-200 $)
- **Öğrenme Yolu**: AI geliştiricileri için azure-openai-chat ile net giriş noktası sağlandı
- **Dokümantasyon Standartları**: Tutarlı beklenen çıktılar ve doğrulama adımları

#### Doğrulandı
- ✅ Microsoft Foundry Modelleri örneği `azd up` ile tamamen işlevsel
- ✅ Tüm 11 uygulama dosyası sözdizimsel olarak doğru
- ✅ README talimatları gerçek dağıtım deneyimiyle uyumlu
- ✅ Dokümantasyon bağlantıları 8+ yerde güncellendi
- ✅ Örnekler indeksi 4 yerel örneği doğru yansıtıyor
- ✅ Tablolarda tekrar eden dış bağlantı yok
- ✅ Tüm gezinme referansları doğru

#### Teknik Uygulama
- **Microsoft Foundry Modelleri Mimarisi**: gpt-4.1 + Key Vault + Container Apps deseni
- **Güvenlik**: Yönetilen Kimlik hazır, sırlar Key Vault'ta
- **İzleme**: Application Insights entegrasyonu
- **Maliyet Yönetimi**: Jeton takibi ve kullanım optimizasyonu
- **Dağıtım**: Tam kurulum için tek bir `azd up` komutu

### [v3.6.0] - 2025-11-19

#### Önemli Güncelleme: Container Uygulama Dağıtım Örnekleri
**Bu sürüm, Azure Developer CLI (AZD) kullanarak kapsamlı, üretime hazır container uygulama dağıtım örneklerini sunar; tam dokümantasyon ve öğrenme yoluna entegrasyon içerir.**

#### Eklendi
- **🚀 Container Uygulama Örnekleri**: `examples/container-app/` içinde yeni yerel örnekler:
  - [Ana Rehber](examples/container-app/README.md): Container dağıtımlarının tam genel bakışı, hızlı başlangıç, üretim ve gelişmiş desenler
  - [Basit Flask API](../../examples/container-app/simple-flask-api): Ölçek sıfıra, sağlık kontrolleri, izleme ve hata ayıklama içeren yeni başlayan dostu REST API
  - [Mikroservis Mimarisi](../../examples/container-app/microservices): Üretime hazır çok servisli dağıtım (API Gateway, Ürün, Sipariş, Kullanıcı, Bildirim), asenkron mesajlaşma, Service Bus, Cosmos DB, Azure SQL, dağıtılmış izleme, mavi-yeşil/canary dağıtım
- **En İyi Uygulamalar**: Container iş yükleri için güvenlik, izleme, maliyet optimizasyonu ve CI/CD rehberi
- **Kod Örnekleri**: Tam `azure.yaml`, Bicep şablonları ve çok dilli servis uygulamaları (Python, Node.js, C#, Go)
- **Test ve Sorun Giderme**: Uçtan uca test senaryoları, izleme komutları, sorun giderme rehberi

#### Değiştirildi
- **README.md**: Yeni container uygulama örneklerini "Yerel Örnekler - Container Uygulamaları" altında özellik olarak ekleyip linklendi
- **examples/README.md**: Container uygulama örnekleri vurgulandı, karşılaştırma matrisi girdileri eklendi ve teknoloji/mimari referansları güncellendi
- **Ders Ana Hatları ve Çalışma Kılavuzu**: İlgili bölümlerde yeni container uygulama örnekleri ve dağıtım desenleri referanslandı

#### Doğrulandı
- ✅ Tüm yeni örnekler `azd up` ile dağıtılabilir ve en iyi uygulamalara uyuyor
- ✅ Dokümantasyon çapraz-bağlantıları ve gezinme güncellendi
- ✅ Örnekler başlangıçtan ileri seviye senaryolara, üretim mikroservislerini de kapsıyor

#### Notlar
- **Kapsam**: Yalnızca İngilizce dokümantasyon ve örnekler
- **Sonraki Adımlar**: Gelecek sürümlerde ileri container desenleri ve CI/CD otomasyonu ile genişletilecek

### [v3.5.0] - 2025-11-19

#### Ürün Yeniden Markalama: Microsoft Foundry
**Bu sürüm, tüm İngilizce dokümantasyonda "Microsoft Foundry" ürün adının kapsamlı şekilde değiştirilmesini içerir ve Microsoft'un resmi yeniden markalama yansıtır.**

#### Değiştirildi
- **🔄 Ürün Adı Güncellemesi**: "Microsoft Foundry" olarak tam yeniden markalama
  - `docs/` klasöründeki tüm İngilizce doküman referansları güncellendi
  - Klasör adı değiştirildi: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Dosya adı değiştirildi: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Toplam: 7 dokümantasyon dosyasında 23 içerik referansı güncellendi

- **📁 Klasör Yapısı Değişiklikleri**:
  - `docs/ai-foundry/` klasörü `docs/microsoft-foundry/` olarak yeniden adlandırıldı
  - Tüm çapraz referanslar yeni klasör yapısını yansıtacak şekilde güncellendi
  - Tüm dokümantasyonda gezinme bağlantıları doğrulandı

- **📄 Dosya Yeniden Adlandırmaları**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tüm dahili bağlantılar yeni dosya adını gösterir şekilde güncellendi

#### Güncellenen Dosyalar
- **Bölüm Dokümantasyonu** (7 dosya):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 gezinme bağlantısı güncellemesi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ürün adı referansı güncellendi
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Önceki güncellemelerle zaten Microsoft Foundry kullanıyor
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 güncelleme (genel bakış, topluluk geri bildirimi, dokümantasyon)
  - `docs/getting-started/azd-basics.md` - 4 çapraz referans bağlantısı güncellendi
  - `docs/getting-started/first-project.md` - 2 bölüm gezinme bağlantısı güncellendi
  - `docs/getting-started/installation.md` - 2 sonraki bölüm bağlantısı güncellendi
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referans güncellendi (gezinme, Discord topluluğu)
  - `docs/troubleshooting/common-issues.md` - 1 gezinme bağlantısı güncellendi
  - `docs/troubleshooting/debugging.md` - 1 gezinme bağlantısı güncellendi

- **Ders Yapısı Dosyaları** (2 dosya):
  - `README.md` - 17 referans güncellendi (ders genel bakışı, bölüm başlıkları, şablonlar bölümü, topluluk içgörüleri)
  - `course-outline.md` - 14 referans güncellendi (genel bakış, öğrenme hedefleri, bölüm kaynakları)

#### Doğrulandı
- ✅ İngilizce dokümanlarda kalan "ai-foundry" klasör yolu referansı sıfırlandı
- ✅ İngilizce dokümanlarda kalan "Microsoft Foundry" ürün adı referansı sıfırlandı
- ✅ Yeni klasör yapısıyla tüm gezinme bağlantıları işlevsel
- ✅ Dosya ve klasör yeniden adlandırmaları başarıyla tamamlandı
- ✅ Bölümler arası çapraz referanslar doğrulandı

#### Notlar
- **Kapsam**: Yalnızca `docs/` klasöründeki İngilizce dokümantasyona uygulandı
- **Çeviriler**: Bu sürümde çeviri klasörleri (`translations/`) güncellenmedi
- **Atölye**: Atölye malzemeleri (`workshop/`) bu sürümde güncellenmedi
- **Örnekler**: Örnek dosyalar hala eski isimlendirmeye referans verebilir (gelecek güncellemede ele alınacak)
- **Dış Bağlantılar**: Harici URL'ler ve GitHub depo referansları değişmemiştir

#### Katkıda Bulunanlar İçin Geçiş Rehberi
Lokal dallarınız veya eski yapıya referans veren dokümantasyon varsa:
1. Klasör referanslarını güncelleyin: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Dosya referanslarını güncelleyin: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ürün adını değiştirin: "Microsoft Foundry" → "Microsoft Foundry"
4. Tüm dahili dokümantasyon bağlantılarının hala çalıştığını doğrulayın

---

### [v3.4.0] - 2025-10-24

#### Altyapı Önizleme ve Doğrulama Geliştirmeleri
**Bu sürüm, yeni Azure Developer CLI önizleme özelliği için kapsamlı destek sunar ve atölye kullanıcı deneyimini geliştirir.**

#### Eklendi
- **🧪 azd provision --preview Özellik Dokümantasyonu**: Yeni altyapı önizleme yeteneğinin kapsamlı açıklaması
  - Cheat sheet'te komut referansı ve kullanım örnekleri
  - Sağlama rehberinde kullanım senaryoları ve faydalı detaylı entegrasyon
  - Daha güvenli dağıtım için ön kontrol entegrasyonu
  - Güvenlik odaklı dağıtım uygulamaları ile başlayan kullanım kılavuzu güncellemeleri
- **🚧 Atölye Durum Çubuğu**: Atölye geliştirme durumunu gösteren profesyonel HTML çubuğu
  - Kullanıcı iletişimi için gradyan tasarım ve yapım göstergeleri
  - Şeffaflık için son güncelleme zaman damgası
  - Tüm cihaz türlerine uygun mobil uyumlu tasarım

#### Geliştirildi
- **Altyapı Güvenliği**: Dağıtım dokümantasyonunda önizleme fonksiyonu entegre edildi
- **Ön Dağıtım Doğrulaması**: Otomatikleştirilmiş betiklere altyapı önizleme testleri eklendi
- **Geliştirici İş Akışı**: Komut dizileri önizleme içererek en iyi uygulama haline getirildi
- **Atölye Deneyimi**: Kullanıcılara içerik geliştirme durumu açıkça bildiriliyor

#### Değiştirildi
- **Dağıtım En İyi Uygulamaları**: Önizleme-öncelikli iş akışı tavsiye edilen yöntem haline geldi
- **Dokümantasyon Akışı**: Altyapı doğrulaması öğrenme sürecinde daha öncelik kazandı
- **Atölye Sunumu**: Profesyonel durum bildirimiyle net geliştirme zaman çizelgesi

#### İyileştirildi
- **Güvenlik Odağı**: Altyapı değişiklikleri dağıtımdan önce doğrulanabilir oldu
- **Takım İşbirliği**: Önizleme sonuçları inceleme ve onay için paylaşılabilir
- **Maliyet Bilinçliliği**: Sağlama öncesi kaynak maliyetlerinin daha iyi anlaşılması
- **Risk Azaltma**: Önceden doğrulama ile dağıtım hataları azaldı

#### Teknik Uygulama
- **Çoklu Doküman Entegrasyonu**: Önizleme özelliği 4 önemli dosyada dökümante edildi
- **Komut Desenleri**: Tüm dokümantasyonda tutarlı sözdizimi ve örnekler
- **En İyi Uygulama Entegrasyonu**: Doğrulama iş akışları ve betiklere önizleme dahil edildi
- **Görsel Göstergeler**: Keşfedilebilirlik için yeni özellik işaretleri açıkça belirtildi

#### Atölye Altyapısı
- **Durum İletişimi**: Gradyan stilinde profesyonel HTML çubuğu
- **Kullanıcı Deneyimi**: Geliştirme durumu karışıklığını önler
- **Profesyonel Sunum**: Depo güvenilirliği korunurken beklentiler belirlenir
- **Zaman Çizelgesi Şeffaflığı**: Ekim 2025 son güncelleme zaman damgası ile hesap verebilirlik

### [v3.3.0] - 2025-09-24

#### Geliştirilmiş Atölye Materyalleri ve Etkileşimli Öğrenme Deneyimi
**Bu sürüm, tarayıcı tabanlı etkileşimli rehberler ve yapılandırılmış öğrenme yollarıyla kapsamlı atölye materyalleri sunmaktadır.**

#### Eklendi
- **🎥 Etkileşimli Atölye Rehberi**: MkDocs önizleme yeteneği ile tarayıcı tabanlı atölye deneyimi
- **📝 Yapılandırılmış Atölye Talimatları**: Keşiften özelleştirmeye 7 adımlı rehberli öğrenme yolu
  - 0-Giriş: Atölye genel bakışı ve kurulum
  - 1-AI-Şablonu-Seçimi: Şablon keşfi ve seçim süreci
  - 2-AI-Şablonu-Doğrulama: Dağıtım ve doğrulama prosedürleri
  - 3-AI-Şablonu-Parçalara-Ayrıştırma: Şablon mimarisini anlama
  - 4-AI-Şablonu-Yapılandırma: Konfigürasyon ve özelleştirme
  - 5-AI-Şablonu-Özelleştirme: İleri düzey değişiklikler ve yinelemeler
  - 6-Altyapıyı-Kaldırma: Temizlik ve kaynak yönetimi
  - 7-Sonuçlandırma: Özet ve sonraki adımlar
- **🛠️ Atölye Araçları**: Geliştirilmiş öğrenme deneyimi için Material temalı MkDocs yapılandırması
- **🎯 Uygulamalı Öğrenme Yolu**: 3 adımlı metodoloji (Keşif → Dağıtım → Özelleştirme)
- **📱 GitHub Codespaces Entegrasyonu**: Sorunsuz geliştirme ortamı kurulumu

#### Geliştirildi
- **AI Atölye Laboratuvarı**: 2-3 saatlik yapılandırılmış kapsamlı öğrenme deneyimi eklendi
- **Atölye Dokümantasyonu**: Gezinti ve görsel destek içeren profesyonel sunum
- **Öğrenme İlerlemesi**: Şablon seçiminden üretim dağıtımına açık adım adım rehberlik
- **Geliştirici Deneyimi**: Entegre araçlar ile geliştirme iş akışları kolaylaştırıldı

#### İyileştirildi
- **Erişilebilirlik**: Arama, kopyalama özelliği ve tema değiştirme için tarayıcı arabirimi
- **Kendi Hızında Öğrenme**: Farklı öğrenme hızlarına uygun esnek atölye yapısı
- **Pratik Uygulama**: Gerçek dünya AI şablon dağıtım senaryoları
- **Topluluk Entegrasyonu**: Atölye desteği ve işbirliği için Discord entegrasyonu

#### Atölye Özellikleri
- **Yerleşik Arama**: Hızlı anahtar kelime ve ders keşfi
- **Kod Bloklarını Kopyalama**: Tüm kod örneklerinde üstüne gelince kopyalama işlevi
- **Tema Değiştirici**: Farklı tercihler için koyu/açık mod desteği
- **Görsel Materyaller**: Anlayışı artıran ekran görüntüleri ve diyagramlar
- **Yardım Entegrasyonu**: Topluluk desteği için doğrudan Discord erişimi

### [v3.2.0] - 2025-09-17

#### Önemli Gezinme Yeniden Yapılandırması ve Bölüm Tabanlı Öğrenme Sistemi
**Bu sürüm, tüm depoda geliştirilmiş gezinme ile kapsamlı bölüm tabanlı öğrenme yapısını tanıtmaktadır.**

#### Eklendi
- **📚 Bölüm Tabanlı Öğrenme Sistemi**: Tüm kurs 8 ilerlemeli öğrenme bölümüne yeniden yapılandırıldı
  - Bölüm 1: Temel ve Hızlı Başlangıç (⭐ - 30-45 dakika)
  - Bölüm 2: AI-Öncelikli Geliştirme (⭐⭐ - 1-2 saat)
  - Bölüm 3: Konfigürasyon ve Kimlik Doğrulama (⭐⭐ - 45-60 dakika)
  - Bölüm 4: Kod Olarak Altyapı ve Dağıtım (⭐⭐⭐ - 1-1.5 saat)
  - Bölüm 5: Çok Ajanlı AI Çözümleri (⭐⭐⭐⭐ - 2-3 saat)
  - Bölüm 6: Ön Dağıtım Doğrulama ve Planlama (⭐⭐ - 1 saat)
  - Bölüm 7: Sorun Giderme ve Hata Ayıklama (⭐⭐ - 1-1.5 saat)
  - Bölüm 8: Üretim ve Kurumsal Desenler (⭐⭐⭐⭐ - 2-3 saat)
- **📚 Kapsamlı Gezinme Sistemi**: Tüm dokümantasyonda tutarlı gezinme başlıkları ve altbilgiler
- **🎯 İlerleme Takibi**: Kurs tamamlama kontrol listesi ve öğrenme doğrulama sistemi
- **🗺️ Öğrenme Yolu Rehberi**: Farklı deneyim seviyeleri ve hedefler için net giriş noktaları
- **🔗 Çapraz Referans Gezinme**: İlgili bölümler ve önkoşullar açıkça bağlandı

#### Geliştirildi
- **README Yapısı**: Bölüm tabanlı organizasyon ile yapılandırılmış öğrenme platformuna dönüştürüldü
- **Dokümantasyon Gezinme**: Her sayfada artık bölüm bağlamı ve ilerleme rehberi mevcut
- **Şablon Organizasyonu**: Örnekler ve şablonlar ilgili öğrenme bölümlerine haritalandı

- **Kaynak Entegrasyonu**: İlgili bölümlerle bağlantılı hile sayfaları, SSS ve çalışma kılavuzları
- **Atölye Entegrasyonu**: Birden fazla bölüm öğrenme hedefiyle eşlenen uygulamalı laboratuvarlar

#### Değiştirilenler
- **Öğrenme İlerlemesi**: Doğrusal dokümantasyondan esnek bölüm tabanlı öğrenmeye geçiş
- **Yapılandırma Konumu**: Daha iyi öğrenme akışı için yapılandırma kılavuzu 3. Bölüm olarak yeniden konumlandırıldı
- **Yapay Zeka İçerik Entegrasyonu**: Öğrenme yolculuğu boyunca AI'ya özel içeriğin daha iyi entegrasyonu
- **Üretim İçeriği**: Kurumsal öğrenenler için gelişmiş kalıplar 8. Bölümde konsolide edildi

#### İyileştirilenler
- **Kullanıcı Deneyimi**: Net gezinme izleri ve bölüm ilerleme göstergeleri
- **Erişilebilirlik**: Kolay kurs gezintisi için tutarlı gezinme kalıpları
- **Profesyonel Sunum**: Akademik ve kurumsal eğitimler için üniversite tarzı kurs yapısı
- **Öğrenme Verimliliği**: Geliştirilmiş organizasyon ile ilgili içeriğe ulaşma süresinin azaltılması

#### Teknik Uygulama
- **Geçiş Başlıkları**: 40'tan fazla dokümantasyon dosyasında standartlaştırılmış bölüm gezintisi
- **Altbilgi Gezinmesi**: Tutarlı ilerleme yönlendirmesi ve bölüm tamamlama göstergeleri
- **Çapraz Bağlantılama**: İlgili kavramları bağlayan kapsamlı dahili bağlantı sistemi
- **Bölüm Eşleştirmesi**: Şablonlar ve örnekler öğrenme hedefleriyle net şekilde ilişkilendirildi

#### Çalışma Kılavuzu Geliştirmesi
- **📚 Kapsamlı Öğrenme Hedefleri**: 8 bölümlü sisteme uyumlu şekilde yeniden yapılandırılmış çalışma kılavuzu
- **🎯 Bölüm Bazlı Değerlendirme**: Her bölümde özel öğrenme hedefleri ve uygulamalı egzersizler
- **📋 İlerleme Takibi**: Ölçülebilir sonuçlar ve tamamlanma kontrol listeleri içeren haftalık öğrenme programı
- **❓ Değerlendirme Soruları**: Her bölüm için profesyonel sonuçlara dayalı bilgi doğrulama soruları
- **🛠️ Uygulamalı Egzersizler**: Gerçek dağıtım senaryoları ve sorun giderme ile uygulamalı aktiviteler
- **📊 Beceri İlerlemesi**: Temel kavramlardan kurumsal kalıplara net ilerleme ve kariyer gelişimine odaklanma
- **🎓 Sertifikasyon Çerçevesi**: Profesyonel gelişim çıktıları ve topluluk tanınma sistemi
- **⏱️ Zaman Çizelgesi Yönetimi**: Kilometre taşı doğrulamalı yapılandırılmış 10 haftalık öğrenme planı

### [v3.1.0] - 2025-09-17

#### Geliştirilmiş Çoklu Ajan AI Çözümleri
**Bu sürüm, çoklu ajan perakende çözümünü daha iyi ajan adlandırması ve geliştirilmiş dokümantasyon ile iyileştirir.**

#### Değiştirilenler
- **Çoklu Ajan Terminolojisi**: Daha net anlaşılması için perakende çoklu ajan çözümünde "Cora ajanı" yerine "Müşteri ajanı" kullanıldı
- **Ajan Mimarisi**: Tüm dokümantasyon, ARM şablonları ve kod örnekleri tutarlı "Müşteri ajanı" adlandırması kullanacak şekilde güncellendi
- **Yapılandırma Örnekleri**: Güncellenmiş adlandırma kurallarıyla ajanın yapılandırma kalıpları modernize edildi
- **Dokümantasyon Tutarlılığı**: Tüm referansların profesyonel ve açıklayıcı ajan isimleri kullandığından emin olundu

#### Geliştirilenler
- **ARM Şablon Paketi**: Customer agent referanslarıyla güncellenmiş retail-multiagent-arm-template
- **Mimari Diyagramlar**: Güncellenmiş ajan adlandırması ile yenilenmiş Mermaid diyagramları
- **Kod Örnekleri**: Python sınıfları ve uygulama örnekleri artık CustomerAgent adlandırmasını kullanıyor
- **Ortam Değişkenleri**: Tüm dağıtım betikleri CUSTOMER_AGENT_NAME konvansiyonlarını kullanacak şekilde güncellendi

#### İyileştirilenler
- **Geliştirici Deneyimi**: Dokümantasyonda daha net ajan rolleri ve sorumlulukları
- **Üretime Hazırlık**: Kurumsal adlandırma standartlarıyla daha iyi uyum
- **Öğrenme Materyalleri**: Eğitim amaçlı daha sezgisel ajan adlandırması
- **Şablon Kullanılabilirliği**: Ajan işlevleri ve dağıtım kalıplarının anlaşılmasının basitleştirilmesi

#### Teknik Detaylar
- CustomerAgent referanslarıyla güncellenmiş Mermaid mimari diyagramları
- Python örneklerinde CoraAgent sınıf adları CustomerAgent ile değiştirildi
- ARM şablonu JSON yapılandırmaları "customer" ajan türünü kullanacak şekilde değiştirildi
- Ortam değişkenleri CORA_AGENT_*'den CUSTOMER_AGENT_* kalıplarına güncellendi
- Tüm dağıtım komutları ve konteyner yapılandırmaları yenilendi

### [v3.0.0] - 2025-09-12

#### Büyük Değişiklikler - AI Geliştirici Odaklı ve Microsoft Foundry Entegrasyonu
**Bu sürüm, depoyu kapsamlı AI odaklı öğrenme kaynağına dönüştürür ve Microsoft Foundry entegrasyonunu içerir.**

#### Eklenenler
- **🤖 AI-Öncelikli Öğrenme Yolu**: AI geliştiricileri ve mühendislerine öncelik veren tam yeniden yapılandırma
- **Microsoft Foundry Entegrasyon Kılavuzu**: AZD ile Microsoft Foundry hizmetlerini bağlama için kapsamlı dokümantasyon
- **AI Model Dağıtım Kalıpları**: Model seçimi, yapılandırma ve üretim dağıtım stratejilerini içeren ayrıntılı rehber
- **AI Atölye Labı**: AI uygulamalarını AZD'ye dağıtılabilir çözümlere dönüştürmek için 2-3 saatlik uygulamalı atölye
- **Üretim AI En İyi Uygulamaları**: AI iş yüklerini ölçeklendirme, izleme ve güvence altına alma için kurumsal hazır kalıplar
- **AI'ya Özel Sorun Giderme Kılavuzu**: Microsoft Foundry Modelleri, Bilişsel Hizmetler ve AI dağıtım sorunları için kapsamlı sorun giderme
- **AI Şablon Galerisi**: Karmaşıklık dereceleriyle Microsoft Foundry şablonlarından seçkiler
- **Atölye Materyalleri**: Uygulamalı laboratuvarlar ve referans materyalleri içeren tam atölye yapısı

#### Geliştirilenler
- **README Yapısı**: Microsoft Foundry Discord'dan %45 topluluk ilgisi verisi ile AI geliştirici odaklı
- **Öğrenme Yolları**: Öğrenciler ve DevOps mühendisleri için geleneksel yollarla paralel yürüyen özel AI geliştirici yolculuğu
- **Şablon Önerileri**: azure-search-openai-demo, contoso-chat ve openai-chat-app-quickstart gibi öne çıkan AI şablonları
- **Topluluk Entegrasyonu**: AI'ya özel kanallar ve tartışmalarla geliştirilmiş Discord topluluk desteği

#### Güvenlik ve Üretim Odaklılık
- **Yönetilen Kimlik Kalıpları**: AI'ya özgü kimlik doğrulama ve güvenlik yapılandırmaları
- **Maliyet Optimizasyonu**: AI iş yükleri için token kullanımı takibi ve bütçe kontrolleri
- **Çok Bölgeli Dağıtım**: Küresel AI uygulama dağıtım stratejileri
- **Performans İzleme**: AI'ya özgü metrikler ve Application Insights entegrasyonu

#### Dokümantasyon Kalitesi
- **Doğrusal Kurs Yapısı**: Başlangıçtan ileri düzey AI dağıtım kalıplarına mantıklı ilerleme
- **Doğrulanmış URL'ler**: Tüm dış depo bağlantıları doğrulanmış ve erişilebilir
- **Tam Referans**: Tüm dahili dokümantasyon bağlantıları doğrulanmış ve işlevsel
- **Üretime Hazır**: Gerçek dünya örnekleriyle kurumsal dağıtım kalıpları

### [v2.0.0] - 2025-09-09

#### Büyük Değişiklikler - Depo Yeniden Yapılandırması ve Profesyonel Gelişim
**Bu sürüm, depo yapısı ve içerik sunumunda önemli bir yenileme temsil eder.**

#### Eklenenler
- **Yapılandırılmış Öğrenme Çerçevesi**: Tüm dokümantasyon sayfalarında Giriş, Öğrenme Hedefleri ve Öğrenme Çıktıları bölümleri eklendi
- **Gezinme Sistemi**: Tüm dokümantasyonda önceki/sonraki ders bağlantıları eklenerek rehberli öğrenme ilerlemesi sağlandı
- **Çalışma Kılavuzu**: Öğrenme hedefleri, uygulamalı egzersizler ve değerlendirme materyalleri içeren kapsamlı study-guide.md
- **Profesyonel Sunum**: Erişilebilirlik ve profesyonel görünüm için tüm emoji ikonları kaldırıldı
- **İçerik Yapısı Geliştirmesi**: Öğrenme materyallerinde organizasyon ve akış iyileştirildi

#### Değiştirilenler
- **Dokümantasyon Formatı**: Tutarlı öğrenme odaklı yapı ile tüm dokümantasyon standartlaştırıldı
- **Gezinme Akışı**: Tüm öğrenme materyallerinde mantıklı ilerleme uygulandı
- **İçerik Sunumu**: Net ve profesyonel biçimlendirme lehine süsleyici öğeler kaldırıldı
- **Bağlantı Yapısı**: Yeni gezinme sistemini desteklemek için tüm dahili bağlantılar güncellendi

#### İyileştirilenler
- **Erişilebilirlik**: Daha iyi ekran okuyucu uyumu için emoji bağımlılıkları kaldırıldı
- **Profesyonel Görünüm**: Kurumsal öğrenmeye uygun temiz, akademik tarz sunum
- **Öğrenme Deneyimi**: Her ders için net hedefler ve çıktılar içeren yapılandırılmış yaklaşım
- **İçerik Organizasyonu**: İlgili konular arasındaki daha iyi mantıksal akış ve bağlantı

### [v1.0.0] - 2025-09-09

#### İlk Yayın - Kapsamlı AZD Öğrenme Deposu

#### Eklenenler
- **Temel Dokümantasyon Yapısı**
  - Tam bir başlangıç kılavuz serisi
  - Kapsamlı dağıtım ve hazırlık dokümantasyonu
  - Ayrıntılı sorun giderme kaynakları ve hata ayıklama kılavuzları
  - Dağıtımdan önce doğrulama araçları ve prosedürleri

- **Başlangıç Modülü**
  - AZD Temelleri: Temel kavramlar ve terminoloji
  - Kurulum Kılavuzu: Platforma özel kurulum talimatları
  - Yapılandırma Kılavuzu: Ortam kurulumu ve kimlik doğrulama
  - İlk Proje Eğitimi: Adım adım uygulamalı öğrenme

- **Dağıtım ve Hazırlık Modülü**
  - Dağıtım Kılavuzu: Tam iş akışı dokümantasyonu
  - Hazırlık Kılavuzu: Bicep ile Altyapı Kod olarak
  - Üretim dağıtımları için en iyi uygulamalar
  - Çok hizmetli mimari kalıplar

- **Dağıtımdan Önce Doğrulama Modülü**
  - Kapasite Planlaması: Azure kaynak kullanılabilirliği doğrulaması
  - SKU Seçimi: Kapsamlı hizmet seviyesi rehberi
  - Uçuş Öncesi Kontroller: Otomatik doğrulama betikleri (PowerShell ve Bash)
  - Maliyet tahmini ve bütçe planlama araçları

- **Sorun Giderme Modülü**
  - Yaygın Sorunlar: Sık karşılaşılan problemler ve çözümleri
  - Hata Ayıklama Kılavuzu: Sistematik sorun giderme metodolojileri
  - İleri teşhis teknikleri ve araçları
  - Performans izleme ve optimizasyon

- **Kaynaklar ve Referanslar**
  - Komut Hile Sayfası: Temel komutlar için hızlı başvuru
  - Terimler Sözlüğü: Kapsamlı terminoloji ve kısaltma açıklamaları
  - SSS: Yaygın sorular için ayrıntılı cevaplar
  - Dış kaynak bağlantıları ve topluluk bağlantıları

- **Örnekler ve Şablonlar**
  - Basit Web Uygulaması örneği
  - Statik Web Sitesi dağıtım şablonu
  - Konteyner Uygulama yapılandırması
  - Veritabanı entegrasyon kalıpları
  - Mikroservis mimarisi örnekleri
  - Sunucusuz fonksiyon uygulamaları

#### Özellikler
- **Çok Platform Desteği**: Windows, macOS ve Linux için kurulum ve yapılandırma rehberleri
- **Çeşitli Yetenek Seviyeleri**: Öğrencilerden profesyonel geliştiricilere kadar içerik tasarımı
- **Pratik Odaklı**: Uygulamalı örnekler ve gerçek dünya senaryoları
- **Kapsamlı Kapsama**: Temel kavramlardan ileri düzey kurumsal kalıplara kadar
- **Güvenlik Öncelikli Yaklaşım**: Güvenlik en iyi uygulamaları entegrasyonu
- **Maliyet Optimizasyonu**: Maliyet etkin dağıtım ve kaynak yönetimi rehberliği

#### Dokümantasyon Kalitesi
- **Detaylı Kod Örnekleri**: Uygulamalı, test edilmiş kod örnekleri
- **Adım Adım Talimatlar**: Net, uygulanabilir rehberlik
- **Kapsamlı Hata Yönetimi**: Yaygın sorunlar için sorun giderme
- **En İyi Uygulamalar Entegrasyonu**: Endüstri standartları ve öneriler
- **Sürüm Uyumluluğu**: En son Azure servisleri ve azd özellikleri ile uyumlu

## Planlanan Gelecek Geliştirmeler

### Sürüm 3.1.0 (Planlandı)
#### AI Platform Genişletmesi
- **Çoklu Model Desteği**: Hugging Face, Azure Machine Learning ve özel modeller için entegrasyon kalıpları
- **AI Ajan Çerçeveleri**: LangChain, Semantic Kernel ve AutoGen dağıtımları için şablonlar
- **Gelişmiş RAG Kalıpları**: Azure AI Search dışındaki vektör veritabanı seçenekleri (Pinecone, Weaviate, vb.)
- **AI Gözlemlenebilirliği**: Model performansı, token kullanımı ve yanıt kalitesi için geliştirilmiş izleme

#### Geliştirici Deneyimi
- **VS Code Uzantısı**: Entegre AZD + Microsoft Foundry geliştirme deneyimi
- **GitHub Copilot Entegrasyonu**: AI destekli AZD şablon üretimi
- **Etkileşimli Eğitimler**: AI senaryoları için otomatik doğrulamalı uygulamalı kodlama alıştırmaları
- **Video İçerik**: AI dağıtımlarına odaklanan görsel öğrenenler için destekleyici video eğitimleri

### Sürüm 4.0.0 (Planlandı)
#### Kurumsal AI Kalıpları
- **Yönetim Çerçevesi**: AI model yönetimi, uyumluluk ve denetim izleri
- **Çok Kiracılı AI**: İzole AI hizmetleri ile birden çok müşteriye servis verme kalıpları
- **Edge AI Dağıtımı**: Azure IoT Edge ve konteyner örnekleri ile entegrasyon
- **Hibrit Bulut AI**: AI iş yükleri için çoklu bulut ve hibrit dağıtım kalıpları

#### Gelişmiş Özellikler
- **AI Boru Hattı Otomasyonu**: Azure Machine Learning boru hatları ile MLOps entegrasyonu
- **Gelişmiş Güvenlik**: Sıfır güvensizlik kalıpları, özel uç noktalar ve ileri tehdit koruması
- **Performans Optimizasyonu**: Yüksek verimlilikli AI uygulamaları için ileri ayar ve ölçeklendirme stratejileri
- **Küresel Dağıtım**: AI uygulamaları için içerik teslimi ve uç önbellekleme kalıpları

### Sürüm 3.0.0 (Planlandı) - Mevcut Sürümle Değiştirildi
#### Önerilen Eklemeler - Şimdi v3.0.0'da Uygulandı
- ✅ **AI Odaklı İçerik**: Kapsamlı Microsoft Foundry entegrasyonu (Tamamlandı)
- ✅ **Etkileşimli Eğitimler**: Uygulamalı AI atölye laboratuvarı (Tamamlandı)
- ✅ **Gelişmiş Güvenlik Modülü**: AI'ya özgü güvenlik kalıpları (Tamamlandı)
- ✅ **Performans Optimizasyonu**: AI iş yükü ayar stratejileri (Tamamlandı)

### Sürüm 2.1.0 (Planlandı) - Bazı Kısımları v3.0.0'da Uygulandı
#### Küçük İyileştirmeler - Bazıları Mevcut Sürümde Tamamlandı
- ✅ **Ek Örnekler**: AI odaklı dağıtım senaryoları (Tamamlandı)
- ✅ **Genişletilmiş SSS**: AI'ya özel sorular ve sorun giderme (Tamamlandı)
- **Araç Entegrasyonu**: Gelişmiş IDE ve editör entegrasyon rehberleri
- ✅ **İzleme Genişletmesi**: AI'ya özgü izleme ve uyarı kalıpları (Tamamlandı)

#### Gelecek Sürüm İçin Planlanmaya Devam Ediyor
- **Mobil Dostu Dokümantasyon**: Mobil öğrenim için duyarlı tasarım
- **Çevrimdışı Erişim**: İndirilebilir dokümantasyon paketleri
- **Gelişmiş IDE Entegrasyonu**: AZD + AI iş akışları için VS Code uzantısı
- **Topluluk Panosu**: Gerçek zamanlı topluluk ölçümleri ve katkı takibi

## Değişiklik Günlüğüne Katkıda Bulunma

### Değişiklik Bildirimi
Bu depoya katkıda bulunurken, değişiklik günlüğü girdilerinin aşağıdaki bilgileri içermesini sağlayınız:

1. **Sürüm Numarası**: Semantik sürümleme (major.minor.patch) formatında
2. **Tarih**: Yayın veya güncelleme tarihi (YYYY-AA-GG formatında)
3. **Kategori**: Eklenen, Değiştirilen, Kullanımdan Kaldırılan, Kaldırılan, Düzeltildi, Güvenlik
4. **Açık Tanım**: Nelerin değiştiğine dair kısa ve öz açıklama
5. **Etkileşim Değerlendirmesi**: Değişikliklerin mevcut kullanıcıları nasıl etkilediği

### Değişiklik Kategorileri

#### Eklenenler
- Yeni özellikler, dokümantasyon bölümleri veya yetenekler
- Yeni örnekler, şablonlar veya öğrenme kaynakları
- İlave araçlar, betikler veya yardımcı programlar

#### Değiştirilenler
- Mevcut işlevsellik veya dokümantasyonda yapılan değişiklikler
- Anlaşılırlığı veya doğruluğu artırmak için güncellemeler
- İçerik veya organizasyonun yeniden yapılandırılması

#### Kullanımdan Kaldırılanlar
- Aşamalandırılarak kaldırılan özellikler veya yaklaşımlar
- Kaldırılması planlanan dokümantasyon bölümleri
- Daha iyi alternatifleri olan yöntemler

#### Kaldırılanlar
- Artık geçerli olmayan özellikler, dokümantasyon veya örnekler
- Güncel olmayan bilgiler veya kullanımdan kaldırılmış yaklaşımlar
- Gereksiz veya konsolide edilmiş içerik

#### Düzeltildi
- Dokümantasyon veya koddaki hataların düzeltilmesi
- Bildirilen sorun veya problemlerin çözümü
- Doğruluk veya işlevsellik iyileştirmeleri


#### Güvenlik
- Güvenlikle ilgili iyileştirmeler veya düzeltmeler
- Güvenlik en iyi uygulamalarında güncellemeler
- Güvenlik açıklarının çözümü

### Semantik Versiyonlama Rehberi

#### Ana Versiyon (X.0.0)
- Kullanıcı müdahalesi gerektiren kırıcı değişiklikler
- İçerik veya organizasyonun önemli derecede yeniden yapılandırılması
- Temel yaklaşımı veya metodolojiyi değiştiren değişiklikler

#### Minor Versiyon (X.Y.0)
- Yeni özellikler veya içerik eklemeleri
- Geriye dönük uyumluluğu koruyan geliştirmeler
- Ek örnekler, araçlar veya kaynaklar

#### Patch Versiyon (X.Y.Z)
- Hata düzeltmeleri ve düzeltmeler
- Mevcut içeriğe yapılan küçük iyileştirmeler
- Açıklamalar ve küçük geliştirmeler

## Topluluk Geri Bildirimi ve Öneriler

Bu öğrenme kaynağını geliştirmek için topluluk geri bildirimlerini aktif olarak teşvik ediyoruz:

### Geri Bildirim Nasıl Sağlanır
- **GitHub Issues**: Sorunları bildirin veya iyileştirme önerin (AI özel sorunları da kabul edilir)
- **Discord Tartışmaları**: Fikir paylaşın ve Microsoft Foundry topluluğu ile etkileşime geçin
- **Pull Requestler**: İçeriğe doğrudan iyileştirmeler katkıda bulunun, özellikle AI şablonları ve rehberlerde
- **Microsoft Foundry Discord**: AZD + AI tartışmaları için #Azure kanalına katılın
- **Topluluk Forumları**: Daha geniş Azure geliştirici tartışmalarına katılın

### Geri Bildirim Kategorileri
- **AI İçerik Doğruluğu**: AI servis entegrasyonu ve dağıtımı bilgilerine düzeltmeler
- **Öğrenme Deneyimi**: AI geliştirici öğrenme akışında gelişme önerileri
- **Eksik AI İçeriği**: Ek AI şablonları, desenleri veya örnekleri talepleri
- **Erişilebilirlik**: Çeşitli öğrenme ihtiyaçları için iyileştirmeler
- **AI Araç Entegrasyonu**: Daha iyi AI geliştirme iş akışı entegrasyonu önerileri
- **Prodüksiyon AI Desenleri**: Kurumsal AI dağıtım deseni talepleri

### Yanıt Taahhüdü
- **Sorun Yanıtı**: Rapor edilen problemler için 48 saat içerisinde yanıt
- **Özellik Talepleri**: Bir hafta içinde değerlendirme
- **Topluluk Katkıları**: Bir hafta içinde inceleme
- **Güvenlik Sorunları**: Öncelikli ve hızlandırılmış yanıt

## Bakım Takvimi

### Düzenli Güncellemeler
- **Aylık İncelemeler**: İçerik doğruluğu ve link doğrulaması
- **Üç Aylık Güncellemeler**: Büyük içerik eklemeleri ve iyileştirmeler
- **Yarıyıl İncelemeleri**: Kapsamlı yeniden yapılandırma ve geliştirme
- **Yıllık Yayınlar**: Önemli iyileştirmelerle ana versiyon güncellemeleri

### İzleme ve Kalite Güvencesi
- **Otomatik Testler**: Kod örnekleri ve bağlantıların düzenli doğrulanması
- **Topluluk Geri Bildirim Entegrasyonu**: Kullanıcı önerilerinin düzenli dahil edilmesi
- **Teknoloji Güncellemeleri**: En yeni Azure hizmetleri ve azd sürümleri ile uyum
- **Erişilebilirlik Denetimleri**: Kapsayıcı tasarım prensipleri için düzenli inceleme

## Versiyon Destek Politikası

### Mevcut Versiyon Desteği
- **En Son Ana Versiyon**: Düzenli güncellemelerle tam destek
- **Önceki Ana Versiyon**: 12 ay boyunca güvenlik güncellemeleri ve kritik düzeltmeler
- **Eski Versiyonlar**: Yalnızca topluluk desteği, resmi güncelleme yok

### Geçiş Rehberliği
Ana versiyonlar yayımlandığında, aşağıdakiler sağlanır:
- **Geçiş Kılavuzları**: Adım adım geçiş talimatları
- **Uyumluluk Notları**: Kırıcı değişikliklerin detayları
- **Araç Desteği**: Geçişe yardımcı olacak betikler veya yardımcı programlar
- **Topluluk Desteği**: Geçiş soruları için özel forumlar

---

**Gezinme**
- **Önceki Ders**: [Çalışma Kılavuzu](resources/study-guide.md)
- **Sonraki Ders**: [Ana README](README.md) dosyasına dön

**Güncel Kalın**: Bu depoyu, yeni sürümler ve öğrenme materyalleri için önemli güncellemeler hakkında bildirim alabilmek için izleyin.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->