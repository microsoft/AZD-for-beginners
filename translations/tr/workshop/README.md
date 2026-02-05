<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T15:45:37+00:00",
  "source_file": "workshop/README.md",
  "language_code": "tr"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Atölye Yapım Aşamasında 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Bu atölye şu anda aktif geliştirme aşamasındadır.</strong><br>
      İçerik eksik olabilir veya değişebilir. Güncellemeler için yakında tekrar kontrol edin!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Son Güncelleme: Ekim 2025
      </span>
    </div>
  </div>
</div>

# AI Geliştiriciler için AZD Atölyesi

Azure Developer CLI (AZD) ile AI uygulama dağıtımına odaklanan uygulamalı atölyeye hoş geldiniz. Bu atölye, AZD şablonlarını 3 adımda uygulamalı olarak anlamanızı sağlar:

1. **Keşif** - size uygun şablonu bulun.
1. **Dağıtım** - dağıtın ve çalıştığını doğrulayın.
1. **Özelleştirme** - değiştirin ve kendi ihtiyaçlarınıza göre uyarlayın!

Atölye boyunca, uçtan uca geliştirme sürecinizi kolaylaştırmanıza yardımcı olacak temel geliştirici araçları ve iş akışlarıyla da tanışacaksınız.

<br/>

## Tarayıcı Tabanlı Kılavuz

Atölye dersleri Markdown formatındadır. GitHub'da doğrudan gezinebilir veya aşağıdaki ekran görüntüsünde gösterildiği gibi tarayıcı tabanlı bir önizleme başlatabilirsiniz.

![Atölye](../../../translated_images/tr/workshop.75906f133e6f8ba0.webp)

Bu seçeneği kullanmak için - depoyu profilinize çatallayın ve GitHub Codespaces'i başlatın. VS Code terminali aktif olduğunda şu komutu yazın:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Birkaç saniye içinde bir açılır diyalog göreceksiniz. `Tarayıcıda aç` seçeneğini seçin. Web tabanlı kılavuz artık yeni bir tarayıcı sekmesinde açılacaktır. Bu önizlemenin bazı avantajları:

1. **Yerleşik arama** - anahtar kelimeleri veya dersleri hızlıca bulun.
1. **Kopyalama simgesi** - kod bloklarının üzerine geldiğinizde bu seçeneği görün.
1. **Tema geçişi** - karanlık ve açık temalar arasında geçiş yapın.
1. **Yardım alın** - alt kısımdaki Discord simgesine tıklayarak katılın!

<br/>

## Atölye Genel Bakış

**Süre:** 3-4 saat  
**Seviye:** Başlangıçtan Orta Seviyeye  
**Ön Koşullar:** Azure, AI kavramları, VS Code ve komut satırı araçlarına aşinalık.

Bu uygulamalı bir atölyedir; öğrenmek için yaparak ilerleyeceksiniz. Egzersizleri tamamladıktan sonra, Güvenlik ve Verimlilik en iyi uygulamalarını öğrenmek için AZD Başlangıç Müfredatını gözden geçirmenizi öneririz.

| Süre| Modül  | Amaç |
|:---|:---|:---|
| 15 dk | [Giriş](docs/instructions/0-Introduction.md) | Hedefleri anlayın, başlangıç yapın |
| 30 dk | [AI Şablonu Seçimi](docs/instructions/1-Select-AI-Template.md) | Seçenekleri keşfedin ve başlangıç yapın | 
| 30 dk | [AI Şablonunu Doğrulama](docs/instructions/2-Validate-AI-Template.md) | Varsayılan çözümü Azure'a dağıtın |
| 30 dk | [AI Şablonunu Parçalama](docs/instructions/3-Deconstruct-AI-Template.md) | Yapıyı ve konfigürasyonu keşfedin |
| 30 dk | [AI Şablonunu Yapılandırma](docs/instructions/4-Configure-AI-Template.md) | Mevcut özellikleri etkinleştirin ve deneyin |
| 30 dk | [AI Şablonunu Özelleştirme](docs/instructions/5-Customize-AI-Template.md) | Şablonu ihtiyaçlarınıza göre uyarlayın |
| 30 dk | [Altyapıyı Kaldırma](docs/instructions/6-Teardown-Infrastructure.md) | Temizlik yapın ve kaynakları serbest bırakın |
| 15 dk | [Sonuç ve Sonraki Adımlar](docs/instructions/7-Wrap-up.md) | Öğrenme kaynakları, Atölye meydan okuması |

<br/>

## Neler Öğreneceksiniz

AZD Şablonunu, Azure AI Foundry üzerinde uçtan uca geliştirme için çeşitli yetenekleri ve araçları keşfetmek üzere bir öğrenme alanı olarak düşünün. Bu atölyenin sonunda, bu bağlamdaki çeşitli araçlar ve kavramlar hakkında sezgisel bir anlayışa sahip olmalısınız.

| Kavram  | Amaç |
|:---|:---|
| **Azure Developer CLI** | Araç komutlarını ve iş akışlarını anlayın |
| **AZD Şablonları**| Proje yapısını ve konfigürasyonu anlayın |
| **Azure AI Agent**| Azure AI Foundry projesini sağlama ve dağıtma |
| **Azure AI Search**| Bağlam mühendisliğini etkinleştirme |
| **Gözlemlenebilirlik**| İzleme, değerlendirme ve takipleri keşfetme |
| **Red Teaming**| Saldırgan testleri ve önlemleri keşfetme |

