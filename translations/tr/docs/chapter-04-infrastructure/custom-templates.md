# Kendi azd Şablonunuzu Oluşturma

**Bölüm Gezinme:**
- **📚 Kurs Ana Sayfası**: [Başlangıç Seviyesi AZD](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 4 - Altyapı Kod Olarak ve Dağıtım
- **⬅️ Önceki**: [Dağıtım Kılavuzu](deployment-guide.md)
- **🚀 Sonraki Bölüm**: [Bölüm 5: Çoklu Ajan Çözümleri](../chapter-05-multi-agent/README.md)

> Temmuz 2026'da `azd 1.27.1` sürümü ile doğrulanmıştır.

## Giriş

Şimdiye kadar `azd init --template <isim>` ile şablonları *tüketiyordunuz*. Ancak ekibinizin beğendiği bir proje düzeniniz olduğunda — örneğin, Cosmos DB ve doğru izleme ile bir Container Uygulaması — bunu kendi tekrar kullanılabilir şablonunuza dönüştürmek isteyeceksiniz. Bir şablon, azd'nin nasıl okuyacağını bildiği öngörülebilir yapıya sahip bir Git deposundan başka bir şey değildir. Bu ders size sıfırdan bir şablon oluşturmayı, test etmeyi ve (isteğe bağlı olarak) topluluk galerisine yayınlamayı gösterecek.

## Öğrenme Hedefleri

Bu dersin sonunda:
- Bir klasörün "azd şablonu" yapan unsurları anlayacaksınız
- Gerekli dosya ve klasör düzenini bileceksiniz
- Başkalarının yeniden kullanabileceği bir `azure.yaml` ve `infra/` ekleyeceksiniz
- Şablonunuzu paylaşmadan önce yerel olarak test edeceksiniz
- Yayınlayacak ve (isteğe bağlı olarak) Awesome AZD'ye göndereceksiniz

## Öğrenme Sonuçları

Bu dersi tamamladıktan sonra:
- Yeni bir şablon deposu oluşturabileceksiniz
- Altyapıyı herhangi bir abonelikte çalışacak şekilde parametreleyebileceksiniz
- `azd init` ve `azd up` ile bir şablonu doğrulayabileceksiniz
- Topluluk galerisi için gereken meta verileri ekleyebileceksiniz

---

## Şablon Aslında Nedir?

Bir azd şablonu, en azından içerdiği **bir Git deposudur**:

| Dosya / klasör | Amaç | Gerekli mi? |
|---------------|---------|-----------|
| `azure.yaml` | Hizmetleri, ana bilgisayarları ve altyapı sağlayıcısını tanımlar | ✅ Evet |
| `infra/` | Kaynakları sağlayan Bicep, Terraform veya Pulumi | ✅ Evet |
| `src/` (veya kodunuz) | azd'nin dağıttığı uygulama kodu | ✅ Evet |
| `README.md` | Şablonun nasıl kullanılacağını açıklar | ✅ Kuvvetle önerilir |
| `.azdo/` veya `.github/` | CI/CD boru hattı tanımları | Opsiyonel |
| `.devcontainer/` | Tekrarlanabilir geliştirme ortamı | Opsiyonel |
| `azure.yaml` `metadata` | Galeri + telemetri bilgisi | Opsiyonel (yayınlamak için gerekli) |

Burada sihir yok: `azd init --template siz/sizin-depo` komutunu çalıştırdığınızda, azd repo'yu klonlar ve `azure.yaml` dosyasını okur.

---

## Adım 1: Depo Yapısını Oluşturun

Klasör yapısını elle oluşturabilir veya minimal bir şablondan başlayıp düzenleyebilirsiniz:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Standart düzeni oluştur
mkdir -p src infra
```

Tipik tamamlama düzeni şu şekildedir:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## Adım 2: `azure.yaml` Dosyasını Yazın

Bu, şablonun kalbidir. azd'ye ne dağıtacağını ve nasıl yapacağını söyler:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> `metadata.template` alanı, galeri telemetrisi tarafından kullanım sayısını saymak için kullanılır. `adı@versiyon` biçimini kullanın.

---

## Adım 3: Altyapıyı Parametreleyin

Tek bir önemli kural vardır: **asla isimleri, bölgeleri veya aboneliğe özgü değerleri sert kodlamayın.** Parametreleri ve kaynak token desenini kullanın ki aynı şablon herkesin aboneliğinde çalışsın.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Bu şablon dostu yapan iki şey vardır:

1. **`azd-env-name` etiketi** — azd bunu ortam başına kaynakları izlemek ve temizlemek için kullanır.
2. **`uniqueString(...)` kaynak tokenı** — isim çakışması olmaması için stabil, küresel benzersiz bir sonek üretir.

Azd'nin ortamdan yerleştirdiği değerleri okuyacak eşleşen bir parametre dosyası sağlayın:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd, mevcut ortamdan `${AZURE_ENV_NAME}` ve `${AZURE_LOCATION}` ifadelerini otomatik olarak değiştirir.

---

## Adım 4: Şablonunuzu Yerelde Test Edin

Paylaşmadan önce, şablonun temiz bir durumdan çalıştığını kanıtlayın.

**Yerel klasörden test edin** (Git push gerekmez):

```bash
# Boş bir dizinden, yerel şablon yolunuzu kullanarak başlatın
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Sağlama + uçtan uca dağıtım
azd auth login
azd up
```

**Sonra kapatma testini yapın**—iyi bir şablon tamamen temizlemelidir:

```bash
azd down --force --purge
```

Eğer `azd down` kaynakları bırakıyorsa, muhtemelen bir kaynağa `azd-env-name` etiketini koymayı unutmuşsunuzdur.

> **İpucu:** önce `azd provision --preview` komutunu çalıştırın. Bu, kaynak oluşturulmadan önce ne olacağını simüle eder ve şablon hatalarını gösterir.

---

## Adım 5: Şablonu Yayınlayın

Depoyu GitHub'a gönderin (başkalarının kullanmasını istiyorsanız genel yapın):

```bash
gh repo create my-azd-template --public --source=. --push
```

Artık herkes kullanabilir:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Adım 6 (İsteğe Bağlı): Awesome AZD'ye Gönderin

[Awesome AZD galerisi](https://azure.github.io/awesome-azd/) topluluk şablonlarını listeler. Listelenmek için deponuzun şunları içermesi gerekir:

- ✅ Ön koşullar, mimari diyagram ve maliyet notları bulunan net bir `README.md`
- ✅ `metadata.template` içeren çalışan bir `azure.yaml`
- ✅ Yeni bir abonelikte temiz çalışan altyapı
- ✅ Bir `LICENSE` dosyası
- ✅ (Önerilen) Tek tıkla Codespaces için `.devcontainer/`

Şablonunuzu galerinin veri dosyasına ekleyen bir çekme isteği açarak gönderin, katkı rehberini [Awesome AZD deposunda](https://github.com/Azure/awesome-azd) bulabilirsiniz.

---

## Yaygın Tuzaklar

| Tuzak | Çözüm |
|---------|-----|
| Sert kodlanmış kaynak isimleri | `uniqueString()` kaynak token'ını kullanın |
| `azd down` kaynak bırakıyor | Her kaynağı (veya kaynak grubunu) `azd-env-name` ile etiketleyin |
| Şablon size çalışıyor, başkalarına işlemiyor | Abonelik ID'leri, tenant ID'leri ve bölge varsayımlarını kaldırın |
| Çıktılar uygulamaya bağlanmamış | `SERVICE_<NAME>_ENDPOINT_URL` ve diğer `AZURE_*` çıktıları dışa aktarın |
| Galeri gönderisi reddedildi | `README.md`, `LICENSE` ve `metadata.template` ekleyin |

---

## Özet

- Bir şablon sadece bir Git deposudur, `azure.yaml`, `infra/` ve sizin kodunuz ile birlikte.
- Her şeyi parametreleyin — isimler, bölgeler ve ID'ler — böylece her yerde çalışır.
- Kaynakları her zaman `azd-env-name` ile etiketleyin, böylece `azd down` çalışır.
- Yayınlamadan önce `azd init --template <local-path>` ile yerelde test yapın.
- Awesome AZD'ye gönderim için meta veriler ve bir README ekleyin.

---

## 🔗 Gezinme

| Yön | Kaynak |
|-----------|----------|
| **Önceki** | [Dağıtım Kılavuzu](deployment-guide.md) |
| **Bölüm Ana Sayfası** | [Bölüm 4: Altyapı Kod Olarak](README.md) |
| **Sonraki Bölüm** | [Bölüm 5: Çoklu Ajan Çözümleri](../chapter-05-multi-agent/README.md) |

## 📖 İlgili Kaynaklar

- [Kaynak Sağlama](provisioning.md)
- [Awesome AZD Galerisi](https://azure.github.io/awesome-azd/)
- [Resmi azd şablon dokümanları](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->