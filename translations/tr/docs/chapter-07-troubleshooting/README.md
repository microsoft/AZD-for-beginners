# 7. Bölüm: Sorun Giderme ve Hata Ayıklama

**📚 Kurs**: [Başlangıç Seviyesi AZD](../../README.md) | **⏱️ Süre**: 1-1.5 saat | **⭐ Zorluk**: Orta Seviye

---

## Genel Bakış

Bu bölüm, Azure Developer CLI ile çalışırken karşılaşılan yaygın sorunları teşhis edip çözmenize yardımcı olur. Dağıtım hatalarından AI özgü problemlere kadar.

> Komut rehberi, yayımlanmış `azd 1.37.2` referansı ile karşılaştırılarak incelenmiştir. Bulut dağıtımları gerçekleştirilmemiştir. Komutları kullanmadan önce örnek kaynak adları ve kimliklerini değiştirin.

## Öğrenme Hedefleri

Bu bölümü tamamlayarak:
- Yaygın AZD dağıtım hatalarını teşhis edebileceksiniz
- Kimlik doğrulama ve izin sorunlarını hata ayıklayabileceksiniz
- AI servis bağlantı problemlerini çözebileceksiniz
- Sorun giderme için Azure Portal ve CLI kullanabileceksiniz

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Yaygın Sorunlar](common-issues.md) | Sık karşılaşılan problemler | 30 dk |
| 2 | [Hata Ayıklama Rehberi](debugging.md) | Adım adım hata ayıklama stratejileri | 45 dk |
| 3 | [AI Sorun Giderme](ai-troubleshooting.md) | AI özgü sorunlar | 30 dk |

---

## 🚨 Hızlı Çözümler

### Kimlik Doğrulama Sorunları
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Sağlama Hataları
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Kaynak Çakışmaları
Öncelikle mevcut kaynak ve dağıtım hatalarını inceleyin. İsim çakışmasını çözmek için paylaşılan veya üretim ortamını silmeyin. **Yeni bir geçici ortam** için benzersiz bir ad kullanın:

```bash
azd env new different-name
azd up
```

### Kota Aşıldı
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

`AZURE_LOCATION` değerini değiştirmek mevcut kaynakları taşımayacak ve yeniden dağıtımda konum çakışmalarına neden olabilir.

---

## 📋 Hata Kodu Referansı

| Hata | Sebep | Çözüm |
|-------|-------|----------|
| `AuthenticationError` | Giriş yapılmamış | `azd auth login` |
| `ResourceNotFound` | Kaynak eksik | Kaynak adlarını kontrol edin |
| `QuotaExceeded` | Abonelik sınırları | Kota artışı talep edin |
| `InvalidTemplate` | Bicep sözdizimi hatası | `az bicep build` |
| `Conflict` | Kaynak mevcut | Yeni isim kullanın veya silin |
| `Forbidden` | Yetersiz izinler | RBAC rollerini kontrol edin |

---

## 🔄 Sıfırlama ve Kurtarma

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Zorunlu sıfırlama verileri siler ve uç noktaları değiştirebilir. Önce yedek alın ve interaktif silme istemlerini gözden geçirin. `--force --purge` yalnızca geri dönüşü olmayan silme amaçlandığında geçici ortamlar için uygundur.

---

## 🔗 Gezinme

| Yön | Bölüm |
|-----------|---------|
| **Önceki** | [6. Bölüm: Dağıtımdan Önce](../chapter-06-pre-deployment/README.md) |
| **Sonraki** | [8. Bölüm: Üretim](../chapter-08-production/README.md) |

---

## 📖 İlgili Kaynaklar

- [Dağıtımdan Önce Kontroller](../chapter-06-pre-deployment/preflight-checks.md)
- [Yapılandırma Rehberi](../chapter-03-configuration/configuration.md)
- [AZD GitHub Sorunları](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->