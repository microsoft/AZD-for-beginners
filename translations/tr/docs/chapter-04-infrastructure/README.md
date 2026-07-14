# Bölüm 4: Altyapı Kod Olarak & Dağıtım

**📚 Kurs**: [AZD Yeni Başlayanlar için](../../README.md) | **⏱️ Süre**: 1-1.5 saat | **⭐ Zorluk Seviyesi**: Orta

---

## Genel Bakış

Bu bölüm, Bicep şablonları kullanılarak Altyapıyı Kod Olarak (IaC) modelini, kaynak sağlama ve Azure Developer CLI ile dağıtım stratejilerini kapsar.

> Temmuz 2026'da `azd 1.27.1` ile doğrulanmıştır.

## Öğrenme Hedefleri

Bu bölümü tamamlayarak:
- Bicep şablon yapısını ve sözdizimini anlayacaksınız
- `azd provision` ile Azure kaynaklarını sağlayacaksınız
- `azd deploy` ile uygulamaları dağıtacaksınız
- Mavi-yeşil ve kademeli dağıtım stratejilerini uygulayacaksınız

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Kaynakların Sağlanması](provisioning.md) | AZD ile Azure kaynak yönetimi | 45 dk |
| 2 | [Dağıtım Rehberi](deployment-guide.md) | Uygulama dağıtım stratejileri | 45 dk |
| 3 | [Kendi Şablonunuzu Oluşturma](custom-templates.md) | Yeniden kullanılabilir azd şablonları oluşturma ve yayımlama | 30 dk |

---

## 🚀 Hızlı Başlangıç

```bash
# Şablondan başlat
azd init --template azure-functions-python-v2-http

# Oluşturulacak olanı önizle
azd provision --preview

# Yalnızca altyapıyı sağla
azd provision

# Yalnızca kodu dağıt
azd deploy

# Ya da her ikisi birden
azd up
```

---

## 📁 AZD Proje Yapısı

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Temel Komutlar

| Komut | Açıklama |
|---------|-------------|
| `azd init` | Projeyi başlat |
| `azd provision` | Azure kaynakları oluştur |
| `azd deploy` | Uygulama kodunu dağıt |
| `azd up` | sağlama + dağıtım |
| `azd down` | Tüm kaynakları sil |

---

## 🔗 Navigasyon

| Yön | Bölüm |
|-----------|---------|
| **Önceki** | [Bölüm 3: Yapılandırma](../chapter-03-configuration/README.md) |
| **Sonraki** | [Bölüm 5: Çoklu Ajan Çözümleri](../chapter-05-multi-agent/README.md) |

---

## 📖 İlgili Kaynaklar

- [Dağıtımdan Önce Kontroller](../chapter-06-pre-deployment/README.md)
- [Kapsayıcı Uygulama Örnekleri](../../examples/container-app/README.md)
- [Veritabanı Uygulama Örneği](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->