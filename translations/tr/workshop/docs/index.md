# AI Geliştiricileri için AZD Atölyesi

> Temmuz 2026'da `azd 1.27.1` ile doğrulanmıştır.

> [!IMPORTANT]  
> **Bu atölye, yerel tarayıcınızda önizleyebileceğiniz bir atölye rehberi ile donatılmıştır. Başlamak için, depo GitHub Codespaces'te, bir geliştirme konteynerinde veya MkDocs yüklü yerel bir kopyada açın—sonra aktif bir VS Code terminali görene kadar bekleyin ve şunu yazın:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Önizleme sayfasını bir tarayıcıda açmak için bir açılır pencere görmelisiniz.**

Azure Developer CLI (AZD) öğrenmek ve özellikle AI uygulaması dağıtımına odaklanmak için uygulamalı atölyeye hoş geldiniz. Bu atölye, AZD şablonlarını 3 adımda uygulamalı olarak anlamanızı sağlar:

1. **Keşif** - size uygun şablonu bulun.
1. **Dağıtım** - dağıtın ve çalıştığını doğrulayın
1. **Özelleştirme** - şablonu değiştirip size uygun hale getirin!

Bu atölye boyunca ayrıca temel geliştirici araçları ve iş akışları ile tanışacak, uçtan uca geliştirme yolculuğunuzu kolaylaştıracaksınız.

| | | 
|:---|:---|
| **📚 Dersin Ana Sayfası**| [Başlangıç İçin AZD](../README.md)|
| **📖 Dokümantasyon** | [AI şablonları ile başlama](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI Şablonları** | [Microsoft Foundry Şablonları](https://ai.azure.com/templates) |
|**🚀 Sonraki Adımlar** | [Meydan okumayı kabul et](#workshop-challenge) |
| | |

## Atölye Genel Bakışı

**Süre:** 3-4 saat  
**Seviye:** Başlangıçtan Orta Düzeye  
**Önkoşullar:** Azure, AI kavramları, VS Code ve komut satırı araçlarına aşinalık.

Bu, uygulayarak öğrenilen bir atölyedir. Egzersizleri tamamladıktan sonra, Güvenlik ve Verimlilik en iyi uygulamalarına yönelik öğrenme yolculuğunuza devam etmek için AZD Başlangıç Müfredatını incelemenizi öneririz.

| Süre| Modül  | Amaç |
|:---|:---|:---|
| 15 dk | Giriş | Konuyu belirleme, hedefleri anlama |
| 30 dk | AI Şablonu Seçimi | Seçenekleri keşfetme ve başlangıç şablonunu seçme | 
| 30 dk | AI Şablonunu Doğrulama | Varsayılan çözümü Azure'a dağıtma |
| 30 dk | AI Şablonunu Parçalama | Yapı ve konfigürasyonu keşfetme |
| 30 dk | AI Şablonunu Yapılandırma | Mevcut özellikleri etkinleştirme ve deneme |
| 30 dk | AI Şablonunu Özelleştirme | Şablonu ihtiyaçlarınıza göre uyarlama |
| 30 dk | Altyapıyı Sökme | Temizlik yapma ve kaynakları serbest bırakma |
| 15 dk | Kapanış ve Sonraki Adımlar | Öğrenme kaynakları, Atölye meydan okuması |
| | |

## Öğrenecekleriniz

AZD Şablonunu, Microsoft Foundry üzerinde uçtan uca geliştirme için çeşitli yetenekler ve araçları keşfetmenizi sağlayan bir öğrenme alanı gibi düşünün. Bu atölye sonunda, bu bağlamdaki çeşitli araçlar ve kavramlar hakkında sezgisel bir anlayışa sahip olmanız gerekir.

| Kavram  | Amaç |
|:---|:---|
| **Azure Developer CLI** | Araç komutlarını ve iş akışlarını anlama|
| **AZD Şablonları**| Proje yapısı ve yapılandırmasını anlama|
| **Azure AI Ajansı**| Microsoft Foundry projesini sağlama ve dağıtma  |
| **Azure AI Arama**| Ajanlarla bağlam mühendisliği sağlama |
| **Gözlemlenebilirlik**| İzleme, takip ve değerlendirmeleri keşfetme |
| **Kırmızı Takım Çalışmaları**| Saldırgan testler ve önlemleri keşfetme |
| | |

## Atölye Modülleri

Başlamaya hazır mısınız? Atölye modülleri arasında gezin:

- [Modül 1: AI Şablonu Seç](instructions/1-Select-AI-Template.md)
- [Modül 2: AI Şablonunu Doğrula](instructions/2-Validate-AI-Template.md) 
- [Modül 3: AI Şablonunu Parçala](instructions/3-Deconstruct-AI-Template.md)
- [Modül 4: AI Şablonunu Yapılandır](instructions/4-Configure-AI-Template.md)
- [Modül 5: AI Şablonunu Özelleştir](instructions/5-Customize-AI-Template.md)
- [Modül 6: Altyapıyı Sök](instructions/6-Teardown-Infrastructure.md)
- [Modül 7: Kapanış ve Sonraki Adımlar](instructions/7-Wrap-up.md)

## Geri bildiriminiz var mı?

Bu depoda bir sorun bildirin (`Workshop` etiketiyle) veya [Discord](https://aka.ms/foundry/discord) üzerinden bize katılın ve `#get-help` kanalına mesaj bırakın

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->