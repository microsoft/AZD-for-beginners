# 5. Testreszabni egy sablont

!!! tip "A MODUL VÉGÉRE KÉPES LESZ"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Alapvonal létrehozása

Használja a korábbi modulokból származó inicializált [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) tárolót. Rögzítse a sablon verzióját, az AZD verziót, a kiválasztott környezetet, a modell telepítését és a működő mintakérdéseket, mielőtt bármit megváltoztat.

A minta egy ügynök által támogatott csevegőalkalmazást valósít meg. Ez **nem** válik két-ügynökös kiskereskedelmi rendszerré pusztán azzal, hogy környezeti változókat állít be vagy további utasításfájlokat ment el. Extra ügynökök, eszközkezelők, irányítás, engedélyezés és adat-hozzáférés alkalmazáskódot igényelnek.

Vizsgálja meg a jelenleg telepített ügynök utasításait és eszközeit a Foundry-ban. Teszteljen egy tényszerű kérdést, egy visszakeresési kérdést, és egy olyan kérdést, amelyre a mintában található adatok nem tudnak választ adni. Ellenőrizze a hivatkozásokat a tényleges forrásdokumentumok alapján, ne feltételezze automatikusan, hogy a gördülékeny válasz helyes.

## 5.2 Tudás-visszakeresés testreszabása

A sablon támogatja a fájl alapú visszakeresést és az opcionális Azure AI Search integrációt. Kövesse a [aktuális AI Search útmutatót](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) az indexeléshez és az eszköz konfigurációhoz.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

A szolgáltatás engedélyezése csak az egyik része a visszakeresésnek. Mielőtt feltöltené a saját adatait:

1. Győződjön meg arról, hogy jogosult a dokumentumok használatára, és távolítsa el az érzékeny információkat.
2. Válasszon az Ön régiójában támogatott beágyazó modellt, és állítsa be annak kompatibilis verzióját, telepítés típusát és vektordimenzióit.
3. Hozza létre/töltse fel az indexet a mintában dokumentált folyamat szerint.
4. Állítsa be az ügynök visszakeresési eszközét, hogy az az indexet használja.
5. Tesztelje a visszakeresést, a hivatkozásokat, az engedélyezést és a viselkedést, ha nincs releváns dokumentum.

Ne váltson `text-embedding-3-small` modellről másik beágyazó modellre anélkül, hogy ellenőrizné a dimenziókat és szükség esetén újraépítené/újraindexelné a vektorokat. Egy név, mint például `retail-products` nem megvalósított katalógus vagy hozzáférés-vezérlési szabályzat.

## 5.3 Követés és megfigyelés