<br/>

## Atölye Yapısı

Atölye, resmi [AI Agent ile Başlangıç](https://github.com/Azure-Samples/get-started-with-ai-agents) başlangıç şablonunu temel alarak, şablon keşfinden dağıtıma, parçalamaya ve özelleştirmeye kadar bir yolculuğa çıkmanızı sağlar.

### [Modül 1: AI Şablonu Seçimi](docs/instructions/1-Select-AI-Template.md) (30 dk)

- AI Şablonları nedir?
- AI Şablonlarını nerede bulabilirim?
- AI Agent'ları oluşturmaya nasıl başlayabilirim?
- **Lab**: GitHub Codespaces ile hızlı başlangıç

### [Modül 2: AI Şablonunu Doğrulama](docs/instructions/2-Validate-AI-Template.md) (30 dk)

- AI Şablon Mimarisi nedir?
- AZD Geliştirme İş Akışı nedir?
- AZD Geliştirme konusunda nasıl yardım alabilirim?
- **Lab**: AI Agent şablonunu dağıtın ve doğrulayın

### [Modül 3: AI Şablonunu Parçalama](docs/instructions/3-Deconstruct-AI-Template.md) (30 dk)

- `.azure/` ortamınızı keşfedin 
- `infra/` kaynak kurulumunuzu keşfedin 
- `azure.yaml` dosyalarındaki AZD konfigürasyonunuzu keşfedin
- **Lab**: Ortam Değişkenlerini Değiştirin ve Yeniden Dağıtın

### [Modül 4: AI Şablonunu Yapılandırma](docs/instructions/4-Configure-AI-Template.md) (30 dk)
- Keşfedin: Retrieval Augmented Generation
- Keşfedin: Agent Değerlendirme ve Red Teaming
- Keşfedin: İzleme ve Takip
- **Lab**: AI Agent + Gözlemlenebilirlik keşfi 

### [Modül 5: AI Şablonunu Özelleştirme](docs/instructions/5-Customize-AI-Template.md) (30 dk)
- Tanımlayın: Senaryo Gereksinimleri ile PRD
- Yapılandırın: AZD için Ortam Değişkenleri
- Uygulayın: Ek görevler için Yaşam Döngüsü Kancaları
- **Lab**: Şablonu kendi senaryoma göre özelleştirme

### [Modül 6: Altyapıyı Kaldırma](docs/instructions/6-Teardown-Infrastructure.md) (30 dk)
- Özet: AZD Şablonları nedir?
- Özet: Neden Azure Developer CLI kullanmalıyız?
- Sonraki Adımlar: Farklı bir şablonu deneyin!
- **Lab**: Altyapıyı kaldırın ve temizleyin

<br/>

## Atölye Meydan Okuması

Daha fazlasını yapmak için kendinizi zorlamak ister misiniz? İşte bazı proje önerileri - veya kendi fikirlerinizi bizimle paylaşabilirsiniz!

| Proje | Açıklama |
|:---|:---|
|1. **Karmaşık Bir AI Şablonunu Parçalama** | Belirttiğimiz iş akışı ve araçları kullanarak farklı bir AI çözüm şablonunu dağıtıp, doğrulayıp ve özelleştirip özümseyebilir misiniz? _Neler öğrendiniz?_|
|2. **Kendi Senaryonuzla Özelleştirme**  | Farklı bir senaryo için bir PRD (Ürün Gereksinimleri Belgesi) yazmayı deneyin. Ardından GitHub Copilot'u şablon deposunda Agent Model'de kullanarak özelleştirme iş akışı oluşturmasını isteyin. _Neler öğrendiniz? Bu önerileri nasıl geliştirebilirsiniz?_|
| | |

## Geri Bildiriminiz Var mı?

1. Bu depoda bir sorun gönderin - kolaylık için `Workshop` etiketi ekleyin.
1. Azure AI Foundry Discord'a katılın - akranlarınızla bağlantı kurun!


| | | 
|:---|:---|
| **📚 Kurs Ana Sayfası**| [AZD Başlangıç Kılavuzu](../README.md)|
| **📖 Dokümantasyon** | [AI şablonlarıyla başlama](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Şablonları** | [Azure AI Foundry Şablonları](https://ai.azure.com/templates) |
|**🚀 Sonraki Adımlar** | [Meydan Okumayı Kabul Et](../../../workshop) |
| | |

<br/>

---

**Önceki:** [AI Sorun Giderme Kılavuzu](../docs/troubleshooting/ai-troubleshooting.md) | **Sonraki:** [Lab 1: AZD Temelleri ile Başlayın](../../../workshop/lab-1-azd-basics)

**AZD ile AI uygulamaları oluşturmaya hazır mısınız?**

[Lab 1: AZD Temelleri ile Başlayın →](./lab-1-azd-basics/README.md)

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çeviriler hata veya yanlışlıklar içerebilir. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalardan sorumlu değiliz.