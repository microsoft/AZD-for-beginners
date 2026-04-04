# Bölüm 4: Kod Olarak Altyapı ve Dağıtım

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Süre**: 1-1.5 saat | **⭐ Zorluk**: Orta

---

## Genel Bakış

Bu bölüm, Bicep şablonları ile Kod Olarak Altyapı (IaC) desenlerini, kaynak sağlama işlemlerini ve Azure Developer CLI kullanarak dağıtım stratejilerini kapsar.

> Mart 2026'da `azd 1.23.12` ile doğrulandı.

## Öğrenme Hedefleri

Bu bölümü tamamladığınızda şunları öğreneceksiniz:
- Bicep şablon yapısını ve sözdizimini anlayın
- Azure kaynaklarını `azd provision` ile sağlayın
- Uygulamaları `azd deploy` ile dağıtın
- Mavi-yeşil ve kademeli (rolling) dağıtım stratejilerini uygulayın

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | AZD ile Azure kaynak yönetimi | 45 dk |
| 2 | [Deployment Guide](deployment-guide.md) | Uygulama dağıtım stratejileri | 45 dk |

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

# Ya da her ikisi birlikte
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

| Command | Description |
|---------|-------------|
| `azd init` | Projeyi başlat |
| `azd provision` | Azure kaynaklarını oluştur |
| `azd deploy` | Uygulama kodunu dağıt |
| `azd up` | kaynak sağlama + dağıtım |
| `azd down` | Tüm kaynakları sil |

---

## 🔗 Gezinme

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Next** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

---

## 📖 İlgili Kaynaklar

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Container App Examples](../../examples/container-app/README.md)
- [Database App Example](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge [Co-op Translator](https://github.com/Azure/co-op-translator) adlı yapay zeka çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için çaba gösterilse de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki metni yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumlama nedeniyle sorumluluk kabul etmiyoruz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->