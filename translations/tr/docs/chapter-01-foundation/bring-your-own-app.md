# Kendi Uygulamanızı Getirin - Mevcut Bir Projeye azd Ekleme

**Bölüm Gezinme:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 1 - Temel & Hızlı Başlangıç
- **⬅️ Önceki**: [İlk Projeniz](first-project.md)
- **➡️ Sonraki**: [Geliştirici Konteynerleri & Codespaces](dev-containers.md)

> Haziran 2026'da `azd 1.25.6` ile doğrulanmıştır.

## Giriş

[İlk Projeniz](first-project.md) dersinde bir şablondan başlayarak bir uygulama dağıttınız. Ancak çoğu zaman zaten bir uygulamanız vardır—makinenizde bir klasörde duran bir Node.js API'si, bir Python Flask servisi, bir .NET web uygulaması gibi. Bu ders, mevcut kodunuza azd nasıl ekleyeceğinizi gösterir, böylece şablon gerekmeksizin `azd up` ile dağıtabilirsiniz.

## Öğrenme Hedefleri

Bu dersin sonunda şunları yapacaksınız:
- azd projesi başlatmanın üç yolunu anlamak
- Mevcut bir kod tabanında `azd init` çalıştırmak
- `azure.yaml` ve `infra/` klasörünün uygulamanız için ne yaptığını anlamak
- azd'nin altyapıyı ne zaman oluşturmasına izin verip ne zaman kendi altyapınızı yazmanız gerektiğini bilmek
- Mevcut uygulamanızı `azd up` ile Azure'a dağıtmak

## Öğrenme Çıktıları

Bu dersi tamamladıktan sonra şunları yapabileceksiniz:
- Zaten sahip olduğunuz bir projede azd'yi başlatmak
- Temel bir `azure.yaml` dosyasını okumak ve düzenlemek
- `azd infra generate` ile başlangıç altyapısı üretmek
- Uygulamanız için uygun bir Azure barındırma seçmek
- Kendi uygulamanızı dağıtmak ve temizlemek

---

## azd Projesi Başlatmanın Üç Yolu

| Başlangıç noktası | Komut | Ne zaman kullanılmalı |
|----------------|---------|-------------|
| **Bir şablondan** | `azd init --template <name>` | Öğrenme veya kanıtlanmış bir örnekten yeni bir uygulama başlatma |
| **Mevcut kodunuzdan** | `azd init` (proje klasörünüzde) | Zaten bir uygulamanız var ve dağıtmak istiyorsunuz |
| **Bir Git deposundan** | `azd init --from-code` (klonlanmış bir depoda) | Mevcut bir depoya azd'yi uygulama |

İlk seçeneği zaten uyguladınız. Bu ders ikinci seçeneği—gerçek dünyada en yaygın senaryoyu—kapsar.

---

## Adım 1: Projenizde `azd init` Çalıştırın

Mevcut proje klasörünüzün içinde bir terminal açın ve şunu çalıştırın:

```bash
cd my-existing-app
azd init
```

azd size nasıl başlatmak istediğinizi soracak. Şunu seçin:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

**"Mevcut dizindeki kodu kullan."** seçeneğini işaretleyin. azd ardından klasörünüzü tarar, dilinizi ve çerçevenizi algılar ve bir barındırma önerir.

### azd'nin algıladıkları

azd, `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` veya bir `Dockerfile` gibi göstergeleri arar ve eşleşen bir Azure barındırma hizmeti önerir:

| Uygulamanız | Muhtemel algılanan barındırma |
|----------|----------------------|
| Node.js / Python / .NET web uygulaması | Azure App Service veya Container Apps |
| Konteynerleştirilmiş uygulama (`Dockerfile`) | Azure Container Apps |
| Function uygulaması | Azure Functions |
| Statik site (React/Vue derleme çıktısı) | Azure Static Web Apps |

Algılanan hizmet(leri) onaylayın, azd ihtiyaç duyduğunuz dosyaları hazırlar.

---

## Adım 2: azd'nin Oluşturduklarını Anlayın

init'ten sonra, projenizde iki yeni şey olacak:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — proje tanımı

