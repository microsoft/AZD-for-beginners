# Példák — Angol Forrás és Azure Minták

Ezek tanulási minták, nem éles üzemre hitelesített alkalmazások. Olvassa el az egyes
példák előfeltételeit, korlátozásait, költségeit és takarítási utasításait futtatás előtt.
Az Azure elérhetőségét és kvótáit a saját előfizetésében kell ellenőrizni.

- [Tanfolyam kezdőoldala](../README.md)
- [Telepítés](../docs/chapter-01-foundation/installation.md)
- [Hibaelhárítás](../docs/chapter-07-troubleshooting/common-issues.md)

## Mi létezik valójában helyben

Négy **alkalmazásmintát** és egy **infrastruktúra vázat** találunk:

| Példa | Helyi megvalósítás | Tanulási fókusz | Szint |
|---|---|---|---|
| [Egyszerű Flask API](../../../examples/container-app/simple-flask-api) | Flask CRUD API, Dockerfile, Bicep, `azure.yaml` | Konténer telepítés, health checkek, naplók | Kezdő |
| [Két szolgáltatásos mikroszolgáltatások](../../../examples/container-app/microservices) | Node.js gateway és csak-olvasás Python termékszolgáltatás, Dockerfile-ök, Bicep, `azure.yaml` | Belső HTTPS kommunikáció, önálló skálázás | Középhaladó |
| [Adatbázis alkalmazás](../../../examples/database-app) | Flask olvasó API, Azure SQL, App Service, Bicep, `azure.yaml` | SQL kapcsolódás, inicializálás, naplók | Középhaladó |
| [Azure OpenAI chat](../../../examples/azure-openai-chat) | Helyi Python CLI, Azure OpenAI és Key Vault Bicep, kizárólag infrastruktúra `azure.yaml` | Modell ellátás, chat előzmények, token becslések | Középhaladó |
| [Kiskereskedelmi infrastruktúra](../../../examples/retail-multiagent-arm-template) | ARM sablon, paraméterek, Bash telepítő script; csak **hello-world konténerek** | Infrastruktúra egy jövőbeli multi-agent alkalmazáshoz | Haladó |

A [kiskereskedelmi forgatókönyv](retail-scenario.md) egy **architektúra tervrajz**, nem egy
teljes multi-agent megvalósítás. Nem tartalmaz kiskereskedelmi ügynök kódot, chat felületet,
router API-t, kereső adat-pipeline-t, értékelő CLI-t, automatikus átváltást vagy éles
üzemre erősítést. Ezeket külön kell megtervezni, felépíteni és tesztelni.

A [mikroszolgáltatások áttekintése](microservices/README.md) a futtatható
két szolgáltatás mintára mutat; ez nem egy külön telepítési könyvtár.

## Ajánlott tanulási útvonal

1. Telepítse a Flask API-t és ellenőrizze `/health` működését és a CRUD műveleteket.
2. Telepítse az adatbázis alkalmazást és ellenőrizze az öt előre feltöltött terméket.
3. Telepítse a két szolgáltatásos példát és ellenőrizze a gateway-ről termék szolgáltatásra irányuló kéréseket.
4. Létrehozza a chat erőforrásokat és futtassa az interaktív CLI-t **helyileg**.
5. Tanulmányozza a kiskereskedelmi tervrajzot a működő példák befejezte után.

Szánjon körülbelül 30–60 percet egy-egy alkalmazásmintára, beleértve az előfeltételeket és
az ellenőrzést. A kiskereskedelmi megvalósítás egy külön fejlesztési projekt, nem egy
30 perces workshop. Az architektúra olvasása kb. 2–3 órát vesz igénybe; a megvalósítás
és az éles használatra való alkalmasság jelentősen hosszabb időt igényelhet, mint az illusztrált
80–120 fejlesztési óra a kalauzban.

## Gyors kezdés

A tároló gyökeréből, az első konténer mintához:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Várt eredmény: HTTP 200 és JSON, ami tartalmazza `"status": "healthy"`.
Docker szükséges a helyi konténer építéshez.

Chat esetén kövesse a [chat README](azure-openai-chat/README.md) útmutatót: használja
`azd provision`, töltse be az API kulcsot a Key Vaultból a jelenlegi shellbe, telepítse
`src/requirements.txt`, és futtassa `python src/chat.py`. Nincs hosztolt chat szolgáltatás.

