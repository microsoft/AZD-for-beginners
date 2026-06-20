# Bölüm 6: Dağıtımdan Önce Planlama ve Doğrulama

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Süre**: 1 saat | **⭐ Zorluk**: Orta düzey

---

## Genel Bakış

Bu bölüm, uygulamanızı dağıtmadan önceki temel planlama ve doğrulama adımlarını kapsar. Doğru kapasite planlaması, SKU seçimi ve preflight kontrolleriyle maliyetli hatalardan kaçınmayı öğrenin.

> Haziran 2026'da `azd 1.25.6` ile doğrulanmıştır.

## Öğrenme Hedefleri

By completing this chapter, you will:
- Dağıtımdan önce preflight kontrollerini çalıştırın
- Kapasite planlaması yapın ve kaynak gereksinimlerini tahmin edin
- Maliyet optimizasyonu için uygun SKU'ları seçin
- İzleme için Application Insights'ı yapılandırın
- Ekip koordinasyon desenlerini anlayın

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Preflight Kontrolleri](preflight-checks.md) | Dağıtımdan önce yapılandırmayı doğrulayın | 15 dk |
| 2 | [Kapasite Planlaması](capacity-planning.md) | Kaynak gereksinimlerini tahmin edin | 20 dk |
| 3 | [SKU Seçimi](sku-selection.md) | Uygun fiyatlandırma kademelerini seçin | 15 dk |
| 4 | [Application Insights](application-insights.md) | İzlemeyi yapılandırın | 20 dk |
| 5 | [Koordinasyon Desenleri](coordination-patterns.md) | Ekip dağıtım iş akışları | 15 dk |

---

## 🚀 Hızlı Başlangıç

```bash
# Abonelik kotalarını kontrol et
az vm list-usage --location eastus --output table

# Dağıtımı önizle (kaynak oluşturulmayacak)
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
- [ ] Adlandırma konvansiyonu tutarlı
- [ ] Güvenlik/RBAC yapılandırıldı

### `azd deploy` Öncesi

- [ ] Ortam değişkenleri ayarlandı
- [ ] Gizli bilgiler Key Vault'ta
- [ ] Bağlantı dizeleri doğrulandı
- [ ] Sağlık kontrolleri yapılandırıldı

---

## 💰 SKU Seçim Rehberi

| İş Yükü | Geliştirme | Üretim |
|----------|-------------|------------|
| Konteyner Uygulamaları | Tüketim | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Modelleri | Standard | Standard + PTU |
| AI Search | Temel | Standard S2+ |

---

## 🔗 Gezinme

| Yön | Bölüm |
|-----------|---------|
| **Önceki** | [Chapter 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Sonraki** | [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |

---

## 📖 İlgili Kaynaklar

- [Yapılandırma Kılavuzu](../chapter-03-configuration/configuration.md)
- [Dağıtım Rehberi](../chapter-04-infrastructure/deployment-guide.md)
- [Yaygın Sorunlar](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->