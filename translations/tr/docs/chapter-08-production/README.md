# Bölüm 8: Üretim ve Kurumsal Desenler

**📚 Kurs**: [AZD Yeni Başlayanlar İçin](../../README.md) | **⏱️ Süre**: 2-3 saat | **⭐ Zorluk**: İleri

---

## Genel Bakış

Bu bölüm, üretim AI iş yükleri için kurumsal düzeyde dağıtım desenlerini, güvenlik sertleştirmesini, izlemeyi ve maliyet optimizasyonunu kapsar.

## Öğrenme Hedefleri

Bu bölümü tamamladığınızda şunları yapabileceksiniz:
- Çok bölgeli dayanıklı uygulamalar dağıtmak
- Kurumsal güvenlik desenlerini uygulamak
- Kapsamlı izlemeyi yapılandırmak
- Ölçekte maliyetleri optimize etmek
- AZD ile CI/CD boru hatları kurmak

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Üretim AI Uygulamaları](production-ai-practices.md) | Kurumsal dağıtım desenleri | 90 dk |

---

## 🚀 Üretim Kontrol Listesi

- [ ] Çok bölgeli dağıtım (dayanıklılık için)
- [ ] Yönetilen kimlik ile kimlik doğrulama (anahtar yok)
- [ ] İzleme için Application Insights
- [ ] Maliyet bütçeleri ve uyarılar yapılandırıldı
- [ ] Güvenlik taraması etkinleştirildi
- [ ] CI/CD boru hattı entegrasyonu
- [ ] Felaket kurtarma planı

---

## 🏗️ Mimari Desenler

### Desen 1: Mikroservis AI

```mermaid
graph LR
    Gateway[API Ağ Geçidi] --> AI[Yapay Zeka Servisi] --> Models[Microsoft Foundry Modelleri]
    Gateway --> Auth[Kimlik Doğrulama Servisi]
    AI --> Data[Veri Deposu]
```
### Desen 2: Olay Tabanlı AI

```mermaid
graph LR
    EventGrid[Olay Izgarası] --> Functions[Fonksiyonlar] --> Pipeline[Yapay Zeka Boru Hattı]
```
---

## 🔐 Güvenlik En İyi Uygulamaları

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 Maliyet Optimizasyonu

| Strateji | Tasarruf |
|----------|---------|
| Sıfıra ölçeklendirme (Container Apps) | 60-80% |
| Geliştirme için tüketim katmanlarını kullanma | 50-70% |
| Zamanlanmış ölçeklendirme | 30-50% |
| Ayrılmış kapasite | 20-40% |

```bash
# Bütçe uyarıları ayarla
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 İzleme Kurulumu

```bash
# Günlükleri canlı izle
azd monitor --logs

# Application Insights'ı kontrol et
azd monitor

# Metrikleri görüntüle
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Gezinme

| Yön | Bölüm |
|-----------|---------|
| **Önceki** | [Bölüm 7: Sorun Giderme](../chapter-07-troubleshooting/README.md) |
| **Kurs Tamamlandı** | [Kurs Ana Sayfa](../../README.md) |

---

## 📖 İlgili Kaynaklar

- [AI Ajanları Kılavuzu](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Çok Ajanlı Çözümler](../chapter-05-multi-agent/README.md)
- [Mikroservis Örneği](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi ana dilindeki versiyonu yetkili kaynak olarak kabul edilmelidir. Önemli bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan herhangi bir yanlış anlama veya yanlış yorumlamadan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->