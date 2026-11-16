# Bölüm 6: Dağıtımdan Önce Planlama ve Doğrulama

**📚 Kurs**: [Yeni Başlayanlar için AZD](../../README.md) | **⏱️ Süre**: 2-4 saat okuma; uyarlanmış laboratuvarlar için ek süre | **⭐ Zorluk**: Orta-Seviye–İleri

---

## Genel Bakış

Bu bölüm, uygulamanızı dağıtmadan önce temel planlama ve doğrulama adımlarını kapsar. Doğru kapasite planlaması, SKU seçimi ve ön kontrollerle maliyetli hatalardan kaçınmayı öğrenin.

> Yayınlanmış `azd 1.37.2` referansına karşı kontrol edilmiş komut rehberi. Bulut dağıtımları gerçekleştirilmedi. Uzun dersler, tamamlanmış yerel dağıtım projeleri değil, örnek parçalardan oluşmaktadır.

## Öğrenme Hedefleri

Bu bölümü tamamlayarak şunları yapabileceksiniz:
- Dağıtımdan önce ön kontrolleri çalıştırmak
- Kapasite planlaması yapmak ve kaynak gereksinimlerini tahmin etmek
- Maliyet optimizasyonu için uygun SKU'ları seçmek
- İzleme için Application Insights'ı yapılandırmak
- Çoklu ajan koordinasyon desenlerini ve bunların dağıtım gereksinimlerini anlamak

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Ön Kontroller](preflight-checks.md) | Dağıtımdan önce yapılandırmayı doğrulama | 15 dk |
| 2 | [Kapasite Planlaması](capacity-planning.md) | Kaynak gereksinimlerini tahmin etme | 20 dk |
| 3 | [SKU Seçimi](sku-selection.md) | Uygun fiyatlandırma katmanlarını seçme | 15 dk |
| 4 | [Application Insights](application-insights.md) | İzlemeyi yapılandırma | 20 dk |
| 5 | [Koordinasyon Desenleri](coordination-patterns.md) | İleri seviye çoklu ajan orkestrasyon tasarımı | 60-75 dk |

---

## 🚀 Hızlı Başlangıç

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ Dağıtımdan Önce Kontrol Listesi

### `azd provision` Öncesi

- [ ] Bölge için kota doğrulandı
- [ ] SKU'lar uygun şekilde seçildi
- [ ] Maliyet tahmini gözden geçirildi
- [ ] İsimlendirme standardı tutarlı
- [ ] Güvenlik/RBAC yapılandırıldı

### `azd deploy` Öncesi

- [ ] Ortam değişkenleri ayarlandı
- [ ] Sırlar Key Vault'ta
- [ ] Bağlantı dizeleri doğrulandı
- [ ] Sağlık kontrolleri yapılandırıldı

---

## 💰 SKU Seçim Kılavuzu

| İş Yükü | Geliştirme | Üretim |
|----------|-------------|------------|
| Container Apps | Tüketim | Ölçülen yük bazında tüketim veya özel iş yükü profili |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI modelleri | Desteklenen kullanım bazlı dağıtım türü | Kullanım bazlı veya tahsis edilmiş throughput; model/bölgeye bağlı |
| AI Search | Limitler dahilinde Ücretsiz/Temel | İndeks, replika ve sorgu yüküne göre Temel veya Standart katman |

---

## 🔗 Navigasyon

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
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->