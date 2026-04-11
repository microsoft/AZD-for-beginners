# Bölüm 2: Yapay Zeka-Öncelikli Geliştirme

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Süre**: 1-2 saat | **⭐ Zorluk**: Orta

---

## Genel Bakış

Bu bölüm, Azure Developer CLI ve Microsoft Foundry hizmetlerini kullanarak yapay zeka destekli uygulamaların dağıtımına odaklanır. Basit AI sohbet uygulamalarından araçlara sahip akıllı ajanlara kadar.

> **Doğrulama notu (2026-03-25):** Bu bölümdeki komut akışı ve uzantı yönergeleri `azd` `1.23.12` ve mevcut önizleme AI ajan uzantısı sürümü `azure.ai.agents` `0.1.18-preview` ile gözden geçirilmiştir. Daha eski bir AZD yapısındaysanız önce güncelleyin ve ardından egzersizlere devam edin.

## Öğrenme Hedefleri

By completing this chapter, you will:
- Önceden hazırlanmış AZD şablonlarını kullanarak yapay zeka uygulamaları dağıtmak
- AZD ile Microsoft Foundry entegrasyonunu anlamak
- Araçlarla AI ajanlarını yapılandırmak ve özelleştirmek
- RAG (Retrieval-Augmented Generation) uygulamalarını dağıtmak

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD'yi Foundry hizmetleriyle bağlayın | 30 min |
| 2 | [AI Agents Guide](agents.md) | Araçlarla akıllı ajanlar dağıtın | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI modellerini dağıtma ve yapılandırma | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Uygulamalı: AI çözümünüzü AZD'ye hazır hale getirin | 60 min |

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

## 🤖 Öne Çıkan AI Şablonları

| Şablon | Açıklama | Hizmetler |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Alıntılarla RAG sohbeti | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Araçlarla AI ajanı | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Temel AI sohbeti | OpenAI + Container Apps |

---

## 💰 Maliyet Bilinci

| Ortam | Tahmini Aylık Maliyet |
|-------------|----------------------|
| Geliştirme | $80-150 |
| Hazırlık | $150-300 |
| Üretim | $300-3,500+ |

**İpucu:** Ücretlerden kaçınmak için testten sonra `azd down` komutunu çalıştırın.

---

## 🔗 Gezinme

| Yön | Bölüm |
|-----------|---------|
| **Önceki** | [Bölüm 1: Temel](../chapter-01-foundation/README.md) |
| **Sonraki** | [Bölüm 3: Yapılandırma](../chapter-03-configuration/README.md) |
| **Atla** | [Bölüm 8: Üretim Kalıpları](../chapter-08-production/README.md) |

---

## 📖 İlgili Kaynaklar

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Bu belge [Co-op Translator](https://github.com/Azure/co-op-translator) adlı yapay zeka çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucunda ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumlamadan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->