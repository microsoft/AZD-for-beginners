# 2. Egy sablon érvényesítése

> A `azd 1.23.12` verzióval lett érvényesítve 2026 márciusában.

!!! tip "A TANFOLYAM VÉGÉRE KÉPES LESZ"

    - [ ] Elemezni az MI Megoldás architektúráját
    - [ ] Megérteni az AZD Telepítési munkafolyamatát
    - [ ] GitHub Copilot segítségével támogatást kapni az AZD használatához
    - [ ] **Gyakorlat 2:** AI Agents sablon telepítése és érvényesítése

---


## 1. Bevezetés

Az [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) vagy `azd` egy nyílt forráskódú parancssori eszköz, amely egyszerűsíti a fejlesztői munkafolyamatot alkalmazások Azure-hoz történő fejlesztése és telepítése során.

Az [AZD sablonok](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) szabványosított tárolók, amelyek tartalmazzák a mintalkalmazás kódját, _infrastruktúra-kód_ elemeket és `azd` konfigurációs fájlokat egy egységes megoldásarchitektúrához. Az infrastruktúra kiépítése egyszerű `azd provision` paranccsal megoldható, míg az `azd up` lehetővé teszi, hogy egyszerre létesítse az infrastruktúrát **és** telepítse az alkalmazást!

Ennek eredményeként az alkalmazásfejlesztés elindítása egyszerű lehet: csak meg kell találni a megfelelő _AZD Starter sablont_, amely legközelebb áll az alkalmazás és infrastruktúra igényeihez – majd testre szabni a tárolót az adott forgatókönyv követelményeihez.

Mielőtt elkezdenénk, győződjünk meg róla, hogy telepítve van az Azure Developer CLI.

1. Nyisson meg egy VS Code terminált, és írja be ezt a parancsot:

      ```bash title="" linenums="0"
      azd version
      ```

1. Ilyet kell látnia!

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**Most már készen áll arra, hogy sablont válasszon és telepítsen az azd segítségével**

---

## 2. Sablon kiválasztása

A Microsoft Foundry platform egy [ajánlott AZD sablonkészletet](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) kínál, amelyek népszerű megoldásszcenáriókat fednek le, mint például _több-agentes munkafolyamat automatizálás_ és _többmodális tartalomfeldolgozás_. Ezeket a sablonokat a Microsoft Foundry portálján is felfedezheti.

