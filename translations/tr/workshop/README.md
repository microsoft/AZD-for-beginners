<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 AZD Yapay Zeka Geliştiricileri Atölyesi
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Azure Developer CLI ile yapay zeka uygulamaları oluşturmak için uygulamalı bir atölye.</strong><br>
      AZD şablonlarını ve AI dağıtım iş akışlarını ustalıkla kullanmak için 7 modülü tamamlayın.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Son Güncelleme: Şubat 2026
      </span>
    </div>
  </div>
</div>

# AZD Yapay Zeka Geliştiricileri Atölyesi

Azure Developer CLI (AZD) ile AI uygulamalarının dağıtımına odaklanan uygulamalı atölyeye hoş geldiniz. Bu atölye, AZD şablonlarını uygulamalı olarak anlamanıza 3 adımda yardımcı olur:

1. **Keşif** - sizin için doğru olan şablonu bulun.
1. **Dağıtım** - dağıtın ve çalıştığını doğrulayın
1. **Özelleştirme** - değiştirin ve yineleyin, size ait hale getirin!

Bu atölye boyunca, uçtan uca geliştirme yolculuğunuzu düzene sokmanıza yardımcı olacak temel geliştirici araçları ve iş akışları da tanıtılacaktır.

<br/>

## Tarayıcı Tabanlı Rehber

Atölye dersleri Markdown formatındadır. Bunlarda GitHub üzerinde doğrudan gezinebilir veya aşağıdaki ekran görüntüsünde gösterildiği gibi tarayıcı tabanlı önizlemeyi başlatabilirsiniz.

![Atölye](../../../translated_images/tr/workshop.75906f133e6f8ba0.webp)

Bu seçeneği kullanmak için - depoyu profilinize fork edin ve GitHub Codespaces'i başlatın. VS Code terminali etkinleştikten sonra, bu komutu yazın:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Birkaç saniye içinde bir açılır iletişim göreceksiniz. `Open in browser` seçeneğini seçin. Web tabanlı rehber artık yeni bir tarayıcı sekmesinde açılacaktır. Bu önizlemenin bazı faydaları:

1. **Dahili arama** - anahtar kelimeleri veya dersleri hızlıca bulun.
1. **Kopyala simgesi** - bu seçeneği görmek için kod bloklarının üzerine gelin
1. **Tema geçişi** - koyu ve açık temalar arasında geçiş yapın
1. **Yardım alın** - katılmak için altbilgideki Discord simgesine tıklayın!

<br/>

## Atölye Genel Bakış

**Süre:** 3-4 saat  
**Seviye:** Başlangıçtan Orta düzeye  
**Önkoşullar:** Azure, yapay zeka kavramları, VS Code ve komut satırı araçlarına aşinalık.

Bu, yaparak öğrendiğiniz uygulamalı bir atölyedir. Egzersizleri tamamladıktan sonra, güvenlik ve verimlilik en iyi uygulamaları konusunda öğrenmeye devam etmek için AZD For Beginners müfredatını gözden geçirmenizi öneririz.

| Süre| Modül  | Amaç |
|:---|:---|:---|
| 15 dakika | [Giriş](docs/instructions/0-Introduction.md) | Giriş yapın, hedefleri anlayın |
| 30 dakika | [AI Şablonu Seçin](docs/instructions/1-Select-AI-Template.md) | Seçenekleri keşfedin ve başlangıç şablonunu seçin | 
| 30 dakika | [AI Şablonunu Doğrula](docs/instructions/2-Validate-AI-Template.md) | Varsayılan çözümü Azure'a dağıtın |
| 30 dakika | [AI Şablonunu Parçala](docs/instructions/3-Deconstruct-AI-Template.md) | Yapıyı ve yapılandırmayı keşfedin |
| 30 dakika | [AI Şablonunu Yapılandır](docs/instructions/4-Configure-AI-Template.md) | Kullanılabilir özellikleri etkinleştirin ve deneyin |
| 30 dakika | [AI Şablonunu Özelleştir](docs/instructions/5-Customize-AI-Template.md) | Şablonu ihtiyaçlarınıza uyarlayın |
| 30 dakika | [Altyapıyı Kaldır](docs/instructions/6-Teardown-Infrastructure.md) | Kaynakları temizleyin ve serbest bırakın |
| 15 dakika | [Kapanış ve Sonraki Adımlar](docs/instructions/7-Wrap-up.md) | Öğrenme kaynakları, Atölye meydan okuması |

<br/>

## Neler Öğreneceksiniz

AZD Şablonunu, Microsoft Foundry üzerinde uçtan uca geliştirme için çeşitli yetenekleri ve araçları keşfetmek amacıyla bir öğrenme kum havuzu olarak düşünün. Bu atölyenin sonunda, bu bağlamdaki çeşitli araçlar ve kavramlar hakkında sezgisel bir anlayışa sahip olmanız beklenir.

