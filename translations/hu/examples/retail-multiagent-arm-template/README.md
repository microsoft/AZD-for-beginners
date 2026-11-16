# Kiskereskedelmi Többügynökös Infrastruktúra Keret

**Fejlett architektúra példa — nem működő többügynökös alkalmazás.**

[Tanfolyam főoldala](../../README.md) ·
[5. fejezet](../../docs/chapter-05-multi-agent/README.md) ·
[Architektúra tervrajz](../retail-scenario.md)

## Amit ez telepít

Ez a könyvtár tartalmaz egy ARM sablont, paramétereket és egy Bash telepítő scriptet.
Nincs **`azure.yaml` vagy kiskereskedelmi alkalmazásforrás**.

| Erőforrás | Aktuális állapot az előkészítés után |
|---|---|
| Elsődleges Azure OpenAI fiók | `gpt-4.1-chat` telepítés `gpt-4.1` verzióval `2025-04-14`, `GlobalStandard` |
| Másodlagos OpenAI fiók (opcionális) | `gpt-4.1-mini-inventory`, `gpt-4.1-mini` modell `2025-04-14` verzióval, `GlobalStandard` |
| Embeddings fiók (opcionális) | `text-embedding-ada-002` `2` verzió, `Standard`; nincs indexelési feldolgozás |
| Grader OpenAI fiók | `gpt-4.1-grader`, `gpt-4.1` modell `2025-04-14` verzióval, `GlobalStandard`; nincs értékelő |
| AI Search | Üres szolgáltatás; nincs index vagy dokumentum |
| Storage | Üres `documents` és `uploads` blob konténerek |
| Cosmos DB | Serverless fiók, `chathistory` adatbázis, `conversations` konténer `/userId` partícionálással, 30 napos elem TTL |
| Container Apps | Router és frontend egyaránt fut `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` port 80-on |
| Key Vault (opcionális) | Üres, RBAC engedélyezett kulcstároló; **nincsenek titkok vagy szerepkör-hozzárendelések** |
| Application Insights / Log Analytics (opcionális) | Erőforrások és környezeti naplógyűjtés; nincs egyedi alkalmazásműszerelés, riasztás vagy irányítópult |
| Document Intelligence | S0 fiók; nincs dokumentumfeldolgozási munkafolyamat |

A Legacy Bing Search v7 2025. augusztus 11-én megszűnt és **nem került előkészítésre**.
Nincs megvalósítva helyettesítő webes alapozás integráció.

**Nem tartalmazza:** ügyfél/készlet ügynökök, router `/chat` API, frontend chat UI,
keresési séma vagy betöltő szkriptek, Azure Container Registry, privát végpontok,
kezelt identitások, RBAC hozzárendelések, automatikus failover, Front Door, red-team
szkenner, értékelő CLI, hitelesítés vagy CI/CD.

Egy ARM sikerüzenet csak az erőforrás előkészítését igazolja. Nem tanúsítja
az alkalmazás működését, biztonságát, elérhetőségét vagy éles üzemre készült állapotát.

## Előfeltételek és költségek

