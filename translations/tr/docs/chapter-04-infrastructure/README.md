# Bölüm 4: Altyapı Kod Olarak ve Dağıtım

**📚 Kurs**: [Başlangıç İçin AZD](../../README.md) | **⏱️ Süre**: 2-3 saat okuma; dağıtım alıştırmaları için ekstra zaman ayırın | **⭐ Zorluk**: Orta Seviye

---

## Genel Bakış

Bu bölüm, Bicep şablonları ile Altyapı Kod Olarak (IaC) desenleri, kaynak sağlama ve Azure Developer CLI kullanarak dağıtım stratejilerini kapsar.

> Komut ve yapılandırma inceleme hedefi: `azd 1.37.2` (Kasım 2026). Canlı Azure sağlama inceleme sırasında çalıştırılmadı.

## Öğrenme Hedefleri

Bu bölümü tamamlayarak:
- Bicep şablon yapısı ve sözdizimini anlayacaksınız
- `azd provision` ile Azure kaynaklarını sağlama yapacaksınız
- `azd deploy` ile uygulamaları dağıtacaksınız
- Mavi-yeşil ve rolling dağıtım stratejilerini uygulayacaksınız

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Kaynak Sağlama](provisioning.md) | AZD ile Azure kaynak yönetimi | 45 dk |
| 2 | [Dağıtım Kılavuzu](deployment-guide.md) | Uygulama dağıtım stratejileri | 45 dk |
| 3 | [Kendi Şablonunu Yazma](custom-templates.md) | Yeniden kullanılabilir azd şablonları oluşturma ve yayımlama | 30 dk |

---

## 🚀 Hızlı Başlangıç

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
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
| `azd up` | sağla + dağıt |
| `azd down` | Tüm kaynakları sil |

---

## 🔗 Navigasyon

| Yön | Bölüm |
|-----------|---------|
| **Önceki** | [Bölüm 3: Konfigürasyon](../chapter-03-configuration/README.md) |
| **Sonraki** | [Bölüm 5: Çoklu Ajan Çözümleri](../chapter-05-multi-agent/README.md) |

---

## 📖 İlgili Kaynaklar

- [Dağıtımdan Önce Kontroller](../chapter-06-pre-deployment/README.md)
- [Konteyner Uygulama Örnekleri](../../examples/container-app/README.md)
- [Veritabanı Uygulama Örneği](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->