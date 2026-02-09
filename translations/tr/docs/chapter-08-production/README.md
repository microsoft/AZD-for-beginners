# Bölüm 8: Üretim ve Kurumsal Desenler

**📚 Kurs**: [Yeni Başlayanlar için AZD](../../README.md) | **⏱️ Süre**: 2-3 saat | **⭐ Zorluk**: İleri

---

## Genel Bakış

Bu bölüm, üretim AI iş yükleri için kurumsal hazır dağıtım desenlerini, güvenlik güçlendirmesini, izlemeyi ve maliyet optimizasyonunu kapsar.

## Öğrenme Hedefleri

Bu bölümü tamamlayarak şunları yapabileceksiniz:
- Çok bölgeli dayanıklı uygulamalar dağıtmak
- Kurumsal güvenlik desenlerini uygulamak
- Kapsamlı izlemeyi yapılandırmak
- Ölçeklendirmede maliyetleri optimize etmek
- AZD ile CI/CD hatları kurmak

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Üretim AI Uygulamaları](production-ai-practices.md) | Kurumsal dağıtım desenleri | 90 dk |

---

## 🚀 Üretim Kontrol Listesi

- [ ] Dayanıklılık için çok bölgeli dağıtım
- [ ] Kimlik doğrulama için yönetilen kimlik (anahtar yok)
- [ ] İzleme için Application Insights
- [ ] Maliyet bütçeleri ve uyarılar yapılandırıldı
- [ ] Güvenlik taraması etkinleştirildi
- [ ] CI/CD boru hattı entegrasyonu
- [ ] Felaket kurtarma planı

---

## 🏗️ Mimari Desenler

### Desen 1: Mikroservis AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   API Gateway   │───▶│   AI Service    │───▶│   Azure OpenAI  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                      │
         ▼                      ▼
┌─────────────────┐    ┌─────────────────┐
│   Auth Service  │    │   Data Store    │
└─────────────────┘    └─────────────────┘
```

### Desen 2: Olay Tabanlı AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
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
| Sıfıra ölçekleme (Container Apps) | 60-80% |
| Geliştirme için tüketim katmanlarını kullanmak | 50-70% |
| Zamanlanmış ölçeklendirme | 30-50% |
| Rezerve kapasite | 20-40% |

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
# Günlükleri akış halinde izle
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
| **Kurs Tamamlandı** | [Kurs Ana Sayfası](../../README.md) |

---

## 📖 İlgili Kaynaklar

- [AI Ajanları Rehberi](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Çok Ajanlı Çözümler](../chapter-05-multi-agent/README.md)
- [Mikroservis Örneği](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Sorumluluk Reddi:
Bu belge, yapay zeka çeviri servisi [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belgenin kendi dilindeki versiyonu yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanılması sonucunda ortaya çıkan herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->