# 2. Egy sablon érvényesítése

> Érvényesítve az `azd 1.27.1` verzióval, 2026 júliusában.

!!! tip "A MODUL VÉGÉRE KÉPES LESZ"

    - [ ] Elemezni az AI megoldásarchitektúrát
    - [ ] Megérteni az AZD telepítési munkafolyamatot
    - [ ] GitHub Copilot segítségét használni az AZD használatában
    - [ ] **Labor 2:** AI ügynökök sablonjának telepítése és érvényesítése

---


## 1. Bevezetés

A [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) vagy `azd` egy nyílt forráskódú parancssori eszköz, amely egyszerűsíti a fejlesztői munkafolyamatot Azure-alkalmazások építése és telepítése során.

Az [AZD sablonok](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) szabványosított adattárak, amelyek tartalmaznak mintaalmazás-kódot, _infrastruktúra-kód formátumban_ lévő erőforrásokat és `azd` konfigurációs fájlokat egy egységes megoldásarchitektúrához. Az infrastruktúra biztosítása egyszerű `azd provision` paranccsal elvégezhető – míg az `azd up` paranccsal egyszerre tudja biztosítani az infrastruktúrát és telepíteni az alkalmazást!

Ennek eredményeképpen az alkalmazásfejlesztési folyamat elindítása olyan egyszerű lehet, mint megtalálni a megfelelő _AZD Starter sablont_, amely a legközelebb áll az alkalmazás- és infrastruktúraigényeihez – majd testreszabni az adattárat a forgatókönyv követelményeihez.

Mielőtt nekikezdenénk, győződjön meg róla, hogy telepítve van az Azure Developer CLI.

1. Nyisson meg egy VS Code terminált és írja be ezt a parancsot:

      ```bash title="" linenums="0"
      azd version
      ```

1. Valami ilyesmit kell látnia!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Most készen áll arra, hogy kiválasszon és telepítsen egy sablont az azd-vel**

---

## 2. Sablon kiválasztása

A Microsoft Foundry platform egy [ajánlott AZD sablonkészlettel](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) érkezik, amelyek népszerű megoldásforgatókönyveket fednek le, például _többügynökös munkafolyamat-automatizálást_ és _többmódusú tartalomfeldolgozást_. Ezeket a sablonokat a Microsoft Foundry portál látogatásával is felfedezheti.

