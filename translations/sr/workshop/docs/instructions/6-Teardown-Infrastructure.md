# 6. Демонтаж инфраструктуре

!!! tip "НА КРАЈУ ОВОГ МОДУЛА ЋЕТЕ МОЋИ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Бонус вежбе

Пре него што демонтирате пројекат, одвојите неколико минута за отворено истраживање.

!!! info "Испробајте ове подстицаје за истраживање"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Уклањање инфраструктуре

1. Демонтажa инфраструктуре је једноставна као:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Потврдите изабрано окружење и прегледајте ресурсе који ће се брисати. Ово уклања Azure ресурсе и може уништити податке. Задржите промпт за потврду у овом процесу учења. Када се заврши, видећете излаз сличан овом:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Проверите брисање у порталу и проверите ресурсе изван домена распоређивања. Пријављивање трошкова и ажурирање квота може каснити. Локална `.azure` конфигурација остаје осим ако је експлицитно не уклоните.

1. `azd down --purge` додатно захтева трајно брисање подржаних ресурса оних који су „меко“ избрисани. Користите је само када опоравак није потребан и разумете политике задржавања/заштите од чишћења. Не гарантује тренутно ослобађање квоте.

1. Не реодређујте само ради провере чишћења. Каснија намерна `azd up` може поново створити ресурсе користећи преостале локалне уносе и поново изазвати трошкове. Ажурирања модела обично користе подржане промене при провизији, а не демонтажу.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->