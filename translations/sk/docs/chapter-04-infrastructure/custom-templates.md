# Vytváranie vlastnej šablóny azd

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 4 - Infrastruktúra ako kód a nasadenie
- **⬅️ Predchádzajúca**: [Návod na nasadenie](deployment-guide.md)
- **🚀 Ďalšia kapitola**: [Kapitola 5: Riešenia s viacerými agentmi](../chapter-05-multi-agent/README.md)

> Skontrolované podľa `azd 1.37.2` (november 2026). Toto je **sprievodca tvorbou s čiastočnými súbormi**, nie kompletná šablóna: pred nasadením musíte dodať aplikačný kód a `modules/web.bicep` s jeho prostredím, registrom, Container App a výstupmi. V tejto revízii nebolo vykonané provisionovanie Azure.

## Úvod

Zatiaľ ste *používali* šablóny s `azd init --template <name>`. Ale keď budete mať rozloženie projektu, ktoré váš tím má rád – napríklad Container App s Cosmos DB a vhodným monitorovaním – budete chcieť vytvoriť vlastnú znovupoužiteľnú šablónu. Šablóna je len Git repozitár so predvídateľnou štruktúrou, ktorú azd vie prečítať. Tento návod vám ukáže, ako šablónu vytvoriť od začiatku, otestovať a (voliteľne) zverejniť v komunite.

## Ciele učenia

Na konci tejto lekcie budete:
- Rozumieť, čo tvorí "azd šablónu"
- Poznať požadované súbory a rozloženie priečinkov
- Pridať `azure.yaml` a `infra/`, ktoré môžu ostatní používať
- Otestovať šablónu lokálne pred zdieľaním
- Publikovať ju a (voliteľne) poslať do Awesome AZD

## Výsledky učenia

Po dokončení lekcie budete vedieť:
- Vytvoriť novú templátovú repozitárovú štruktúru
- Parametrizovať infraštruktúru tak, aby fungovala v akejkoľvek predplatnom
- Overiť šablónu pomocou `azd init` a `azd up`
- Pridať metaúdaje požadované komunitnou galériou

---

## Čo vlastne je šablóna?

Azd šablóna je **Git repozitár**, ktorý obsahuje minimálne:

| Súbor / priečinok | Účel | Povinné? |
|---------------|---------|-----------|
| `azure.yaml` | Popisuje služby, hostiteľov a poskytovateľa infraštruktúry | ✅ Áno |
| `infra/` | Definície provisionovania v Bicep alebo Terraform | Povinné pre tento explicitný príklad IaC; projekty s generovanou infraštruktúrou ho môžu vynechať |
| `src/` (alebo váš kód) | Aplikačný kód, ktorý azd nasadzuje | Povinné pre služby založené na zdrojových kódoch; nie všetky šablóny obsahujú aplikačný kód |
| `README.md` | Ako používať šablónu | ✅ Dôrazne odporúčané |
| `.azdo/` alebo `.github/` | Definície CI/CD pipeline | Voliteľné |
| `.devcontainer/` | Reprodukovateľné vývojové prostredie | Voliteľné |
| `azure.yaml` `metadata` | Identita/telemetria šablóny | Odporúčané; publikovanie Git repozitára to nevyžaduje |

Nie je na tom nič magické: keď spustíte `azd init --template you/your-repo`, azd naklonuje repozitár a prečíta `azure.yaml`.

---

## Krok 1: Vytvorte štruktúru repozitára

Vytvorte priečinkovú štruktúru ručne alebo začnite z minimálnej šablóny a upravte ju:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Typické hotové rozloženie vyzerá takto:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## Krok 2: Napíšte `azure.yaml`

Toto je jadro šablóny. Hovorí azd, čo a ako nasadiť:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Pole `metadata.template` sa používa na telemetriu galérie na sledovanie používania. Použite konvenciu `name@version`.

---

## Krok 3: Parametrizujte infraštruktúru

Najdoležitejšie pravidlo pre *znovupoužiteľnú* šablónu: **nikdy nezadávajte názvy, regióny ani predplatné pevne do kódu.** Používajte parametre a vzor tokenu zdrojov, aby šablóna fungovala v predplatnom kohokoľvek.

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Dve veci robia túto šablónu priateľskou:

1. **`azd-env-name` tag** — azd ho používa na sledovanie a čistenie zdrojov podľa prostredia.
2. **`uniqueString(...)` resource token** — vytvára stabilný hashový suffix na zníženie kolízií; nie je to záruka globálnej jedinečnosti.

