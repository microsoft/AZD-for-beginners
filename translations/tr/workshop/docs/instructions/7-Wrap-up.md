# 7. Kapanış ve Sonraki Adımlar

!!! tip "THE MAIN TAKEAWAY MESSAGES ARE"

    - [ ] AZD şablonları AI uygulama geliştirmeyi günlerden saatlere hızlandırır
    - [ ] Discovery → Deployment → Customization metodolojisi yapılandırılmış bir öğrenme yolu sunar
    - [ ] MCP sunucularıyla GitHub Copilot karmaşık kod tabanlarının doğal dil ile keşfedilmesini sağlar
    - [ ] Microsoft Foundry yerleşik gözlemlenebilirlik, değerlendirme ve güvenlik testi sağlar

---

## 1. Neler Başardınız

Congratulations! In this workshop, you have successfully:

| Modül | Başarı |
|:---|:---|
| **Modül 1** | Azure Developer CLI'yi keşfettiniz ve bir AI şablonu seçtiniz |
| **Modül 2** | Tam bir AI ajanları çözümünü dağıttınız ve doğruladınız |
| **Modül 3** | Şablonu parçalara ayırarak mimarisini anladınız |
| **Modül 4** | `azure.yaml` yapılandırmasını ve yaşam döngüsü kancalarını incelediniz |
| **Modül 5** | Şablonu kendi senaryonuza göre özelleştirdiniz |
| **Modül 6** | Altyapıyı güvenli şekilde sonlandırdınız ve kaynakları yönettiniz |

---

## 2. Edindiğiniz Temel Kavramlar

### Azure Developer CLI (azd)
- `azd init` - Şablonlardan projeleri başlatır
- `azd up` - Tek komutta kaynak oluşturma ve dağıtım yapar
- `azd env` - Ortam değişkenlerini yönetir
- `azd down` - Kaynakları güvenli şekilde temizler

### AZD Şablon Yapısı
- `azure.yaml` - Yapılandırma ve dağıtım kancaları
- `infra/` - Bicep ile altyapı-as-kod
- `src/` - Uygulama kaynak kodu
- `scripts/` - Otomasyon ve kurulum betikleri

### Microsoft Foundry Özellikleri
- Akıllı asistanlar için AI Agent Service
- Bilgi alma için File Search ve Azure AI Search
- Yerleşik izleme, gözetim ve değerlendirme
- AI güvenliği doğrulaması için red teaming

---

## 3. Öğrenme Yolculuğunuza Devam Edin

### Önerilen Sonraki Adımlar

| Yol | Kaynak | Süre |
|:---|:---|:---|
| **Kursu Tamamlayın** | [AZD Başlangıç Müfredatı](../../README.md) | 8-12 saat |
| **Başka Bir Şablonu Deneyin** | [Microsoft Foundry Şablonları](https://ai.azure.com/templates) | 1-2 saat |
| **Derinlemesine İnceleyin** | [Azure Developer CLI Belgeleri](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Sürekli |
| **Topluluk** | [Azure Discord](https://aka.ms/foundry/discord) | Bugün katılın! |

### Sonraki Denemeniz İçin Önerilen Şablonlar

1. **[Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Verilerinizle temel sohbet
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Gelişmiş RAG desenleri
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Kurumsal perakende senaryoları

---

## 4. Çalıştay Meydan Okuması

Yeteneklerinizi test etmeye hazır mısınız? Bu meydan okumaları deneyin:

| Meydan Okuma | Açıklama | Zorluk |
|:---|:---|:---|
| **1. Çoklu Ajan Senaryosu** | Farklı bir sektör için dağıtın ve özelleştirin (ör. sağlık, finans) | ⭐⭐ |
| **2. Özel Bilgi Tabanı** | Kendi veri dosyalarınızı ekleyin ve özel bir arama dizini oluşturun | ⭐⭐⭐ |
| **3. Üretim Dağıtımı** | `azd pipeline config` kullanarak GitHub Actions ile CI/CD kurun | ⭐⭐⭐⭐ |

---

## 5. Geri Bildiriminizi Paylaşın

Geri bildiriminiz bu çalıştayı geliştirmemize yardımcı olur!

- **GitHub Issues**: [Geri bildirim gönderin](https://github.com/microsoft/azd-for-beginners/issues) - `Workshop` ile etiketleyin
- **Discord**: [Microsoft Foundry Discord](https://aka.ms/foundry/discord) katılın - `#get-help` kanalına gönderin
- **Katkılar**: Çalıştayı geliştirmeye yardımcı olmak için pull request gönderin!

---

## Teşekkürler! 🎉

AZD for AI Developers Atölyesini tamamladığınız için teşekkürler. Umarız bu deneyim size Azure üzerinde AI uygulamaları oluşturma ve dağıtma konusunda gerekli beceri ve özgüveni kazandırmıştır.

**İnşa etmeye devam edin, öğrenmeye devam edin ve Azure AI geliştirici topluluğuna hoş geldiniz!**

---

| | |
|:---|:---|
| **📚 Kurs Ana Sayfası** | [AZD Başlangıç](../../README.md) |
| **📖 Belgeler** | [Azure Developer CLI Belgeleri](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI Şablonları** | [Microsoft Foundry Şablonları](https://ai.azure.com/templates) |
| **💬 Topluluk** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, [Co-op Translator](https://github.com/Azure/co-op-translator) adlı yapay zeka çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belgenin kendi dilindeki metni yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı nedeniyle oluşabilecek herhangi bir yanlış anlama veya yorum hatasından sorumlu tutulamayız.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->