Kiskereskedelemhez használja az [ARM útmutatót](retail-multiagent-arm-template/README.md).
Ez nem tartalmaz `azure.yaml` és **nem** telepíthető vagy törölhető `azd up`/`azd down` segítségével.

## Költségek és korlátozások

- Minden telepítés díjköteles Azure erőforrásokat hoz létre. A skálázás nullára csak az
  alkalmazási számításokra vonatkozik; nem szünteti meg a registry, adatbázis, tárolás, keresés vagy naplók költségeit.
- A pontos árak régiótól, valutától, forgalomtól, modelltől/SKU-tól és tárolási időtől függnek.
  Használja az [Azure árkalkulátort](https://azure.microsoft.com/pricing/calculator/)
  telepítés előtt, és állítson be költségkeretet az Azure Cost Managementben.
- A Flask CRUD adatok memória alapúak, alapértelmezés szerint egy munkás és legfeljebb egy replikára korlátozva.
  Újraindításkor vagy skálázás nullára esetén törlődnek. Ez nem tartós tárolás.
- A termék mikroszolgáltatás csak GET végpontokat nyújt. Nem tartalmaz rendelés szolgáltatást, felhasználó
  szolgáltatást, adatbázist, Service Bus-t, C#-t vagy Go megvalósítást.
- Application Insights erőforrások nem instrumentálják automatikusan az összes alkalmazást.
  Minden példában ellenőrizze a ténylegesen kibocsátott telemetriát.
- A példák nem valósítanak meg alkalmazás hitelesítést. Adja hozzá azonosítást, engedélyezést,
  tartós tárolást, hálózati szabályozásokat, teszteket és működtetési eljárásokat élesbe kerülés előtt.

## Külső Azure minták — külön klónozza

Ezek a linkek külön repository-kra mutatnak, **nem helyi példák**.
Karbantartóik felelősek a beállítási utasításokért, megvalósításért, függőségekért és költségekért.

| Minta | Fókusz |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Node.js alkalmazás adatbázissal |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# és Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Statikus frontend C# Functions és SQL háttérrel |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Python szerver nélküli alkalmazás |
| [Container Apps store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Konténerizált áruház backend |
| [AI chat quickstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | Mesterséges intelligencia chat alkalmazás |
| [AI agents quickstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | Ügynök alkalmazás |
| [Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Keresés és idézések RAG technológiával |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Konverzációs MI példa |
| [Java on Container Apps](https://github.com/Azure-Samples/java-on-aca) | Java mikroszolgáltatások |

További projekteket talál a [AZD sablon galériában](https://azure.github.io/awesome-azd/).
Ne feltételezze, hogy egy külső projekt támogatja `azd` anélkül, hogy ellenőrizné a jelenlegi README-t.

## Repository struktúra

```text
examples/
├── azure-openai-chat/               # Local CLI + model infrastructure
├── container-app/
│   ├── simple-flask-api/            # Single Flask API
│   └── microservices/               # Gateway + read-only product service
├── database-app/                    # Flask + Azure SQL on App Service
├── microservices/README.md          # Navigation to the canonical example
├── retail-multiagent-arm-template/  # Infrastructure scaffold only
└── retail-scenario.md               # Architecture blueprint
```

Nincs közös `configurations/`, `scripts/` vagy teszt könyvtár, amit ez az index ígérne.
A tényleges fájlokat és opcionális bővítési ötleteket minden útmutatóban meghatározzuk.

## Tisztítás

A négy AZD minta esetén futtassa ezt a **kiválasztott mintakönyvtárból**:

```bash
azd down
```

Nézze át a törlés megerősítést. Kiskereskedelem esetén csak az ön által létrehozott dedikált erőforráscsoportot törölje
az ARM útmutató utasításai szerint. Ellenőrizze az Azure Cost Managementet
a tisztítás után; a számlázási adatok késve érkezhetnek.

## Közreműködés

Minden alkalmazásmintához mellékelje a forráskódot, infrastruktúrát, telepítési konfigurációt, végrehajtható beállítási és
ellenőrzési lépéseket, korlátozásokat és tisztítási utasításokat. Az architektúra-only anyagokat és hiányos kivágatokat
egyértelműen jelölje meg.
Ne állítsa, hogy készen áll a termelésre telepítés, funkcionális és működtetési tesztek nélkül.

[GYIK](../resources/faq.md) · [Tanulmányi útmutató](../resources/study-guide.md) ·
[Hiba bejelentése](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->