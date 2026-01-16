<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-25T02:17:48+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "sl"
}
-->
# 6. Razgradnja infrastrukture

!!! tip "DO KONCA TEGA MODULA BOSTE ZMOGLI"

    - [ ] Postavka
    - [ ] Postavka
    - [ ] Postavka

---

## Dodatne vaje

Preden razgradimo projekt, si vzemite nekaj minut za odprto raziskovanje.

!!! danger "NITYA-TODO: Pripravite nekaj predlogov za raziskovanje"

---

## Deprovisioniranje infrastrukture

1. Razgradnja infrastrukture je preprosta kot:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Zastavica `--purge` zagotavlja, da se odstranijo tudi mehko izbrisani viri Cognitive Service, s čimer se sprosti kvota, ki jo ti viri zasedajo. Ko je postopek končan, boste videli nekaj takega:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Neobvezno) Če zdaj ponovno zaženete `azd up`, boste opazili, da se model gpt-4.1 ponovno namesti, saj je bila spremenjena (in shranjena) okoljska spremenljivka v lokalni mapi `.azure`.

      Tukaj so namestitve modela **pred**:

      ![Začetno](../../../../../translated_images/sl/14-deploy-initial.30e4cf1c29b587bc.png)

      In tukaj so **po**:
      ![Novo](../../../../../translated_images/sl/14-deploy-new.f7f3c355a3cf7299.png)

---

