# Bölüm 4: Altyapı Kod Olarak (IaC) ve Dağıtım

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Süre**: 1-1.5 saat | **⭐ Zorluk**: Orta

---

## Genel Bakış

Bu bölüm, Bicep şablonlarıyla Altyapı Kod Olarak (IaC) desenlerini, kaynak sağlama ve Azure Developer CLI kullanarak dağıtım stratejilerini kapsar.

## Öğrenme Hedefleri

Bu bölümü tamamlayarak şunları yapabileceksiniz:
- Bicep şablon yapısını ve sözdizimini anlamak
- `azd provision` ile Azure kaynakları oluşturmak
- `azd deploy` ile uygulamaları dağıtmak
- blue-green ve rolling dağıtım stratejilerini uygulamak

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Kaynak Sağlama](provisioning.md) | AZD ile Azure kaynak yönetimi | 45 dk |
| 2 | [Dağıtım Rehberi](deployment-guide.md) | Uygulama dağıtım stratejileri | 45 dk |

---

## 🚀 Hızlı Başlangıç

```bash
# Şablondan başlat
azd init --template azure-functions-python-v2-http

# Nelerin oluşturulacağını önizle
azd provision --preview

# Yalnızca altyapıyı sağla
azd provision

# Yalnızca kodu dağıt
azd deploy

# Veya her ikisini birlikte
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
| `azd up` | kaynak oluşturma + dağıtım |
| `azd down` | Tüm kaynakları sil |

---

## 🔗 Gezinme

| Yön | Bölüm |
|-----------|---------|
| **Önceki** | [Bölüm 3: Yapılandırma](../chapter-03-configuration/README.md) |
| **Sonraki** | [Bölüm 5: Çoklu Ajan Çözümleri](../chapter-05-multi-agent/README.md) |

---

## 📖 İlgili Kaynaklar

- [Dağıtımdan Önce Kontroller](../chapter-06-pre-deployment/README.md)
- [Konteyner Uygulama Örnekleri](../../examples/container-app/README.md)
- [Veritabanı Uygulama Örneği](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, [Co-op Translator](https://github.com/Azure/co-op-translator) adlı yapay zeka çeviri hizmeti kullanılarak çevrilmiştir. Doğruluğa özen göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belgenin özgün dili yetkili kaynak olarak kabul edilmelidir. Kritik/önemli bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalar veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->