1. Látogasson el a [https://ai.azure.com/templates](https://ai.azure.com/templates) oldalra
1. Jelentkezzen be a Microsoft Foundry portálra, amikor kéri – az alábbihoz hasonló oldalt fog látni.

![Pick](../../../../../translated_images/hu/01-pick-template.60d2d5fff5ebc374.webp)


Az **Alap** opciók az indító sablonok:

1. [ ] [Kezdje el az AI Chat használatát](https://github.com/Azure-Samples/get-started-with-ai-chat), amely egy alap chat alkalmazást telepít _az Ön adatával_ az Azure Container Apps-re. Ezt használja egy alap AI chatbot szcenárió felfedezéséhez.
1. [X] [Kezdje el az AI Agents használatát](https://github.com/Azure-Samples/get-started-with-ai-agents), amely egy szabványos AI Agentet is telepít (a Foundry Agents-szel együtt). Ezt használja, hogy megismerje az ügynökalapú MI megoldásokat, amelyek eszközöket és modelleket tartalmaznak.

Nyissa meg a második linket egy új böngészőfülön (vagy kattintson az adott kártyán az `Open in GitHub` gombra). Látni fogja ennek az AZD sablonnak a tárolóját. Szánjon egy percet a README áttekintésére. Az alkalmazás architektúrája így néz ki:

![Arch](../../../../../translated_images/hu/architecture.8cec470ec15c65c7.webp)

---

## 3. Sablon aktiválása

Próbáljuk meg telepíteni ezt a sablont, és győződjünk meg róla, hogy érvényes. Kövessük az [Első lépések](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) szakasz irányelveit.

1. Válasszon munkakörnyezetet a sablon tárolójához:

      - **GitHub Codespaces**: Kattintson [ide](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) és erősítse meg a `Create codespace` parancsot
      - **Helyi klónozás vagy fejlesztői konténer**: Klónozza a `Azure-Samples/get-started-with-ai-agents` tárolót, és nyissa meg VS Code-ban

1. Várja meg, míg a VS Code terminál készen áll, majd írja be a következő parancsot:

   ```bash title="" linenums="0"
   azd up
   ```

Teljesítse a triggered munkafolyamat lépéseit:

1. Bejelentkezés fog kérni az Azure-ba – kövesse az utasításokat az authentikációhoz
1. Adjon meg egy egyedi környezet nevet – például én a `nitya-mshack-azd` nevet használtam
1. Ez létrehozza a `.azure/` mappát – látni fog egy al-mappát a környezet nevével
1. Kéri a feliratkozási név kiválasztását – válassza az alapértelmezettet
1. Kéri a hely kiválasztását – használja az `East US 2` helyet

Most várjon a provisioning befejezéséig. **Ez 10-15 percet vesz igénybe**

1. Amikor kész, a terminál egy SUCCESS üzenetet fog megjeleníteni, valahogy így:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Az Azure Portalban most már rendelkezni fog egy az adott környezet neve szerinti erőforráscsoporttal:

      ![Infra](../../../../../translated_images/hu/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Most már készen áll az infrastruktúra és az alkalmazás érvényesítésére**.

---

## 4. Sablon érvényesítése

1. Látogasson el az Azure Portál [Erőforráscsoportok](https://portal.azure.com/#browse/resourcegroups) oldalára – jelentkezzen be, ha kéri
1. Kattintson a környezeti nevéhez tartozó erőforráscsoportra – az imént látott oldal fog megjelenni

      - kattintson az Azure Container Apps erőforrásra
      - kattintson az Alkalmazás URL-re az _Essentials_ résznél (jobb felső sarok)

1. Egy ilyen, hosztolt alkalmazás front-end UI-t kell látnia:

   ![App](../../../../../translated_images/hu/03-test-application.471910da12c3038e.webp)

1. Tegyen fel néhány [mintakérdést](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Tegye fel: ```Mi Franciaország fővárosa?``` 
      1. Tegye fel: ```Mi a legjobb sátor két személynek 200 dollár alatt, és milyen funkciókat tartalmaz?```

1. Hasonló válaszokat fog kapni, mint az alábbi képen. _De hogyan működik ez?_

      ![App](../../../../../translated_images/hu/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Ügynök érvényesítése

Az Azure Container App deployol egy végpontot, amely kapcsolódik az MI ügynökhöz, amely a Microsoft Foundry projektjében lett létrehozva ezen sablonhoz. Nézzük meg, mit jelent ez.

1. Térjen vissza az Azure Portál _Áttekintés_ oldalára az erőforráscsoportjánál

1. Kattintson a `Microsoft Foundry` erőforrásra ezen a listán

1. Ezt kell látnia. Kattintson a `Go to Microsoft Foundry Portal` gombra.
   ![Foundry](../../../../../translated_images/hu/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Látni fogja a Foundry Projekt oldalt az MI alkalmazásához
   ![Project](../../../../../translated_images/hu/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Kattintson az `Agents` menüpontra – látni fogja az alapértelmezett Ügynököt a projektben
   ![Agents](../../../../../translated_images/hu/06-visit-agents.bccb263f77b00a09.webp)

1. Válassza ki – megjelennek az Ügynök részletei. Jegyezze meg a következőket:

      - Az ügynök alapértelmezettként File Search-t használ (mindig)
      - Az ügynök `Knowledge` mutatja, hogy 32 fájlt töltöttek fel (a fájlkereséshez)
      ![Agents](../../../../../translated_images/hu/07-view-agent-details.0e049f37f61eae62.webp)

1. Keresse meg a bal oldali menüben a `Data+indexes` lehetőséget, és kattintson a részletekért.

      - Látni fogja a 32 adatfájlt, amelyet a tudásbázishoz feltöltöttek.
      - Ezek megfelelnek a 12 ügyfélfájlnak és 20 termékfájlnak a `src/files` alatt
      ![Data](../../../../../translated_images/hu/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Érvényesítette az Ügynök működését!**

1. Az ügynök válaszai azokban a fájlokban lévő tudáson alapulnak.
1. Most már kérdéseket tehet fel ezzel az adattal kapcsolatban, és megalapozott válaszokat kap.
1. Példa: a `customer_info_10.json` leírja "Amanda Perez" 3 vásárlását

Lépjen vissza a böngészőablakhoz az Container App végponthoz, és kérdezze meg: „Milyen termékek vannak Amanda Perez tulajdonában?”. Valami ilyesmit fog látni:

![Data](../../../../../translated_images/hu/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Ügynök játékterem

Építsünk egy kicsit több intuíciót a Microsoft Foundry képességeiről azzal, hogy kipróbáljuk az Ügynököt az Agents Playground-ban.

1. Térjen vissza az `Agents` oldalra a Microsoft Foundry-ban – válassza ki az alapértelmezett ügynököt
1. Kattintson a `Try in Playground` opcióra – egy ilyen Playground UI jelenik meg
1. Tegye fel ugyanazt a kérdést: „Milyen termékek vannak Amanda Perez tulajdonában?”

    ![Data](../../../../../translated_images/hu/09-ask-in-playground.a1b93794f78fa676.webp)

Ugyanazt (vagy hasonló) választ kapja – de további információkat is lát, amelyek segítségével megértheti az ügynökalapú alkalmazás minőségét, költségét és teljesítményét. Például:

1. Vegye észre, hogy a válasz hivatkozik a válasz alapjául szolgáló adatfájlokra
1. Vigye az egérmutatót ezekre a fájlcímkékre – egyezik-e az adat a lekérdezésével és a megjelenített válasszal?

Láthat egy _statisztikai_ sort a válasz alatt.

1. Vigye az egeret bármelyik mutató fölé – pl. Safety. Ilyet fog látni
1. Az értékelt besorolás egyezik-e az Ön intuíciójával a válasz biztonsági szintjére vonatkozóan?

      ![Data](../../../../../translated_images/hu/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Beépített megfigyelhetőség

A megfigyelhetőség az alkalmazás műszerezésére vonatkozik, hogy adatokat generáljon, amelyek segítségével megérthetjük, hibakereshetjük és optimalizálhatjuk a működését. Ehhez:

1. Kattintson a `View Run Info` gombra – ezt a nézetet fogja látni. Ez egy példa az [Agent nyomkövetésre](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) működés közben. _Ezt a nézetet a Thread Logs menüpontjával is elérheti a főmenüben._

   - Tájékozódjon a végrehajtási lépésekről és az ügynök által igénybe vett eszközökről
   - Értse meg a teljes token számot (a kimenő tokenek használatához viszonyítva) a válaszra
   - Értse meg a késleltetést és hogy a végrehajtás mely részein telik el az idő

      ![Agent](../../../../../translated_images/hu/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Kattintson a `Metadata` fülre, hogy további attribútumokat lásson, amelyek hasznos kontextust nyújthatnak hibák későbbi elemzéséhez.

      ![Agent](../../../../../translated_images/hu/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Kattintson az `Evaluations` fülre, hogy megnézze az automatikus értékeléseket az ügynök válaszaira. Ide tartozik a biztonsági értékelés (pl. Önkárosítás) és az ügynökspecifikus értékelések (pl. szándékfeloldás, feladathűség).

      ![Agent](../../../../../translated_images/hu/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Végül, kattintson a `Monitoring` fülre az oldalsáv menüben.

      - Válassza ki a megjelenő oldalon az `Erőforrás-használat` fület – és tekintse meg a mutatókat.
      - Figyelje az alkalmazás használatát költségek (tokenek) és terhelés (kérések) szempontjából.
      - Figyelje az alkalmazás késleltetését az első bájttól (bemenet feldolgozása) az utolsó bájtig (kimenet).

      ![Agent](../../../../../translated_images/hu/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Környezeti változók

Eddig végigjártuk a telepítést a böngészőből – és érvényesítettük, hogy az infrastruktúránk létrejött és az alkalmazás működik. De az alkalmazáskóddal _elsőként_ dolgozva a helyi fejlesztői környezetünket kell beállítanunk a szükséges változókkal, amelyek az erőforrásokkal való munkához kellenek. Az `azd` használata ezt megkönnyíti.

1. Az Azure Developer CLI [környezeti változókat használ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) az alkalmazástelepítések konfigurációs beállításainak tárolására és kezelésére.

1. A környezeti változókat a `.azure/<env-name>/.env` fájlban tárolja – ez a telepítés során használt `env-name` környezethez köti őket, és segít elkülöníteni a különböző telepítési célok környezeteit ugyanabban a tárolóban.

1. A környezeti változókat az `azd` parancs automatikusan tölti be, amikor végrehajt egy adott parancsot (pl. `azd up`). Fontos megjegyezni, hogy az `azd` nem olvassa be automatikusan az _operációs rendszer szintű_ környezeti változókat (pl. shell-ben beállítottakat) – e helyett használja az `azd set env` és `azd get env` parancsokat az információk szkriptek közötti továbbítására.


Próbáljunk ki néhány parancsot:

1. Listázza az összes azd-hez beállított környezeti változót ebben a környezetben:

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

1. Lekérdez egy konkrét értéket – pl. meg akarom tudni, be lett-e állítva az `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Ilyet fog látni – alapértelmezés szerint nem lett beállítva!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Állítson be egy új környezeti változót az azd-hez. Itt az ügynök modell nevét frissítjük. _Megjegyzés: az itt végzett változtatások azonnal megjelennek a `.azure/<env-name>/.env` fájlban._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Most már az értéknek beállítottnak kell lennie:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Vegye figyelembe, hogy egyes erőforrások állandóak (pl. modell telepítések), és több, mint egy `azd up` parancsra van szükség a redeployhoz. Próbáljuk meg eltávolítani az eredeti telepítést, majd újratelepíteni a módosított környezeti változókkal.

1. **Frissítés** Ha korábban telepített már infrastruktúrát egy azd sablon segítségével – akkor _frissítheti_ a helyi környezeti változók állapotát az aktuális Azure telepítés alapján ezzel a paranccsal:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Ez egy erőteljes módszer arra, hogy két vagy több helyi fejlesztési környezet között _szinkronizáld_ a környezeti változókat (pl. több fejlesztőből álló csapat esetén) - lehetővé téve, hogy a telepített infrastruktúra szolgáljon az env változók állapotának valós alapjaként. A csapattagok egyszerűen _frissítik_ a változókat, hogy újra szinkronban legyenek.

---

## 9. Gratulálunk 🏆

Most fejeztél be egy teljes folyamatot, amely során:

- [X] Kiválasztottad a használandó AZD sablont
- [X] Megnyitottad a sablont egy támogatott fejlesztési környezetben
- [X] Telepítetted a sablont, és megerősítetted, hogy működik

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:  
Ez a dokumentum az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) használatával készült. Bár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum a saját nyelvén tekintendő irányadónak. Fontos információk esetén szakmai, emberi fordítást javasolt igénybe venni. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->