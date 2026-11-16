# 5. Egy sablon testreszabása

!!! tip "A MODUL VÉGÉRE KÉPES LESZ"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Alapvonal létrehozása

Használja a korábbi modulokból származó inicializált [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) adattárat. Jegyezze fel a sablon verzióját, az AZD verziót, a kiválasztott környezetet, a modell telepítését és a működő mintakérdéseket, mielőtt bármit is megváltoztatna.

A minta egy ügynök által támogatott csevegőalkalmazást valósít meg. Nem válik két-ügynökös kiskereskedelmi rendszerré pusztán azzal, hogy környezeti változókat állít be vagy további utasításfájlokat ment el. További ügynökök, eszközkezelők, irányítás, engedélyezés és adat-hozzáférés alkalmazáskódot igényel.

Vizsgálja meg a jelenleg telepített ügynök utasításait és eszközeit a Foundry-ban. Teszteljen egy ténykérdést, egy lekérdezési kérdést és egy kérdést, amelyre a mintában szereplő adatok nem tudnak választ adni. Ellenőrizze a hivatkozásokat a tényleges forrásdokumentumokkal szemben, ne feltételezze, hogy a folyékony válasz helyes.

## 5.2 Tudáslekérés testreszabása

A sablon támogatja a fájl alapú lekérést és az opcionális Azure AI Search integrációt. Kövesse a [jelenlegi AI Search útmutatót](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) indexeléshez és eszközkonfigurációhoz.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

A szolgáltatás engedélyezése csak egy része a lekérésnek. Mielőtt feltöltené saját adatait:

1. Győződjön meg arról, hogy jogosult a dokumentumok használatára és távolítsa el az érzékeny információkat.
2. Válasszon egy az adott régióban támogatott beágyazási modellt, és állítsa be annak kompatibilis verzióját, telepítési típusát és vektorméretét.
3. Hozza létre/készítse el az indexet a minta dokumentált folyamata alapján.
4. Állítsa be az ügynök lekérő eszközét az adott index használatára.
5. Tesztelje a lekérést, hivatkozásokat, engedélyezést és a viselkedést, ha nincs releváns dokumentum.

Ne váltson `text-embedding-3-small`-ról más beágyazási modellre anélkül, hogy ellenőrizné a dimenziókat és szükség esetén újraépítené/újraindexelné a vektorokat. Egy olyan név, mint `retail-products`, nem valósított meg katalógus vagy hozzáférési szabályzat.

## 5.3 Követés és monitorozás

