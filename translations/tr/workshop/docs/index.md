# Yapay Zeka Geliştiricileri için AZD Atölyesi

> Haziran 2026'da `azd 1.25.6` ile doğrulanmıştır.

> [!IMPORTANT]  
> **Bu atölye, yerel tarayıcınızda önizleyebileceğiniz bir atölye kılavuzu ile donatılmıştır. Başlamak için repo'yu GitHub Codespaces'ta, bir geliştirme konteynerinde veya MkDocs yüklü yerel bir kopyada açın—daha sonra etkin bir VS Code terminali görünene kadar bekleyin ve yazın:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Önizleme sayfasını bir tarayıcıda açmak için bir açılır iletişim penceresi görmelisiniz.**

Azure Developer CLI (AZD) öğrenmeye yönelik, AI uygulama dağıtımına odaklanan uygulamalı atölyeye hoş geldiniz. Bu atölye, AZD şablonlarını 3 adımda uygulamalı olarak anlamanıza yardımcı olur:

1. **Keşif** - size uygun şablonu bulun.
1. **Dağıtım** - dağıtın ve çalıştığını doğrulayın
1. **Özelleştirme** - değiştirin ve kendi ihtiyaçlarınıza göre yineleyin!

Bu atölye boyunca ayrıca temel geliştirici araçları ve iş akışlarıyla tanışacak, uçtan uca geliştirme sürecinizi kolaylaştırmaya yardımcı olacak bilgiler edineceksiniz.

| | | 
|:---|:---|
| **📚 Kurs Ana Sayfa**| [AZD For Beginners](../README.md)|
| **📖 Dokümantasyon** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Şablonları** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Sonraki Adımlar** | [Take The Challenge](#workshop-challenge) |
| | |

## Atölye Genel Bakışı

**Süre:** 3-4 saat  
**Seviye:** Başlangıçtan Orta Düzeye  
**Önkoşullar:** Azure, yapay zeka kavramları, VS Code ve komut satırı araçlarına aşinalık.

Bu, uygulayarak öğrenmenizi sağlayacak bir uygulamalı atölyedir. Egzersizleri tamamladıktan sonra, Güvenlik ve Verimlilik en iyi uygulamalarına yönelik öğreniminize devam etmek için AZD For Beginners müfredatını gözden geçirmenizi öneririz.

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | Giriş | Çerçeveyi oluşturun, hedefleri anlayın |
| 30 mins | AI Şablonu Seçin | Seçenekleri keşfedin ve başlangıç şablonunu seçin | 
| 30 mins | AI Şablonunu Doğrulayın | Varsayılan çözümü Azure'a dağıtın |
| 30 mins | AI Şablonunu Analiz Edin | Yapıyı ve yapılandırmayı keşfedin |
| 30 mins | AI Şablonunu Yapılandırın | Kullanılabilir özellikleri etkinleştirin ve deneyin |
| 30 mins | AI Şablonunu Özelleştirin | Şablonu ihtiyaçlarınıza uyarlayın |
| 30 mins | Altyapıyı Kaldırma | Temizlik ve kaynakları serbest bırakma |
| 15 mins | Kapanış & Sonraki Adımlar | Öğrenme kaynakları, Atölye meydan okuması |
| | |

## Neler Öğreneceksiniz

AZD Şablonunu, Microsoft Foundry üzerinde uçtan uca geliştirme için çeşitli yetenekleri ve araçları keşfetmenize olanak sağlayan bir öğrenme kum havuzu (sandbox) olarak düşünün. Bu atölyenin sonunda, bu bağlamdaki çeşitli araçlar ve kavramlar hakkında sezgisel bir anlayışa sahip olmalısınız.

| Kavram  | Hedef |
|:---|:---|
| **Azure Developer CLI** | Araç komutlarını ve iş akışlarını anlayın|
| **AZD Şablonları**| Proje yapısını ve yapılandırmasını anlayın|
| **Azure AI Agent**| Microsoft Foundry projesini sağlama ve dağıtma |
| **Azure AI Search**| Ajanlarla bağlam mühendisliğini etkinleştirme |
| **Gözlemlenebilirlik**| İz sürme, izleme ve değerlendirmeleri keşfedin |
| **Red Teaming**| Saldırı amaçlı testleri ve azaltma yöntemlerini keşfedin |
| | |

## Atölye Modülleri

Başlamaya hazır mısınız? Atölye modülleri arasında gezinin:

- [Modül 1: AI Şablonu Seçin](instructions/1-Select-AI-Template.md)
- [Modül 2: AI Şablonunu Doğrulayın](instructions/2-Validate-AI-Template.md) 
- [Modül 3: AI Şablonunu Analiz Edin](instructions/3-Deconstruct-AI-Template.md)
- [Modül 4: AI Şablonunu Yapılandırın](instructions/4-Configure-AI-Template.md)
- [Modül 5: AI Şablonunu Özelleştirin](instructions/5-Customize-AI-Template.md)
- [Modül 6: Altyapıyı Kaldırma](instructions/6-Teardown-Infrastructure.md)
- [Modül 7: Kapanış & Sonraki Adımlar](instructions/7-Wrap-up.md)

## Geri bildiriminiz mi var?

Bu repoda bir issue oluşturun (etiketleyin `Workshop`) veya bize [Discord](https://aka.ms/foundry/discord) üzerinden katılın ve `#get-help` kanalına gönderin

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->