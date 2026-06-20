# 6. Teardown Infrastructure

!!! tip "BU MODÜLÜN SONUNDA ŞUNLARI YAPABİLECEKSİNİZ"

    - [ ] Kaynak temizliğinin ve maliyet yönetiminin önemini anlayın
    - [ ] `azd down` komutunu kullanarak altyapıyı güvenli şekilde kaldırın
    - [ ] Gerekirse yumuşak silinmiş Azure AI Hizmetlerini kurtarın
    - [ ] **Lab 6:** Azure kaynaklarını temizleyin ve kaldırılmasını doğrulayın

---

## Bonus Alıştırmalar

Before we tear down the project, take a few minutes to do some open-ended exploration.

!!! info "Bu Keşif Yönlendirmelerini Deneyin"

    **GitHub Copilot ile Deneyin:**
    
    1. Sor: `Çoklu ajan senaryoları için başka hangi AZD şablonlarını deneyebilirim?`
    2. Sor: `Ajan talimatlarını sağlık kullanım durumu için nasıl özelleştirebilirim?`
    3. Sor: `Maliyet optimizasyonunu hangi ortam değişkenleri kontrol ediyor?`
    
    **Azure Portalını Keşfedin:**
    
    1. Dağıtımınız için Application Insights metriklerini gözden geçirin
    2. Sağlanan kaynaklar için maliyet analizini kontrol edin
    3. Microsoft Foundry portalı ajan oyun alanını bir kez daha keşfedin

---

## Altyapıyı Kaldır

1. Altyapıyı sökmek şu kadar kolaydır:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. The `--purge` flag ensures that it also purges soft-deleted Cognitive Service resources, thereby releasing quota held by these resources. Once complete you will see something like this:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (İsteğe bağlı) Eğer şimdi tekrar `azd up` çalıştırırsanız, ortam değişkeni yerel `.azure` klasöründe değiştirildiği (ve kaydedildiği) için gpt-4.1 modelinin dağıtıldığını fark edeceksiniz. 

      Here is the model deployments **before**:

      ![Başlangıç](../../../../../translated_images/tr/14-deploy-initial.30e4cf1c29b587bc.webp)

      And here it is **after**:
      ![Yeni](../../../../../translated_images/tr/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->