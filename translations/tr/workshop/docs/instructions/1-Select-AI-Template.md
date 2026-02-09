# 1. Bir Şablon Seçin

!!! tip "BU MODÜLÜN SONUNDA ŞUNLARI YAPABİLECEKSİNİZ"

    - [ ] AZD şablonlarının ne olduğunu açıklayın
    - [ ] AI için AZD şablonlarını keşfedin ve kullanın
    - [ ] AI Agents şablonuyla başlayın
    - [ ] **Lab 1:** GitHub Codespaces ile AZD Hızlı Başlangıç

---

## 1. Bir İnşaatçı Benzetmesi

Modern, kurumsal düzeye hazır bir yapay zeka uygulamasını _sıfırdan_ inşa etmek göz korkutucu olabilir. Bu, yeni evinizi kendi başınıza tuğla tuğla inşa etmeye benzemektedir. Evet, yapılabilir! Ancak istenen sonuca ulaşmanın en etkili yolu değildir! 

Bunun yerine, genellikle var olan bir _tasarım planı_ ile başlar ve kişisel gereksinimlerimize göre özelleştirmek için bir mimarla çalışırız. Akıllı uygulamalar geliştirirken izlenmesi gereken tam da bu yaklaşımdır. Önce, sorun alanınıza uygun iyi bir tasarım mimarisi bulun. Ardından çözümü özel senaryonuza göre özelleştirmek ve geliştirmek için bir çözüm mimarıyla çalışın.

Peki bu tasarım planlarını nerede bulabilirsiniz? Ve bu planları kendi başımıza nasıl özelleştirip dağıtacağımızı öğretmeye istekli bir mimarı nasıl buluruz? Bu çalıştayda, size üç teknolojiyi tanıtarak bu soruları yanıtlıyoruz:

