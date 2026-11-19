# 6. Pagtanggal ng Imprastraktura

!!! tip "PAGKATAPOS NG MODULONG ITO, MAGAGAWA MO NA"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Mga Karagdagang Ehersisyo

Bago natin tanggalin ang proyekto, maglaan ng ilang minuto para sa malayang paggalugad.

!!! info "Subukan ang mga Prompt sa Paggalugad na Ito"

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

!!! warning "Kung natapos mo na rin ang GA hosted-agent na ehersisyo"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Madaling gawin ang pagtanggal ng imprastraktura:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Kumpirmahin ang napiling kapaligiran at suriin ang mga mapapaganang burahin. Tinatanggal nito ang mga Azure na resources at maaaring sirain ang data. Panatilihin ang kumpirmasyon para sa prosesong ito ng pag-aaral. Kapag tapos, makikita mo ang output na katulad ng:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Siguraduhing nabura na ito sa portal at suriin kung may mga resources na nasa labas ng sakop ng deployment. Maaaring mabagal ang pag-update ng gastos at quota. Ang lokal na pagsasaayos ng `.azure` ay nananatili maliban kung iyong aalisin ito nang tahasan.

1. Ang `azd down --purge` ay karagdagang humihiling ng permanenteng pagtanggal sa mga suportadong soft-deleted resources. Gamitin ito lamang kapag hindi na kailangan ang pagbawi at nauunawaan mo ang mga patakaran sa pag-retain/purge-protection. Hindi nito ginagarantiyahan ang agarang pagpapalaya ng quota.

1. Huwag mag redeploy para lang tiyakin ang paglilinis. Ang susunod na sinadyang `azd up` ay maaaring muling likhain ang mga resources gamit ang natitirang lokal na input, at muling magkakaroon ng singil. Karaniwan, ang mga update sa modelo ay gumagamit ng suportadong pagbabago sa provisioning, hindi sa pagtanggal.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->