Kövesse a [minta megfigyelhetőségi útmutatóját](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Győződjön meg róla, hogy a szükséges Application Insights erőforrás és kapcsolat már létezik; ha infrastruktúra beállításokat változtat, használja az `azd up` -t.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Küldjön tesztkérést, majd vizsgálja meg a Container App alkalmazásnaplóit és az ügynök követési nézetét a Foundry-ban. Ellenőrizze a késleltetést, az eszközhívásokat, a hibákat és a kérés és követés közötti összefüggést. Ne feltételezze, hogy a telemetria csatlakoztatva van pusztán azért, mert a telepítés sikeres volt.

Hagyja az `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` letiltva, hacsak kifejezetten nem tekintette át a hozzájárulást, az eltávolítást, a megőrzést és a hozzáférés-vezérlést. A követések érzékeny eszközparamétereket vagy dokumentum tartalmat is tartalmazhatnak, még ha a szokásos alkalmazásnaplók ártalmatlannak is tűnnek.

## 5.4 Ügynök értékelés

A minta értékelési belépési pontja most [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), nem pedig egy `evals/` könyvtár. A minta gyökérből használjon egy Python környezetet, amely megfelel a dokumentált követelményeknek:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Futtatás előtt fejezze be a [értékelési előfeltételeket](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). A tesztek konfigurációt töltenek be a kiválasztott `.azure/<environment>/.env` -ból; ellenőrizze, hogy a kívánt környezet van-e kiválasztva. Fontos bemenetek:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, a mintában jelenleg használt formátumban (a felülvizsgált verzió `agent_name:agent_version` -t használ)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, amelyet bíró modell telepítésként használnak

Vizsgálja meg a teszteket az értékelő választásának, küszöbértékeknek, szükséges szerepköröknek és a modell költségeknek a megértéséhez. A végrehajtott futtatás nem automatikusan minőségi átjáró; ellenőrizze az eredményeket, a sikertelen/hibás eseteket és a kapcsolódó Foundry eredményeket.

### Különálló AZD értékelések bővítmény

A fenti Python teszt egy **minta-specifikus munkafolyamat**. Az opcionális `azure.ai.evaluations` bővítmény más munkafolyamatot jelent, saját `evals/azure.eval.yaml` konfigurációval. Ezt külön kell telepíteni, nem része az általánosan elérhető `microsoft.foundry` 1.0 csomagnak:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Teljes bővítmény beállításért lásd a [értékelési munkafolyamatok és migráció](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md) dokumentációt. Az agents bővítmény beta.22 verziójától ne használja a megszűnt `azd ai agent eval` parancsokat. Az értékelési bővítmény telepítése nem konvertálja a minta Python tesztjeit, és nem hoz létre automatikusan értékelési konfigurációt.

Egy különálló **GA hosted-agent gyakorlat** esetén használjon egy üres mappát ezen a workshopon kívül, és kövesse a [Foundry helyi-tól-felhő bejárást](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Ez AZD 1.37.0+ -ot, a `microsoft.foundry` csomagot, Python 3.13+ -at és aktuális uv-t használ. Meg fogja vizsgálni az `azure.yaml` -t, helyben tesztel Agent Inspectorral, telepíti a forrást távoli Foundry buildhez, és létrehoz/megvizsgál egy adatkészletet és értékelő sablont, mielőtt konfigurálná az `azd ai eval init --name quality` -t. Ne helyettesítse a minta tesztjeit, és ne gondolja, hogy a csomag telepítése megváltoztatja a hosztolási modellt.

## 5.5 Mesterséges intelligencia red teaming és folyamatos értékelés

Az aktuális minta biztosítja a [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py) lehetőséget. Fejezze be az előfeltételeket, és tekintse át a célzott célt és költségeket futtatás előtt:

```bash
pytest tests/test_red_teaming.py -s
```

Használjon engedélyezett teszt telepítést és szintetikus adatokat. Vizsgálja át a generált támadásokat és eredményeket; ez a vizsgálat nem bizonyítja, hogy a alkalmazás biztonságos vagy megfelel a követelményeknek.

A [megfigyelhetőségi útmutató](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) a konténer indításakor konfigurált folyamatos értékelést is leírja. Ez valódi felhasználói interakciókat értékel, nem generált tesztforgalmat, és az értékelő támogatás régiónként változik. Nincs interakció, nincs értékelési bejegyzés. Ellenőrizze a telepített minta verziót és az értékelő konfigurációt, ne feltételezze, hogy minden telepítés ugyanazokat az alapbeállításokat használja.

Az autentikáció különválik az értékeléstől. Kövesse a minta dokumentált azonosító/hozzáférési beállításait. Nincs dokumentált „alap hitelesítés visszatérés”, amire egy nyilvános végpont védelmében lehetne támaszkodni.

## 5.6 Tervezési gyakorlat: kiskereskedelmi testreszabás

!!! warning "Tervezési gyakorlat, nem egy kész telepítés"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Írjon egy rövid tervet, amely kitér:

| Terület | Döntés és összegyűjtendő bizonyítékok |
|------|----------------------------------|
| Ügynök felelősségek | Kezdje egy ügynökkel, vagy indokolja külön Vásárlói és Hűség ügynököket és az irányítás logikáját |
| Adatok | Definiáljon egy szintetikus katalógus/jutalom adatkészletet és az frissítések tulajdonjogát |
| Eszközök | Valósítson meg először csak-olvasó kezelőket; határozza meg az engedélyezést és az érvényesítést az írásokra |
| Modellek | Válassza ki a rendelkezésre álló modell/verzió/SKU kombinációkat és ellenőrizze a kvótát; kerülje az nem használt modellek előkészítését |
| Visszakeresés | Határozza meg az indexelést, beágyazási dimenziókat, hivatkozásokat, és a dokumentum szintű hozzáférés-vezérlést |
| Értékelés | Adjon hozzá várható válasz, támogatatlan kérdés, eszköz használati és biztonsági eseteket explicit küszöbökkel |
| Üzemeltetés | Definiálja a telemetriát, késleltetés/hiba költségvetést, költséglimitet és a takarítás felelősségét |

A `custom-agents/shopper-agent-instructions.md` mentése nem okozza, hogy a minta betöltse azt. Keresse meg az alkalmazáskódot, amely létrehozza/frissíti az ügynököt, csatlakoztassa oda az átvizsgált utasításokat, és ellenőrizze az eredményül kapott ügynök verziót a tesztelés előtt. Az utasítások nem adhatnak hozzáférést olyan adatokhoz vagy eszközökhöz, amelyeket Ön nem valósított meg.

Egy változtatást alkalmazzon egyszerre, telepítse újra az érintett komponenseket, majd futtassa újra az alapvonal kérdéseket és értékeléseket. Tartson meg egy működő revíziót összehasonlítás céljából. Az architektúra inspirációért lásd a [kiskereskedelmi tervrajzot](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), amely szintén nem egy teljes kiskereskedelmi alkalmazás.

!!! quote "A LAB VÉGÉRE RENDELKEZNIE KELL"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Folytassa a [Infrastruktúra lebontásával](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->