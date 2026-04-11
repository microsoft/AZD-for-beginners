# Bölüm 6: Dağıtımdan Önce Planlama ve Doğrulama

**📚 Kurs**: [AZD Yeni Başlayanlar İçin](../../README.md) | **⏱️ Süre**: 1 saat | **⭐ Zorluk**: Orta düzey

---

## Genel Bakış

Bu bölüm, uygulamanızı dağıtmadan önce yapılması gereken temel planlama ve doğrulama adımlarını kapsar. Doğru kapasite planlaması, SKU seçimi ve preflight kontrolleri ile maliyetli hatalardan kaçınmayı öğrenin.

> `azd 1.23.12` ile Mart 2026'da doğrulandı.

## Öğrenme Hedefleri

Bu bölümü tamamlayarak:
- Dağıtımdan önce preflight kontrollerini çalıştıracaksınız
- Kapasite planlaması yapacak ve kaynak gereksinimlerini tahmin edeceksiniz
- Maliyet optimizasyonu için uygun SKU'ları seçeceksiniz
- İzleme için Application Insights'ı yapılandıracaksınız
- Ekip koordinasyon modellerini anlayacaksınız

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Preflight Kontrolleri](preflight-checks.md) | Dağıtımdan önce yapılandırmayı doğrulayın | 15 min |
| 2 | [Kapasite Planlaması](capacity-planning.md) | Kaynak gereksinimlerini tahmin etmek | 20 min |
| 3 | [SKU Seçimi](sku-selection.md) | Uygun fiyatlandırma katmanlarını seçin | 15 min |
| 4 | [Application Insights](application-insights.md) | İzlemeyi yapılandırın | 20 min |
| 5 | [Koordinasyon Modelleri](coordination-patterns.md) | Ekip dağıtım iş akışları | 15 min |

---

## 🚀 Hızlı Başlangıç

```bash
# Abonelik kotalarını kontrol et
az vm list-usage --location eastus --output table

# Dağıtımı önizle (kaynak oluşturulmaz)
azd provision --preview

# Bicep sözdizimini doğrula
az bicep build --file infra/main.bicep

# Ortam yapılandırmasını kontrol et
azd env get-values
```

---

## ☑️ Dağıtımdan Önce Kontrol Listesi

### `azd provision` Öncesi

- [ ] Bölge kotası doğrulandı
- [ ] SKU'lar uygun şekilde seçildi
- [ ] Maliyet tahmini gözden geçirildi
- [ ] Adlandırma kuralları tutarlı
- [ ] Güvenlik/RBAC yapılandırıldı

### `azd deploy` Öncesi

- [ ] Ortam değişkenleri ayarlandı
- [ ] Gizli anahtarlar Key Vault'ta
- [ ] Bağlantı dizeleri doğrulandı
- [ ] Sağlık kontrolleri yapılandırıldı

---

## 💰 SKU Seçim Rehberi

| İş Yükü | Geliştirme | Üretim |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Gezinme

| Yön | Bölüm |
|-----------|---------|
| **Önceki** | [Bölüm 5: Çoklu Ajan](../chapter-05-multi-agent/README.md) |
| **Sonraki** | [Bölüm 7: Sorun Giderme](../chapter-07-troubleshooting/README.md) |

---

## 📖 İlgili Kaynaklar

- [Yapılandırma Rehberi](../chapter-03-configuration/configuration.md)
- [Dağıtım Rehberi](../chapter-04-infrastructure/deployment-guide.md)
- [Yaygın Sorunlar](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki metni yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek herhangi bir yanlış anlaşılma veya yanlış yorumlamadan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->