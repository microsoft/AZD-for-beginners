# Bölüm 2: Yapay Zeka-Öncelikli Geliştirme

**📚 Kurs**: [Başlangıç için AZD](../../README.md) | **⏱️ Süre**: 1-2 saat | **⭐ Zorluk Seviyesi**: Orta

---

## Genel Bakış

Bu bölüm, Azure Developer CLI ve Microsoft Foundry hizmetlerini kullanarak yapay zeka destekli uygulamaların dağıtımına odaklanmaktadır. Basit yapay zeka sohbet uygulamalarından araçlara sahip akıllı ajanlara kadar.

> **Doğrulama notu (2026-07-13):** Bu bölümdeki komut akışı ve uzantı rehberi `azd` `1.27.1` ve mevcut önizleme AI ajan uzantısı sürümü `azure.ai.agents` `1.0.0-beta.5` ile gözden geçirilmiştir. Daha eski bir AZD sürümündeyseniz, önce güncelleyin ve sonra alıştırmalara devam edin.

## Öğrenme Hedefleri

Bu bölümü tamamlayarak:
- Önceden hazırlanmış AZD şablonları kullanarak yapay zeka uygulamaları dağıtacaksınız
- Microsoft Foundry entegrasyonunu AZD ile anlayacaksınız
- Araçlara sahip yapay zeka ajanlarını yapılandırıp özelleştireceksiniz
- RAG (Retrieval-Augmented Generation) uygulamalarının dağıtımını yapacaksınız

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Entegrasyonu](microsoft-foundry-integration.md) | AZD'yi Foundry hizmetlerine bağlayın | 30 dk |
| 2 | [Yapay Zeka Ajanları Rehberi](agents.md) | Araçlara sahip akıllı ajanlar dağıtın | 45 dk |
| 3 | [Yapay Zeka Modeli Dağıtımı](ai-model-deployment.md) | Yapay zeka modellerini dağıtın ve yapılandırın | 30 dk |
| 4 | [Yapay Zeka Atölye Laboratuvarı](ai-workshop-lab.md) | Uygulamalı: Yapay zeka çözümünüzü AZD’ye hazır hale getirin | 60 dk |

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
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Atıflı RAG sohbeti | OpenAI + AI Arama |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Araçlara sahip yapay zeka ajanı | AI Ajan Hizmeti |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Temel yapay zeka sohbeti | OpenAI + Container Apps |

---

## 💰 Maliyet Bilinci

| Ortam | Tahmini Aylık Maliyet |
|-------------|----------------------|
| Geliştirme | 80-150 $ |
| Test | 150-300 $ |
| Üretim | 300-3.500+ $ |

**İpucu:** Ücretlendirmeyi önlemek için testi tamamladıktan sonra `azd down` komutunu çalıştırın.

---

## 🔗 Navigasyon

| Yön | Bölüm |
|-----------|---------|
| **Önceki** | [Bölüm 1: Temel](../chapter-01-foundation/README.md) |
| **Sonraki** | [Bölüm 3: Yapılandırma](../chapter-03-configuration/README.md) |
| **Atla** | [Bölüm 8: Üretim Desenleri](../chapter-08-production/README.md) |

---

## 📖 İlgili Kaynaklar

- [Yapay Zeka Sorun Giderme](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Üretim Yapay Zeka Uygulamaları](../chapter-08-production/production-ai-practices.md)
- [Uygulama İçgörüleri](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->