# 2. Egy sablon validálása

!!! tip "A MODUL VÉGÉRE KÉPES LESZ"

    - [ ] Elemezni az AI megoldás architektúráját
    - [ ] Megérteni az AZD telepítési munkafolyamatot
    - [ ] Használni a GitHub Copilot-ot az AZD használatában való segítséghez
    - [ ] **Labor 2:** AI ügynökök sablonjának telepítése és validálása

---


## 1. Bevezetés

Az [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) vagy `azd` egy nyílt forráskódú parancssori eszköz, amely leegyszerűsíti a fejlesztői munkafolyamatot Azure-alkalmazások építése és telepítése során.

Az [AZD sablonok](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) szabványosított tárolók, amelyek mintaalkalmazás-kódot, _infrastruktúrakódként_ kezelt erőforrásokat és `azd` konfigurációs fájlokat tartalmaznak egy összefüggő megoldás architektúrához. Az infrastruktúra létrehozása olyan egyszerű, mint egy `azd provision` parancs futtatása – míg az `azd up` használata egyszerre teszi lehetővé az infrastruktúra létrehozását **és** az alkalmazás telepítését!

Ennek eredményeként az alkalmazásfejlesztési folyamat elindítása olyan egyszerű lehet, mint megtalálni a megfelelő _AZD Starter sablont_, amely a legközelebb áll az alkalmazás- és infrastruktúraigényeihez – majd testre szabni a tárolót az Ön forgatókönyvének megfelelően.

Mielőtt elkezdenénk, győződjön meg arról, hogy telepítve van az Azure Developer CLI.

1. Nyisson meg egy VS Code terminált, és írja be ezt a parancsot:

      ```bash title="" linenums="0"
      azd version
      ```

1. Valami ilyesmit kell látnia!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Most már készen áll arra, hogy sablont válasszon és telepítsen az azd-vel**

---

## 2. Sablon kiválasztása

A Microsoft Foundry platform egy [ajánlott AZD sabloncsomagot](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) tartalmaz, amely népszerű megoldási forgatókönyveket fed le, például _több ügynök munkafolyamat-automatizációt_ és _többmodális tartalomfeldolgozást_. Ezeket a sablonokat a Microsoft Foundry portálon is felfedezheti.

