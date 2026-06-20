# 2. Bir Şablonu Doğrulayın

> `azd 1.25.6` ile Haziran 2026'da doğrulandı.

!!! tip "BU MODÜLÜN SONUNDA ŞUNLARI YAPABİLİRSİNİZ"

    - [ ] AI Çözüm Mimarisini Analiz Etmek
    - [ ] AZD Dağıtım İş Akışını Anlamak
    - [ ] AZD kullanımı için GitHub Copilot'tan yardım almak
    - [ ] **Lab 2:** AI Agents şablonunu dağıtmak ve doğrulamak

---


## 1. Giriş

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) veya `azd`, uygulamaları Azure'a yönelik oluşturma ve dağıtma sırasında geliştirici iş akışını kolaylaştıran açık kaynaklı bir komut satırı aracıdır.

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates), örnek uygulama kodu, _altyapı-kod olarak_ varlıkları ve çözüm mimarisi için bir arada `azd` yapılandırma dosyalarını içeren standartlaştırılmış depolardır. Altyapıyı hazırlamak, bir `azd provision` komutu kadar basit hale gelir - aynı zamanda `azd up` kullanarak altyapıyı **hazırlayıp** uygulamanızı tek seferde dağıtabilirsiniz!

Sonuç olarak, uygulama geliştirme sürecinizi başlatmak, uygulama ve altyapı ihtiyaçlarınıza en yakın _AZD Başlangıç şablonunu_ bulup depo üzerinde senaryonuza göre özelleştirmek kadar basit olabilir.

Başlamadan önce, Azure Developer CLI'nın yüklü olduğundan emin olalım.

1. VS Code terminalini açın ve şu komutu yazın:

      ```bash title="" linenums="0"
      azd version
      ```

1. Şunun gibi bir şey görmelisiniz!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**Artık azd ile bir şablon seçmeye ve dağıtmaya hazırsınız**

---

## 2. Şablon Seçimi

Microsoft Foundry platformu, _çok ajanlı iş akışı otomasyonu_ ve _çok modlu içerik işleme_ gibi popüler çözüm senaryolarını kapsayan [önerilen AZD şablonları kümesi](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) ile gelir. Bu şablonları Microsoft Foundry portalını ziyaret ederek de keşfedebilirsiniz.