1. [Azure Developer CLI](https://aka.ms/azd) - yerel geliştirmeden (inşa) bulut dağıtımına (gönderme) geçişi hızlandıran açık kaynaklı bir araç.
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - AI çözüm mimarisinin dağıtımı için örnek kod, altyapı ve yapılandırma dosyalarını içeren standartlaştırılmış açık kaynak depoları.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - Azure bilgisine dayanan, doğal dil kullanarak kod tabanında gezinme ve değişiklik yapmada yol gösteren bir kodlama ajanı.

Elinizde bu araçlar olduğunda, doğru şablonu _keşfedebilir_, çalışıp çalışmadığını doğrulamak için _dağıtabilir_ ve belirli senaryolarınıza uyacak şekilde _özelleştirebilirsiniz_. Haydi bunların nasıl çalıştığını öğrenelim.


---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (or `azd`) bir açık kaynak komut satırı aracıdır ve IDE (geliştirme) ile CI/CD (devops) ortamlarınızda tutarlı şekilde çalışan geliştirici dostu komutlar setiyle koddan buluta yolculuğunuzu hızlandırabilir.

`azd` ile dağıtım yolculuğunuz şu kadar basit olabilir:

- `azd init` - Mevcut bir AZD şablonundan yeni bir AI projesi başlatır.
- `azd up` - Altyapıyı sağlar ve uygulamanızı tek adımda dağıtır.
- `azd monitor` - Dağıtılmış uygulamanız için gerçek zamanlı izleme ve teşhis sağlar.
- `azd pipeline config` - Azure'a dağıtımı otomatikleştirmek için CI/CD boru hatlarını yapılandırır.

**🎯 | UYGULAMA**: <br/> Şimdi GitHub Codespaces ortamınızda `azd` komut satırı aracını inceleyin. Araçta neler yapabileceğini görmek için şu komutu yazmakla başlayın:

```bash title="" linenums="0"
azd help
```

![Akış](../../../../../translated_images/tr/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD Şablonu

`azd`'nin bunu başarabilmesi için hangi altyapıyı sağlayacağını, hangi yapılandırma ayarlarını uygulayacağını ve hangi uygulamayı dağıtacağını bilmesi gerekir. İşte burada [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) devreye girer. 

AZD şablonları, çözüm mimarisinin dağıtımı için gereken örnek kodu altyapı ve yapılandırma dosyalarıyla birleştiren açık kaynaklı depolardır.
Bir _Infrastructure-as-Code_ (IaC) yaklaşımı kullanarak, şablon kaynak tanımlarının ve yapılandırma ayarlarının sürüm kontrolüne alınmasını sağlar (tıpkı uygulama kaynak kodu gibi) - böylece proje kullanıcıları arasında yeniden kullanılabilir ve tutarlı iş akışları oluşturur.

_AZD şablonunu kendi senaryonuz için_ oluştururken veya yeniden kullanırken, bu soruları göz önünde bulundurun:

1. Ne inşa ediyorsunuz? → Bu senaryo için başlangıç kodu olan bir şablon var mı?
1. Çözümünüz nasıl tasarlandı? → Gerekli kaynaklara sahip bir şablon var mı?
1. Çözümünüz nasıl dağıtılıyor? → Ön/son işleme kancalarıyla `azd deploy`'u düşünün!
1. Bunu daha nasıl optimize edebilirsiniz? → Yerleşik izleme ve otomasyon boru hatlarını düşünün!

**🎯 | UYGULAMA**: <br/> 
Mevcut 250+ şablonu keşfetmek için [Awesome AZD](https://azure.github.io/awesome-azd/) galerisini ziyaret edin ve filtreleri kullanın. _Kendi_ senaryo gereksinimlerinize uyan bir şablon bulup bulamayacağınıza bakın.

![Kod](../../../../../translated_images/tr/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI Uygulama Şablonları

Yapay zeka destekli uygulamalar için Microsoft, **Microsoft Foundry** ve **Foundry Agents** içeren özelleşmiş şablonlar sağlar. Bu şablonlar, akıllı ve üretime hazır uygulamalar oluşturma yolunuzu hızlandırır.

### Microsoft Foundry & Foundry Agents Şablonları

Dağıtmak için aşağıdaki şablonlardan birini seçin. Her şablon [Awesome AZD](https://azure.github.io/awesome-azd/) üzerinde bulunur ve tek bir komutla başlatılabilir.

| Şablon | Açıklama | Dağıtım Komutu |
|----------|-------------|----------------|
| **[RAG ile AI Sohbeti](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Retrieval Augmented Generation (RAG) kullanarak sohbet uygulaması | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Servis Başlatıcı](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Otonom görev yürütme için Foundry Agents ile AI ajanları oluşturun | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Çok Ajanlı Orkestrasyon](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Karmaşık iş akışları için birden fazla Foundry Agent'i koordine edin | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Belge Zekası](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Microsoft Foundry modelleri ile belgeleri çıkartın ve analiz edin | `azd init -t azure-samples/ai-document-processing` |
| **[Konuşma Tabanlı AI Botu](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Microsoft Foundry entegrasyonu ile akıllı sohbet botları oluşturun | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Görüntü Oluşturma](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Microsoft Foundry üzerinden DALL-E kullanarak görüntüler oluşturun | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Ajanı](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Foundry Agents ile Semantic Kernel kullanan AI ajanları | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Çoklu Ajan](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | AutoGen çerçevesi kullanarak çoklu ajan sistemleri | `azd init -t azure-samples/autogen-multi-agent` |

### Hızlı Başlangıç

1. **Şablonlara göz atın**: Ziyaret edin [https://azure.github.io/awesome-azd/] ve `AI`, `Agents` veya `Microsoft Foundry` ile filtreleyin
2. **Şablonunuzu seçin**: Kullanım durumunuza uygun bir tane seçin
3. **Başlatın**: Seçtiğiniz şablon için `azd init` komutunu çalıştırın
4. **Dağıtın**: Altyapıyı sağlamak ve dağıtmak için `azd up` komutunu çalıştırın

**🎯 | UYGULAMA**: <br/>
Senaryonuza göre yukarıdaki şablonlardan birini seçin:

- **Bir sohbet botu mu inşa ediyorsunuz?** → **RAG ile AI Sohbeti** veya **Konuşma Tabanlı AI Botu** ile başlayın
- **Otonom ajanlara mı ihtiyacınız var?** → **Foundry Agent Servis Başlatıcı** veya **Çok Ajanlı Orkestrasyon**'u deneyin
- **Belgeleri mi işliyorsunuz?** → **AI Belge Zekası**'nı kullanın
- **AI kodlama yardımı mı istiyorsunuz?** → **Semantic Kernel Ajanı** veya **AutoGen Çoklu Ajan**'ı keşfedin

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Daha Fazla Şablonu Keşfedin"
    The [Awesome AZD Galerisi](https://azure.github.io/awesome-azd/) 250+ şablon içerir. Dil, çerçeve ve Azure hizmetleri için özel gereksinimlerinize uyan şablonları bulmak için filtreleri kullanın.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluğa özen göstersek de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki hâli yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucunda ortaya çıkabilecek yanlış anlamalar veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->