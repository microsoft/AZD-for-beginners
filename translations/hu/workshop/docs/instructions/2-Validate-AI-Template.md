# 2. Érvényesítsünk egy sablont

> Érvényesítve az `azd 1.25.6` verzióval 2026 júniusában.

!!! tip "A MODUL VÉGÉRE KÉPES LESZ"

    - [ ] Elemezni az AI Megoldás Architektúrát
    - [ ] Megérteni az AZD Telepítési munkafolyamatot
    - [ ] GitHub Copilot segítségét igénybe venni az AZD használatában
    - [ ] **Labor 2:** Az AI Agent sablon telepítése és érvényesítése

---


## 1. Bevezetés

Az [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) vagy `azd` egy nyílt forráskódú parancssori eszköz, amely egyszerűsíti a fejlesztői munkafolyamatot az Azure-ra történő alkalmazásépítés és -telepítés során.

Az [AZD sablonok](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) szabványosított tárhelyek, amelyek tartalmaznak mintapélda alkalmazáskódot, _infrastruktúra-kód formájában_ eszközöket, valamint `azd` konfigurációs fájlokat egy összefüggő megoldás architektúrához. Az infrastruktúra kialakítása olyan egyszerű, mint az `azd provision` parancs - míg az `azd up` segítségével egyszerre tudja létrehozni az infrastruktúrát **és** telepíteni az alkalmazást!

Ennek eredményeképpen az alkalmazásfejlesztési folyamat elindítása lehet olyan egyszerű, mint megtalálni a megfelelő _AZD kezdő sablont_, amely a legközelebb áll az alkalmazási és infrastruktúra igényeihez - majd testreszabni a tárhelyet az Ön forgatókönyvi követelményei szerint.

Mielőtt elkezdjük, győződjünk meg arról, hogy telepítve van az Azure Developer CLI.

1. Nyisson meg egy VS Code terminált, és írja be ezt a parancsot:

      ```bash title="" linenums="0"
      azd version
      ```

1. Valami hasonlót kell látnia!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**Most készen áll arra, hogy sablont válasszon ki és telepítsen az azd segítségével**

---

## 2. Sablon kiválasztás

A Microsoft Foundry platform egy [javasolt AZD sablonok sorozatával](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) érkezik, amelyek népszerű megoldási forgatókönyveket fednek le, például _több-ügynök munkafolyamat automatizálás_ és _többmodális tartalom feldolgozás_. Ezeket a sablonokat a Microsoft Foundry portálon is felfedezheti.

