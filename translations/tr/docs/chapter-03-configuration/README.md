# Bölüm 3: Yapılandırma ve Kimlik Doğrulama

**📚 Kurs**: [Başlangıç için AZD](../../README.md) | **⏱️ Süre**: 45-60 dakika | **⭐ Zorluk Seviyesi**: Orta

---

## Genel Bakış

Bu bölümde Azure Developer CLI dağıtımları için ortam yapılandırması, kimlik doğrulama kalıpları ve güvenlik en iyi uygulamaları ele alınmaktadır.

> Temmuz 2026'da `azd 1.27.1` ile doğrulanmıştır.

## Öğrenme Hedefleri

Bu bölümü tamamlayarak:
- AZD yapılandırma hiyerarşisini ustaca kullanacaksınız
- Birden çok ortamı (geliştirme, test, üretim) yöneteceksiniz
- Yönetilen kimliklerle güvenli kimlik doğrulamasını uygulayacaksınız
- Ortama özgü ayarları yapılandıracaksınız

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Yapılandırma Rehberi](configuration.md) | Ortam kurulumu ve yönetimi | 30 dk |
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

AZD ayarları şu sırayla uygular (sonrakiler öncekinin yerini alır):

1. **Varsayılan değerler** (şablonların içine gömülü)
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

# Gerekirse tekrar kimlik doğrulaması yapın
azd auth login

# İsteğe bağlı: az komutları için Azure CLI kimlik doğrulamasını yenileyin
az login
```

---

## 🔗 Navigasyon

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
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->