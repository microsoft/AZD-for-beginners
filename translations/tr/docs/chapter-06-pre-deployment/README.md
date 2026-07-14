# Bölüm 6: Yayınlama Öncesi Planlama ve Doğrulama

**📚 Kurs**: [AZD Yeni Başlayanlar İçin](../../README.md) | **⏱️ Süre**: 1 saat | **⭐ Zorluk**: Orta Seviye

---

## Genel Bakış

Bu bölüm, uygulamanızı yayınlamadan önce gerekli planlama ve doğrulama adımlarını kapsamaktadır. Doğru kapasite planlaması, SKU seçimi ve ön kontrollerle maliyetli hatalardan nasıl kaçınacağınızı öğrenin.

> Temmuz 2026'da `azd 1.27.1` ile doğrulanmıştır.

## Öğrenme Hedefleri

Bu bölümü tamamlayarak:
- Yayınlama öncesi ön kontrolleri yapacaksınız
- Kapasiteyi planlayacak ve kaynak gereksinimlerini tahmin edeceksiniz
- Maliyet optimizasyonu için uygun SKU'ları seçeceksiniz
- İzleme için Application Insights yapılandıracaksınız
- Takım koordinasyon kalıplarını anlayacaksınız

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Ön Kontroller](preflight-checks.md) | Yayınlama öncesi yapılandırmayı doğrula | 15 dk |
| 2 | [Kapasite Planlama](capacity-planning.md) | Kaynak gereksinimlerini tahmin et | 20 dk |
| 3 | [SKU Seçimi](sku-selection.md) | Uygun fiyatlandırma kademelerini seç | 15 dk |
| 4 | [Application Insights](application-insights.md) | İzlemeyi yapılandır | 20 dk |
| 5 | [Koordinasyon Kalıpları](coordination-patterns.md) | Takım yayınlama iş akışları | 15 dk |

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

## ☑️ Yayınlama Öncesi Kontrol Listesi

### `azd provision` Öncesi

- [ ] Bölge için kota doğrulandı
- [ ] SKU'lar uygun seçildi
- [ ] Maliyet tahmini gözden geçirildi
- [ ] İsimlendirme standardı tutarlı
- [ ] Güvenlik/RBAC yapılandırıldı

### `azd deploy` Öncesi

- [ ] Ortam değişkenleri ayarlandı
- [ ] Anahtar Kasası'nda gizli bilgiler
- [ ] Bağlantı dizeleri doğrulandı
- [ ] Sağlık kontrolleri yapılandırıldı

---

## 💰 SKU Seçim Rehberi

| İş Yükü | Geliştirme | Üretim |
|----------|-------------|------------|
| Container Apps | Tüketim | Adanmış D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Modelleri | Standart | Standart + PTU |
| AI Search | Temel | Standart S2+ |

---

## 🔗 Navigasyon

| Yön | Bölüm |
|-----------|---------|
| **Önceki** | [Bölüm 5: Çoklu Ajan](../chapter-05-multi-agent/README.md) |
| **Sonraki** | [Bölüm 7: Sorun Giderme](../chapter-07-troubleshooting/README.md) |

---

## 📖 İlgili Kaynaklar

- [Yapılandırma Kılavuzu](../chapter-03-configuration/configuration.md)
- [Yayınlama Kılavuzu](../chapter-04-infrastructure/deployment-guide.md)
- [Yaygın Sorunlar](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->