Chýbajúci `modules/web.bicep` musí prijať `name`, `location` a `tags`, provisionovať prostredie/registrov Container Apps a aplikáciu, označiť aplikáciu značkou `azd-service-name: web` a exportovať `uri`. Tiež musí sprístupniť hodnoty registra potrebné pre vybraný build/deploy tok (napríklad `AZURE_CONTAINER_REGISTRY_ENDPOINT` z koreňového modulu). Výstup samotného endpointu nezapája service discovery, nastavenia aplikácie ani autentifikáciu registra.

Poskytnite zodpovedajúci súbor parametrov, ktorý načíta hodnoty, ktoré azd automaticky injektuje z prostredia:

Uložte nasledujúce ako `infra/main.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

Azd automaticky nahrádza `${AZURE_ENV_NAME}` a `${AZURE_LOCATION}` z aktuálneho prostredia.

---

## Krok 4: Otestujte svoju šablónu lokálne

Pred zdieľaním dokážte, že šablóna funguje z čistého stavu.

**Testujte z lokálneho priečinka** (nie je potrebné pushovať na Git):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Potom otestujte zrušenie** — dobrá šablóna dôkladne vyčistí všetko:

```bash
azd down --force --purge
```

Ak `azd down` necháva za sebou zdroje, skontrolujte zistenie prostredia/skupiny zdrojov, externé/zdieľané zdroje, povolenia, zámky a ochranu pred vymazaním. `--purge` neodstráni lokálny stav `.azure/`.

> **Tip:** po doplnení všetkých chýbajúcich súborov najprv spustite `azd provision --preview`. Skontrolujte hooky pred preview, pretože môžu vykonávať príkazy vedľajších efektov. Preview nie je oceňovanie ani záruka úspešného provisionovania.

---

## Krok 5: Publikujte šablónu

Pushnite repozitár na GitHub (verejný, ak chcete, aby ju používali aj ostatní):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Ktokoľvek ju teraz môže použiť:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Krok 6 (voliteľné): Odoslať do Awesome AZD

Galéria [Awesome AZD](https://azure.github.io/awesome-azd/) obsahuje šablóny od komunity. Aby bol váš repozitár zaradený, mal by obsahovať:

- ✅ Jasný `README.md` s predpokladmi, architektonickým diagramom a poznámkami o nákladoch
- ✅ Fungujúci `azure.yaml` s `metadata.template`
- ✅ Infraštruktúru, ktorá sa čisto vytvorí v novom predplatnom
- ✅ Súbor `LICENSE`
- ✅ (Odporúčané) `.devcontainer/` pre jedným kliknutím Codespaces

Príspevok odošlite otvorením pull requestu, ktorý pridá vašu šablónu do dátového súboru galérie, podľa návodu na prispievanie v repozitári [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Bežné nástrahy

| Nástraha | Riešenie |
|---------|-----|
| Tvrdé kódované názvy zdrojov | Použite `uniqueString()` token zdroja |
| `azd down` označuje zdroje | Označte každý zdroj (alebo skupinu zdrojov) pomocou `azd-env-name` |
| Šablóna funguje pre vás, zlyháva pre ostatných | Odstráňte ID predplatného, ID nájomcu a predpoklady regiónu |
| Výstupy nie sú prepojené s aplikáciou | Zodpovedajte `azd-service-name`/`resourceName` pre nasadenie a výslovne mapujte výstupy na nastavenia aplikácie |
| Odmietnutie odoslania do galérie | Pridajte `README.md`, `LICENSE` a `metadata.template` |

---

## Zhrnutie

- Šablóna je len Git repozitár s `azure.yaml`, `infra/` a vaším kódom.
- Parametrizujte všetko — mená, regióny a ID — aby fungovala kdekoľvek.
- Vždy označujte zdroje pomocou `azd-env-name`, aby fungovalo `azd down`.
- Testujte lokálne s `azd init --template <local-path>` pred zverejnením.
- Pridajte metaúdaje a README pre odoslanie do Awesome AZD.

---

## 🔗 Navigácia

| Smer | Zdroj |
|-----------|----------|
| **Predchádzajúce** | [Sprievodca nasadením](deployment-guide.md) |
| **Domov kapitoly** | [Kapitola 4: Infraštruktúra ako kód](README.md) |
| **Nasledujúca kapitola** | [Kapitola 5: Riešenia s viacerými agentmi](../chapter-05-multi-agent/README.md) |

## 📖 Súvisiace zdroje

- [Zdroje na poskytovanie](provisioning.md)
- [Úžasná galéria AZD](https://azure.github.io/awesome-azd/)
- [Oficiálna dokumentácia šablón azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->