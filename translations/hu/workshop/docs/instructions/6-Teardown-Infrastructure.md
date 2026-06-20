# 6. Infrastruktúra bontása

!!! tip "A MODUL VÉGÉRE KÉPES LESZ"

    - [ ] Megérteni az erőforrás-tisztítás és a költségkezelés fontosságát
    - [ ] Az `azd down` használata az infrastruktúra biztonságos leszereléséhez
    - [ ] Az Azure AI Szolgáltatások soft-törölt példányainak visszaállítása, ha szükséges
    - [ ] **6. labor:** Azure erőforrások eltávolítása és eltávolítás igazolása

---

## Bónusz gyakorlatok

Mielőtt lebontanánk a projektet, szánj néhány percet egy nyitott végű felfedezésre.

!!! info "Próbáld ki ezeket a felfedező kérdéseket"

    **Kísérletezz a GitHub Copilottal:**
    
    1. Kérdezd meg: `Milyen más AZD sablonokat próbálhatok ki több ügynökös forgatókönyvekhez?`
    2. Kérdezd meg: `Hogyan testre szabhatom az ügynök utasításait egy egészségügyi esethez?`
    3. Kérdezd meg: `Milyen környezeti változók szabályozzák a költségoptimalizálást?`
    
    **Fedezd fel az Azure Portált:**
    
    1. Tekintsd át a telepítésed Application Insights mérőszámait
    2. Nézd meg a költségelemzést a létrehozott erőforrásokra vonatkozóan
    3. Fedezd fel még egyszer a Microsoft Foundry portál ügynök játszóterét

---

## Infrastruktúra leszerelése

1. Az infrastruktúra lebontása ennyire egyszerű:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. A `--purge` kapcsoló biztosítja, hogy az puhán törölt Kognitív Szolgáltatás erőforrásokat is törli, így felszabadítva az ezek által lefoglalt kvótát. A folyamat végén ilyesmit fogsz látni:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Opcionális) Ha most újra lefuttatod az `azd up` parancsot, észre fogod venni, hogy a gpt-4.1 modell települ, mivel a környezeti változót megváltoztattuk (és elmentettük) a helyi `.azure` mappában.

      Íme a modell telepítések **előtte**:

      ![Kezdeti](../../../../../translated_images/hu/14-deploy-initial.30e4cf1c29b587bc.webp)

      És íme **utána**:
      ![Új](../../../../../translated_images/hu/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->