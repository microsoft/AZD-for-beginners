<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7816c6ec50c694c331e7c6092371be4d",
  "translation_date": "2025-09-24T15:03:43+00:00",
  "source_file": "workshop/docs/instructions/2-Validate-AI-Template.md",
  "language_code": "tr"
}
-->
# 2. Bir Şablonu Doğrulama

!!! tip "BU MODÜLÜN SONUNDA ŞUNLARI YAPABİLECEKSİNİZ"

    - [ ] Yapay Zeka Çözüm Mimarisi'ni analiz etme
    - [ ] AZD Dağıtım İş Akışını anlama
    - [ ] GitHub Copilot'u kullanarak AZD hakkında yardım alma
    - [ ] **Lab 2:** AI Agents şablonunu dağıtma ve doğrulama

---

## 1. Giriş

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) veya `azd`, Azure'a uygulama geliştirirken ve dağıtırken geliştirici iş akışını kolaylaştıran açık kaynaklı bir komut satırı aracıdır.

[AZD Şablonları](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates), örnek uygulama kodu, _altyapı kodu_ varlıkları ve `azd` yapılandırma dosyalarını içeren standartlaştırılmış depolardır. Altyapıyı sağlamak, bir `azd provision` komutuyla basitleşir - ve `azd up` kullanarak altyapıyı **ve** uygulamanızı tek seferde dağıtabilirsiniz!

Sonuç olarak, uygulama geliştirme sürecinize başlamak, uygulamanıza ve altyapı ihtiyaçlarınıza en yakın olan _AZD Başlangıç Şablonu_'nu bulmak kadar basit olabilir - ardından depoyu senaryo gereksinimlerinize göre özelleştirebilirsiniz.

Başlamadan önce, Azure Developer CLI'nin yüklü olduğundan emin olalım.

1. VS Code terminalini açın ve şu komutu yazın:

      ```bash title="" linenums="0"
      azd version
      ```

1. Şuna benzer bir şey görmelisiniz!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Artık bir şablon seçmeye ve azd ile dağıtmaya hazırsınız**

---

## 2. Şablon Seçimi

Azure AI Foundry platformu, _çoklu ajan iş akışı otomasyonu_ ve _çok modlu içerik işleme_ gibi popüler çözüm senaryolarını kapsayan [önerilen AZD şablonları](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) setiyle birlikte gelir. Bu şablonları Azure AI Foundry portalını ziyaret ederek de keşfedebilirsiniz.