1. Látogasson el a következő oldalra: [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Jelentkezzen be a Microsoft Foundry portálra, amikor kéri – valami ilyesmit fog látni.

![Pick](../../../../../translated_images/hu/01-pick-template.60d2d5fff5ebc374.webp)


A **Basic** opciók az induló sablonjai:

1. [ ] [Ismerkedj meg az AI chat használatával](https://github.com/Azure-Samples/get-started-with-ai-chat), amely egy egyszerű chatalkalmazást telepít _az Ön adataival_ az Azure Container Apps-be. Ezt használhatja egy alap AI chatbot forgatókönyv felfedezésére.
1. [X] [Ismerkedj meg az AI ügynökökkel](https://github.com/Azure-Samples/get-started-with-ai-agents), amely egy standard AI ügynököt is telepít (a Foundry ügynökökkel). Ezt használja, hogy megismerkedjen az ügynökalapú AI megoldásokkal, amelyek eszközöket és modelleket érintenek.

Látogassa meg a második linket egy új böngészőfülön (vagy kattintson a `Open in GitHub` gombra a kapcsolódó kártyán). Meg kell látnia az AZD sablon tárházát. Szánjon egy percet a README felfedezésére. Az alkalmazás architektúrája így néz ki:

![Arch](../../../../../translated_images/hu/architecture.8cec470ec15c65c7.webp)

---

## 3. Sablon aktiválása

Próbáljuk meg telepíteni ezt a sablont, és győződjünk meg róla, hogy érvényes. Kövessük a [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) szakasz útmutatásait.

1. Kattintson [erre a linkre](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) – erősítse meg az alapértelmezett műveletet: `Create codespace`
1. Ez megnyit egy új böngészőfület – várjon, amíg a GitHub Codespaces munkamenet betöltődik
1. Nyissa meg a VS Code terminált a Codespaces-ben – írja be a következő parancsot:

   ```bash title="" linenums="0"
   azd up
   ```

Teljesítse a munkafolyamat lépéseit, amelyeket ez kivált:

1. Kéri az Azure-ba való bejelentkezést – kövesse az utasításokat az azonosításhoz
1. Adjon meg egy egyedi környezetnevet – pl. én az `nitya-mshack-azd` nevet használtam
1. Ez létrehoz egy `.azure/` mappát – ott látni fog egy almappát a környezeti névvel
1. Kéri majd, hogy válasszon előfizetést – válassza az alapértelmezettet
1. Kéri a helyszínt – használja az `East US 2` értéket

Ezután várjon, amíg a létrehozás befejeződik. **Ez 10-15 percet vesz igénybe**

1. Amikor kész, a konzolja SIKERES üzenetet mutat így:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Most az Azure portálban lesz egy létrehozott erőforráscsoport az adott környezeti névvel:

      ![Infra](../../../../../translated_images/hu/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Most már készen áll arra, hogy validálja a telepített infrastruktúrát és az alkalmazást**.

---

## 4. Sablon validálása

1. Látogassa meg az Azure Portal [Erőforráscsoportok](https://portal.azure.com/#browse/resourcegroups) oldalát – jelentkezzen be, ha kéri
1. Kattintson a környezetének nevét tartalmazó erőforráscsoportra – a fentebb látott oldal fog megjelenni

      - kattintson az Azure Container Apps erőforrásra
      - kattintson az _Essentials_ szakaszban (jobb felső sarok) az Alkalmazás URL-re

1. Látnia kell egy ilyen hosztolt alkalmazás front-end felületet:

   ![App](../../../../../translated_images/hu/03-test-application.471910da12c3038e.webp)

1. Próbáljon meg feltenni pár [minta kérdést](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Kérdezze meg: ```Mi Franciaország fővárosa?``` 
      1. Kérdezze meg: ```Mi a legjobb sátor 200 dollár alatt két személy számára, és milyen funkciókat tartalmaz?```

1. Olyan válaszokat kell kapnia, amelyek a következő képen láthatóak. _De hogyan működik ez?_

      ![App](../../../../../translated_images/hu/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Ügynök validálása

Az Azure Container Apps egy végpontot telepít, amely csatlakozik az AI ügynökhöz, amely a Microsoft Foundry projektben került létrehozásra ennél a sablonnál. Nézzük meg, mit jelent ez.

1. Térjen vissza az Azure Portal erőforráscsoportjának _Áttekintő_ oldalára

1. Kattintson a listában a `Microsoft Foundry` erőforrásra

1. Ezt kell látnia. Kattintson a `Go to Microsoft Foundry Portal` gombra. 
   ![Foundry](../../../../../translated_images/hu/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Meg kell látnia az AI alkalmazás Foundry projekt oldalát
   ![Project](../../../../../translated_images/hu/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Kattintson az `Agents` menüpontra – látni fogja az alapértelmezett ügynököt, amely létrejött a projektjében
   ![Agents](../../../../../translated_images/hu/06-visit-agents.bccb263f77b00a09.webp)

1. Válassza ki – és megtekintheti az ügynök részleteit. Jegyezze meg a következőket:

      - Az ügynök alapértelmezettként mindig fájlkeresést használ
      - Az ügynök `Knowledge` mutatja, hogy 32 fájl lett feltöltve (a fájlkereséshez)
      ![Agents](../../../../../translated_images/hu/07-view-agent-details.0e049f37f61eae62.webp)

1. Keresse meg a bal oldali menüben a `Data+indexes` beállítást, és kattintson a részletekért.

      - Látni fogja a 32 tudásfájlt feltöltve.
      - Ezek megfelelnek a `src/files` alatti 12 ügyfél és 20 termék fájlnak
      ![Data](../../../../../translated_images/hu/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Érvényesítette az ügynök működését!**

1. Az ügynök válaszai az ebben a fájlokban tárolt tudásra épülnek.
1. Most már kérdéseket tehet fel az adatokhoz kapcsolódóan, és megalapozott válaszokat kaphat.
1. Példa: a `customer_info_10.json` leírja az "Amanda Perez" által végrehajtott 3 vásárlást.

Látogasson vissza a böngészőfülre az Container App végponttal, és kérdezze meg: `Milyen termékek vannak Amanda Perez tulajdonában?`. Valami ilyesmit kell látnia:

![Data](../../../../../translated_images/hu/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Ügynök játékterem

Alkossunk egy kis intuíciót a Microsoft Foundry képességeiről azáltal, hogy kipróbáljuk az ügynököt az Agents Playground-ban.

1. Térjen vissza a Microsoft Foundry `Agents` oldalára – válassza ki az alapértelmezett ügynököt
1. Kattintson a `Try in Playground` opcióra – egy ilyen játékterem UI-t kell kapnia
1. Tegye fel ugyanazt a kérdést: `Milyen termékek vannak Amanda Perez tulajdonában?`

    ![Data](../../../../../translated_images/hu/09-ask-in-playground.a1b93794f78fa676.webp)

Ugyanazt (vagy hasonló) választ kapja – de további információkat is kap, amelyek segítségével megértheti az ügynökalapú alkalmazás minőségét, költségét és teljesítményét. Például:

1. Vegye észre, hogy a válasz hivatkozik a válasz „megalapozásához” használt adatfájlokra
1. Vigye az egeret ezek bármelyik fájlcímkéje fölé – az adatok megfelelnek-e a kérdésének és a megjelenített válasznak?

Látható egy _statisztika_ sor is a válasz alatt.

1. Vigye az egeret bármelyik mérőszám fölé – pl. a Biztonság fölé. Valami ilyesmit fog látni
1. A becsült értékelés megfelel az Ön intuíciójának a válasz biztonságosságát illetően?

      ![Data](../../../../../translated_images/hu/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Beépített megfigyelhetőség

A megfigyelhetőség arról szól, hogy az alkalmazását úgy instrumentálja, hogy adatokat generáljon, amelyeket az üzemeltetés megértésére, hibakeresésére és optimalizálására használhat. Ezen érzék megteremtéséhez:

1. Kattintson a `View Run Info` gombra – ezt a nézetet fogja látni. Ez egy példa a [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) működésére. _Ezt a nézetet a főmenüben a Thread Logs-ra kattintva is elérheti_.

   - Tájékozódjon a futási lépésekről és az ügynök által használt eszközökről
   - Ismerje meg a teljes Token-számot (az output token használathoz képest) a válasznál
   - Ismerje meg a késleltetést és hogy az idő hol telik el a végrehajtás során

      ![Agent](../../../../../translated_images/hu/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Kattintson a `Metadata` fülre, hogy további attribútumokat lásson a futásról, amelyek segíthetnek a későbbi hibakeresésben.

      ![Agent](../../../../../translated_images/hu/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Kattintson az `Evaluations` fülre, hogy lássa az ügynök válaszára vonatkozó automatikus értékeléseket. Ezek tartalmazzák a biztonsági értékeléseket (pl. öngyilkossági veszély) és az ügynökre vonatkozó konkrét értékeléseket (pl. szándék feloldása, feladat betartása).

      ![Agent](../../../../../translated_images/hu/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Végül kattintson az oldalsó menüben a `Monitoring` fülre.

      - Válassza a megjelenített oldalon a `Resource usage` fület – és tekintse meg a mérőszámokat.
      - Kövesse az alkalmazáshasználatot költségek (tokenek) és terhelés (kérések) alapján.
      - Kövesse az alkalmazás első bájtos (bemenet feldolgozása) és utolsó bájtos (kimenet) késleltetését.

      ![Agent](../../../../../translated_images/hu/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Környezeti változók

Eddig a telepítést böngészőből hajtottuk végre – és validáltuk az infrastruktúra létrejöttét és az alkalmazás működését. De hogy az alkalmazás _kódalapú_ megközelítésével dolgozzunk, be kell állítanunk a helyi fejlesztői környezetet a releváns változókkal, amelyek szükségesek az erőforrások kezeléséhez. Az `azd` használata ezt leegyszerűsíti.

1. Az Azure Developer CLI [környezeti változókat használ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) az alkalmazástelepítések konfigurációs beállításainak tárolására és kezelésére.

1. A környezeti változók a `.azure/<env-name>/.env` fájlban tárolódnak – ez leválasztja őket az adott `env-name` környezetről, amelyben a telepítés történt, és segíti a környezetek elhatárolását különböző telepítési célpontok között ugyanabban a tárolóban.

1. A környezeti változókat az `azd` parancs automatikusan betölti, amikor végrehajt egy adott parancsot (pl. `azd up`). Megjegyzendő, hogy az `azd` nem olvassa automatikusan az _operációs rendszer szintű_ környezeti változókat (pl. a shell-ben beállítottakat) – helyette használja az `azd set env` és az `azd get env` parancsokat az információk átadására szkriptek között.


Próbáljunk ki néhány parancsot:

1. Listázza az összes környezeti változót, amely az `azd`-hez van beállítva ebben a környezetben:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Valami ilyesmit fog látni:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Lekérdez egy konkrét értéket – pl. én megnézem, hogy be van-e állítva az `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Valami ilyesmit fog látni – alapértelmezés szerint nem volt beállítva!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Beállít egy új környezeti változót az `azd` számára. Itt frissítjük az ügynök modell nevét. _Megjegyzés: minden változtatás azonnal tükröződik a `.azure/<env-name>/.env` fájlban._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Most már látni fogjuk, hogy az érték be van állítva:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Vegye figyelembe, hogy néhány erőforrás tartós (pl. modell telepítések), és azokhoz nem elegendő egy `azd up`-t futtatni az újratelepítés megerőltetéséhez. Próbáljuk meg lebontani az eredeti telepítést és újratelepíteni a megváltozott környezeti változókkal.

1. **Frissítés** Ha korábban már telepített infrastruktúrát egy azd sablonnal – frissítheti a helyi környezeti változók állapotát az aktuális Azure telepítés állapotának megfelelően a következő paranccsal:

      ```bash title="" linenums="0"
      azd env refresh
      ```

Ez egy hatékony módja annak, hogy a környezeti változókat két vagy több helyi fejlesztői környezet között _szinkronizáljuk_ (például egy több fejlesztős csapat esetében) – lehetővé téve, hogy a telepített infrastruktúra szolgáljon alapul a környezeti változó állapotának. A csapattagok egyszerűen _frissítik_ a változókat, hogy újra szinkronban legyenek.

---

## 9. Gratulálunk 🏆

Most fejezted be a teljes munkafolyamatot, ahol:

- [X] Kiválasztottad a Használni kívánt AZD sablont
- [X] Elindítottad a sablont GitHub Codespaces használatával
- [X] Telepítetted a sablont, és megerősítetted, hogy működik

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:  
Ezt a dokumentumot a [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítószolgáltatásával fordítottuk le. Bár igyekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum, az anyanyelvén tekinthető hiteles forrásnak. Kritikus információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->