1. Látogasson el a [https://ai.azure.com/templates](https://ai.azure.com/templates) oldalra
1. Jelentkezzen be a Microsoft Foundry portálra, amikor kéri – valami ilyesmit fog látni.

![Pick](../../../../../translated_images/hu/01-pick-template.60d2d5fff5ebc374.webp)


A **Basic** lehetőségek az induló sablonjai:

1. [ ] [Kezdje el az AI chattel](https://github.com/Azure-Samples/get-started-with-ai-chat), amely egy alapvető chatalkalmazást telepít _az Ön adataival_ az Azure Container Apps szolgáltatásba. Használja ezt egy alap AI chatbot forgatókönyv felfedezéséhez.
1. [X] [Kezdje el az AI ügynökökkel](https://github.com/Azure-Samples/get-started-with-ai-agents), amely egy standard AI ügynököt is telepít (a Foundry ügynökökkel). Használja ezt az eszközzel és modellekkel működő ügynöki AI megoldások megismeréséhez.

Nyissa meg a második hivatkozást egy új böngészőfülön (vagy kattintson a `Open in GitHub` gombra a kártyán). Meg kell látnia az AZD sablon adattárát. Tegyen egy percet az olvasására a README-ben. Az alkalmazás architektúrája így néz ki:

![Arch](../../../../../translated_images/hu/architecture.8cec470ec15c65c7.webp)

---

## 3. Sablon aktiválása

Próbáljuk meg telepíteni ezt a sablont és győződjünk meg a helyességéről. Követjük a [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) részt.

1. Válassza ki a munkakörnyezetet a sablon adattárhoz:

      - **GitHub Codespaces**: Kattintson [ide](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) és erősítse meg a `Create codespace` opciót
      - **Helyi másolat vagy fejlesztői konténer**: Klónozza a `Azure-Samples/get-started-with-ai-agents` adattárat és nyissa meg a VS Code-ban

1. Várja meg, amíg a VS Code terminál készen áll, majd írja be a következő parancsot:

   ```bash title="" linenums="0"
   azd up
   ```

Teljesítse a munkafolyamat lépéseit, amelyeket ez elindít:

1. Fel fogják kérni, hogy jelentkezzen be az Azure-ba – kövesse az utasításokat az azonosításhoz
1. Adjon meg egy egyedi környezetnevet – pl. én `nitya-mshack-azd` nevet használtam
1. Ez létre fog hozni egy `.azure/` mappát – amiben egy almappát talál a környezet nevével
1. Felkérést kap a feliratkozás nevének kiválasztására – válassza az alapértelmezettet
1. Felkérést kap helyszín megadására – használja az `East US 2`-t

Most várja meg a biztosítás befejezését. **Ez 10-15 percet vesz igénybe**

1. Amikor kész, a konzolban SUCCESS üzenetet fog látni ilyet:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Az Azure Portálon most lesz egy biztosított erőforráscsoport ezzel a környezeti névvel:

      ![Infra](../../../../../translated_images/hu/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Most készen áll az infrastruktúra és az alkalmazás telepítésének érvényesítésére**.

---

## 4. Sablon érvényesítése

1. Látogassa meg az Azure Portál [Resource Groups](https://portal.azure.com/#browse/resourcegroups) oldalát – jelentkezzen be, ha szükséges
1. Kattintson az Ön környezetének nevéhez tartozó RG-re – látni fogja a fenti oldalt

      - Kattintson az Azure Container Apps erőforrásra
      - Kattintson az Application Url-re az _Essentials_ részben (jobb felső sarok)

1. Egy hostolt alkalmazás felhasználói felületének hasonló oldalát kell látnia:

   ![App](../../../../../translated_images/hu/03-test-application.471910da12c3038e.webp)

1. Próbáljon meg feltenni néhány [mintakérdést](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Tegye fel a kérdést: ```Mi Franciaország fővárosa?``` 
      1. Tegye fel a kérdést: ```Melyik a legjobb sátor 200 dollár alatt két személy számára, és milyen jellemzői vannak?```

1. Hasonló válaszokat kell kapnia, mint az alábbiakban. _De hogyan működik ez?_ 

      ![App](../../../../../translated_images/hu/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Ügynök érvényesítése

Az Azure Container App telepít egy végpontot, amely kapcsolódik az AI ügynökhöz, amelyet a Microsoft Foundry projektben biztosítottak ehhez a sablonhoz. Nézzük meg, mit jelent ez.

1. Térjen vissza az Azure Portál _Áttekintés_ oldalára az erőforráscsoportjához

1. Kattintson a `Microsoft Foundry` erőforrásra a listán

1. Ezt kell látnia. Kattintson a `Go to Microsoft Foundry Portal` gombra.
   ![Foundry](../../../../../translated_images/hu/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Meg kell látnia a Foundry projekt oldalát az AI alkalmazásához
   ![Project](../../../../../translated_images/hu/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Kattintson az `Agents` (ügynökök) menüpontra – látni fogja az alapértelmezett ügynököt, amelyet a projektben biztosítottak
   ![Agents](../../../../../translated_images/hu/06-visit-agents.bccb263f77b00a09.webp)

1. Válassza ki – és látni fogja az ügynök részleteit. Figyelje meg a következőket:

      - Az ügynök alapértelmezés szerint Fájl keresést használ (mindig)
      - Az ügynök `Knowledge` mezője 32 feltöltött fájlt jelez (a fájlkutatáshoz)
      ![Agents](../../../../../translated_images/hu/07-view-agent-details.0e049f37f61eae62.webp)

1. Keresse meg a `Data+indexes` opciót a bal oldali menüben és kattintson a részletekért.

      - Látnia kell a 32 feltöltött adatfájlt a tudáshoz.
      - Ezek megegyeznek a `src/files` mappában lévő 12 ügyfélfájllal és 20 termékfájllal
      ![Data](../../../../../translated_images/hu/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Érvényesítette az ügynök működését!**

1. Az ügynök válaszai a fájlokban lévő tudás alapjain nyugszanak.
1. Most már kérdéseket tehet fel az ezen adatokkal kapcsolatban, és megalapozott válaszokat kaphat.
1. Például: a `customer_info_10.json` leírja "Amanda Perez" 3 vásárlását

Térjen vissza a böngészőfülhöz, ahol a Container App végpont van, és kérdezze meg: `Milyen termékek tulajdonosa Amanda Perez?`. Valami ilyesmit kell látnia:

![Data](../../../../../translated_images/hu/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Ügynök játszótér

Építsünk egy kicsit jobb intuíciót a Microsoft Foundry képességeiről, azáltal, hogy kipróbáljuk az ügynököt az Ügynök Játszótéren.

1. Térjen vissza a Microsoft Foundry `Agents` oldalára – válassza ki az alapértelmezett ügynököt
1. Kattintson a `Try in Playground` opcióra – ilyesmi játszótéri UI-t kell kapnia
1. Tegye fel ugyanazt a kérdést: `Milyen termékek tulajdonosa Amanda Perez?`

    ![Data](../../../../../translated_images/hu/09-ask-in-playground.a1b93794f78fa676.webp)

Ugyanazt (vagy hasonló) választ kap – de további információkat is, amelyeket az ügynöki alkalmazás minőségének, költségeinek és teljesítményének megértésére használhat. Például:

1. Vegye észre, hogy a válasz hivatkozik arra, hogy mely adatfájlokat használta "a válasz megalapozásához"
1. Vigye az egérmutatót ezek valamelyik fájlcímkéje fölé – egyezik az adat a lekérdezéssel és a megjelenített válasszal?

A válasz alatt lát egy _statisztika_ sort is.

1. Vigye az egérmutatót bármelyik mutató fölé – például Safety (biztonság). Valami ilyesmit lát majd
1. Megfelel az értékelt besorolás a saját intuíciójának a válasz biztonsági szintjéről?

      ![Data](../../../../../translated_images/hu/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Beépített megfigyelhetőség

A megfigyelhetőség azt jelenti, hogy az alkalmazást úgy műszerelik, hogy olyan adatokat generáljon, amelyek segítségével megérthető, hibakereshető és optimalizálható a működése. Ehhez:

1. Kattintson a `View Run Info` gombra – ezt a nézetet fogja látni. Ez egy példa az [Ügynök nyomkövetésre](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground). _Ezt a nézetet a Főmenüben a Thread Logs-ra kattintva is elérheti_.

   - Tájékozódjon az ügynök futási lépéseiről és az általa használt eszközökről
   - Értse meg a teljes token számot (összehasonlítva a kimenő tokenek felhasználásával) a válaszhoz
   - Értse meg a késleltetést és hogy hol töltődik a futási idő

      ![Agent](../../../../../translated_images/hu/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Kattintson a `Metadata` fülre, hogy további tulajdonságokat lásson a futásról, amelyek hasznos kontextust nyújthatnak a későbbi hibakereséshez.

      ![Agent](../../../../../translated_images/hu/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Kattintson az `Evaluations` fülre, hogy lássa az ügynök válaszon automatikusan végzett értékeléseket. Ezek tartalmaznak biztonsági értékeléseket (pl. öngyilkossági kockázat) és ügynökspecifikus értékeléseket (pl. szándékfeloldás, feladattartás).

      ![Agent](../../../../../translated_images/hu/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Végül, de nem utolsó sorban, kattintson az oldalsáv menüjében a `Monitoring` fülre.

      - Válassza a megjelenő oldalon a `Resource usage` fület – és tekintse meg a mérőszámokat.
      - Kövesse az alkalmazáshasználatot költségek (tokenek) és terhelés (kérések) szerint.
      - Kövesse az alkalmazáskésleltetést az első byte-ig (bemeneti feldolgozás) és az utolsó byte-ig (kimenet)

      ![Agent](../../../../../translated_images/hu/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Környezeti változók

Eddig a telepítést a böngészőben követtük végig – és érvényesítettük, hogy az infrastruktúra biztosítva van és az alkalmazás működik. De ahhoz, hogy _kódközpontúan_ dolgozzunk az alkalmazással, be kell állítanunk a helyi fejlesztési környezetünket a szükséges változókkal, amelyek az erőforrások kezeléséhez kellenek. Az `azd` használata ezt leegyszerűsíti.

1. Az Azure Developer CLI [környezeti változókat használ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) az alkalmazástelepítési konfigurációk tárolására és kezelésére.

1. A környezeti változók a `.azure/<env-name>/.env` fájlban vannak tárolva – így azok az adott telepítési környezet (`env-name`) számára korlátozódnak, és segítik izolálni a különböző telepítési célpontok környezetét ugyanabban az adattárban.

1. Az `azd` parancs automatikusan betölti a környezeti változókat, amikor egy adott parancsot futtat (például `azd up`). Fontos megjegyezni, hogy az `azd` nem olvassa be automatikusan az _operációs rendszer szintű_ környezeti változókat (pl. shell-ben beállítottakat) – ehelyett használja az `azd set env` és `azd get env` parancsokat az információk átadására scriptből.


Próbáljunk ki néhány parancsot:

1. Listázza az összes az adott környezetben az `azd`-hez beállított környezeti változót:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Valami ilyesmit kell látnia:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Lekérdez egy konkrét értéket – pl. meg akarom tudni, hogy beállítottuk-e az `AZURE_AI_AGENT_MODEL_NAME` értéket

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Ilyesmit láthat – alapból nem volt beállítva!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Állítson be egy új környezeti változót az `azd`-hez. Itt az ügynökmodell nevét frissítjük. _Megjegyzés: a változtatások azonnal megjelennek a `.azure/<env-name>/.env` fájlban._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Most már meg kell találnunk, hogy az érték be van állítva:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Vegye figyelembe, hogy néhány erőforrás tartós (pl. modelltelepítések), és többre lesz szükség, mint egy `azd up`, hogy újratelepítse őket. Próbáljuk meg lebontani az eredeti telepítést és a megváltozott környezeti változókkal újratelepíteni.

1. **Frissítés:** Ha korábban már telepített infrastruktúrát az `azd` sablonjával – az aktuális Azure telepítés állapota alapján frissítheti a helyi környezeti változók állapotát ezzel a paranccsal:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Ez egy erőteljes módszer arra, hogy _szinkronizáljuk_ a környezeti változókat két vagy több helyi fejlesztési környezet között (pl. többszemélyes csapat) – lehetővé téve, hogy a telepített infrastruktúra szolgáljon a környezeti változók állapotának tényleges alapjaként. A csapattagok egyszerűen _frissítik_ a változókat, hogy újra szinkronban legyenek.

---

## 9. Gratulálunk 🏆

Éppen befejeztél egy végponttól végpontig tartó munkafolyamatot, amelyben:

- [X] Kiválasztottad a használni kívánt AZD sablont
- [X] Megnyitottad a sablont egy támogatott fejlesztési környezetben
- [X] Telepítetted a sablont és ellenőrizted, hogy működik

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->