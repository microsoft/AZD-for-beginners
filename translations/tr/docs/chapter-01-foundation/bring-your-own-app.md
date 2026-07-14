# Kendi Uygulamanı Getir - Mevcut Bir Projeye azd Ekleme

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfa**: [Başlangıç için AZD](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 1 - Temel ve Hızlı Başlangıç
- **⬅️ Önceki**: [İlk Projeniz](first-project.md)
- **➡️ Sonraki**: [Geliştirici Konteynerleri & Kod Alanları](dev-containers.md)

> Temmuz 2026'da `azd 1.27.1` sürümüyle doğrulanmıştır.

## Giriş

[İlk Projeniz](first-project.md) dersinde bir şablon kullanarak bir uygulama dağıttınız. Ancak çoğu zaman zaten elinizde bir uygulama olur—örneğin bir Node.js API, bir Python Flask servisi, bir .NET web uygulaması—bilgisayarınızda bir klasörde duruyordur. Bu ders, azd'yi mevcut koda nasıl ekleyeceğinizi gösterir, böylece `azd up` komutuyla dağıtabilirsiniz, herhangi bir şablon gerekmez.

## Öğrenme Hedefleri

Bu dersi tamamladığınızda:
- azd projesi başlatmanın üç yolunu anlayacaksınız
- Mevcut bir kod tabanı içinde `azd init` çalıştırabileceksiniz
- `azure.yaml` dosyasının ve `infra/` klasörünün uygulamanız için ne işe yaradığını kavrayacaksınız
- azd'nin altyapıyı ne zaman oluşturması gerektiğini ya da kendi altyapınızı yazmanız gerektiğini bileceksiniz
- Mevcut uygulamanızı `azd up` ile Azure'a dağıtabileceksiniz

## Öğrenme Çıktıları

Bu dersi tamamladıktan sonra aşağıdakileri yapabileceksiniz:
- Mevcut bir projede azd'yi başlatmak
- Temel bir `azure.yaml` dosyasını okuyup düzenlemek
- `azd infra generate` ile başlangıç altyapısı üretmek
- Uygulamanız için uygun Azure barındırıcısını seçmek
- Kendi uygulamanızı dağıtmak ve temizlemek

---

## azd Projesi Başlatmanın Üç Yolu

| Başlangıç noktası | Komut | Ne zaman kullanılır |
|----------------|---------|-------------|
| **Bir şablondan** | `azd init --template <name>` | Öğrenme veya kanıtlanmış bir örnekten yeni bir uygulama başlatma |
| **Mevcut kodunuzdan** | `azd init` (proje klasörünüzde) | Zaten bir uygulamanız var ve dağıtmak istiyorsunuz |
| **Bir Git deposundan** | `azd init --from-code` (klonlanmış depoda) | Var olan bir depoya azd'yi adapte etmek |

İlk seçeneği zaten denediniz. Bu ders ikinci seçeneği ele alır—en yaygın gerçek dünya senaryosu.

---

## Adım 1: Projenizde `azd init` Çalıştırın

Mevcut proje klasörünüzün **içinde bir terminal açın** ve şunu çalıştırın:

```bash
cd my-existing-app
azd init
```

azd, başlatmayı nasıl yapmak istediğinizi soracaktır. Şunu seçin:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

**"Mevcut dizindeki kodu kullan."** seçeneğini seçin. azd klasörünüzü tarar, dili ve çerçeveyi algılar ve bir barındırıcı önerir.

### azd'nin Algıladıkları

azd, `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` veya `Dockerfile` gibi işaretler arar ve uygun Azure barındırıcısını önerir:

| Uygulamanız | Muhtemel algılanan barındırıcı |
|----------|------------------------------|
| Node.js / Python / .NET web uygulaması | Azure App Service veya Container Apps |
| Konteynerleşmiş uygulama (`Dockerfile`) | Azure Container Apps |
| Fonksiyon uygulaması | Azure Functions |
| Statik site (React/Vue derleme çıktısı) | Azure Static Web Apps |

Algılanan hizmet(ler)i onaylayın, azd gerekli dosyaları hazırlar.

---

## Adım 2: azd'nin Oluşturduklarını Anlayın

`init` işleminden sonra projenizde iki yeni şey olacak:

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

Bu, bir azd projesinin kalbidir. Minimal hali şöyle görünür:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` bloğu en önemli kısımdır: her bir giriş, kod klasörünüzü bir Azure barındırıcısına eşler. Uygulamanız hem bir ön yüz hem de bir API içeriyorsa, iki hizmetiniz olur.

### `infra/` — Azure kaynaklarınız kod olarak

`infra/` klasörü, uygulamanızın ihtiyaç duyduğu Azure kaynaklarını (App Service, veritabanı vb.) tanımlayan Bicep dosyalarını tutar. Bunları elle yazmak zorunda değilsiniz—azd çalışan bir başlangıç noktası üretir. Daha sonra kaynak eklemek veya güvenliği sıkılaştırmak için düzenleyebilirsiniz (bu [Bölüm 4](../chapter-04-infrastructure/README.md)'te anlatılmıştır).

> **İpucu:** Dağıtmadan önce oluşturulan altyapıyı görmek veya özelleştirmek ister misiniz? `azd infra generate` (veya `azd infra synth`) komutunu çalıştırarak Bulut Altyapısını Kodu olarak (IaC) disk üzerine yazdırabilir, inceleyip sürüm kontrolüne alabilirsiniz.

---

## Adım 3: Gerekli Yapılandırmayı Belirleyin

Uygulamanız ayarlar veya gizli bilgiler (bir bağlantı dizesi, API anahtarı) gerektiriyorsa, bunları sabit kod olarak yazmayın. Ortam değerlerini kullanın:

```bash
# Bir ortam oluştur
azd env new dev

# Gizli olmayan bir değer ayarla
azd env set API_VERSION 1.0.0
```

Gerçek gizli bilgileri Key Vault'ta depolayın ve altyapınızdan referans verin—detaylar için [Bölüm 3: Yapılandırma & Doğrulama](../chapter-03-configuration/authsecurity.md) bölümüne bakınız.

---

## Adım 4: Dağıtım

Artık bildiğiniz aynı iş akışını kullanabilirsiniz:

```bash
# Kimlik doğrulama (azd için gerekli)
azd auth login

# Oluşturulacak kaynakları önizleyin
azd provision --preview

# Altyapıyı sağlayın ve kodunuzu dağıtın
azd up
```

İşlem bitince azd, uygulamanızın URL'sini gösterir. Diğer azd uygulamalarında olduğu gibi doğrulayın:

```bash
azd show           # uç noktalarını göster
azd monitor --logs # gerekirse günlükleri kontrol et
```

---

## Yaygın İlk Kez Karşılaşılan Sorunlar

| Belirti | Muhtemel neden | Çözüm |
|---------|---------------|-------|
| azd uygulamamı algılamadı | Manifest dosyası eksik (örneğin, `package.json`) | Manifest dosyasını ekleyin veya `azd init` sırasında barındırıcıyı manuel seçin |
| `azd up` sırasında derleme başarısız oldu | Uygulama derleme adımı gerektiriyor | `azure.yaml` içinde hizmet altına `buildCommand`/`outputPath` ekleyin |
| Uygulama başlıyor ama hata döndürüyor | Konfigürasyon/gizli bilgi eksik | Değerleri `azd env set` ile ayarlayın veya Key Vault'u bağlayın |
| Yanlış barındırıcı seçildi | Otomatik algılamadan kaynaklı | `azure.yaml` dosyasındaki `host:` kısmını düzenleyip `azd up` yeniden çalıştırın |

Daha fazlası için [Bölüm 7: Sorun Giderme](../chapter-07-troubleshooting/README.md) bölümüne bakınız.

---

## Temizlik

```bash
azd down --force --purge
```

---

## Özet

- `azd init` → **"Mevcut dizindeki kodu kullan"** seçeneği, zaten sahip olduğunuz bir uygulamaya azd ekler.
- `azure.yaml` kod klasörlerinizi Azure barındırıcılara eşler; `infra/` kaynakları Bicep ile tanımlar.
- `azd infra generate` oluşturulan altyapıyı incelemenize veya özelleştirmenize olanak tanır.
- Başlatıldıktan sonra mevcut uygulamanız, şablon tabanlı bir uygulama ile tamamen aynı `azd up` / `azd down` iş akışını kullanır.

---

## 🔗 Navigasyon

| Yön | Ders |
|---|--------|
| **Önceki** | [İlk Projeniz](first-project.md) |
| **Sonraki** | [Geliştirici Konteynerleri & Kod Alanları](dev-containers.md) |

## 📖 İlgili Kaynaklar

- [AZD Temelleri](azd-basics.md)
- [Bölüm 4: Altyapı Kod Olarak](../chapter-04-infrastructure/README.md)
- [Yapılandırma & Doğrulama](../chapter-03-configuration/authsecurity.md)
- [Komut Hile Sayfası](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->