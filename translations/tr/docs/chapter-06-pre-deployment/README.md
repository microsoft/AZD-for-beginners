# Bölüm 6: Dağıtımdan Önce Planlama ve Doğrulama

**📚 Course**: [AZD Yeni Başlayanlar](../../README.md) | **⏱️ Duration**: 1 saat | **⭐ Complexity**: Orta

---

## Genel Bakış

Bu bölüm, uygulamanızı dağıtmadan önce yapılması gereken temel planlama ve doğrulama adımlarını kapsar. Uygun kapasite planlaması, SKU seçimi ve preflight kontrolleri ile maliyetli hatalardan kaçınmayı öğrenin.

## Öğrenme Hedefleri

By completing this chapter, you will:
- Dağıtımdan önce preflight kontrollerini çalıştırmak
- Kapasite planlaması yapmak ve kaynak gereksinimlerini tahmin etmek
- Maliyet optimizasyonu için uygun SKU'ları seçmek
- İzleme için Application Insights'ı yapılandırmak
- Ekip koordinasyon modellerini anlamak

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Preflight Kontrolleri](preflight-checks.md) | Dağıtımdan önce yapılandırmayı doğrulayın | 15 dk |
| 2 | [Kapasite Planlaması](capacity-planning.md) | Kaynak gereksinimlerini tahmin etmek | 20 dk |
| 3 | [SKU Seçimi](sku-selection.md) | Uygun fiyatlandırma katmanlarını seçin | 15 dk |
| 4 | [Application Insights](application-insights.md) | İzlemeyi yapılandırın | 20 dk |
| 5 | [Koordinasyon Modelleri](coordination-patterns.md) | Ekip dağıtım iş akışları | 15 dk |

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

### Öncesi `azd provision`

- [ ] Bölge için kota doğrulandı
- [ ] Uygun SKU'lar seçildi
- [ ] Maliyet tahmini gözden geçirildi
- [ ] Adlandırma kuralı tutarlı
- [ ] Güvenlik/RBAC yapılandırıldı

### Öncesi `azd deploy`

- [ ] Ortam değişkenleri ayarlandı
- [ ] Secrets Key Vault'ta
- [ ] Bağlantı dizeleri doğrulandı
- [ ] Sağlık kontrolleri yapılandırıldı

---

## 💰 SKU Seçim Rehberi

| İş Yükü | Geliştirme | Üretim |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Gezinme

| Yön | Bölüm |
|-----------|---------|
| **Önceki** | [Bölüm 5: Çok Ajanlı](../chapter-05-multi-agent/README.md) |
| **Sonraki** | [Bölüm 7: Sorun Giderme](../chapter-07-troubleshooting/README.md) |

---

## 📖 İlgili Kaynaklar

- [Yapılandırma Rehberi](../chapter-03-configuration/configuration.md)
- [Dağıtım Rehberi](../chapter-04-infrastructure/deployment-guide.md)
- [Yaygın Sorunlar](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Sorumluluk Reddi:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluğa özen göstersek de otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belgenin kendi dilindeki hâli, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->