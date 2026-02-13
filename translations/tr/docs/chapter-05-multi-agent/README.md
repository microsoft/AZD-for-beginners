# Bölüm 5: Çok Ajanlı Yapay Zeka Çözümleri

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Süre**: 2-3 saat | **⭐ Zorluk**: İleri

---

## Genel Bakış

Bu bölüm, gelişmiş çok ajanlı mimari desenlerini, ajan orkestrasyonunu ve karmaşık senaryolar için üretime hazır yapay zeka dağıtımlarını kapsar.

## Öğrenme Hedefleri

Bu bölümü tamamladığınızda:
- Çok ajanlı mimari desenlerini anlayın
- Koordine edilmiş yapay zeka ajan sistemlerini dağıtın
- Ajanlar arası iletişimi uygulayın
- Üretime hazır çok ajanlı çözümler oluşturun

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Retail Multi-Agent Solution](../../examples/retail-scenario.md) | Tam uygulama anlatımı | 90 dk |
| 2 | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) | Ajan orkestrasyon stratejileri | 30 dk |
| 3 | [ARM Template Deployment](../../examples/retail-multiagent-arm-template/README.md) | Tek tıklamayla dağıtım | 30 dk |

---

## 🚀 Hızlı Başlangıç

```bash
# Perakende çok ajanlı çözümü dağıtın
cd examples/retail-multiagent-arm-template
./deploy.sh

# Veya şablonu doğrudan kullanın
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Çok Ajanlı Mimari

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 Öne Çıkan Çözüm: Perakende Çok Ajanlı Çözümü

[Perakende Çok Ajanlı Çözüm](../../examples/retail-scenario.md) şunları gösterir:

- **Müşteri Ajanı**: Kullanıcı etkileşimleri ve tercihleriyle ilgilenir
- **Envanter Ajanı**: Stok ve sipariş işlemlerini yönetir
- **Orkestratör**: Ajanlar arasında koordinasyon sağlar
- **Paylaşılan Bellek**: Ajanlar arası bağlam yönetimi

### Kullanılan Servisler

| Servis | Amaç |
|---------|---------|
| Azure OpenAI | Dil anlama |
| Azure AI Search | Ürün kataloğu |
| Cosmos DB | Ajan durumu ve belleği |
| Container Apps | Ajan barındırma |
| Application Insights | İzleme |

---

## 🔗 Navigasyon

| Yön | Bölüm |
|-----------|---------|
| **Önceki** | [Bölüm 4: Altyapı](../chapter-04-infrastructure/README.md) |
| **Sonraki** | [Bölüm 6: Ön Dağıtım](../chapter-06-pre-deployment/README.md) |

---

## 📖 İlgili Kaynaklar

- [Yapay Zeka Ajanları Kılavuzu](../chapter-02-ai-development/agents.md)
- [Üretim Yapay Zeka Uygulamaları](../chapter-08-production/production-ai-practices.md)
- [Yapay Zeka Sorun Giderme](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Sorumluluk Reddi:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belgenin kendi dilindeki versiyonu yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel bir insan çevirmeni tarafından yapılan çeviri önerilir. Bu çevirinin kullanımı sonucu ortaya çıkan herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->