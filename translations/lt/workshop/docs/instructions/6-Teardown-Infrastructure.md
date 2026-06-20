# 6. Infrastruktūros išardymas

!!! tip "MODULIO PABAIGOJE JŪS GALĖSITE"

    - [ ] Suprasti išteklių išvalymo ir kaštų valdymo svarbą
    - [ ] Naudoti `azd down`, kad saugiai išardytumėte infrastruktūrą
    - [ ] Atkurti minkštai ištrintas Azure AI paslaugas, jei reikia
    - [ ] **Laboratorija 6:** Išvalyti Azure išteklius ir patvirtinti pašalinimą

---

## Papildomos užduotys

Prieš išardydami projektą, skirkite kelias minutes laisvam tyrinėjimui.

!!! info "Išbandykite šias tyrinėjimo užuominas"

    **Eksperimentuokite su GitHub Copilot:**
    
    1. Paklauskite: `Kokius kitus AZD šablonus galėčiau išbandyti daugiaagentėms scenarijams?`
    2. Paklauskite: `Kaip galėčiau pritaikyti agentų instrukcijas sveikatos priežiūros atvejui?`
    3. Paklauskite: `Kokie aplinkos kintamieji valdo kaštų optimizavimą?`
    
    **Ištirkite Azure portalą:**
    
    1. Peržiūrėkite Application Insights metrikas savo diegimui
    2. Patikrinkite kaštų analizę sukurtų išteklių
    3. Dar kartą ištirkite Microsoft Foundry portalo agentų bandymų aikštelę

---

## Išardyti infrastruktūrą

1. Infrastruktūros išardymas yra toks paprastas:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Jungiklis `--purge` užtikrina, kad jis taip pat pašalintų minkštai ištrintas Cognitive Service išteklius, taip atlaisvindamas šių išteklių užimamą kvotą. Baigus pamatysite kažką panašaus:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Pasirinktinai) Jei dabar vėl paleisite `azd up`, pastebėsite, kad diegiamas modelis gpt-4.1, nes aplinkos kintamasis buvo pakeistas (ir išsaugotas) lokaliame `.azure` kataloge. 

      Štai modelio diegimai **prieš**:

      ![Pradinis](../../../../../translated_images/lt/14-deploy-initial.30e4cf1c29b587bc.webp)

      O štai **po**:
      ![Naujas](../../../../../translated_images/lt/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->