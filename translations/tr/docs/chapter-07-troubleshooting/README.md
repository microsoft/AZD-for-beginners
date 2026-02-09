# Bölüm 7: Sorun Giderme ve Hata Ayıklama

**📚 Kurs**: [AZD Yeni Başlayanlar İçin](../../README.md) | **⏱️ Süre**: 1-1.5 saat | **⭐ Zorluk**: Orta

---

## Genel Bakış

Bu bölüm, Azure Developer CLI ile çalışırken karşılaşılan yaygın sorunları teşhis etmenize ve çözmenize yardımcı olur. Dağıtım hatalarından yapay zekâya özgü problemlere kadar.

## Öğrenme Hedefleri

Bu bölümü tamamlayarak:
- Yaygın AZD dağıtım hatalarını teşhis edebileceksiniz
- Kimlik doğrulama ve izin sorunlarını hata ayıklayabileceksiniz
- Yapay hizmet bağlantı sorunlarını çözebileceksiniz
- Sorun giderme için Azure Portal ve CLI kullanabileceksiniz

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Yaygın Sorunlar](common-issues.md) | Sık karşılaşılan sorunlar | 30 dk |
| 2 | [Hata Ayıklama Rehberi](debugging.md) | Adım adım hata ayıklama stratejileri | 45 dk |
| 3 | [Yapay Zeka Sorun Giderme](ai-troubleshooting.md) | Yapay zekâya özgü sorunlar | 30 dk |

---

## 🚨 Hızlı Çözümler

### Kimlik Doğrulama Sorunları
```bash
azd auth login
az login
azd auth whoami
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

### Kota Aşımı
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Hata Kodu Referansı

| Hata | Sebep | Çözüm |
|-------|-------|----------|
| `AuthenticationError` | Giriş yapılmamış | `azd auth login` |
| `ResourceNotFound` | Kaynak bulunamadı | Kaynak adlarını kontrol edin |
| `QuotaExceeded` | Abonelik sınırları | Kota artışı talep edin |
| `InvalidTemplate` | Bicep sözdizimi hatası | `az bicep build` |
| `Conflict` | Kaynak zaten var | Yeni bir ad kullanın veya silin |
| `Forbidden` | Yetersiz izinler | RBAC rolleri kontrol edin |

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

| Yön | Bölüm |
|-----------|---------|
| **Önceki** | [Bölüm 6: Ön Dağıtım](../chapter-06-pre-deployment/README.md) |
| **Sonraki** | [Bölüm 8: Üretim](../chapter-08-production/README.md) |

---

## 📖 İlgili Kaynaklar

- [Ön Dağıtım Kontrolleri](../chapter-06-pre-deployment/preflight-checks.md)
- [Yapılandırma Kılavuzu](../chapter-03-configuration/configuration.md)
- [AZD GitHub Sorunları](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba gösterilse de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki haliyle yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkan herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->