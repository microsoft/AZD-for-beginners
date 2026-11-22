# 6. Демонтажа инфраструктуре

!!! tip "НА КРАЈУ ОВОГ МОДУЛА БИЋЕТЕ У МОГУЋНОСТИ ДА"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Бонус вежбе

Пре него што демонтирате пројекат, одвојите неколико минута за неко слободно истраживање.

!!! info "Пробајте ове предлоге за истраживање"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Де-привизионисање инфраструктуре

!!! warning "Ако сте такође завршили вежбу са GA хостованим агентом"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Демонтажа инфраструктуре је једнако лака као:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Потврдите изабрано окружење и прегледајте ресурсе који ће бити обрисиани. Ово уклања Azure ресурсе и може уништити податке. Држите упит за потврду у овом процесу учења. Када се заврши, видећете излаз сличан овоме:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Потврдите брисање у порталу и проверите ресурсе који су ван домена распоређивања. Извештаји о трошковима и ажурирања квота могу каснити. Локална `.azure` конфигурација остаје осим ако је јасно не уклоните.

1. `azd down --purge` додатно захтева трајно брисање подржаних ресурса који су меко избрисани. Користите га само када није потребан опоравак и разумете правила задржавања/заштите од чишћења. Оно не гарантује тренутно ослобађање квоте.

1. Немојте поново распоређивати само да бисте проверили чишћење. Касније намерно `azd up` може поново креирати ресурсе користећи преостале локалне уносе, и поново ће бити наплаћено. Ажурирања модела обично користе подршку промена у провизионисању, а не демонтажу.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->