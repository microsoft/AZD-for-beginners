# Bölüm 3: Yapılandırma ve Kimlik Doğrulama

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Süre**: 45-60 dakika | **⭐ Zorluk**: Orta

---

## Genel Bakış

Bu bölüm, Azure Developer CLI dağıtımları için ortam yapılandırması, kimlik doğrulama desenleri ve güvenlik en iyi uygulamalarını kapsar.

> Validated against `azd 1.25.6` in Haziran 2026.

## Öğrenme Hedefleri

Bu bölümü tamamlayarak şunları yapacaksınız:
- AZD yapılandırma hiyerarşisine hakim olmak
- Birden fazla ortamı yönetmek (dev, staging, prod)
- Yönetilen kimliklerle güvenli kimlik doğrulaması uygulamak
- Ortamlara özel ayarları yapılandırmak

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Yapılandırma Kılavuzu](configuration.md) | Ortam kurulumu ve yönetimi | 30 dk |
| 2 | [Kimlik Doğrulama ve Güvenlik](authsecurity.md) | Yönetilen kimlik ve RBAC kalıpları | 30 dk |

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

AZD ayarları şu sırayla uygular (sonraki, öncekini geçersiz kılar):

1. **Varsayılan değerler** (şablonlara gömülü)
2. **azure.yaml** (proje yapılandırması)
3. **Ortam değişkenleri** (`azd env set`)
4. **Komut satırı bayrakları** (`--location eastus`)

---

## 🔐 Güvenlik En İyi Uygulamaları

```bash
# Yönetilen kimlik kullanın (önerilir)
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

- [Dağıtımdan Önce Kontroller](../chapter-06-pre-deployment/README.md)
- [Sorun Giderme](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->