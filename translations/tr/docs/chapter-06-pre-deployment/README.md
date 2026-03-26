# Bölüm 6: Dağıtım Öncesi Planlama ve Doğrulama

**📚 Kurs**: [AZD Yeni Başlayanlar](../../README.md) | **⏱️ Süre**: 1 saat | **⭐ Zorluk**: Orta

---

## Genel Bakış

Bu bölüm, uygulamanızı dağıtmadan önce yapılması gereken temel planlama ve doğrulama adımlarını kapsar. Doğru kapasite planlaması, SKU seçimi ve ön kontroller ile maliyetli hatalardan kaçınmayı öğrenin.

## Öğrenme Hedefleri

Bu bölümü tamamlayarak:
- Dağıtımdan önce preflight kontrollerini çalıştırırsınız
- Kapasite planlaması yapar ve kaynak gereksinimlerini tahmin edersiniz
- Maliyet optimizasyonu için uygun SKU'ları seçersiniz
- İzleme için Application Insights'ı yapılandırırsınız
- Ekip koordinasyon modellerini anlarsınız

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Preflight Kontrolleri](preflight-checks.md) | Dağıtımdan önce yapılandırmayı doğrulayın | 15 dk |
| 2 | [Kapasite Planlaması](capacity-planning.md) | Kaynak gereksinimlerini tahmin edin | 20 dk |
| 3 | [SKU Seçimi](sku-selection.md) | Uygun fiyatlandırma kademelerini seçin | 15 dk |
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

## ☑️ Dağıtım Öncesi Kontrol Listesi

### `azd provision` Öncesi

- [ ] Bölge için kota doğrulandı
- [ ] SKU'lar uygun şekilde seçildi
- [ ] Maliyet tahmini gözden geçirildi
- [ ] Adlandırma kuralı tutarlı
- [ ] Güvenlik/RBAC yapılandırıldı

### `azd deploy` Öncesi

- [ ] Ortam değişkenleri ayarlandı
- [ ] Sırlar Key Vault'ta
- [ ] Bağlantı dizeleri doğrulandı
- [ ] Sağlık kontrolleri yapılandırıldı

---

## 💰 SKU Seçim Rehberi

| Workload | Development | Production |
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

- [Yapılandırma Kılavuzu](../chapter-03-configuration/configuration.md)
- [Dağıtım Kılavuzu](../chapter-04-infrastructure/deployment-guide.md)
- [Yaygın Sorunlar](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Sorumluluk Reddi**:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belgenin kendi dilindeki sürümü yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanılmasıyla ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->