1. Látogasson el a [https://ai.azure.com/templates](https://ai.azure.com/templates) oldalra
1. Jelentkezzen be a Microsoft Foundry portálra, amikor erre kérik - valami ilyesmit fog látni.

![Pick](../../../../../translated_images/hu/01-pick-template.60d2d5fff5ebc374.webp)


Az **Alap** lehetőségek a kezdő sablonjai:

1. [ ] [Kezdjünk el egy AI Chat-t](https://github.com/Azure-Samples/get-started-with-ai-chat), amely egy alap chat alkalmazást telepít _az Ön adataival_ az Azure Container Apps-re. Ezt arra használhatja, hogy felfedezzen egy egyszerű AI chatbot forgatókönyvet.
1. [X] [Kezdjünk el AI Agentekkel](https://github.com/Azure-Samples/get-started-with-ai-agents), amely szintén egy szabványos AI Agentet telepít (a Foundry ügynökökkel). Ezt arra használhatja, hogy megismerkedjen az eszközökkel és modellekkel kapcsolatos agentikus AI megoldásokkal.

Nyissa meg a második linket egy új böngészőfülön (vagy kattintson a `Open in GitHub` gombra a kapcsolódó kártyán). Meg kell látnia az AZD Template tárhelyét. Töltsön el egy percet az README felfedezésével. Az alkalmazás architektúrája így néz ki:

![Arch](../../../../../translated_images/hu/architecture.8cec470ec15c65c7.webp)

---

## 3. Sablon aktiválása

Próbáljuk meg telepíteni ezt a sablont, és ellenőrizzük, hogy érvényes-e. Kövessük a [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) szakasz útmutatásait.

1. Válasszon munka környezetet a sablon tárhelyhez:

      - **GitHub Codespaces**: Kattintson [ide](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents), majd erősítse meg a `Create codespace`-et
      - **Helyi klón vagy fejlesztői konténer**: Klónozza az `Azure-Samples/get-started-with-ai-agents` tárhelyet, és nyissa meg VS Code-ban

1. Várja meg, amíg a VS Code terminál készen áll, majd írja be a következő parancsot:

   ```bash title="" linenums="0"
   azd up
   ```

Teljesítse az alábbi munkafolyamat lépéseket:

1. Az Azure-ba való bejelentkezésre kérik - kövesse az utasításokat az azonosításhoz
1. Adjon meg egy egyedi környezeti nevet - például én `nitya-mshack-azd`-t használtam
1. Ez létrehoz egy `.azure/` mappát - amelyben megjelenik egy alkönyvtár a környezet nevével
1. Kérni fogja egy előfizetés kiválasztását - válassza az alapértelmezettet
1. Kérni fogja egy helyszín megadását - használja az `East US 2`-t

Most várjon, amíg a provisioning befejeződik. **Ez 10-15 percet vesz igénybe**

1. Ha kész, a konzolja egy SIKERES üzenetet fog mutatni így:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Az Azure Portálján most lesz egy létrehozott erőforrás csoport az adott környezeti névvel:

      ![Infra](../../../../../translated_images/hu/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Most készen áll arra, hogy érvényesítse a telepített infrastruktúrát és alkalmazást**.

---

## 4. Sablon érvényesítése

1. Látogasson el az Azure Portál [Erőforrás Csoportok](https://portal.azure.com/#browse/resourcegroups) oldalára - jelentkezzen be
1. Kattintson arra az erőforráscsoportra, amely a környezeti nevéhez tartozik - a fenti oldal fog megjelenni

      - kattintson az Azure Container Apps erőforrásra
      - kattintson az Alkalmazás URL-re az _Essentials_ szakaszban (jobb felső sarok)

1. Egy ilyen hosztolt alkalmazás front-end felületet kell látnia:

   ![App](../../../../../translated_images/hu/03-test-application.471910da12c3038e.webp)

1. Próbáljon meg feltenni néhány [minta kérdést](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Kérdezze: ```Mi Franciaország fővárosa?```
      1. Kérdezze: ```Mi a legjobb sátor 200 dollár alatt két ember számára, és milyen funkciói vannak?```

1. Hasonló válaszokat kell kapnia, mint az alábbi. _De hogyan működik ez?_

      ![App](../../../../../translated_images/hu/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Ügynök érvényesítés

Az Azure Container App egy végpontot telepít, amely csatlakozik az AI Agenthez, amely a Microsoft Foundry projektben van biztosítva ehhez a sablonhoz. Nézzük meg, pontosan mit is jelent ez.

1. Lépjen vissza az Azure Portál _Áttekintés_ oldalára az erőforráscsoportjához

1. Kattintson a `Microsoft Foundry` erőforrásra a listában

1. Ezt kell látnia. Kattintson a `Go to Microsoft Foundry Portal` gombra.
   ![Foundry](../../../../../translated_images/hu/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Meg kell látnia a Foundry projekt oldalát az AI alkalmazásához
   ![Project](../../../../../translated_images/hu/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Kattintson az `Agents` menüpontra - látni fogja az alapértelmezett ügynököt a projektben
   ![Agents](../../../../../translated_images/hu/06-visit-agents.bccb263f77b00a09.webp)

1. Válassza ki az ügynököt - megjelennek az Ügynök részletei. Jegyezze meg a következőket:

      - Az ügynök alapértelmezés szerint Fájlkeresést használ (mindig)
      - Az ügynök `Knowledge` mutatja, hogy 32 fájl lett feltöltve (a fájlkereséshez)
      ![Agents](../../../../../translated_images/hu/07-view-agent-details.0e049f37f61eae62.webp)

1. Keresse meg a bal oldali menüben a `Data+indexes` opciót, és kattintson a részletekért.

      - Látni fogja a 32 tudásra feltöltött adatfájlt.
      - Ezek megfelelnek a `src/files` mappában található 12 ügyfél fájlnak és 20 termék fájlnak
      ![Data](../../../../../translated_images/hu/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Érvényesítette az Ügynök működését!**

1. Az ügynök válaszai az említett fájlok adatai alapján alapszanak.
1. Mostantól kérdéseket tehet fel ezekkel az adatokkal kapcsolatban, és megalapozott válaszokat kap.
1. Példa: a `customer_info_10.json` leírja Amanda Perez 3 vásárlását.

Lépjen vissza a böngészőfülre az Container App végponttal és tegye fel a kérdést: `Milyen termékei vannak Amanda Pereznek?`. Ehhez hasonló képet kell látnia:

![Data](../../../../../translated_images/hu/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Ügynök játszótér

Építsünk egy kis intuíciót a Microsoft Foundry képességeiről, az Ügynököt próbáljuk ki az Agents Playground-ban.

1. Térjen vissza az `Agents` oldalra a Microsoft Foundry-ban - válassza ki az alapértelmezett ügynököt
1. Kattintson a `Try in Playground` opcióra - megjelenik egy ilyen Playground felület
1. Tegye fel ugyanazt a kérdést: `Milyen termékei vannak Amanda Pereznek?`

    ![Data](../../../../../translated_images/hu/09-ask-in-playground.a1b93794f78fa676.webp)

Ugyanazt (vagy hasonló) választ kap, de további információkat is kap, amelyek segítségével megértheti az ügynökalapú alkalmazás minőségét, költségét és teljesítményét. Például:

1. Vegye észre, hogy a válasz hivatkozik az adatfájlokra, amelyek "megalapozzák" a választ
1. Vigye az egeret bármelyik fájlcímke fölé - az adatok megfelelnek a kérdésnek és a megjelenített válasznak?

Láthat egy _statisztika_ sort a válasz alatt.

1. Vigye az egeret bármelyik metrika fölé, pl. Safety (Biztonság). Valami ilyesmit lát
1. A besorolt értékelés megfelel az Ön intuíciójának a válasz biztonsági szintjéről?

      ![Data](../../../../../translated_images/hu/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Beépített megfigyelhetőség

A megfigyelhetőség arról szól, hogy az alkalmazást úgy instrumentáljuk, hogy olyan adatokat generáljon, amelyek segítségével megérthetjük, hibakereshetjük és optimalizálhatjuk annak működését. Ehhez:

1. Kattintson a `View Run Info` gombra - ezt a nézetet kell látnia. Ez egy példa az [Agent követésre](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground). _Ezt a nézetet a főmenüben a Thread Logs (Szál naplók) kiválasztásával is elérheti_.

   - Tekintse meg az ügynök által végrehajtott lépéseket és használ eszközöket
   - Ismerje meg a teljes token számot (a kimeneti tokenek használatával szemben) a válasznál
   - Ismerje meg a késleltetést és azt, hogy hol töltődik az idő a végrehajtás során

      ![Agent](../../../../../translated_images/hu/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Kattintson a „Metadata” fülre, hogy további attribútumokat lásson a futásról, amelyek hasznos kontextust adhatnak későbbi hibakereséshez.

      ![Agent](../../../../../translated_images/hu/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Kattintson az „Evaluations” fülre, hogy megtekintse az ügynök válaszára vonatkozó automatikus értékeléseket. Ebbe beletartoznak a biztonsági értékelések (pl. öngyilkossági kockázat) és az ügynök-specifikus értékelések (pl. szándék feloldása, feladat betartása).

      ![Agent](../../../../../translated_images/hu/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Végül kattintson az oldalsáv menüben a „Monitoring” fülre.

      - Válassza a „Resource usage” fület a megjelenő oldalon - és tekintse meg a metrikákat.
      - Kövesse nyomon az alkalmazás használatot költségek (tokenek) és terhelés (kérések) szerint.
      - Kövesse az alkalmazás késleltetését az első bájttól (bemeneti feldolgozás) az utolsó bájtig (kimenet).

      ![Agent](../../../../../translated_images/hu/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Környezeti változók

Eddig végigvezettük a telepítésen a böngészőben, és érvényesítettük, hogy az infrastruktúra ki lett építve, és az alkalmazás működik. Azonban ha _kóddal_ szeretnénk dolgozni, konfigurálnunk kell a helyi fejlesztői környezetünket a releváns változókkal, amelyek szükségesek a erőforrások használatához. Az `azd` használata ezt megkönnyíti.

1. Az Azure Developer CLI [környezeti változókat használ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) a konfigurációs beállítások tárolására és kezelésére az alkalmazás telepítésekhez.

1. A környezeti változók a `.azure/<env-name>/.env` fájlban vannak tárolva - így scope-olva az adott `env-name` környezethez, amelyet a telepítés során használunk, ezzel segítve a környezetek elkülönítését ugyanazon tárhely különböző telepítési céljai között.

1. A környezeti változókat az `azd` parancs automatikusan betölti, amikor egy adott parancsot futtat (pl. `azd up`). Fontos megjegyezni, hogy az `azd` nem olvassa be automatikusan az _operációs rendszer szintű_ környezeti változókat (pl. shellben beállítottakat), hanem használja az `azd set env` és `azd get env` parancsokat az információ átadására szkriptek között.


Próbáljunk meg néhány parancsot:

1. Lekérni az összes környezeti változót, amely az `azd` számára be van állítva ebben a környezetben:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Valami ilyesmit fog látni:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Lekérni egy konkrét értéket - pl. meg akarom tudni, hogy be lett-e állítva az `AZURE_AI_AGENT_MODEL_NAME` változó

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Valami ilyesmit fog látni - alapértelmezés szerint nem volt beállítva!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Állítson be egy új környezeti változót az `azd` számára. Itt az ügynök modell nevét frissítjük. _Megjegyzés: bármilyen módosítás azonnal megjelenik a `.azure/<env-name>/.env` fájlban._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Most már meg kell találnunk, hogy az érték beállított:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Vegye figyelembe, hogy néhány erőforrás tartós (pl. modell telepítések), ezért többre lesz szükség, mint egy egyszerű `azd up`, hogy újratelepítés történjen. Próbáljuk meg lebontani az eredeti telepítést és újratelepíteni a megváltoztatott környezeti változókkal.

1. **Frissítés** Ha korábban már telepített infrastruktúrát egy azd sablon segítségével, akkor a helyi környezeti változók állapotát frissítheti az aktuális Azure telepítési állapot alapján ezzel a paranccsal:

      ```bash title="" linenums="0"
      azd env refresh
      ```

Ez egy hatékony módja annak, hogy környezeti változókat _szinkronizáljunk_ két vagy több helyi fejlesztői környezet között (pl. több fejlesztőből álló csapat) – lehetővé téve, hogy a telepített infrastruktúra szolgáljon igaz alapként a környezeti változók állapotához. A csapattagok egyszerűen _frissítik_ a változókat, hogy újra szinkronban legyenek.

---

## 9. Gratulálunk 🏆

Most fejeztél be egy végponttól végpontig tartó munkafolyamatot, amely során:

- [X] Kiválasztottad a használni kívánt AZD sablont
- [X] Megnyitottad a sablont egy támogatott fejlesztői környezetben
- [X] Telepítetted a sablont, és ellenőrizted, hogy működik

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->