- Bash (Git Bash/WSL Windows-on) és
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Előfizetés, amely jogosultsággal rendelkezik az összes felsorolt erőforrás létrehozására.
- Ellenőrizze az **egy-egy modell/verzió/SKU elérhetőségét minden kiválasztott régióban** és
  az előfizetése kvótáját. Az alapértelmezettek példák, nem garanciák.
  Nézze meg a [modell elérhetőséget](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Válasszon ki egy dedikált erőforráscsoportot, amelyet törölhet tesztelés után.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Alapértelmezett helyek: elsődleges `eastus2`, másodlagos `westus2`, embeddings `francecentral`;
a grader az elsődleges régiót használja alapértelmezettként, hacsak nem adott `graderLocation`.
`--no-multi-region` kihagyja a másodlagos és embeddings fiókokat; a
grader fiókot nem hagyja ki.

A Search díjköteles, amíg előkészítve van, még akkor is, ha üres. A konténer minimális replikái,
a tároló redundanciája, Cosmos DB kérések/tárolás, modell tokenek, Document Intelligence
hívások, és a napló betöltése/tárolása további költségeket okozhat. Nincs **fix vagy validált
havi összes** költség. Becslést készítsen a pontos SKU-król az
[Azure árazó kalkulátor](https://azure.microsoft.com/pricing/calculator/) segítségével, és
állítson be költségkeretet a telepítés előtt.

### Telepítési módok

Ezek az értékek erőforrás méretek, **nem éles üzem vagy SLA tanúsítványok**:

| Mód | Chat / mini / embedding / grader kapacitás egységek | Router példányok | Frontend példányok | Search szint | Tároló |
|---|---|---|---|---|---|
| minimális | 10 / 10 / 20 / 5 | 0–3 | 1–2 | alap, 1 példány | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 példány | Standard_ZRS |
| prémium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 példány | Standard_GRS |

A modell kapacitás egységek modell/SKU specifikusak; ne összegezze őket általános TPM
garanciaként. A prémium nem engedélyezi a zónaredundáns Container Apps-et: ez további
hálózati tervezést igényel. Az alap Search támogatja a vektoros keresést, szolgálati
korlátok függvényében; nem alapból inkompatibilis a vektorokkal.

## 🚀 Gyors Telepítés

Először nézze át a `azuredeploy.json` és `azuredeploy.parameters.json` fájlokat. Az alábbi parancsok
**számlázandó Azure erőforrásokat hoznak létre**; nem offline ellenőrzések.

A tárház gyökérkönyvtárából:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

A szkript saját könyvtárához viszonyított útvonalakat használ, ellenőrzi a bejelentkezést/eszközöket/paramétereket,
létrehozza az erőforrás-csoportot, ha hiányzik, érvényesíti a telepítést, előkészít, és
megjeleníti a nem titkosított kimeneteket. Nem szükséges vagy történik `jq`, adatfeltöltés, titok lekérés,
vagy telepítés utáni alkalmazás beállítás.

A szkript alapértelmezett parancssori értékei felülírják a paraméter fájl megfelelő értékeit.
Szerkessze a paraméter fájlt például másodlagos/harmadlagos
régiók beállításához; közvetlen CLI telepítéssel hajthat végre tetszőleges paraméter felülírást:

```bash
az group create --name retail-learning-rg --location eastus2
az deployment group create \
  --resource-group retail-learning-rg \
  --name retail-learning \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --parameters projectName=retail environmentName=dev \
    deploymentMode=minimal enableMultiRegion=false
```

A kiépítés 15–45 percig vagy tovább is tarthat, és meghiúsulhat régiók szerinti kvóták vagy
a modell életciklus korlátozásai miatt. Ne próbálkozzon vakon újra: először olvassa el a sikertelen műveletet.

## Konfigurációs opciók

| Paraméter | Alapértelmezett a sablonban | Jelentés |
|---|---|---|
| `projectName` | Kötelező (`retail` a paraméterfájlban) | 3–10 kisbetűs betű/szám |
| `location` | Erőforráscsoport helyszíne | Elsődleges régió (`eastus2` a paraméterfájlban) |
| `secondaryLocation` | `westus2` | Mini modell fiók régiója |
| `tertiaryLocation` | `francecentral` | Beágyazások fiók régiója |
| `graderLocation` | Elsődleges régió | Független értékelő fiók régiója |
| `environmentName` | `dev` | `dev`, `staging` vagy `prod`; csak név, nem keményítési kapcsoló |
| `deploymentMode` | `standard` | SKU/kapacitás választás |
| `enableMultiRegion` | `true` | Másodlagos és beágyazás fiókok hozzáadása |
| `enableMonitoring` | `true` | Insights/munkaterület és környezeti naplógyűjtés hozzáadása |
| `enableSecurity` | `true` | Csak egy üres, RBAC-képes kulcsőrző létrehozása |

A félrevezető `openAiApiVersion` paraméter eltávolításra került: egy adatforgalmi API verzió
nem irányítja az ARM erőforrásverziókat vagy a modellverziókat. A modell név/verzió párok
megtalálhatók az `variables.modelDeployments`-ben; ellenőrizze őket a telepítési SKU-val együtt.

## Telepítés ellenőrzése

Használja a telepítés nevét a szkript kimenetéből vagy az `az deployment group list`-ből.
A közvetlen fenti telepítés esetén:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Várt állapot: telepítési állapot `Succeeded`. Sikertelenség esetén vizsgálja meg a művelet hiba
részleteit. Csak az erőforrás-lista kimenete nem megbízható telepítési állapot ellenőrzés.

Tesztelje a **root** helyőrzőt, ne nem létező ügynök végpontot:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Várt eredmény: HTTP 200 hello-world oldal, **nem csevegő válasz**. Egy HTTP hiba
nem számít sikeres ellenőrzésnek.

Az aktuális elsődleges modell következtetésének teszteléséhez (számlázandó):

```bash
OPENAI_ENDPOINT=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.openAiEndpointPrimary.value -o tsv)
OPENAI_NAME=$(az cognitiveservices account list -g "$RG" \
  --query "[?kind=='OpenAI' && contains(name, '-openai-primary-')].name | [0]" -o tsv)
OPENAI_KEY=$(az cognitiveservices account keys list -g "$RG" -n "$OPENAI_NAME" \
  --query key1 -o tsv)
curl --fail-with-body \
  "${OPENAI_ENDPOINT%/}/openai/deployments/gpt-4.1-chat/chat/completions?api-version=2024-10-21" \
  -H "Content-Type: application/json" -H "api-key: $OPENAI_KEY" \
  -d '{"messages":[{"role":"user","content":"Say hello"}],"max_tokens":20}'
unset OPENAI_KEY
```

Várt eredmény: JSON tartalmazza az `choices` és `usage` értékeket. A telepítés neve
az `gpt-4.1-chat`, nem az alapul szolgáló modell neve `gpt-4.1`.

## 🔧 Telepítés utáni lépések

Ez egy **fejlesztési feladatlista**, nem egy befejezett feladat:

1. Hitelesített ügyfél/készlet ügynökök és útválasztó szerződés megvalósítása.
2. Frontend megvalósítása és konfigurációjának validálása.
3. Keresési index létrehozása és feltöltése az ön beágyazási modelljének
   dimenziójával/profiljával, valamint dokumentumhibák és frissítések kezelése.
4. Regiszter létrehozása és képletöltéshez szükséges identitás/jogosultság beállítása.
5. Valódi képek építése és feltöltése. A konténeralkalmazás bejövő portjainak és ellenőrzéseinek módosítása,
   hogy megfeleljenek ezeknek a képeknek tesztelés előtt; itt a 80-as port a helyőrzőké.
6. Titkok vagy kezelt identitások és korlátozott adat-plane szerepkörök konfigurálása. Ne
   hivatkozzon képzeletbeli titoknevekre: ez a sablon nem hoz létre alkalmazási titkokat.
7. Alkalmazások instrumentálása, riasztások beállítása, hiba/helyreállítás tesztelése és az
   eredmények értékelése reprezentatív valós adatok és emberi ellenőrzés alapján.

Lásd az [architektúra tervrajzot](../retail-scenario.md) a tervezési határokért.

## Hibakeresés és biztonsági határok

- **Modell nem elérhető:** ellenőrizze a modellt/verziót/SKU-t, régiót és előfizetési kvótát;
  a szkript nem ellenőrzi előre a modellkatalógusokat.
- **Monitoring letiltva:** a környezeti napló célja `none`, nem érvénytelen üres Log Analytics konfiguráció.

- **Csak helyőrzők:** `/chat`, ügynök értékelés és fájl bevitel nem létezik.
- **Hálózat/identitás:** publikus végpontok és helyi hitelesítés engedélyezve van.
  Csak a Key Vault RBAC engedélyezése nem hoz létre szerepkör hozzárendeléseket vagy identitásokat.
- **Éles üzem:** adjon hozzá hitelesítést, korlátozott identitásokat, titokkezelést,
  privát hálózatot, ahol megfelelő, elérhetőségi tervezést és működési teszteket.
  Többrégiós modell számlák önmagukban nem biztosítanak failovert.

## Takarítás

Itt nincs AZD projekt; az `azd down` nem a takarító parancs.
Miután ellenőrizte, hogy a csoport csak a tanuló erőforrásokat tartalmazza:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Várt eredmény a törlés befejezése után: `false`. A Key Vault és Cognitive Services
lágyan törölt erőforrásai megtarthatják neveiket; a végleges törléshez megfelelő jogosultságok szükségesek.
Ellenőrizze a Költségkezelést a késleltetett használati díjak miatt.

[Hibabejelentés](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->