# Bölüm 7: Sorun Giderme ve Hata Ayıklama

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Süre**: 1-1.5 saat | **⭐ Zorluk**: Orta

---

## Genel Bakış

Bu bölüm, Azure Developer CLI ile çalışırken karşılaşılan yaygın sorunları teşhis etmenize ve çözmenize yardımcı olur. Dağıtım hatalarından yapay zekâya özgü sorunlara kadar.

> Haziran 2026'da `azd 1.25.6` ile doğrulanmıştır.

## Öğrenme Hedefleri

Bu bölümü tamamladığınızda:
- Yaygın AZD dağıtım hatalarını teşhis etmek
- Kimlik doğrulama ve izin sorunlarını hata ayıklamak
- Yapay zekâ hizmeti bağlantı sorunlarını çözmek
- Sorun giderme için Azure Portal ve CLI'yi kullanmak

---

## 📚 Dersler

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Yaygın Sorunlar](common-issues.md) | Sık karşılaşılan problemler | 30 dakika |
| 2 | [Hata Ayıklama Rehberi](debugging.md) | Adım adım hata ayıklama stratejileri | 45 dakika |
| 3 | [AI Sorun Giderme](ai-troubleshooting.md) | AI'ye özgü sorunlar | 30 dakika |

---

## 🚨 Hızlı Düzeltmeler

### Kimlik Doğrulama Sorunları
```bash
# AZD iş akışları için gereklidir
azd auth login

# Ayrıca Azure CLI komutlarını doğrudan kullanıyorsanız isteğe bağlıdır
az login

azd auth status
```

### Sağlama Hataları
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Kaynak Çakışmaları
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Kota Aşıldı
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Hata Kodu Referansı

| Error | Cause | Solution |
|-------|-------|----------|
| `AuthenticationError` | Giriş yapılmamış | `azd auth login` |
| `ResourceNotFound` | Kaynak eksik | Kaynak adlarını kontrol edin |
| `QuotaExceeded` | Abonelik sınırları | Kota artışı talep edin |
| `InvalidTemplate` | Bicep sözdizimi hatası | `az bicep build` |
| `Conflict` | Kaynak mevcut | Yeni bir ad kullanın veya silin |
| `Forbidden` | Yetersiz izinler | RBAC rollerini kontrol edin |

---

## 🔄 Sıfırlama ve Kurtarma

```bash
# Yumuşak sıfırlama (kaynakları koru, kodu yeniden dağıt)
azd deploy --force

# Sert sıfırlama (her şeyi sil, baştan başla)
azd down --force --purge
azd up
```

---

## 🔗 Gezinme

| Direction | Chapter |
|-----------|---------|
| **Önceki** | [Bölüm 6: Dağıtım Öncesi](../chapter-06-pre-deployment/README.md) |
| **Sonraki** | [Bölüm 8: Üretim](../chapter-08-production/README.md) |

---

## 📖 İlgili Kaynaklar

- [Dağıtım Öncesi Kontrolleri](../chapter-06-pre-deployment/preflight-checks.md)
- [Yapılandırma Kılavuzu](../chapter-03-configuration/configuration.md)
- [AZD GitHub Sorunları](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->