Bu, bir azd projesinin kalbidir. Minimal bir örnek şöyle görünür:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` bloğu ana parçadır: her giriş, kodunuzun bir klasörünü bir Azure barındırma hizmetine eşler. Uygulamanız hem bir ön yüz hem de bir API içeriyorsa, iki hizmetiniz olur.

### `infra/` — kod olarak Azure kaynaklarınız

`infra/` klasörü, uygulamanızın ihtiyaç duyduğu Azure kaynaklarını (App Service, veritabanı vb.) tanımlayan Bicep dosyalarını barındırır. Bunları el ile yazmak zorunda değilsiniz—azd çalışan bir başlangıç noktası üretir. Daha sonra kaynak eklemek veya güvenliği sıkılaştırmak için bunları düzenleyebilirsiniz (bakınız [Bölüm 4](../chapter-04-infrastructure/README.md)).

> **İpucu:** Dağıtmadan önce üretilen altyapıyı görmek veya özelleştirmek ister misiniz? IaC'yi diske yazmak için `azd infra generate` (aynı zamanda `azd infra synth` olarak da kullanılabilir) çalıştırın, böylece inceleyebilir ve sürüm kontrolüne alabilirsiniz.

---

## Adım 3: Gerekli Yapılandırmayı Ayarlayın

Uygulamanız ayarlar veya gizli bilgiler gerektiriyorsa (bir bağlantı dizesi, bir API anahtarı), bunları sabit kodlama yapmayın. Ortam değişkenlerini kullanın:

```bash
# Bir ortam oluştur
azd env new dev

# Gizli olmayan bir değer ayarla
azd env set API_VERSION 1.0.0
```

Gerçek gizli bilgiler için bunları Key Vault'ta depolayın ve altyapınızdan referans verin—bkz. [Bölüm 3: Yapılandırma & Kimlik Doğrulama](../chapter-03-configuration/authsecurity.md).

---

## Adım 4: Dağıtım

Şimdi zaten bildiğiniz aynı iş akışını kullanın:

```bash
# Kimlik doğrulaması yapın (azd için gerekli)
azd auth login

# Oluşturulacak kaynakları önizleyin
azd provision --preview

# Altyapıyı hazırlayın ve kodunuzu dağıtın
azd up
```

Tamamlandığında, azd uygulamanızın URL'sini yazdırır. Bunu herhangi bir azd uygulamasında olduğu gibi doğrulayın:

```bash
azd show           # uç noktaları göster
azd monitor --logs # gerekirse günlükleri kontrol et
```

---

## İlk Kez Karşılaşılan Yaygın Sorunlar

| Belirti | Muhtemel neden | Çözüm |
|---------|--------------|-----|
| azd uygulamamı algılamadı | Manifest eksik (ör. `package.json`) | Manifest'i ekleyin veya `azd init` sırasında host'u manuel olarak seçin |
| Derleme `azd up` sırasında başarısız oluyor | Uygulama bir derleme adımına ihtiyaç duyuyor | `azure.yaml` içindeki hizmet altında `buildCommand`/`outputPath` ekleyin |
| Uygulama başlıyor ama hatalar döndürüyor | Yapılandırma/gizli bilgi eksik | Değerleri `azd env set` ile ayarlayın veya Key Vault'u bağlayın |
| Yanlış host seçildi | Otomatik algılama tahmin etti | `azure.yaml` içindeki `host:`'u düzenleyin ve `azd up`'u yeniden çalıştırın |

Daha fazlası için bkz. [Bölüm 7: Sorun Giderme](../chapter-07-troubleshooting/README.md).

---

## Temizlik

```bash
azd down --force --purge
```

---

## Özet

- `azd init` → **"Mevcut dizindeki kodu kullan."** zaten sahip olduğunuz bir uygulamaya azd ekler.
- `azure.yaml` kod klasörlerinizi Azure barındırma hizmetlerine eşler; `infra/` kaynakları Bicep olarak tanımlar.
- `azd infra generate`, üretilen altyapıyı incelemenize veya özelleştirmenize olanak tanır.
- Başlatıldıktan sonra, mevcut uygulamanız şablon tabanlı bir uygulama ile aynı `azd up` / `azd down` iş akışını kullanır.

---

## 🔗 Gezinme

| Yön | Ders |
|-----------|--------|
| **Önceki** | [İlk Projeniz](first-project.md) |
| **Sonraki** | [Geliştirici Konteynerleri & Codespaces](dev-containers.md) |

## 📖 İlgili Kaynaklar

- [AZD Temelleri](azd-basics.md)
- [Bölüm 4: Kod Olarak Altyapı](../chapter-04-infrastructure/README.md)
- [Yapılandırma & Kimlik Doğrulama](../chapter-03-configuration/authsecurity.md)
- [Komut Hızlı Başvurusu](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->