# 6. Altyapıyı Sökme

!!! tip "BU MODÜLÜN SONUNDA YAPABİLECEKLERİNİZ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonus Egzersizler

Projeyi sökmeden önce, açık uçlu keşif yapmak için birkaç dakika ayırın.

!!! info "Bu Keşif Tavsiyelerini Deneyin"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Altyapıyı Hizmetten Kaldırma

!!! warning "Eğer ayrıca GA hosted-agent egzersizini tamamladıysanız"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Altyapıyı sökme işlemi şu kadar kolaydır:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Seçilen ortamı doğrulayın ve silinecek kaynakları gözden geçirin. Bu Azure kaynaklarını kaldırır ve verileri yok edebilir. Bu öğrenme iş akışı için doğrulama istemini tutun. Tamamlandıktan sonra benzer bir çıktı göreceksiniz:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Portalda silmeyi doğrulayın ve dağıtım kapsamı dışındaki kaynakları kontrol edin. Maliyet raporlaması ve kota güncellemeleri gecikebilir. Yerel `.azure` yapılandırması, açıkça kaldırılmadıkça kalır.

1. `azd down --purge` ayrıca desteklenen yumuşak silinmiş kaynakların kalıcı silinmesini talep eder. Kurtarma gerekmiyorsa ve saklama/silinebilirlik politikalarını anlıyorsanız bunu kullanın. Hemen kota serbest bırakma garantisi vermez.

1. Temizliği doğrulamak için yeniden dağıtmayın. Daha sonra yapılacak kasıtlı bir `azd up` kalan yerel girdileri kullanarak kaynakları yeniden oluşturabilir ve tekrar ücretlendirme yapar. Model güncellemeleri genellikle desteklenen yapılandırma değişiklikleriyle yapılır, sökme ile değil.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->