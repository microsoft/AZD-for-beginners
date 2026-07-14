# 2. Bir Şablonu Doğrulayın

> Temmuz 2026'da `azd 1.27.1` sürümü ile doğrulanmıştır.

!!! tip "BU MODÜLÜN SONUNDA ŞUNLARI YAPABİLİRSİNİZ"

    - [ ] Yapay Zeka Çözüm Mimarisini Analiz Etmek
    - [ ] AZD Dağıtım İş Akışını Anlamak
    - [ ] AZD kullanımı için GitHub Copilot'tan yardım almak
    - [ ] **Laboratuvar 2:** AI Agents şablonunu dağıtmak ve doğrulamak

---


## 1. Giriş

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) veya `azd`, Azure'a uygulama oluşturma ve dağıtım sırasında geliştirici iş akışını kolaylaştıran açık kaynak bir komut satırı aracıdır.

[AZD Şablonları](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates), örnek uygulama kodu, _altyapı kodu olarak_ varlıklar ve tutarlı bir çözüm mimarisi için `azd` yapılandırma dosyalarını içeren standartlaştırılmış depolardır. Altyapının sağlanması, `azd provision` komutu kadar basittir - ve `azd up` kullanarak hem altyapıyı sağlamak hem de uygulamayı tek seferde dağıtmak mümkündür!

Sonuç olarak, uygulama geliştirme sürecinizi başlatmak, uygulama ve altyapı ihtiyaçlarınıza en yakın _AZD Başlangıç şablonu_'nu bulup senaryonuza göre depoyu özelleştirmek kadar basit olabilir.

Başlamadan önce, Azure Developer CLI'nin yüklü olduğundan emin olalım.

1. VS Code terminalini açın ve bu komutu yazın:

      ```bash title="" linenums="0"
      azd version
      ```

1. Şöyle bir şey görmelisiniz!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Artık bir şablon seçip azd ile dağıtım yapmaya hazırsınız**

---

## 2. Şablon Seçimi

Microsoft Foundry platformu, _çok ajanlı iş akışı otomasyonu_ ve _çok modlu içerik işleme_ gibi popüler çözüm senaryolarını kapsayan [önerilen AZD şablonları seti](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) ile birlikte gelir. Bu şablonları Microsoft Foundry portalını ziyaret ederek de keşfedebilirsiniz.

