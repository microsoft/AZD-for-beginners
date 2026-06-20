# 6. Pag-alis ng Imprastruktura

!!! tip "SA PAGTATAPOS NG MODULONG ITO AY MAGAGAWA MO"

    - [ ] Maunawaan ang kahalagahan ng paglilinis ng mga resource at pamamahala ng gastos
    - [ ] Gamitin `azd down` upang ligtas na i-deprovision ang imprastruktura
    - [ ] I-recover ang mga soft-deleted na Azure AI Services kung kinakailangan
    - [ ] **Lab 6:** Linisin ang mga Azure resource at beripikahin ang pagtanggal

---

## Mga Bonus na Ehersisyo

Bago natin ibuwag ang proyekto, maglaan ng ilang minuto para sa bukas na paggalugad.

!!! info "Subukan ang mga Prompt na Ito para sa Paggalugad"

    **Magsagawa ng Eksperimento gamit ang GitHub Copilot:**
    
    1. Magtanong: `Anong iba pang mga AZD template ang maaari kong subukan para sa mga multi-agent na senaryo?`
    2. Magtanong: `Paano ko maiangkop ang mga tagubilin ng ahente para sa kaso ng paggamit sa pangangalagang pangkalusugan?`
    3. Magtanong: `Aling mga environment variable ang kumokontrol sa pag-optimize ng gastos?`
    
    **Galugarin ang Azure Portal:**
    
    1. Suriin ang mga metric ng Application Insights para sa iyong deployment
    2. Suriin ang cost analysis para sa mga na-provision na resource
    3. Galugarin muli ang Microsoft Foundry portal agent playground

---

## I-deprovision ang Infra

1. Ang pagbuwag ng imprastruktura ay kasing dali ng:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Tinitiyak ng flag na `--purge` na buburahin din nito ang mga soft-deleted na Cognitive Service resource, kaya mailalabas ang quota na hinahawakan ng mga resource na ito. Kapag kumpleto na makikita mo ang ganito:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Opsyonal) Kung tatakbo mo muli ngayon ang `azd up`, mapapansin mong na-deploy ang modelong gpt-4.1 dahil ang environment variable ay binago (at na-save) sa lokal na `.azure` folder. 

      Narito ang mga deployment ng modelo **bago**:

      ![Paunang](../../../../../translated_images/tl/14-deploy-initial.30e4cf1c29b587bc.webp)

      At narito ito **pagkatapos**:
      ![Bago](../../../../../translated_images/tl/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->