# Bölüm 2: Yapay Zeka Öncelikli Geliştirme

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Süre**: 1-2 saat | **⭐ Zorluk**: Orta

---

## Genel Bakış

Bu bölüm, Azure Developer CLI ve Microsoft Foundry hizmetleri kullanarak yapay zeka destekli uygulamaların dağıtımına odaklanır. Basit yapay zeka sohbet uygulamalarından araçlara sahip akıllı ajanlara kadar.

> **Doğrulama notu (2026-06-15):** Bu bölümdeki komut akışı ve eklenti yönergeleri `azd` `1.25.6` ve mevcut önizleme AI agent eklenti sürümü `azure.ai.agents` `0.1.40-preview` ile gözden geçirilmiştir. Eğer daha eski bir AZD sürümündeyseniz, önce güncelleyin ve ardından egzersizlere devam edin.

## Öğrenme Hedefleri

Bu bölümü tamamladığınızda şunları yapabileceksiniz:
- Önceden hazırlanmış AZD şablonlarını kullanarak yapay zeka uygulamaları dağıtın
- Microsoft Foundry ile AZD entegrasyonunu anlayın
- Araçlarla yapay zeka ajanlarını yapılandırın ve özelleştirin
- RAG (Retrieval-Augmented Generation) uygulamalarını dağıtın

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|------|----------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD'yi Foundry hizmetleriyle bağlayın | 30 dk |
| 2 | [AI Agents Guide](agents.md) | Araçlarla akıllı ajanlar dağıtın | 45 dk |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Yapay zeka modellerini dağıtın ve yapılandırın | 30 dk |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Uygulamalı: Yapay zeka çözümünüzü AZD'ye hazır hale getirin | 60 dk |

---

## 🚀 Hızlı Başlangıç

```bash
# Seçenek 1: RAG Sohbet Uygulaması
azd init --template azure-search-openai-demo
azd up

# Seçenek 2: Yapay Zeka Ajanları
azd init --template get-started-with-ai-agents
azd up

# Seçenek 3: Hızlı Sohbet Uygulaması
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Öne Çıkan Yapay Zeka Şablonları

| Şablon | Açıklama | Hizmetler |
|--------|----------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Atıflı RAG sohbeti | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Araçlara sahip yapay zeka ajanı | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Temel yapay zeka sohbeti | OpenAI + Container Apps |

---

## 💰 Maliyet Farkındalığı

| Ortam | Tahmini Aylık Maliyet |
|-------|-----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**İpucu:** Ücretlerden kaçınmak için testten sonra `azd down` komutunu çalıştırın.

---

## 🔗 Gezinme

| Yön | Bölüm |
|-----|-------|
| **Önceki** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **Sonraki** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Atla** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 İlgili Kaynaklar

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->