| Kavram  | Amaç |
|:---|:---|
| **Azure Developer CLI** | Araç komutlarını ve iş akışlarını anlayın|
| **AZD Templates**| Proje yapısı ve yapılandırmasını anlayın|
| **Azure AI Agent**| Microsoft Foundry projesini sağlama ve dağıtma  |
| **Azure AI Search**| Ajanlarla bağlam mühendisliğini etkinleştirin |
| **Observability**| İzleme, takip ve değerlendirmeleri keşfedin |
| **Red Teaming**| Saldırgan testleri ve hafifletme yöntemlerini keşfedin |

<br/>

## Atölye Yapısı

Atölye, şablon keşfinden dağıtıma, sökümlemeye ve özelleştirmeye kadar sizi bir yolculuğa çıkaracak şekilde yapılandırılmıştır - temel olarak resmi [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) başlangıç şablonu kullanılmaktadır.

### [Modül 1: AI Şablonu Seçin](docs/instructions/1-Select-AI-Template.md) (30 mins)

- AI Şablonları nedir?
- AI Şablonlarını nerede bulabilirim?
- AI Ajanları oluşturmaya nasıl başlayabilirim?
- **Lab**: GitHub Codespaces ile Hızlı Başlangıç

### [Modül 2: AI Şablonunu Doğrula](docs/instructions/2-Validate-AI-Template.md) (30 mins)

- AI Şablonu Mimarisi nedir?
- AZD Geliştirme İş Akışı nedir?
- AZD geliştirmesi için nasıl yardım alabilirim?
- **Lab**: AI Ajanları şablonunu dağıtın ve doğrulayın

### [Modül 3: AI Şablonunu Parçala](docs/instructions/3-Deconstruct-AI-Template.md) (30 mins)

- Ortamınızı `.azure/` içinde keşfedin 
- Kaynak kurulumunuzu `infra/` içinde keşfedin 
- AZD yapılandırmanızı `azure.yaml`s içinde keşfedin
- **Lab**: Ortam Değişkenlerini Değiştirin ve Yeniden Dağıtın

### [Modül 4: AI Şablonunu Yapılandır](docs/instructions/4-Configure-AI-Template.md) (30 mins)
- Keşfet: Retrieval Augmented Generation
- Keşfet: Ajan Değerlendirmesi & Red Teaming
- Keşfet: İzleme & Monitörleme
- **Lab**: AI Ajanı + Gözlemlenebilirliği Keşfedin 

### [Modül 5: AI Şablonunu Özelleştir](docs/instructions/5-Customize-AI-Template.md) (30 mins)
- Tanımla: Senaryo Gereksinimleri ile PRD
- Yapılandır: AZD için Ortam Değişkenleri
- Uygula: Ek görevler için Yaşam Döngüsü Kancaları
- **Lab**: Şablonu benim senaryoma göre özelleştir

### [Modül 6: Altyapıyı Kaldır](docs/instructions/6-Teardown-Infrastructure.md) (30 mins)
- Tekrar: AZD Şablonları nedir?
- Tekrar: Neden Azure Developer CLI kullanılır?
- Sonraki Adımlar: Farklı bir şablonu deneyin!
- **Lab**: Altyapıyı kaldırma ve temizleme

<br/>

## Atölye Meydan Okuması

Daha fazlasını yapmak için kendinizi zorlamak mı istiyorsunuz? İşte bazı proje önerileri - veya fikirlerinizi bizimle paylaşın!!

| Proje | Açıklama |
|:---|:---|
|1. **Karmaşık Bir AI Şablonunu Parçala** | Kullandığımız iş akışını ve araçları kullanarak farklı bir AI çözüm şablonunu dağıtıp doğrulayabilir ve özelleştirebilir misiniz? _Ne öğrendiniz?_|
|2. **Senaryonuza Göre Özelleştirin**  | Farklı bir senaryo için bir PRD (Product Requirements Document) yazmayı deneyin. Ardından şablon repozitorinizde Agent Model içinde GitHub Copilot'u kullanın - ve size bir özelleştirme iş akışı oluşturmasını isteyin. _Ne öğrendiniz? Bu önerileri nasıl geliştirebilirsiniz?_|
| | |

## Geri bildiriminiz var mı?

1. Bu repoya bir issue gönderin - kolaylık için `Workshop` etiketi ekleyin.
1. Microsoft Foundry Discord'a katılın - akranlarınızla bağlantı kurun!


| | | 
|:---|:---|
| **📚 Kurs Ana Sayfası**| [AZD For Beginners](../README.md)|
| **📖 Dokümantasyon** | [AI şablonlarıyla başlayın](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Şablonları** | [Microsoft Foundry Şablonları](https://ai.azure.com/templates) |
|**🚀 Sonraki Adımlar** | [Atölyeye Başla](../../../workshop) |
| | |

<br/>

---

**Gezinme:** [Ana Kurs](../README.md) | [Giriş](docs/instructions/0-Introduction.md) | [Modül 1: AI Şablonu Seçin](docs/instructions/1-Select-AI-Template.md)

**AZD ile yapay zeka uygulamaları geliştirmeye başlamaya hazır mısınız?**

[Atölyeye Başla: Giriş →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluğa özen gösterilse de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki haliyle yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu oluşabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->