1. [https://ai.azure.com/templates](https://ai.azure.com/templates) adresini ziyaret edin
1. İstendiğinde Microsoft Foundry portalına giriş yapın - şu benzerini göreceksiniz.

![Seç](../../../../../translated_images/tr/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** seçenekleri başlangıç şablonlarınızdır:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) - temel bir sohbet uygulamasını _verilerinizle birlikte_ Azure Container Apps'e dağıtır. Basit bir AI sohbet botu senaryosunu keşfetmek için bunu kullanın.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) - Foundry Agents ile standart bir AI Ajanı da dağıtır. Araçlar ve modeller içeren ajan tabanlı AI çözümlerine aşina olmak için bunu kullanın.

Bağlantının ikincisini yeni bir tarayıcı sekmesinde açın (veya ilgili kart için `Open in GitHub`'a tıklayın). Bu AZD Şablonu için depoyu görmelisiniz. README dosyasını incelemek için bir dakika ayırın. Uygulama mimarisi şöyle görünüyor:

![Mimari](../../../../../translated_images/tr/architecture.8cec470ec15c65c7.webp)

---

## 3. Şablon Aktifleştirme

Bu şablonu dağıtmayı deneyelim ve geçerli olduğunu doğrulayalım. [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) bölümündeki yönergeleri izleyeceğiz.

1. Şablon deposu için bir çalışma ortamı seçin:

      - **GitHub Codespaces**: Bu [bağlantıya](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) tıklayın ve `Create codespace` onaylayın
      - **Yerel klon veya dev container**: `Azure-Samples/get-started-with-ai-agents` deposunu klonlayın ve VS Code'da açın

1. VS Code terminali hazır olana kadar bekleyin, ardından şu komutu yazın:

   ```bash title="" linenums="0"
   azd up
   ```

Başlatacak olan iş akışı adımlarını tamamlayın:

1. Azure'a giriş yapmanız istenecek - kimlik doğrulaması için talimatları izleyin
1. Kendiniz için benzersiz bir ortam adı girin - ör., ben `nitya-mshack-azd` kullandım
1. Bu, bir `.azure/` klasörü oluşturacaktır - ortam adıyla bir alt klasör göreceksiniz
1. Bir abonelik seçmeniz istenecek - varsayılanı seçin
1. Bir konum sorulacak - `East US 2` kullanın

Şimdi, hazırlamanın tamamlanmasını bekleyin. **Bu 10-15 dakika sürer**

1. Tamamlandığında, konsolunuz aşağıdaki gibi BİR BAŞARI mesajı gösterecektir:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure Portal'ınız şimdi o ortam adına sahip bir kaynak grubu içerecek:

      ![Altyapı](../../../../../translated_images/tr/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Artık dağıtılan altyapıyı ve uygulamayı doğrulamaya hazırsınız**.

---

## 4. Şablon Doğrulama

1. Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) sayfasını ziyaret edin - istendiğinde giriş yapın
1. Ortam adınız için RG'ye tıklayın - yukarıdaki sayfayı görmelisiniz

      - Azure Container Apps kaynağına tıklayın
      - _Essentials_ bölümündeki Uygulama Url'sine tıklayın (sağ üst)

1. Bu şekilde barındırılan bir uygulama ön yüzü görmelisiniz:

   ![Uygulama](../../../../../translated_images/tr/03-test-application.471910da12c3038e.webp)

1. Birkaç [örnek soru](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) sormayı deneyin

      1. Sorun: ```What is the capital of France?``` 
      1. Sorun: ```What's the best tent under $200 for two people, and what features does it include?```

1. Aşağıda gösterildiği gibi benzer yanıtlar almanız gerekir. _Ama bu nasıl çalışıyor?_ 

      ![Uygulama](../../../../../translated_images/tr/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Ajan Doğrulama

Azure Container App, bu şablon için Microsoft Foundry projesinde hazırlanan AI Ajana bağlanan bir uç nokta dağıtır. Bunun ne anlama geldiğine bir bakalım.

1. Kaynak grubunuzun Azure Portal _Overview_ sayfasına geri dönün

1. Listede `Microsoft Foundry` kaynağına tıklayın

1. Şunu görmelisiniz. `Go to Microsoft Foundry Portal` düğmesine tıklayın. 
   ![Foundry](../../../../../translated_images/tr/04-view-foundry-project.fb94ca41803f28f3.webp)

1. AI uygulamanız için Foundry Proje sayfasını görmelisiniz
   ![Proje](../../../../../translated_images/tr/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents`'a tıklayın - projenize sağlanan varsayılan Ajan'ı görürsünüz
   ![Ajanlar](../../../../../translated_images/tr/06-visit-agents.bccb263f77b00a09.webp)

1. Seçin - Ajan ayrıntılarını görürsünüz. Aşağıdakilere dikkat edin:

      - Ajan varsayılan olarak Dosya Araması kullanır (her zaman)
      - Ajanın `Knowledge` kısmı, 32 dosya yüklendiğini gösterir (dosya araması için)
      ![Ajanlar](../../../../../translated_images/tr/07-view-agent-details.0e049f37f61eae62.webp)

1. Sol menüde `Data+indexes` seçeneğini arayın ve ayrıntılar için tıklayın. 

      - Bilgi için yüklenmiş 32 veri dosyasını görmelisiniz.
      - Bunlar `src/files` altındaki 12 müşteri dosyası ve 20 ürün dosyasına karşılık gelecektir
      ![Veri](../../../../../translated_images/tr/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Ajan çalışmasını doğruladınız!**

1. Ajan yanıtları, bu dosyalardaki bilgiye dayanır. 
1. Artık bu verilerle ilgili sorular sorabilir ve dayandırılmış yanıtlar alabilirsiniz.
1. Örnek: `customer_info_10.json`, "Amanda Perez" tarafından yapılan 3 satın almayı tanımlar

Tarayıcı sekmesine geri dönün (Container App uç noktası) ve sorun: `What products does Amanda Perez own?`. Şunun gibi bir şey görmelisiniz:

![Veri](../../../../../translated_images/tr/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Ajan Oyun Alanı

Microsoft Foundry'nin yetenekleri hakkında biraz daha sezgi geliştirelim; Ajana Agents Playground'da bir tur attıralım.

1. Microsoft Foundry'deki `Agents` sayfasına geri dönün - varsayılan ajanı seçin
1. `Try in Playground` seçeneğine tıklayın - şöyle bir Playground UI'sı almalısınız
1. Aynı soruyu sorun: `What products does Amanda Perez own?`

    ![Veri](../../../../../translated_images/tr/09-ask-in-playground.a1b93794f78fa676.webp)

Aynı (veya benzer) yanıtı alırsınız - ancak ayrıca ajan uygulamanızın kalite, maliyet ve performansını anlamak için kullanabileceğiniz ek bilgiler de elde edersiniz. Örneğin:

1. Yanıtın, yanıtı "temellendirmek" için kullanılan veri dosyalarını alıntıladığını unutmayın
1. Bu dosya etiketlerinin üzerine gelin - veriler sorgunuz ve görüntülenen yanıtla eşleşiyor mu?

Yanıtın altında bir _stats_ satırı da görürsünüz. 

1. Herhangi bir metriğin üzerine gelin - ör., Safety. Şunun gibi bir şey görürsünüz
1. Değerlendirilen puan yanıtın güvenlik düzeyiyle sezginize uyuyor mu?

      ![Veri](../../../../../translated_images/tr/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Yerleşik Gözlemlenebilirlik

Gözlemlenebilirlik, uygulamanızı çalışması hakkında anlamak, hata ayıklamak ve optimize etmek için kullanılabilecek verileri üretecek şekilde enstrümante etmeyle ilgilidir. Bunu anlamak için:

1. `View Run Info` düğmesine tıklayın - bu görünümü görmelisiniz. Bu, [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) örneğidir. _Bu görünümü ayrıca üst düzey menüde Thread Logs'a tıklayarak da alabilirsiniz_.

   - Çalıştırma adımlarını ve ajanın kullandığı araçları kavrayın
   - Yanıt için toplam Token sayısını (ve çıktı token kullanımı karşılaştırmasını) anlayın
   - Gecikmeyi ve yürütme sırasında zamanın nerede harcandığını anlayın

      ![Ajan](../../../../../translated_images/tr/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Çalıştırma için faydalı bağlam sağlayabilecek ek öznitelikleri görmek üzere `Metadata` sekmesine tıklayın.   

      ![Ajan](../../../../../translated_images/tr/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` sekmesine tıklayarak ajan yanıtı üzerinde yapılan otomatik değerlendirmeleri görün. Bunlar güvenlik değerlendirmelerini (ör., Self-harm) ve ajanla ilgili değerlendirmeleri (ör., Niyet çözümlemesi, Görev uyumu) içerir.

      ![Ajan](../../../../../translated_images/tr/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Son olarak, kenar çubuğu menüsünde `Monitoring` sekmesine tıklayın.

      - Görüntülenen sayfada `Resource usage` sekmesini seçin - ve metrikleri görüntüleyin.
      - Tokenlar (maliyetler) ve yük (istekler) açısından uygulama kullanımını izleyin.
      - İlk byte'a (girdi işleme) ve son byte'a (çıktı) kadar olan uygulama gecikmesini izleyin.

      ![Ajan](../../../../../translated_images/tr/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Ortam Değişkenleri

Şu ana kadar dağıtımı tarayıcıda inceledik - altyapımızın hazırlanmış olduğunu ve uygulamanın çalıştığını doğruladık. Ancak uygulama ile _kod-öncelikli_ çalışmak için bu kaynaklarla çalışmak üzere yerel geliştirme ortamımızı ilgili değişkenlerle yapılandırmamız gerekir. `azd` kullanmak bunu kolaylaştırır.

1. Azure Developer CLI, uygulama dağıtımları için yapılandırma ayarlarını depolamak ve yönetmek üzere [ortam değişkenlerini kullanır](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash).

1. Ortam değişkenleri `.azure/<env-name>/.env` içinde saklanır - bu onları dağıtım sırasında kullanılan `env-name` ortamına özgü kılar ve aynı repo içindeki farklı dağıtım hedefleri arasında ortamları izole etmenize yardımcı olur.

1. Ortam değişkenleri `azd` komutu belirli bir komut çalıştırdığında otomatik olarak yüklenir (ör., `azd up`). `azd` işletim sistemi düzeyindeki ortam değişkenlerini (ör., kabukta ayarlanmış olanlar) otomatik olarak okumaz - bunun yerine betiklerde bilgi aktarmak için `azd set env` ve `azd get env` kullanın.


Birkaç komutu deneyelim:

1. Bu ortamda `azd` için ayarlanmış tüm ortam değişkenlerini alın:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Şunun gibi bir şey görürsünüz:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Belirli bir değeri alın - ör., `AZURE_AI_AGENT_MODEL_NAME` değerini ayarlayıp ayarlamadığımızı öğrenmek istiyorum

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Şunun gibi bir şey görürsünüz - varsayılan olarak ayarlanmamıştı!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd` için yeni bir ortam değişkeni ayarlayın. Burada ajan model adını güncelliyoruz. _Not: yapılan herhangi bir değişiklik hemen `.azure/<env-name>/.env` dosyasında yansıtılır._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Şimdi, değerin ayarlandığını görmeliyiz:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Bazı kaynakların kalıcı olduğunu unutmayın (ör., model dağıtımları) ve yeniden dağıtımı zorlamak için sadece `azd up` yeterli olmayabilir. Orijinal dağıtımı kapatıp değiştirilen ortam değişkenleriyle yeniden dağıtmayı deneyelim.

1. **Yenileme** Daha önce bir azd şablonu kullanarak altyapı dağıttıysanız - yerel ortam değişkenlerinizin durumunu Azure dağıtımınızın mevcut durumuna göre yenilemek için şu komutu kullanabilirsiniz:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Bu, dağıtılan altyapının ortam değişkenlerinin durumuna ilişkin nihai gerçek olarak hizmet etmesini sağlayarak iki veya daha fazla yerel geliştirme ortamı (ör. birden fazla geliştiricinin bulunduğu bir ekip) arasında ortam değişkenlerini _eşitlemenin_ güçlü bir yoludur. Ekip üyeleri sadece değişkenleri _yenileyerek_ tekrar senkronize olur.

---

## 9. Tebrikler 🏆

Az önce uçtan uca bir iş akışını tamamladınız:

- [X] Kullanmak istediğiniz AZD Template'i seçtiniz
- [X] Şablonu desteklenen bir geliştirme ortamında açtınız
- [X] Şablonu dağıttınız ve çalıştığını doğruladınız

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->