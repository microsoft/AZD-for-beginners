# 6. Pagtanggal ng Imprastruktura

!!! tip "PAGKATAPOS NG MODULONG ITO IKAW AY MAAARING"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Mga Bonus na Pagsasanay

Bago natin gibain ang proyekto, maglaan ng ilang minuto para sa bukas na paggalugad.

!!! info "Subukan ang mga Pahiwatig na ito sa Paggalugad"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Pagtanggal ng Infra

1. Ang pagbibiyak ng imprastruktura ay kasing dali ng:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Kumpirmahin ang napiling kapaligiran at suriin ang mga resource na tatanggalin. Tinatanggal nito ang mga Azure resource at maaaring magwasak ng data. Panatilihin ang kumpirmasyon para sa workflow na ito ng pag-aaral. Kapag tapos na makakakita ka ng output na kahalintulad ng:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Suriin ang pagtanggal sa portal at tingnan ang mga resource na nasa labas ng saklaw ng deployment. Ang ulat ng gastos at update ng quota ay maaaring mahuli. Mananatili ang lokal na `.azure` na pagsasaayos maliban kung ito ay tahasang tinanggal.

1. Humihiling din ang `azd down --purge` ng permanenteng pagtanggal ng mga supportadong soft-deleted na resource. Gamitin lamang ito kapag hindi na kailangan ang pagbawi at naiintindihan mo ang mga patakaran sa pagpapanatili/pagprotekta sa pag-delete. Hindi nito ginagarantiyahan ang agarang pag-release ng quota.

1. Huwag muling i-deploy para lamang tiyakin ang paglilinis. Ang isang hinaharap na sadyang `azd up` ay maaaring muling lumikha ng mga resource gamit ang natitirang lokal na mga input, at muling magdudulot ng bayarin. Karaniwang ginagamit ang mga update sa modelo sa pamamagitan ng suportadong pagbabago sa provisioning, hindi sa teardown.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->