# Kendi azd Şablonunuzu Oluşturma

**Bölüm Navigasyonu:**
- **📚 Kurs Anasayfası**: [AZD For Beginners](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 4 - Altyapı Kod Olarak ve Dağıtım
- **⬅️ Önceki**: [Deployment Guide](deployment-guide.md)
- **🚀 Sonraki Bölüm**: [Bölüm 5: Çoklu Ajan Çözümleri](../chapter-05-multi-agent/README.md)

> Haziran 2026'da `azd 1.25.6` ile doğrulandı.

## Giriş

Şimdiye kadar `azd init --template <name>` ile şablonları *tüketmiştiniz*. Ancak bir proje düzenini ekibiniz beğendiğinde—örneğin, bir Container App, bir Cosmos DB ve uygun izleme—bunu kendi tekrar kullanılabilir şablonunuza dönüştürmek istersiniz. Bir şablon, azd’nin okuyabileceği öngörülebilir bir yapıya sahip bir Git deposundan ibarettir. Bu ders size sıfırdan bir şablon oluşturmayı, test etmeyi ve (isteğe bağlı) topluluk galerisine yayınlamayı gösterir.

## Öğrenme Hedefleri

Bu dersi bitirdiğinizde:
- Bir klasörü "azd şablonu" yapan unsurları anlayacaksınız
- Gerekli dosyaları ve klasör düzenini bileceksiniz
- Başkalarının yeniden kullanabileceği bir `azure.yaml` ve `infra/` ekleyeceksiniz
- Paylaşmadan önce şablonunuzu yerelde test edeceksiniz
- Şablonu yayımlayacak ve (isteğe bağlı) Awesome AZD'ye göndereceksiniz

## Öğrenme Çıktıları

Bu dersi tamamladıktan sonra şunları yapabileceksiniz:
- Yeni bir şablon deposu iskeleti oluşturmak
- Altyapıyı herhangi bir abonelikte çalışacak şekilde parametreleştirmek
- Bir şablonu `azd init` ve `azd up` ile doğrulamak
- Topluluk galerisi için gerekli meta verileri eklemek

---

## Şablon Gerçekte Nedir?

Bir azd şablonu en azından şunu içeren **bir Git deposudur**:

| Dosya / klasör | Amaç | Gerekli? |
|---------------|---------|-----------|
| `azure.yaml` | Hizmetleri, hostları ve altyapı sağlayıcısını tanımlar | ✅ Evet |
| `infra/` | Kaynakları sağlayan Bicep, Terraform veya Pulumi | ✅ Evet |
| `src/` (veya kodunuz) | azd'nin dağıttığı uygulama kodu | ✅ Evet |
| `README.md` | Şablonun nasıl kullanılacağı | ✅ Kuvvetle önerilir |
| `.azdo/` veya `.github/` | CI/CD iş akışı tanımları | İsteğe bağlı |
| `.devcontainer/` | Tekrarlanabilir geliştirme ortamı | İsteğe bağlı |
| `azure.yaml` `metadata` | Galeri + telemetri bilgisi | İsteğe bağlı (yayımlamak için gerekli) |

Burada sihirli bir şey yok: `azd init --template you/your-repo` komutunu çalıştırdığınızda, azd repoyu klonlar ve `azure.yaml` dosyasını okur.

---

## Adım 1: Depo İskeleti Oluşturun

Klasör yapısını elle oluşturun veya minimal bir şablondan başlayıp düzenleyin:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Standart düzeni oluşturun.
mkdir -p src infra
```

Tipik tamamlanmış düzen şöyle görünür:

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

## Adım 2: `azure.yaml` Yazın

Bu, şablonun kalbidir. azd'ye neyi nasıl dağıtacağını söyler:

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

> `metadata.template` alanı galerinin telemetri için kullanım sayısını sayarken kullandığı alandır. `name@version` kuralını kullanın.

---

## Adım 3: Altyapıyı Parametreleştirin

Tek bir en önemli kural: *yeniden kullanılabilir* bir şablon için **isimleri, bölgeleri veya aboneliğe özgü değerleri ASLA sabit kodlamayın.** Aynı şablonun herkesin aboneliğinde çalışması için parametreler ve kaynak token desenini kullanın.

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

Bu şablonu şablon-dostu yapan iki şey:

1. **`azd-env-name` etiketi** — azd bunu ortam başına kaynakları izlemek ve temizlemek için kullanır.
2. **`uniqueString(...)` kaynak tokenı** — adların çakışmaması için kararlı, küresel olarak benzersiz bir sonek üretir.

azd'nin ortamdan enjekte ettiği değerleri okuyan eşleşen bir parametre dosyası sağlayın:

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

azd, `${AZURE_ENV_NAME}` ve `${AZURE_LOCATION}` değerlerini mevcut ortamdan otomatik olarak ikame eder.

---

## Adım 4: Şablonunuzu Yerelde Test Edin

Paylaşmadan önce şablonun temiz bir durumdan çalıştığını kanıtlayın.

**Yerel klasörden test edin** (Git push gerekmez):

```bash
# Boş bir dizinden, yerel şablon yolunuzu kullanarak başlatın
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Uçtan uca kaynak sağlama ve dağıtım
azd auth login
azd up
```

**Sonra geri almayı test edin**—iyi bir şablon tamamen temizler:

```bash
azd down --force --purge
```

Eğer `azd down` kaynaklar bırakıyorsa, muhtemelen bir kaynağa `azd-env-name` etiketini eklemeyi kaçırdınız.

> **İpucu:** önce `azd provision --preview` çalıştırın. Bu bir what-if işlemi yapar ve herhangi bir kaynak oluşturulmadan önce şablon hatalarını gösterir.

---

## Adım 5: Şablonu Yayımlayın

Depoyu GitHub'a gönderin (başkalarının kullanmasını istiyorsanız public olarak):

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

- ✅ Önkoşullar, bir mimari diyagramı ve maliyet notları içeren net bir `README.md`
- ✅ `metadata.template` içeren çalışan bir `azure.yaml`
- ✅ Yeni bir abonelikte temizce kaynak sağlayan altyapı
- ✅ Bir `LICENSE` dosyası
- ✅ (Önerilir) Tek tıklamayla Codespaces için bir `.devcontainer/`

Galerinin veri dosyasına şablonunuzu ekleyen bir pull request açarak gönderin; katkı kılavuzuna [Awesome AZD deposunda](https://github.com/Azure/awesome-azd) bulunan rehberi izleyerek uyun.

---

## Yaygın Tuzaklar

| Tuzak | Çözüm |
|---------|-----|
| Kaynak isimlerinin sabit kodlanması | `uniqueString()` kaynak tokenını kullanın |
| `azd down` kaynak bırakıyor | Her kaynağı (veya kaynak grubunu) `azd-env-name` ile etiketleyin |
| Şablon sizde çalışıyor, başkalarında çalışmıyor | Abonelik ID'lerini, tenant ID'lerini ve bölge varsayımlarını kaldırın |
| Çıktılar uygulamaya bağlanmamış | `SERVICE_<NAME>_ENDPOINT_URL` ve diğer `AZURE_*` çıktıları dışa aktarın |
| Galeri gönderimi reddedildi | `README.md`, `LICENSE` ve `metadata.template` ekleyin |

---

## Özet

- Bir şablon sadece `azure.yaml`, `infra/` ve kodunuz olan bir Git reposudur.
- Her şeyi parametreleştirin—isimleri, bölgeleri ve kimlikleri—böylece her yerde çalışır.
- `azd down` düzgün çalışsın diye kaynakları her zaman `azd-env-name` ile etiketleyin.
- Yayınlamadan önce `azd init --template <local-path>` ile yerelde test edin.
- Awesome AZD'ye göndermek için meta veriler ve bir README ekleyin.

---

## 🔗 Gezinme

| Yön | Kaynak |
|-----------|----------|
| **Önceki** | [Deployment Guide](deployment-guide.md) |
| **Bölüm Anasayfası** | [Bölüm 4: Altyapı Kod Olarak](README.md) |
| **Sonraki Bölüm** | [Bölüm 5: Çoklu Ajan Çözümleri](../chapter-05-multi-agent/README.md) |

## 📖 İlgili Kaynaklar

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Galerisi](https://azure.github.io/awesome-azd/)
- [Resmi azd şablon belgeleri](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->