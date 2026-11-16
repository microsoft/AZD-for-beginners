# Bölüm 3: Yapılandırma & Kimlik Doğrulama

**📚 Kurs**: [AZD Yeni Başlayanlar için](../../README.md) | **⏱️ Süre**: Entegrasyon pratiği dahil 90-150 dakika | **⭐ Zorluk Seviyesi**: Orta

---

## Genel Bakış

Bu bölüm, Azure Developer CLI dağıtımları için ortam yapılandırması, kimlik doğrulama kalıpları ve güvenlik en iyi uygulamalarını kapsar.

> Komut ve yapılandırma inceleme hedefi: `azd 1.37.2` (Kasım 2026). İnceleme sırasında canlı Azure sağlama çalıştırılmadı.

## Öğrenme Hedefleri

Bu bölümü tamamlayarak:
- AZD yapılandırma hiyerarşisini öğreneceksiniz
- Birden çok ortamı yöneteceksiniz (dev, staging, prod)
- Yönetilen kimliklerle güvenli kimlik doğrulamayı uygulayacaksınız
- Ortama özgü ayarları yapılandıracaksınız

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Yapılandırma Kılavuzu](configuration.md) | Ortam kurulumu ve yönetimi | 30 dk |
| 2 | [Kimlik Doğrulama & Güvenlik](authsecurity.md) | Yönetilen kimlik ve RBAC kalıpları | 30 dk |

---

## 🚀 Hızlı Başlangıç

Kurs deposu değil, **önceden başlatılmış bir azd uygulamasının kökünden** çalıştırın. Eğer zaten varsa kullanılmamış ortam adlarını tercih edin.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` örnektir: yalnızca şablonunuz açıkça kullanıyorsa altyapıyı etkiler. Normal `azd env set` değerleri yerel olarak düz metin halinde kaydedilir; bunlar güvenli gizli depolama değildir.

---

## 🔧 Yapılandırma Hiyerarşisi

Üç farklı yapılandırma yüzeyini ayrı tutun: genel tercihler (`azd config`), proje yapısı (`azure.yaml`) ve ortam bazlı değerler (`azd env`). Bayraklar yalnızca destekledikleri ayarları geçersiz kılar; `azure.yaml` veya Bicep üzerinde keyfi ortam değişkenlerinin evrensel bir üst üste binmesi yoktur.

---

## 🔐 Güvenlik En İyi Uygulamaları

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Navigasyon

| Yön | Bölüm |
|-----------|---------|
| **Önceki** | [Bölüm 2: AI Geliştirme](../chapter-02-ai-development/README.md) |
| **Sonraki** | [Bölüm 4: Altyapı](../chapter-04-infrastructure/README.md) |

---

## 📖 İlgili Kaynaklar

- [Dağıtım Öncesi Kontroller](../chapter-06-pre-deployment/README.md)
- [Sorun Giderme](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->