Kövesse a [minta megfigyelhetőségi útmutatóját](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Győződjön meg arról, hogy a szükséges Application Insights erőforrás és kapcsolat már létezik; ha infrastruktúra beállításokat változtat, használja `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Küldjön tesztkérést, majd vizsgálja meg a Container App alkalmazásnaplóit és az ügynök követési nézetét a Foundry-ban. Ellenőrizze a késleltetést, eszközhívásokat, hibákat és a kérés és a követés közötti kapcsolatot. Ne feltételezze, hogy a telemetria csatlakoztatva van pusztán a sikeres telepítés miatt.

Hagyja a `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT`-at kikapcsolva, hacsak kifejezetten nem tekintette át a beleegyezést, törlést, megőrzést és hozzáférés-szabályozást. A követések tartalmazhatnak érzékeny eszközparamétereket vagy dokumentumtartalmat még akkor is, ha az alkalmazásnaplók ártalmatlannak tűnnek.

## 5.4 Ügynök értékelése

A minta értékelési belépési pontja most [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), nem egy `evals/` könyvtár. A minta gyökérkönyvtárából használjon egy Python környezetet, amely megfelel a dokumentált követelményeknek:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

A futtatás előtt fejezze be a [értékelési előfeltételeket](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). A tesztek a kiválasztott `.azure/<environment>/.env` konfigurációját töltik be; erősítse meg, hogy a kívánt környezet van kiválasztva. Fontos bemenetek:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, a jelenlegi minta által megkövetelt formátummal (a felülvizsgált verzió `agent_name:agent_version`-ot használ)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, mint a bíró-modell telepítése

Vizsgálja meg a teszteket az értékelő választásának, küszöbértékeknek, szükséges szerepeknek és modellköltségeknek a megértéséhez. Egy befejezett futás nem automatikusan átmenő minőségi kapu; nézze meg az eredményeket, hibás/hibás eseteket és a kapcsolódó Foundry eredményeket.

### Különálló AZD értékelések bővítmény

A fenti Python teszt egy **minta-specifikus munkafolyamat**. Az opcionális `azure.ai.evaluations` bővítmény egy másik munkafolyamat, saját `evals/azure.eval.yaml` konfigurációval:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Teljes bővítmény beállításhoz lásd: [értékelési munkafolyamatok és migráció](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Az agents bővítmény beta.22 verziója óta ne használja az eltávolított `azd ai agent eval` parancsokat. Az értékelési bővítmény telepítése nem konvertálja át automatikusan a minta Python tesztjeit, sem nem hoz létre automatikusan értékelési konfigurációt.

## 5.5 Mesterséges intelligencia red teaming és folyamatos értékelés

A jelenlegi minta biztosít [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Fejezze be annak előfeltételeit és tekintse át a kívánt célt és költségeket futtatás előtt:

```bash
pytest tests/test_red_teaming.py -s
```

Használjon engedélyezett teszt telepítést és szintetikus adatokat. Tekintse át a generált támadásokat és eredményeket; ez a vizsgálat nem bizonyítja, hogy egy alkalmazás biztonságos vagy megfelelőségi szempontból megfelelő.

A [megfigyelhetőségi útmutató](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) a konténer indításakor konfigurált folyamatos értékelést is ismerteti. Ez valódi felhasználói interakciókat értékel, nem generált tesztforgalmat, és az értékelő támogatása régiónként változó. Interakció hiányában nincs értékelési bejegyzés. Ellenőrizze a telepített minta verzióját és az értékelő konfigurációját, ne feltételezze, hogy minden telepítés azonos alapbeállításokat használ.

Azonosítás külön van az értékeléstől. Kövesse a minta dokumentált identitás/hozzáférés beállítását. Nincs dokumentált „alap autentikációs visszaesési” lehetőség, amelyre támaszkodhat egy nyilvános végpont védelméhez.

## 5.6 Tervezési gyakorlat: kiskereskedelmi testreszabás

!!! warning "Tervezési gyakorlat, nem kész telepítés"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Írjon egy rövid tervet, amely foglalkozik:

| Terület | Döntés és a gyűjtendő bizonyíték |
|------|----------------------------------|
| Ügynök felelősségek | Kezdjen egy ügynökkel, vagy indokolja külön Bevásárló és Hűség ügynökök és irányítás szükségességét |
| Adatok | Határozzon meg szintetikus katalógus/jutalom adatsort és frissítési tulajdonjogot |
| Eszközök | Először implementáljon csak olvasható kezelőket; írjon engedélyezést és érvényesítést minden írásra |
| Modellek | Válasszon elérhető modell/verzió/SKU kombinációkat és ellenőrizze a kvótát; kerüljön el nem használt modellek előkészítését |
| Lekérés | Határozza meg az indexelést, beágyazási dimenziókat, hivatkozásokat és dokumentumszintű hozzáférési szabályokat |
| Értékelés | Adjon hozzá elvárt válasz, nem támogatott kérdés, eszközhasználat és biztonsági eseteket explicit küszöbökkel |
| Működés | Határozza meg a telemetriát, késleltetési/hiba költségkeretet, költségkorlátokat és takarítási felelősséget |

Az `custom-agents/shopper-agent-instructions.md` mentése nem eredményezi, hogy a minta betöltse azt. Keresse meg az alkalmazáskódot, amely létrehozza/frissíti az ügynököt, kapcsolja be oda a felülvizsgált utasításokat, és ellenőrizze a kapott ügynök verzióját a tesztelés előtt. Az utasítások nem adhatnak hozzáférést olyan adatokhoz vagy eszközökhöz, amelyeket nem valósított meg.

Alkalmazzon egy változtatást egyszerre, telepítse újra az érintett komponenseket, és futtassa újra az alapvonal kérdéseket és értékeléseket. Tartson meg egy működő verziót összehasonlítás céljából. Architektúra inspirációként lásd a [kiskereskedelmi tervrajzot](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), amely szintén nem egy teljes kiskereskedelmi alkalmazás.

!!! quote "A LABOR VÉGÉRE EZEK KELL, HOGY MEGLEGYENEK"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Folytassa a [Infrastruktúra lebontását](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->