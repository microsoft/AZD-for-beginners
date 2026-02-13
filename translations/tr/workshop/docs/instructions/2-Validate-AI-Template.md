# 2. Bir Şablonu Doğrulayın

!!! tip "BU MODÜLÜN SONUNDA ŞUNLARI YAPABİLECEKSİNİZ"

    - [ ] AI Çözüm Mimarisini analiz etmek
    - [ ] AZD Dağıtım İş Akışını anlamak
    - [ ] AZD kullanımında yardım almak için GitHub Copilot kullanmak
    - [ ] **Laboratuvar 2:** AI Agents şablonunu Dağıtma ve Doğrulama

---


## 1. Giriş

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) veya `azd`, uygulamaları Azure'a oluşturup dağıtırken geliştirici iş akışını kolaylaştıran açık kaynaklı bir komut satırı aracıdır.

[AZD Şablonları](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) örnek uygulama kodu, altyapı-kod olarak varlıklar ve tutarlı bir çözüm mimarisi için `azd` yapılandırma dosyalarını içeren standart depolardır. Altyapıyı sağlamak, bir `azd provision` komutu kadar basit hale gelir - aynı zamanda `azd up` kullanmak altyapıyı sağlarken uygulamanızı tek seferde dağıtmanızı sağlar!

Sonuç olarak, uygulama geliştirme sürecinizi başlatmak, uygulama ve altyapı ihtiyaçlarınıza en yakın gelen doğru _AZD Başlangıç şablonunu_ bulmak ve ardından senaryonuza göre depo özelleştirmek kadar basit olabilir.

Başlamadan önce, Azure Developer CLI'nizin kurulu olduğundan emin olalım.

1. VS Code terminalini açın ve şu komutu yazın:

      ```bash title="" linenums="0"
      azd version
      ```

1. Şunun gibi bir şey görmelisiniz!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Artık azd ile bir şablon seçmeye ve dağıtmaya hazırsınız**

---

## 2. Şablon Seçimi

Microsoft Foundry platformu, _çok ajanlı iş akışı otomasyonu_ ve _çok modlu içerik işleme_ gibi popüler çözüm senaryolarını kapsayan [önerilen AZD şablonları kümesi](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) ile gelir. Bu şablonları Microsoft Foundry portalını ziyaret ederek de keşfedebilirsiniz.

1. Ziyaret edin: [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. İstendiğinde Microsoft Foundry portalına giriş yapın - şunun gibi bir şey göreceksiniz.

![Seç](../../../../../translated_images/tr/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** seçenekleri başlangıç şablonlarınızdır:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) – temelde bir sohbet uygulamasını _verilerinizle birlikte_ Azure Container Apps üzerine dağıtır. Basit bir AI sohbet botu senaryosunu keşfetmek için bunu kullanın.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) – Foundry Agents ile standart bir AI Agent (ajan) da dağıtır. Araçlar ve modeller içeren ajan tabanlı AI çözümlerine aşina olmak için bunu kullanın.

İkinci bağlantıyı yeni bir tarayıcı sekmesinde açın (veya ilgili kart için `Open in GitHub` tıklayın). Bu AZD Şablonu için depoyu görmelisiniz. README dosyasını incelemek için bir dakika ayırın. Uygulama mimarisi şu şekilde görünüyor:

![Mimari](../../../../../translated_images/tr/architecture.8cec470ec15c65c7.webp)

---

## 3. Şablon Etkinleştirme

Bu şablonu dağıtmaya çalışalım ve geçerli olduğunu doğrulayalım. [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) bölümündeki yönergeleri izleyeceğiz.

