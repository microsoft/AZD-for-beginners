# 6. Уклањање инфраструктуре

!!! tip "НА КРАЈУ ОВОГ МОДУЛА БИЋЕТЕ У МОГУЋНОСТИ"

    - [ ] Ставка
    - [ ] Ставка
    - [ ] Ставка

---

## Додатне вежбе

Пре него што уклонимо пројекат, одвојите неколико минута за отворено истраживање.

!!! danger "NITYA-TODO: Осмислити неке предлоге за истраживање"

---

## Депровизионисање инфраструктуре

1. Уклањање инфраструктуре је једноставно као:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```

1. Опција `--purge` осигурава да се такође уклоне ресурси когнитивних услуга који су меко обрисани, чиме се ослобађа квота коју су ти ресурси заузимали. Када се процес заврши, видећете нешто овако:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Опционо) Ако сада поново покренете `azd up`, приметићете да се модел gpt-4.1 поново поставља јер је променљива окружења промењена (и сачувана) у локалном `.azure` фолдеру.

      Ево како изгледају постављени модели **пре**:

      ![Initial](../../../../../translated_images/sr/14-deploy-initial.30e4cf1c29b587bc.webp)

      А овако изгледају **после**:
      ![New](../../../../../translated_images/sr/14-deploy-new.f7f3c355a3cf7299.webp)

---

