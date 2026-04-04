# Bölüm 3: Yapılandırma ve Kimlik Doğrulama

**📚 Kurs**: [AZD Yeni Başlayanlar](../../README.md) | **⏱️ Süre**: 45-60 dakika | **⭐ Zorluk**: Orta

---

## Genel Bakış

Bu bölüm, Azure Developer CLI dağıtımları için ortam yapılandırması, kimlik doğrulama desenleri ve güvenlik en iyi uygulamalarını kapsar.

> Mart 2026'da `azd 1.23.12` ile doğrulanmıştır.

## Öğrenme Hedefleri

Bu bölümü tamamladığınızda şunları yapabileceksiniz:
- AZD yapılandırma hiyerarşisinde hakim olmak
- Birden çok ortamı yönetmek (dev, staging, prod)
- Yönetilen kimliklerle güvenli kimlik doğrulamayı uygulamak
- Ortam özelindeki ayarları yapılandırmak

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Yapılandırma Rehberi](configuration.md) | Ortam kurulumu ve yönetimi | 30 dakika |
| 2 | [Kimlik Doğrulama ve Güvenlik](authsecurity.md) | Yönetilen kimlik ve RBAC desenleri | 30 dakika |

---

## 🚀 Hızlı Başlangıç

```bash
# Birden fazla ortam oluştur
azd env new dev
azd env new staging
azd env new prod

# Ortamlar arasında geçiş yap
azd env select prod

# Ortam değişkenlerini ayarla
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Yapılandırmayı görüntüle
azd env get-values
```

---

## 🔧 Yapılandırma Hiyerarşisi

AZD ayarları şu sırayla uygular (daha sonraki önceki ayarları geçersiz kılar):

1. **Varsayılan değerler** (şablonlara gömülüdür)
2. **azure.yaml** (proje yapılandırması)
3. **Ortam değişkenleri** (`azd env set`)
4. **Komut satırı bayrakları** (`--location eastus`)

---

## 🔐 Güvenlik En İyi Uygulamaları

```bash
# Yönetilen kimliği kullanın (önerilir)
azd env set AZURE_USE_MANAGED_IDENTITY true

# AZD kimlik doğrulama durumunu kontrol edin
azd auth status

# İsteğe bağlı: az komutlarını çalıştırmayı planlıyorsanız Azure CLI bağlamını doğrulayın
az account show

# Gerekirse yeniden kimlik doğrulaması yapın
azd auth login

# İsteğe bağlı: az komutları için Azure CLI kimlik doğrulamasını yenileyin
az login
```

---

## 🔗 Gezinme

| Yön | Bölüm |
|-----------|---------|
| **Önceki** | [Bölüm 2: Yapay Zeka Geliştirme](../chapter-02-ai-development/README.md) |
| **Sonraki** | [Bölüm 4: Altyapı](../chapter-04-infrastructure/README.md) |

---

## 📖 İlgili Kaynaklar

- [Dağıtım Öncesi Kontroller](../chapter-06-pre-deployment/README.md)
- [Sorun Giderme](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Bu belge, yapay zeka çeviri servisi [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi ana dilindeki sürümü yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanılması sonucu ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->