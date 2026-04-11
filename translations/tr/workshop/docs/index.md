# AZD for AI Geliştiricileri Atölyesi

> Mart 2026'da `azd 1.23.12` ile doğrulandı.

> [!IMPORTANT]  
> **Bu atölye, yerel tarayıcınızda önizleyebileceğiniz bir atölye kılavuzuyla donatılmıştır. Başlamak için depoyu GitHub Codespaces'te, bir geliştirme konteynerinde veya MkDocs yüklü yerel bir kopyada açın—sonra etkin bir VS Code terminali görünce bekleyin ve yazın:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Önizleme sayfasını tarayıcıda açmak için bir açılır ileti görmelisiniz.**

Azure Developer CLI (AZD) öğrenmeye yönelik ve AI uygulama dağıtımına odaklanan uygulamalı atölyeye hoş geldiniz. Bu atölye, AZD şablonlarını uygulamalı olarak 3 adımda anlamanıza yardımcı olur:

1. **Keşif** - sizin için doğru şablonu bulun.
1. **Dağıtım** - dağıtın ve çalıştığını doğrulayın
1. **Özelleştirme** - değiştirin ve yineleyerek size uygun hale getirin!

Bu atölye boyunca, uçtan uca geliştirme sürecinizi kolaylaştırmaya yardımcı olmak için temel geliştirici araçları ve iş akışlarıyla da tanıştırılacaksınız.

| | | 
|:---|:---|
| **📚 Kurs Ana Sayfası**| [AZD Yeni Başlayanlar](../README.md)|
| **📖 Dokümantasyon** | [AI şablonları ile başlayın](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Şablonları** | [Microsoft Foundry Şablonları](https://ai.azure.com/templates) |
|**🚀 Sonraki Adımlar** | [Meydan Okumayı Kabul Et](#workshop-challenge) |
| | |

## Atölye Genel Bakışı

**Süre:** 3-4 saat  
**Seviye:** Başlangıç - Orta Düzey  
**Önkoşullar:** Azure, AI kavramları, VS Code ve komut satırı araçlarına aşinalık.

Bu, yaparak öğrenmeniz için tasarlanmış uygulamalı bir atölyedir. Alıştırmaları tamamladıktan sonra, Güvenlik ve Verimlilik en iyi uygulamalarına yönelik öğrenme yolculuğunuza devam etmek için AZD Yeni Başlayanlar müfredatını gözden geçirmenizi öneririz.

| Süre| Modül  | Hedef |
|:---|:---|:---|
| 15 dakika | Giriş | Sahneyi hazırlayın, hedefleri anlayın |
| 30 dakika | AI Şablonu Seç | Seçenekleri keşfedin ve başlangıç şablonunu seçin | 
| 30 dakika | AI Şablonunu Doğrula | Varsayılan çözümü Azure'a dağıtın |
| 30 dakika | AI Şablonunu İnceleme | Yapıyı ve yapılandırmayı keşfedin |
| 30 dakika | AI Şablonunu Yapılandırma | Kullanılabilir özellikleri etkinleştirin ve deneyin |
| 30 dakika | AI Şablonunu Özelleştirme | Şablonu ihtiyaçlarınıza göre uyarlayın |
| 30 dakika | Altyapıyı Kaldırma | Temizlik yapın ve kaynakları serbest bırakın |
| 15 dakika | Kapanış ve Sonraki Adımlar | Öğrenme kaynakları, Atölye meydan okuması |
| | |

## Neler Öğreneceksiniz

AZD Şablonunu, Microsoft Foundry üzerinde uçtan uca geliştirme için çeşitli yetenekleri ve araçları keşfetmek amacıyla bir öğrenme kum havuzu (sandbox) olarak düşünün. Bu atölyenin sonunda, bu bağlamdaki çeşitli araçlar ve kavramlar hakkında sezgisel bir anlayışa sahip olmalısınız.

| Kavram  | Hedef |
|:---|:---|
| **Azure Developer CLI** | Araç komutlarını ve iş akışlarını anlayın|
| **AZD Şablonları**| Proje yapısını ve yapılandırmasını anlayın|
| **Azure AI Agent**| Microsoft Foundry projesini sağlama ve dağıtma  |
| **Azure AI Search**| Ajanlarla bağlam mühendisliğini etkinleştirin |
| **Gözlenebilirlik**| İz sürme, izleme ve değerlendirmeleri keşfedin |
| **Red Teaming**| Düşmanca testleri ve hafifletmeleri keşfedin |
| | |

## Atölye Modülleri

Başlamaya hazır mısınız? Atölye modülleri arasında gezin:

- [Modül 1: AI Şablonu Seç](instructions/1-Select-AI-Template.md)
- [Modül 2: AI Şablonunu Doğrula](instructions/2-Validate-AI-Template.md) 
- [Modül 3: AI Şablonunu İnceleme](instructions/3-Deconstruct-AI-Template.md)
- [Modül 4: AI Şablonunu Yapılandırma](instructions/4-Configure-AI-Template.md)
- [Modül 5: AI Şablonunu Özelleştirme](instructions/5-Customize-AI-Template.md)
- [Modül 6: Altyapıyı Kaldırma](instructions/6-Teardown-Infrastructure.md)
- [Modül 7: Kapanış ve Sonraki Adımlar](instructions/7-Wrap-up.md)

## Geri bildiriminiz var mı?

Bu depoda bir issue açın (etiketleyin `Workshop`) veya bize [Discord](https://aka.ms/foundry/discord) üzerinden katılın ve `#get-help` kanalına gönderin

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge [Co-op Translator](https://github.com/Azure/co-op-translator) adlı yapay zeka çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki hâliyle yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucunda ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->