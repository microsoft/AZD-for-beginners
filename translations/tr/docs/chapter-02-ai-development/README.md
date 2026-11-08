# Bölüm 2: AI-Öncelikli Geliştirme

**📚 Kurs**: [AZD Yeni Başlayanlar İçin](../../README.md) | **⏱️ Süre**: Atölye dahil 4-5 saat | **⭐ Zorluk**: Orta

---

## Genel Bakış

Bu bölüm, Azure Developer CLI ve Microsoft Foundry hizmetleri kullanarak yapay zekâ destekli uygulamaların dağıtımına odaklanmaktadır. Basit yapay zekâ sohbet uygulamalarından araçlarla donatılmış zeki ajanlara kadar.

> **Sürüm incelemesi (2026-11-04):** AI CLI rehberi yayımlanan `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23` ve `azure.ai.evaluations` `1.0.0-beta.2` dokümantasyon/kaynaklarla karşılaştırıldı. Birleşik iş akışı için `azd >= 1.37.0` kullanılmalıdır. Değerlendirmeler artık ayrı `azd ai eval` ad alanını kullanıyor; [sürüm değişiklikleri ve geçiş rehberine](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes) bakınız. Bu canlı dağıtım doğrulaması değildir.

## Öğrenme Hedefleri

Bu bölümü tamamladığınızda:
- Önceden hazırlanmış AZD şablonlarıyla AI uygulamalarını dağıtabileceksiniz
- Microsoft Foundry'nin AZD ile entegrasyonunu anlayacaksınız
- Araçlarla AI ajanlarını yapılandıracak ve özelleştirebileceksiniz
- RAG (Retrieval-Augmented Generation) uygulamalarını dağıtabileceksiniz

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Entegrasyonu](microsoft-foundry-integration.md) | AZD'yi Foundry hizmetlerine bağlama | 30 dk |
| 2 | [AI Ajanları Rehberi](agents.md) | Araçlarla zeki ajanları dağıtma | 45 dk |
| 3 | [AI Model Dağıtımı](ai-model-deployment.md) | AI modellerini dağıtma ve yapılandırma | 30 dk |
| 4 | [AI Atölye Laboratuvarı](ai-workshop-lab.md) | Uygulamalı: Bir şablonu keşfedin ve dönüşümünüzü planlayın | 2-3 saat |

---

## 🚀 Hızlı Başlangıç

Yeni boş bir dizinde bir seçenek seçin. Arkadaki `.` mevcut dizini başlatır; aksi takdirde AZD, kabuk çalışma dizininizi değiştirmeden bir alt dizin oluşturabilir.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 Öne Çıkan AI Şablonları

| Şablon | Açıklama | Hizmetler |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Kaynakça içeren RAG sohbet | OpenAI + AI Arama |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Araçlarla AI ajanı | AI Ajan Hizmeti |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Temel AI sohbeti | OpenAI + Container Apps |

---

## 💰 Maliyet Bilinci

Bunlar sadece örnek aralıklardır, teklif ya da üst sınır değildir; model trafiği, Arama/bilgi işlem SKU'ları, bölge ve isteğe bağlı özellikler bunları aşabilir. Sağlanan örneğin güncel fiyatlandırma rehberini inceleyin.

| Ortam | Tahmini Aylık Maliyet |
|-------------|----------------------|
| Geliştirme | 80-150 $ |
| Hazırlık | 150-300 $ |
| Üretim | 300-3.500+ $ |

**İpucu:** Ücretlendirmeyi önlemek için testten sonra `azd down` çalıştırın.

---

## 🔗 Navigasyon

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
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->