1. Bu bağlantıya tıklayın: [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - `Create codespace` için varsayılan işlemi onaylayın
1. Bu yeni bir tarayıcı sekmesi açar - GitHub Codespaces oturumu yüklenene kadar bekleyin
1. Codespaces içindeki VS Code terminalini açın - şu komutu yazın:

   ```bash title="" linenums="0"
   azd up
   ```

Bu tetikleyeceği iş akışı adımlarını tamamlayın:

1. Azure'a giriş yapmanız istenecek - kimlik doğrulama talimatlarını izleyin
1. Kendiniz için benzersiz bir ortam adı girin - ör., ben `nitya-mshack-azd` kullandım
1. Bu bir `.azure/` klasörü oluşturacak - ortam adı ile bir alt klasör göreceksiniz
1. Bir abonelik adı seçmeniz istenecek - varsayılanı seçin
1. Bir konum seçmeniz istenecek - `East US 2` kullanın

Şimdi, sağlama işleminin tamamlanmasını bekleyin. **Bu 10-15 dakika sürer**

1. Tamamlandığında, konsolunuz şu şekilde bir BAŞARI mesajı gösterecektir:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure Portal'ınız artık o ortam adıyla sağlanmış bir kaynak grubuna sahip olacak:

      ![Altyapı](../../../../../translated_images/tr/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Artık dağıtılan altyapıyı ve uygulamayı doğrulamaya hazırsınız**.

---

## 4. Şablon Doğrulama

1. Azure Portal [Kaynak Grupları](https://portal.azure.com/#browse/resourcegroups) sayfasını ziyaret edin - istendiğinde giriş yapın
1. Ortam adınız için RG'ye tıklayın - yukarıdaki sayfayı görmelisiniz

      - Azure Container Apps kaynağına tıklayın
      - _Essentials_ bölümündeki Uygulama URL'sine tıklayın (sağ üst)

1. Şu gibi barındırılan bir uygulama ön yüzü UI'si görmelisiniz:

   ![Uygulama](../../../../../translated_images/tr/03-test-application.471910da12c3038e.webp)

1. Birkaç [örnek soru](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) sorun

      1. Sorun: ```What is the capital of France?``` 
      1. Sorun: ```What's the best tent under $200 for two people, and what features does it include?```

1. Aşağıda gösterildiğine benzer yanıtlar almalısınız. _Peki bu nasıl çalışıyor?_ 

      ![Uygulama](../../../../../translated_images/tr/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Ajan Doğrulama

Azure Container App, bu şablon için Microsoft Foundry projesinde sağlanan AI Agent'e bağlanan bir uç nokta dağıtır. Bunun ne anlama geldiğine bir bakalım.

1. Kaynak grubunuzun Azure Portal _Overview_ sayfasına geri dönün

1. Listede `Microsoft Foundry` kaynağına tıklayın

1. Şunu görmelisiniz. `Go to Microsoft Foundry Portal` düğmesine tıklayın. 
   ![Foundry](../../../../../translated_images/tr/04-view-foundry-project.fb94ca41803f28f3.webp)

1. AI uygulamanız için Foundry Proje sayfasını görmelisiniz
   ![Proje](../../../../../translated_images/tr/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents` üzerine tıklayın - projenizde sağlanmış varsayılan Agent'i görürsünüz
   ![Ajanlar](../../../../../translated_images/tr/06-visit-agents.bccb263f77b00a09.webp)

1. Seçin - ve Ajan ayrıntılarını görürsünüz. Aşağıdakilere dikkat edin:

      - Ajan varsayılan olarak File Search kullanır (her zaman)
      - Ajanın `Knowledge` kısmı, bilgi için 32 dosya yüklendiğini gösterir
      ![Ajanlar](../../../../../translated_images/tr/07-view-agent-details.0e049f37f61eae62.webp)

1. Sol menüde `Data+indexes` seçeneğini arayın ve ayrıntılar için tıklayın. 

      - Bilgi için yüklenmiş 32 veri dosyasını görmelisiniz.
      - Bunlar `src/files` altında bulunan 12 müşteri dosyası ve 20 ürün dosyası ile eşleşir
      ![Veri](../../../../../translated_images/tr/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Ajan işlemini doğruladınız!**

1. Ajan yanıtları bu dosyalardaki bilgiye dayanır.
1. Artık bu verilerle ilgili sorular sorabilir ve dayanağı olan yanıtlar alabilirsiniz.
1. Örnek: `customer_info_10.json`, "Amanda Perez" tarafından yapılan 3 satın almayı açıklar

Container App uç noktası içeren tarayıcı sekmesine geri dönün ve sorun: `What products does Amanda Perez own?`. Şunun gibi bir şey görmelisiniz:

![Veri](../../../../../translated_images/tr/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Ajan Oyun Alanı

Microsoft Foundry'nin yetenekleri hakkında biraz daha sezgi geliştirmek için Ajanı Agents Playground'da çalıştıralım.

1. Microsoft Foundry'de `Agents` sayfasına geri dönün - varsayılan ajanı seçin
1. `Try in Playground` seçeneğine tıklayın - şu gibi bir Playground UI elde etmelisiniz
1. Aynı soruyu sorun: `What products does Amanda Perez own?`

    ![Veri](../../../../../translated_images/tr/09-ask-in-playground.a1b93794f78fa676.webp)

Aynı (veya benzer) yanıtı alırsınız - ancak ayrıca ajan uygulamanızın kalitesini, maliyetini ve performansını anlamak için kullanabileceğiniz ek bilgiler de elde edersiniz. Örneğin:

1. Yanıtın "dayanmak" için kullanılan veri dosyalarını alıntıladığını fark edin
1. Bu dosya etiketlerinin herhangi birinin üzerine gelin - veri, sorgunuzla ve görüntülenen yanıtla eşleşiyor mu?

Yanıtın altında bir de _istatistikler_ satırı görürsünüz.

1. Herhangi bir metriğin üzerine gelin - ör., Safety. Şunun gibi bir şey görürsünüz
1. Değerlendirilen puanlama, yanıt güvenlik düzeyi için sezginizle eşleşiyor mu?

      ![Veri](../../../../../translated_images/tr/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Yerleşik Gözlemlenebilirlik

Gözlemlenebilirlik, uygulamanızın operasyonlarını anlamak, hata ayıklamak ve optimize etmek için kullanılabilecek veri üretmesi amacıyla enstrümantasyon yapmaktır. Bunun bir örneğini görmek için:

1. `View Run Info` düğmesine tıklayın - bu görünümü görmelisiniz. Bu, çalışan bir [Agent izleme](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) örneğidir. _Bu görünümü ayrıca üst düzey menüde Thread Logs'a tıklayarak da alabilirsiniz_.

   - Ajanın çalıştırma adımlarını ve kullanılan araçları anlayın
   - Yanıt için toplam Token sayısını (ve çıktı token kullanımı karşılaştırmasını) anlayın
   - Gecikmeyi ve yürütme sırasında zamanın nerede harcandığını anlayın

      ![Ajan](../../../../../translated_images/tr/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Çalışma için hata ayıklama bağlamı sağlayabilecek ek öznitelikleri görmek için `Metadata` sekmesine tıklayın.   

      ![Ajan](../../../../../translated_images/tr/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` sekmesine tıklayarak ajan yanıtı üzerinde otomatik yapılan değerlendirmeleri görün. Bunlar güvenlik değerlendirmelerini (örn., Self-harm) ve ajanla ilgili değerlendirmeleri (örn., Niyet çözümü, Göreve uyum) içerir.

      ![Ajan](../../../../../translated_images/tr/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Son olarak, kenar çubuğu menüsünde `Monitoring` sekmesine tıklayın.

      - Görüntülenen sayfada `Resource usage` sekmesini seçin - ve metrikleri görüntüleyin.
      - Maliyet (tokenlar) ve yük (istekler) açısından uygulama kullanımını izleyin.
      - Uygulama için ilk byte (girdi işleme) ve son byte (çıktı) gecikmesini izleyin.

      ![Ajan](../../../../../translated_images/tr/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Ortam Değişkenleri

Şimdiye kadar dağıtımı tarayıcıda gezindik ve altyapımızın sağlandığını ve uygulamanın çalıştığını doğruladık. Ancak uygulama ile _kod-öncelikli_ çalışmak için, bu kaynaklarla çalışmak için gereken ilgili değişkenlerle yerel geliştirme ortamımızı yapılandırmamız gerekir. `azd` kullanmak bunu kolaylaştırır.

1. Azure Developer CLI [uygulama dağıtımları için yapılandırma ayarlarını saklamak ve yönetmek amacıyla ortam değişkenlerini kullanır](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash).

1. Ortam değişkenleri `.azure/<env-name>/.env` içinde saklanır - bu onları dağıtım sırasında kullanılan `env-name` ortamına özgü kılar ve aynı depo içindeki farklı dağıtım hedefleri arasında ortamları izole etmenize yardımcı olur.

1. Ortam değişkenleri, `azd` komutu belirli bir komut yürüttüğünde (örn., `azd up`) otomatik olarak yüklenir. `azd` işletim sistemi seviyesindeki ortam değişkenlerini (örn., shell içinde ayarlanmış olanları) otomatik olarak okumaz - bunun yerine betikler içinde bilgiyi aktarmak için `azd set env` ve `azd get env` kullanın.


Birkaç komutu deneyelim:

1. Bu ortam için `azd` ile ayarlanmış tüm ortam değişkenlerini alın:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Şunun gibi bir şey görürsünüz:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Belirli bir değeri alın - ör., `AZURE_AI_AGENT_MODEL_NAME` değerinin ayarlanıp ayarlanmadığını bilmek istiyorum

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Şunun gibi bir şey görürsünüz - varsayılan olarak ayarlanmamıştı!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd` için yeni bir ortam değişkeni ayarlayın. Burada, ajan model adını güncelliyoruz. _Not: yapılan değişiklikler `.azure/<env-name>/.env` dosyasında hemen yansıtılacaktır._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Şimdi değerin ayarlandığını görmeliyiz:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Bazı kaynakların kalıcı olduğunu (örn., model dağıtımları) ve yeniden dağıtımı zorlamak için sadece bir `azd up`'dan daha fazlasını gerektirebileceğini unutmayın. Orijinal dağıtımı kaldırıp değiştirilen ortam değişkenleriyle yeniden dağıtmayı deneyelim.

1. **Yenileme** Daha önce bir azd şablonu kullanarak altyapı dağıttıysanız - yerel ortam değişkenlerinizin durumunu Azure dağıtımınızın mevcut durumuna göre yenilemek için şu komutu kullanabilirsiniz:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Bu, iki veya daha fazla yerel geliştirme ortamı (ör. birden fazla geliştiricinin olduğu bir ekip) arasında ortam değişkenlerini _eşitlemenin_ güçlü bir yoludur - dağıtılan altyapının ortam değişkenlerinin durumunu gerçek kaynak olarak kabul etmesini sağlar. Ekip üyeleri sadece değişkenleri _yenileyerek_ tekrar senkronize olurlar.

---

## 9. Tebrikler 🏆

Az önce uçtan uca bir iş akışını tamamladınız:

- [X] Kullanmak İstediğiniz AZD Şablonunu Seçtiniz
- [X] Şablonu GitHub Codespaces ile Başlattınız 
- [X] Şablonu dağıttınız ve çalıştığını doğruladınız

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Sorumluluk Reddi:
Bu belge, yapay zeka çeviri servisi Co-op Translator (https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki haliyle yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı nedeniyle oluşabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->