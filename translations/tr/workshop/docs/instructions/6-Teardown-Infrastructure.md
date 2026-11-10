# 6. Altyapıyı Kaldırma

!!! tip "BU MODÜLÜN SONUNDA ŞUNLARI YAPABİLECEKSİNİZ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonus Egzersizler

Projeyi kaldırmadan önce, birkaç dakika açık uçlu keşif yapın.

!!! info "Bu Keşif Yönlendirmelerini Deneyin"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Altyapıyı Devreden Çıkar

1. Altyapıyı kaldırmak şu kadar kolaydır:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Seçilen ortamı onaylayın ve silinecek kaynakları gözden geçirin. Bu Azure kaynaklarını kaldırır ve veri yok edebilir. Bu öğrenme iş akışı için onay istemi kalmalıdır. Tamamlandığında şöyle bir çıktı görürsünüz:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Portalda silmeyi doğrulayın ve dağıtım kapsamının dışındaki kaynakları kontrol edin. Maliyet raporlaması ve kota güncellemeleri gecikebilir. Yerel `.azure` yapılandırması açıkça kaldırmadığınız sürece kalır.

1. `azd down --purge` ayrıca desteklenen yumuşak silinmiş kaynakların kalıcı silinmesini talep eder. Kurtarma gerekmiyorsa ve saklama/temizleme koruma politikalarını anlıyorsanız kullanın. Hemen kota serbest bırakma garantisi vermez.

1. Temizliği doğrulamak için yeniden dağıtım yapmayın. Sonradan kasıtlı bir `azd up` kalan yerel girişleri kullanarak kaynakları tekrar oluşturabilir ve ücretlendirmeyi yeniden başlatır. Model güncellemeleri normalde desteklenen sağlama değişiklikleriyle yapılır, kaldırma ile değil.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->