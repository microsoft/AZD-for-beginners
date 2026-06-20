# Bölüm 4: Altyapı Kod Olarak (Infrastructure as Code) & Dağıtım

**📚 Kurs**: [AZD Yeni Başlayanlar](../../README.md) | **⏱️ Süre**: 1-1.5 saat | **⭐ Zorluk**: Orta

---

## Genel Bakış

Bu bölüm, Bicep şablonlarıyla Altyapıyı Kod Olarak (IaC) kalıplarını, kaynak sağlama ve Azure Developer CLI kullanarak dağıtım stratejilerini kapsar.

> Haziran 2026'da `azd 1.25.6` ile doğrulandı.

## Öğrenme Hedefleri

By completing this chapter, you will:
- Bicep şablon yapısını ve sözdizimini anlamak
- `azd provision` ile Azure kaynakları sağlamak
- `azd deploy` ile uygulamaları dağıtmak
- Mavi-yeşil ve kademeli dağıtım stratejilerini uygulamak

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | AZD ile Azure kaynak yönetimi | 45 dk |
| 2 | [Deployment Guide](deployment-guide.md) | Uygulama dağıtım stratejileri | 45 dk |
| 3 | [Authoring Your Own Template](custom-templates.md) | Yeniden kullanılabilir azd şablonları oluşturma ve yayınlama | 30 dk |

---

## 🚀 Hızlı Başlangıç

```bash
# Şablondan başlat
azd init --template azure-functions-python-v2-http

# Ne oluşturulacağını önizle
azd provision --preview

# Yalnızca altyapıyı sağla
azd provision

# Sadece kodu dağıt
azd deploy

# Ya da her ikisini birlikte
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
| `azd init` | Projeyi başlatır |
| `azd provision` | Azure kaynakları oluşturur |
| `azd deploy` | Uygulama kodunu dağıtır |
| `azd up` | kaynak sağlama + dağıtım |
| `azd down` | Tüm kaynakları siler |

---

## 🔗 Gezinme

| Yön | Bölüm |
|-----------|---------|
| **Önceki** | [Bölüm 3: Yapılandırma](../chapter-03-configuration/README.md) |
| **Sonraki** | [Bölüm 5: Çok Ajanlı Çözümler](../chapter-05-multi-agent/README.md) |

---

## 📖 İlgili Kaynaklar

- [Dağıtım Öncesi Kontroller](../chapter-06-pre-deployment/README.md)
- [Konteyner Uygulama Örnekleri](../../examples/container-app/README.md)
- [Veritabanı Uygulama Örneği](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->