1. [https://ai.azure.com/templates](https://ai.azure.com/templates) adresini ziyaret edin
1. İstendiğinde Microsoft Foundry portalına giriş yapın - şöyle bir şey görmelisiniz.

![Pick](../../../../../translated_images/tr/01-pick-template.60d2d5fff5ebc374.webp)


**Temel** seçenekler başlangıç şablonlarınız:

1. [ ] Temel bir sohbet uygulamasını _verilerinizle birlikte_ Azure Container Apps'e dağıtan [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat). Bunu temel bir yapay zeka sohbet botu senaryosunu keşfetmek için kullanın.
1. [X] Standart bir AI Ajanı (Foundry Agents ile) dağıtan [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents). Araçlar ve modellerle ilgili ajan bazlı AI çözümlerini tanımak için bunu kullanın.

İkinci bağlantıyı yeni bir tarayıcı sekmesinde açın (veya ilgili kart için `Open in GitHub` tıklayın). Bu AZD Şablonu deposunu görmelisiniz. README dosyasını incelemek için bir dakika ayırın. Uygulama mimarisi şöyle:

![Arch](../../../../../translated_images/tr/architecture.8cec470ec15c65c7.webp)

---

## 3. Şablon Aktivasyonu

Bu şablonu dağıtmayı deneyelim ve geçerli olduğundan emin olalım. [Başlarken](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) bölümündeki rehberi takip edeceğiz.

1. Şablon deposu için bir çalışma ortamı seçin:

      - **GitHub Codespaces**: [bu bağlantıya](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) tıklayın ve `Create codespace` onaylayın
      - **Yerel klon veya geliştirme kabı**: `Azure-Samples/get-started-with-ai-agents` deposunu klonlayıp VS Code'da açın

1. VS Code terminalinin hazır olmasını bekleyin, ardından aşağıdaki komutu yazın:

   ```bash title="" linenums="0"
   azd up
   ```

Bu işlemin tetikleyeceği iş akışı adımlarını tamamlayın:

1. Azure'a giriş yapmanız istenecek - kimlik doğrulama talimatlarını takip edin
1. Kendiniz için benzersiz bir ortam adı girin - örneğin `nitya-mshack-azd` kullandım
1. Bu, `.azure/` klasörü oluşturacak - içinde ortam adıyla bir alt klasör göreceksiniz
1. Bir abonelik adı seçmeniz istenecek - varsayılana tıklayın
1. Bir konum seçmeniz istenecek - `East US 2` kullanın

Şimdi, sağlama işleminin tamamlanması için bekleyin. **Bu işlem 10-15 dakika sürer**

1. İşlem bittiğinde, konsolunuzda şu gibi bir BAŞARILI mesaj göreceksiniz:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure Portal'ınızda artık bu ortam adına sahip sağlanmış bir kaynak grubu olacak:

      ![Infra](../../../../../translated_images/tr/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Artık dağıtılan altyapıyı ve uygulamayı doğrulamaya hazırsınız**.

---

## 4. Şablon Doğrulama

1. Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) sayfasını ziyaret edin - istendiğinde giriş yapın
1. Ortam adınıza ait RG'ye tıklayın - yukarıdaki sayfayı görmelisiniz

      - Azure Container Apps kaynağına tıklayın
      - _Essentials_ bölümünde (sağ üst) Uygulama URL'sine tıklayın

1. Şurada olduğu gibi barındırılan uygulama ön yüz UI'sını görmelisiniz:

   ![App](../../../../../translated_images/tr/03-test-application.471910da12c3038e.webp)

1. Birkaç [örnek soru](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) sormayı deneyin

      1. Sorun: ```Fransa'nın başkenti nedir?``` 
      1. Sorun: ```İki kişi için 200$ altındaki en iyi çadır nedir ve hangi özellikleri içerir?```

1. Aşağıda gösterildiği gibi yanıtlar almalısınız. _Peki bu nasıl çalışıyor?_

      ![App](../../../../../translated_images/tr/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Ajan Doğrulama

Azure Container App, bu şablon için Microsoft Foundry projesinde konuşlandırılan AI Ajanına bağlanan bir uç noktayı dağıtır. Bu ne anlama geliyor, biraz bakalım.

1. Kaynak grubunuzun Azure Portal _Genel Bakış_ sayfasına geri dönün

1. Listede `Microsoft Foundry` kaynağına tıklayın

1. Şunu göreceksiniz. `Microsoft Foundry Portal'a Git` butonuna tıklayın.
   ![Foundry](../../../../../translated_images/tr/04-view-foundry-project.fb94ca41803f28f3.webp)

1. AI uygulamanız için Foundry Proje sayfasını görmelisiniz
   ![Project](../../../../../translated_images/tr/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents`'a tıklayın - projenizde konuşlandırılmış varsayılan Ajanı görürsünüz
   ![Agents](../../../../../translated_images/tr/06-visit-agents.bccb263f77b00a09.webp)

1. Onu seçin - Ajan detaylarını göreceksiniz. Aşağıdakilere dikkat edin:

      - Ajan varsayılan olarak Dosya Arama kullanır (her zaman)
      - Ajanın `Knowledge` kısmında 32 dosya yüklendiği yazıyor (dosya arama için)
      ![Agents](../../../../../translated_images/tr/07-view-agent-details.0e049f37f61eae62.webp)

1. Sol menüde `Data+indexes` seçeneğini bulun ve detaylar için tıklayın.

      - Bilgi için yüklenen 32 veri dosyasını görmelisiniz.
      - Bunlar `src/files` altındaki 12 müşteri dosyası ve 20 ürün dosyasıyla eşleşir
      ![Data](../../../../../translated_images/tr/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Ajanın çalışmasını doğruladınız!**

1. Ajan yanıtları, bu dosyalardaki bilgiye dayanır.
1. Bu verilerle ilgili sorular sorabilirsiniz ve doğrulanmış yanıtlar alırsınız.
1. Örnek: `customer_info_10.json` "Amanda Perez"in yaptığı 3 satın almayı açıklar.

Tarayıcı sekmesine geri dönün, Container App uç noktasında sorun: `Amanda Perez hangi ürünlere sahip?`. Şöyle bir şey görmelisiniz:

![Data](../../../../../translated_images/tr/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Ajan Oyun Alanı

Microsoft Foundry'nin yeteneklerine biraz daha sezgi kazanalım ve Ajanı Agents Playground'da deneyelim.

1. Microsoft Foundry'de `Agents` sayfasına geri dönün - varsayılan ajan'ı seçin
1. `Playground'da Deneyin` seçeneğine tıklayın - böyle bir Playground UI elde etmelisiniz
1. Aynı soruyu sorun: `Amanda Perez hangi ürünlere sahip?`

    ![Data](../../../../../translated_images/tr/09-ask-in-playground.a1b93794f78fa676.webp)

Aynı (veya benzer) yanıtı alırsınız - ancak ayrıca ajan uygulamanızın kalitesi, maliyeti ve performansını anlamak için kullanabileceğiniz ek bilgiler de elde edersiniz. Örneğin:

1. Yanıtın kaynaklandığı veri dosyalarını belirtiyor
1. Bu dosya etiketlerinin üzerine gelin - veriler sorgunuz ve görüntülenen yanıt ile eşleşiyor mu?

Ayrıca yanıtın altında bir _istatistik_ satırı görürsünüz.

1. Herhangi bir metriğin üzerine gelin - örneğin Güvenlik. Şöyle bir şey görürsünüz
1. Değerlendirilen güvenlik seviyesi, sizin yanıt güvenliği algınız ile uyumlu mu?

      ![Data](../../../../../translated_images/tr/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Dahili İzlenebilirlik

İzlenebilirlik, uygulamanızı veri üretmek için enstrümante etmekle ilgilidir; bu veriler uygulamanızın operasyonlarını anlamak, hata ayıklamak ve optimize etmek için kullanılır. Bunu anlamak için:

1. `Çalıştırma Bilgilerini Görüntüle` butonuna tıklayın - şu görünümü görmelisiniz. Bu, [Ajan izleme](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) örneğidir. _Ayrıca üst menüde Thread Logs'a tıklayarak da bu görünümü alabilirsiniz_.

   - Ajan tarafından kullanılan işlem adımlarını ve araçları anlayın
   - Yanıt için toplam Token sayısını (ve çıktı token kullanımı) anlayın
   - Gecikmeyi ve yürütmenin nerede zaman harcadığını görün

      ![Agent](../../../../../translated_images/tr/10-view-run-info.b20ebd75fef6a1cc.webp)

1. `Metadata` sekmesine tıklayarak yürütme hakkında ek bilgileri görün, bu bilgiler sorun giderirken yararlı olabilir.

      ![Agent](../../../../../translated_images/tr/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` sekmesine tıklayarak ajan yanıtı üzerine yapılan otomatik değerlendirmeleri görün. Bunlar güvenlik değerlendirmelerini (örneğin, Kendine zarar verme) ve ajan spesifik değerlendirmeleri (örneğin, Niyet çözümlemesi, Görev uyumu) içerir.

      ![Agent](../../../../../translated_images/tr/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Son olarak, yan menüdeki `Monitoring` sekmesine tıklayın.

      - Görüntülenen sayfada `Kaynak Kullanımı` sekmesini seçin ve metrikleri görün.
      - Uygulama kullanımını maliyet (tokenlar) ve yük (istekler) açısından takip edin.
      - Uygulama gecikmesini ilk bayt (girdi işlemi) ve son bayt (çıktı) açısından takip edin.

      ![Agent](../../../../../translated_images/tr/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Ortam Değişkenleri

Şimdiye dek, dağıtımı tarayıcıda gerçekleştirdik ve altyapımızın sağlandığını, uygulamanın çalışır durumda olduğunu doğruladık. Ancak uygulama ile _kod-öncelikli_ çalışmak için, bu kaynaklarla çalışmakta ihtiyaç duyulan ilgili değişkenlerle yerel geliştirme ortamımızı yapılandırmamız gerekiyor. `azd` kullanmak bunu kolaylaştırır.

1. Azure Developer CLI, uygulama dağıtımları için yapılandırma ayarlarını saklamak ve yönetmek için [ortam değişkenlerini kullanır](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash).

1. Ortam değişkenleri `.azure/<env-name>/.env` dosyasında saklanır - bu, onları dağıtım sırasında kullanılan `env-name` ortamına özel yapar ve aynı depoda farklı dağıtım hedefleri arasında ortamları izole etmenize yardımcı olur.

1. Ortam değişkenleri, `azd` komutu belirli bir komutu (ör. `azd up`) yürüttüğünde otomatik olarak yüklenir. Not: `azd` _işletim sistemi düzeyinde_ ortam değişkenlerini (örneğin, kabukta ayarlanmış olanlar) otomatik olarak okumaz - bunun yerine bilgi aktarımı için `azd set env` ve `azd get env` kullanılır.


Birkaç komutu deneyelim:

1. Bu ortamda `azd` için ayarlanmış tüm ortam değişkenlerini alın:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Şöyle bir şey görürsünüz:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Belirli bir değeri alın - örneğin, `AZURE_AI_AGENT_MODEL_NAME` değerini ayarlayıp ayarlamadığımızı öğrenin

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Şöyle bir şey görürsünüz - varsayılan olarak ayarlanmamıştı!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd` için yeni bir ortam değişkeni ayarlayın. Burada ajan model adını güncelliyoruz. _Not: yapılan değişiklikler anında `.azure/<env-name>/.env` dosyasına yansır._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Şimdi değerin ayarlandığını görmeliyiz:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Bazı kaynakların kalıcı olduğunu unutmayın (örneğin, model dağıtımları) ve bunlar için yalnızca `azd up` komutunu çalıştırmak yeniden dağıtım için yeterli olmayabilir. Orijinal dağıtımı kaldırıp, değiştirilen ortam değişkenleri ile yeniden dağıtımı deneyelim.

1. **Yenileme** Daha önce azd şablonunu kullanarak altyapıyı dağıttıysanız - mevcut Azure dağıtımı durumuna göre yerel ortam değişkenlerinin durumunu _yenileyebilirsiniz_:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Bu, iki veya daha fazla yerel geliştirme ortamı arasında (örneğin, birden fazla geliştiricinin bulunduğu ekip) ortam değişkenlerini _eşitlemenin_ güçlü bir yoludur - konuşlandırılan altyapının ortam değişkeni durumu için temel gerçek olarak hizmet vermesine olanak tanır. Ekip üyeleri, _yenileyerek_ değişkenleri tekrar senkronize hale getirir.

---

## 9. Tebrikler 🏆

Az önce bir uçtan uca iş akışını tamamladınız, burada şunları yaptınız:

- [X] Kullanmak İstediğiniz AZD Şablonunu Seçtiniz
- [X] Şablonu desteklenen bir geliştirme ortamında açtınız
- [X] Şablonu dağıttınız ve çalıştığını doğruladınız

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->