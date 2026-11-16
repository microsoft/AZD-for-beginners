# AI Geliştiricileri için AZD Atölyesi

> Kaynak rehber AZD 1.37.2 karşısında 4 Kasım 2026'da gözden geçirilmiştir. Ekran görüntüleri açıklayıcıdır; hizmet kullanılabilirliği, portal etiketleri ve şablon varsayılanları değişebilir.

> [!IMPORTANT]  
> **Bu atölye, yerel tarayıcınızda önizleyebileceğiniz bir atölye rehberi ile donatılmıştır. Başlamak için, GitHub Codespaces'de, bir geliştirici konteynerinde veya MkDocs yüklü yerel klonunuzda depoyu açın—daha sonra aktif bir VS Code terminali görünene kadar bekleyin ve şunu yazın:**  
> Kurs depo kökünden, `requirements-dev.txt` yükleyin, ardından ön planda `python -m mkdocs serve --config-file workshop/mkdocs.yml` çalıştırın.
> **Önizleme sayfasını bir tarayıcıda açmak için bir açılır iletişim kutusu görmelisiniz.**

Azure Developer CLI (AZD) öğrenmek için AI uygulama dağıtımına odaklanan uygulamalı atölyeye hoş geldiniz. Bu atölye size AZD şablonlarını 3 adımda uygulamalı olarak anlamanızı sağlar:

1. **Keşif** - size uygun şablonu bulun.
1. **Dağıtım** - dağıtın ve çalıştığını doğrulayın
1. **Özelleştirme** - üzerinde değişiklik yapın ve kendi kullanımınıza uyarlayın!

Bu atölye boyunca, uçtan uca geliştirme sürecinizi kolaylaştırmak için temel geliştirici araçları ve iş akışlarıyla tanıtılacaksınız.

| | | 
|:---|:---|
| **📚 Kurs Anasayfası**| [AZD Yeni Başlayanlar için](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md)|
| **📖 Dokümantasyon** | [AI şablonlarıyla başlayın](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Şablonları** | [Microsoft Foundry Şablonları](https://ai.azure.com/templates) |
|**🚀 Sonraki Adımlar** | [Meydan Okumayı Alın](instructions/7-Wrap-up.md#4-workshop-challenge) |
| | |

## Atölye Genel Bakışı

**Süre:** 3-4 saat  
**Seviye:** Başlangıç - Orta  
**Önkoşullar:** Azure, AI kavramları, VS Code ve komut satırı araçlarına aşinalık.

Bu uygulamalı atölyede yaparak öğreniyorsunuz. Egzersizleri tamamladıktan sonra, Güvenlik ve Verimlilik en iyi uygulamalarına yönelik öğrenme yolculuğunuza devam etmek için AZD Yeni Başlayanlar müfredatını gözden geçirmenizi öneriyoruz.

| Süre | Modül  | Hedef |
|:---|:---|:---|
| 15 dk | Giriş | Sahneyi ayarlayın, hedefleri anlayın |
| 30 dk | AI Şablonu Seçimi | Seçenekleri keşfedin ve başlangıç şablonunu seçin | 
| 30 dk | AI Şablonunu Doğrulama | Varsayılan çözümü Azure'a dağıtın |
| 30 dk | AI Şablonunu Parçalama | Yapıyı ve yapılandırmayı keşfedin |
| 30 dk | AI Şablonunu Yapılandırma | Mevcut özellikleri etkinleştirin ve deneyin |
| 30 dk | AI Şablonunu Özelleştirme | Şablonu ihtiyaçlarınıza göre uyarlayın |
| 30 dk | Altyapıyı Kaldırma | Kaynakları temizleyin ve serbest bırakın |
| 15 dk | Kapanış & Sonraki Adımlar | Öğrenme kaynakları, Atölye meydan okuması |
| | |

## Öğrenecekleriniz

AZD Şablonunu, Microsoft Foundry'de uçtan uca geliştirme için çeşitli yetenekleri ve araçları keşfetmek üzere bir öğrenme alanı olarak düşünün. Bu atölye sonunda, bu bağlamda çeşitli araçlar ve kavramlar hakkında sezgisel bir anlayışa sahip olmalısınız.

| Kavram  | Hedef |
|:---|:---|
| **Azure Developer CLI** | Araç komutlarını ve iş akışlarını anlayın |
| **AZD Şablonları**| Proje yapısını ve yapılandırmasını anlayın |
| **Azure AI Agent**| Microsoft Foundry projesini tahsis edin ve dağıtın  |
| **Azure AI Search**| Ajanlarla bağlam mühendisliği etkinleştirin |
| **Gözlemlenebilirlik**| İzleme, takip ve değerlendirmeleri keşfedin |
| **Kırmızı Takım Çalışması**| Rakip testleri ve önlemleri keşfedin |
| | |

## Atölye Modülleri

Başlamaya hazır mısınız? Atölye modülleri arasında gezin:

- [Modül 1: AI Şablonu Seçimi](instructions/1-Select-AI-Template.md)
- [Modül 2: AI Şablonunu Doğrulama](instructions/2-Validate-AI-Template.md) 
- [Modül 3: AI Şablonunu Parçalama](instructions/3-Deconstruct-AI-Template.md)
- [Modül 4: AI Şablonunu Yapılandırma](instructions/4-Configure-AI-Template.md)
- [Modül 5: AI Şablonunu Özelleştirme](instructions/5-Customize-AI-Template.md)
- [Modül 6: Altyapıyı Kaldırma](instructions/6-Teardown-Infrastructure.md)
- [Modül 7: Kapanış & Sonraki Adımlar](instructions/7-Wrap-up.md)

## Geri bildiriminiz var mı?

Bu repoda bir sorun bildirin (etiketleyin `Workshop`) veya bize [Discord](https://aka.ms/foundry/discord) üzerinden katılın ve `#get-help` kanalımıza yazın

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->