1. [https://ai.azure.com/templates](https://ai.azure.com/templates) adresini ziyaret edin
1. Azure AI Foundry portalına giriş yapın - şuna benzer bir şey göreceksiniz.

![Pick](../../../../../translated_images/tr/01-pick-template.60d2d5fff5ebc374.png)

**Temel** seçenekler başlangıç şablonlarınızdır:

1. [ ] [AI Chat ile Başlayın](https://github.com/Azure-Samples/get-started-with-ai-chat), verilerinizle birlikte Azure Container Apps'e temel bir sohbet uygulaması dağıtır. Temel bir yapay zeka sohbet botu senaryosunu keşfetmek için bunu kullanın.
1. [X] [AI Agents ile Başlayın](https://github.com/Azure-Samples/get-started-with-ai-agents), Azure AI Agent Service ile standart bir AI Agent'ı dağıtır. Araçlar ve modeller içeren ajan tabanlı yapay zeka çözümlerine aşina olmak için bunu kullanın.

İkinci bağlantıyı yeni bir tarayıcı sekmesinde ziyaret edin (veya ilgili kart için `GitHub'da Aç` seçeneğine tıklayın). Bu AZD Şablonu için depoyu görmelisiniz. README dosyasını incelemek için bir dakikanızı ayırın. Uygulama mimarisi şu şekilde görünüyor:

![Arch](../../../../../translated_images/tr/architecture.8cec470ec15c65c7.png)

---

## 3. Şablon Aktivasyonu

Bu şablonu dağıtmaya çalışalım ve geçerli olduğundan emin olalım. [Başlarken](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) bölümündeki yönergeleri takip edeceğiz.

1. [Bu bağlantıya](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) tıklayın - varsayılan `Create codespace` eylemini onaylayın
1. Bu, yeni bir tarayıcı sekmesi açar - GitHub Codespaces oturumunun yüklenmesini bekleyin
1. Codespaces'te VS Code terminalini açın - şu komutu yazın:

   ```bash title="" linenums="0"
   azd up
   ```

Bu işlemle tetiklenen iş akışı adımlarını tamamlayın:

1. Azure'a giriş yapmanız istenecek - kimlik doğrulama talimatlarını izleyin
1. Kendinize özgü bir ortam adı girin - örneğin, `nitya-mshack-azd` kullandım
1. Bu, bir `.azure/` klasörü oluşturacak - ortam adıyla bir alt klasör göreceksiniz
1. Bir abonelik adı seçmeniz istenecek - varsayılanı seçin
1. Bir konum seçmeniz istenecek - `East US 2` kullanın

Şimdi, sağlama işleminin tamamlanmasını bekleyin. **Bu işlem 10-15 dakika sürer**

1. İşlem tamamlandığında, konsolunuzda şu gibi bir BAŞARI mesajı göreceksiniz:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure Portalınızda artık o ortam adıyla sağlanmış bir kaynak grubu olacak:

      ![Infra](../../../../../translated_images/tr/02-provisioned-infra.46c706b14f56e0bf.png)

1. **Artık dağıtılan altyapıyı ve uygulamayı doğrulamaya hazırsınız.**

---

## 4. Şablon Doğrulama

1. Azure Portal [Kaynak Grupları](https://portal.azure.com/#browse/resourcegroups) sayfasını ziyaret edin - giriş yapmanız istenecek
1. Ortam adınız için RG'ye tıklayın - yukarıdaki sayfayı göreceksiniz

      - Azure Container Apps kaynağına tıklayın
      - _Essentials_ bölümündeki (sağ üst) Uygulama URL'sine tıklayın

1. Şuna benzer bir barındırılan uygulama ön yüzü UI'si görmelisiniz:

   ![App](../../../../../translated_images/tr/03-test-application.471910da12c3038e.png)

1. Birkaç [örnek soru](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) sormayı deneyin

      1. Sorun: ```Fransa'nın başkenti nedir?``` 
      1. Sorun: ```İki kişi için 200 doların altında en iyi çadır hangisidir ve hangi özelliklere sahiptir?```

1. Aşağıda gösterilenlere benzer yanıtlar almalısınız. _Peki bu nasıl çalışıyor?_ 

      ![App](../../../../../translated_images/tr/03-test-question.521c1e863cbaddb6.png)

---

## 5. Ajan Doğrulama

Azure Container App, bu şablon için Azure AI Foundry projesinde sağlanan AI Agent'a bağlanan bir uç nokta dağıtır. Bunun ne anlama geldiğine bir göz atalım.

1. Kaynak grubunuzun Azure Portal _Genel Bakış_ sayfasına geri dönün

1. Listedeki `Azure AI Foundry` kaynağına tıklayın

1. Şunu görmelisiniz. `Go to Azure AI Foundry Portal` düğmesine tıklayın. 
   ![Foundry](../../../../../translated_images/tr/04-view-foundry-project.fb94ca41803f28f3.png)

1. AI uygulamanız için Foundry Proje sayfasını görmelisiniz
   ![Project](../../../../../translated_images/tr/05-visit-foundry-portal.d734e98135892d7e.png)

1. `Agents` sekmesine tıklayın - projenizde sağlanan varsayılan Agent'ı göreceksiniz
   ![Agents](../../../../../translated_images/tr/06-visit-agents.bccb263f77b00a09.png)

1. Seçin - ve Agent ayrıntılarını göreceksiniz. Şunlara dikkat edin:

      - Agent varsayılan olarak Dosya Arama kullanır (her zaman)
      - Agent'ın `Knowledge` kısmı, dosya arama için 32 dosya yüklendiğini gösterir
      ![Agents](../../../../../translated_images/tr/07-view-agent-details.0e049f37f61eae62.png)

1. Sol menüdeki `Data+indexes` seçeneğini arayın ve ayrıntılar için tıklayın. 

      - Bilgi için yüklenen 32 veri dosyasını görmelisiniz.
      - Bunlar `src/files` altındaki 12 müşteri dosyası ve 20 ürün dosyasına karşılık gelir
      ![Data](../../../../../translated_images/tr/08-visit-data-indexes.5a4cc1686fa0d19a.png)

**Agent operasyonunu doğruladınız!** 

1. Agent yanıtları, bu dosyalardaki bilgilere dayalıdır. 
1. Artık bu verilerle ilgili sorular sorabilir ve dayalı yanıtlar alabilirsiniz.
1. Örnek: `customer_info_10.json`, "Amanda Perez" tarafından yapılan 3 satın alımı açıklar.

Container App uç noktasıyla tarayıcı sekmesine geri dönün ve şunu sorun: `Amanda Perez hangi ürünlere sahip?`. Şuna benzer bir şey görmelisiniz:

![Data](../../../../../translated_images/tr/09-ask-in-aca.4102297fc465a4d5.png)

---

## 6. Ajan Oyun Alanı

Azure AI Foundry'nin yetenekleri hakkında biraz daha sezgi geliştirelim ve Agent'ı Agents Playground'da deneyelim. 

1. Azure AI Foundry'deki `Agents` sayfasına geri dönün - varsayılan agent'ı seçin
1. `Try in Playground` seçeneğine tıklayın - şu şekilde bir Playground UI'si almalısınız
1. Aynı soruyu sorun: `Amanda Perez hangi ürünlere sahip?`

    ![Data](../../../../../translated_images/tr/09-ask-in-playground.a1b93794f78fa676.png)

Aynı (veya benzer) yanıtı alırsınız - ancak ayrıca ajan uygulamanızın kalitesini, maliyetini ve performansını anlamak için kullanabileceğiniz ek bilgiler de alırsınız. Örneğin:

1. Yanıtın "dayandırıldığı" veri dosyalarını belirttiğini fark edin
1. Bu dosya etiketlerinin üzerine gelin - sorgunuz ve görüntülenen yanıtla veri eşleşiyor mu?

Yanıtın altında bir _istatistik_ satırı da görürsünüz. 

1. Herhangi bir metriğin üzerine gelin - örneğin, Güvenlik. Şuna benzer bir şey görürsünüz
1. Değerlendirilen derecelendirme, yanıtın güvenlik seviyesi için sezginizle eşleşiyor mu?

      ![Data](../../../../../translated_images/tr/10-view-run-info-meter.6cdb89a0eea5531f.png)

---x

## 7. Dahili Gözlemlenebilirlik

Gözlemlenebilirlik, uygulamanızı çalışmasını anlamak, hata ayıklamak ve optimize etmek için kullanılabilecek veri üretmek üzere enstrümanlamaktır. Bunun için bir fikir edinmek için:

1. `View Run Info` düğmesine tıklayın - bu görünümü görmelisiniz. Bu, [Agent izleme](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) örneğidir. _Bu görünüme üst düzey menüdeki Thread Logs'a tıklayarak da ulaşabilirsiniz._

   - Agent tarafından kullanılan çalışma adımları ve araçlar hakkında bilgi edinin
   - Yanıt için toplam Token sayısını (vs. çıktı token kullanımı) anlayın
   - Gecikmeyi ve yürütmede zamanın nerede harcandığını anlayın

      ![Agent](../../../../../translated_images/tr/10-view-run-info.b20ebd75fef6a1cc.png)

1. `Metadata` sekmesine tıklayın ve daha sonra sorunları ayıklamak için yararlı bağlam sağlayabilecek çalıştırma için ek öznitelikleri görün.   

      ![Agent](../../../../../translated_images/tr/11-view-run-info-metadata.7966986122c7c2df.png)

1. `Evaluations` sekmesine tıklayın ve agent yanıtı üzerinde yapılan otomatik değerlendirmeleri görün. Bunlar güvenlik değerlendirmelerini (örneğin, Kendine zarar verme) ve agent'a özgü değerlendirmeleri (örneğin, Niyet çözümü, Görev uyumu) içerir.

      ![Agent](../../../../../translated_images/tr/12-view-run-info-evaluations.ef25e4577d70efeb.png)

1. Son olarak, yan menüdeki `Monitoring` sekmesine tıklayın.

      - Görüntülenen sayfada `Resource usage` sekmesini seçin ve metrikleri görüntüleyin.
      - Uygulama kullanımını maliyetler (tokenlar) ve yük (istekler) açısından takip edin.
      - İlk bayta (girdi işleme) ve son bayta (çıktı) kadar uygulama gecikmesini takip edin.

      ![Agent](../../../../../translated_images/tr/13-monitoring-resources.5148015f7311807f.png)

---

## 8. Ortam Değişkenleri

Şimdiye kadar, tarayıcıda dağıtımı yürüttük - ve altyapımızın sağlandığını ve uygulamanın çalıştığını doğruladık. Ancak uygulamayla _kod odaklı_ çalışmak için, bu kaynaklarla çalışmak için gereken ilgili değişkenleri içeren yerel geliştirme ortamımızı yapılandırmamız gerekiyor. `azd` kullanmak bunu kolaylaştırır.

1. Azure Developer CLI [ortam değişkenlerini kullanır](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) uygulama dağıtımları için yapılandırma ayarlarını depolamak ve yönetmek için.

1. Ortam değişkenleri `.azure/<env-name>/.env` içinde depolanır - bu, dağıtım sırasında kullanılan `env-name` ortamına göre kapsamlanır ve aynı depoda farklı dağıtım hedefleri arasında ortamları izole etmenize yardımcı olur.

1. Ortam değişkenleri, `azd` komutu belirli bir komut (örneğin, `azd up`) çalıştırdığında otomatik olarak yüklenir. `azd`'nin _OS düzeyindeki_ ortam değişkenlerini (örneğin, kabukta ayarlanan) otomatik olarak okumadığını unutmayın - bunun yerine, bilgiler arasında geçiş yapmak için `azd set env` ve `azd get env` kullanın.

Birkaç komut deneyelim:

1. Bu ortamda `azd` için ayarlanan tüm ortam değişkenlerini alın:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Şuna benzer bir şey görürsünüz:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Belirli bir değeri alın - örneğin, `AZURE_AI_AGENT_MODEL_NAME` değerini ayarlayıp ayarlamadığımızı öğrenmek istiyorum

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Şuna benzer bir şey görürsünüz - varsayılan olarak ayarlanmamış!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd` için yeni bir ortam değişkeni ayarlayın. Burada, agent model adını güncelliyoruz. _Not: yapılan değişiklikler hemen `.azure/<env-name>/.env` dosyasında yansıtılacaktır._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Şimdi, değerin ayarlandığını görmeliyiz:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Bazı kaynaklar kalıcıdır (örneğin, model dağıtımları) ve yeniden dağıtımı zorlamak için yalnızca bir `azd up` yeterli olmayacaktır. Orijinal dağıtımı kaldırmayı ve değiştirilen ortam değişkenleriyle yeniden dağıtmayı deneyelim.

1. **Yenileme** Daha önce bir azd şablonu kullanarak altyapı sağladıysanız - bu komutla Azure dağıtımınızın mevcut durumuna dayalı olarak yerel ortam değişkenlerinizin durumunu _yenileyebilirsiniz_:
      ```bash title="" linenums="0"
      azd env refresh
      ```

      Bu, ortam değişkenlerini birden fazla yerel geliştirme ortamı arasında senkronize etmenin güçlü bir yoludur (örneğin, birden fazla geliştiriciden oluşan bir ekip) - dağıtılmış altyapının ortam değişkeni durumu için referans noktası olarak hizmet etmesine olanak tanır. Ekip üyeleri, değişkenleri basitçe _yenileyerek_ senkronize duruma geri dönebilir.

---

## 9. Tebrikler 🏆

Az önce uçtan uca bir iş akışını tamamladınız ve şunları yaptınız:

- [X] Kullanmak İstediğiniz AZD Şablonunu Seçtiniz
- [X] Şablonu GitHub Codespaces ile Başlattınız
- [X] Şablonu Dağıttınız ve çalıştığını doğruladınız

---

