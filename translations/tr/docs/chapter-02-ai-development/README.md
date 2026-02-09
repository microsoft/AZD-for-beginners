# Bölüm 2: AI-Öncelikli Geliştirme

**📚 Course**: [AZD Yeni Başlayanlar](../../README.md) | **⏱️ Duration**: 1-2 saat | **⭐ Complexity**: Orta

---

## Genel Bakış

Bu bölüm, Azure Developer CLI ve Microsoft Foundry hizmetlerini kullanarak yapay zeka destekli uygulamaları dağıtmaya odaklanır. Basit AI sohbet uygulamalarından araçlara sahip akıllı ajanlara kadar.

## Öğrenme Hedefleri

Bu bölümü tamamlayarak:
- Önceden oluşturulmuş AZD şablonlarını kullanarak AI uygulamaları dağıtacaksınız
- AZD ile Microsoft Foundry entegrasyonunu anlayacaksınız
- Araçlara sahip AI ajanlarını yapılandırıp özelleştireceksiniz
- RAG (Retrieval-Augmented Generation) uygulamalarını dağıtacaksınız

---

## 📚 Dersler

| # | Lesson | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Entegrasyonu](microsoft-foundry-integration.md) | AZD'yi Foundry hizmetleriyle bağlayın | 30 dk |
| 2 | [AI Ajanları Kılavuzu](agents.md) | Araçlara sahip akıllı ajanları dağıtın | 45 dk |
| 3 | [AI Model Dağıtımı](ai-model-deployment.md) | AI modellerini dağıtın ve yapılandırın | 30 dk |
| 4 | [AI Atölye Laboratuvarı](ai-workshop-lab.md) | Uygulamalı: AI çözümünüzü AZD'ye hazır hale getirin | 60 dk |

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
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Kaynak gösterimli RAG sohbeti | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Araçlara sahip AI ajanı | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Temel AI sohbeti | OpenAI + Container Apps |

---

## 💰 Maliyet Bilinci

| Ortam | Tahmini Aylık Maliyet |
|-------------|----------------------|
| Geliştirme | $80-150 |
| Hazırlama | $150-300 |
| Üretim | $300-3,500+ |

**İpucu:** Ücretlerden kaçınmak için testten sonra `azd down` çalıştırın.

---

## 🔗 Gezinme

| Yön | Bölüm |
|-----------|---------|
| **Önceki** | [Bölüm 1: Temel](../chapter-01-foundation/README.md) |
| **Sonraki** | [Bölüm 3: Yapılandırma](../chapter-03-configuration/README.md) |
| **Atla** | [Bölüm 8: Üretim Kalıpları](../chapter-08-production/README.md) |

---

## 📖 İlgili Kaynaklar

- [AI Sorun Giderme](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Üretim AI Uygulamaları](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Sorumluluk Reddi:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dilindeki sürümü yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucunda ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumlamadan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->