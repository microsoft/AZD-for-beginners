# Vytváranie vlastnej šablóny azd

**Navigácia kapitolami:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 4 - Infrastruktúra ako kód a nasadenie
- **⬅️ Predchádzajúca**: [Sprievodca nasadením](deployment-guide.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 5: Riešenia s viacerými agentmi](../chapter-05-multi-agent/README.md)

> Overené s `azd 1.27.1` v júli 2026.

## Úvod

Doteraz ste *spotrebovali* šablóny pomocou `azd init --template <názov>`. Ale keď už máte rozloženie projektu, ktoré sa vášmu tímu páči—napríklad Container App s Cosmos DB a správnym monitorovaním—chcete ho premeniť na opakovane použiteľnú šablónu. Šablóna je jednoducho Git repozitár s predvídateľnou štruktúrou, ktorú azd vie načítať. Táto lekcia vám ukáže, ako ju vytvoriť od nuly, otestovať a (voliteľne) zverejniť v komunitnej galérii.

## Ciele učenia

Na konci tejto lekcie budete:
- Rozumieť, čo robí zložku "azd šablónou"
- Poznať potrebné súbory a rozloženie adresárov
- Pridať `azure.yaml` a `infra/`, ktoré môžu používať aj iní ľudia
- Otestovať šablónu lokálne pred zdieľaním
- Publikovať ju a (voliteľne) odoslať do Awesome AZD

## Výsledky učenia

Po dokončení tejto lekcie budete vedieť:
- Vytvoriť novú šablónu repozitára
- Parameterizovať infraštruktúru tak, aby fungovala v akomkoľvek predplatnom
- Overiť šablónu pomocou `azd init` a `azd up`
- Pridať metadáta, ktoré galéria vyžaduje

---

## Čo vlastne je šablóna?

Azd šablóna je **Git repozitár**, ktorý obsahuje minimálne:

| Súbor / adresár | Účel | Povinné? |
|---------------|---------|-----------|
| `azure.yaml` | Popis služieb, hostiteľov a poskytovateľa infraštruktúry | ✅ Áno |
| `infra/` | Bicep, Terraform alebo Pulumi, ktoré zriaďujú zdroje | ✅ Áno |
| `src/` (alebo váš kód) | Kód aplikácie, ktorý azd nasadzuje | ✅ Áno |
| `README.md` | Ako používať šablónu | ✅ Silne odporúčané |
| `.azdo/` alebo `.github/` | Definície CI/CD pipeline | Voliteľné |
| `.devcontainer/` | Reprodukovateľné vývojové prostredie | Voliteľné |
| `azure.yaml` `metadata` | Informácie pre galériu a telemetriu | Voliteľné (vyžaduje sa pre publikovanie) |

Nie je na tom nič magické: keď spustíte `azd init --template vy/vaš-repo`, azd sklonuje repozitár a prečíta `azure.yaml`.

---

## Krok 1: Vytvorte repozitár

Vytvorte štruktúru priečinkov ručne alebo začnite z minimálnej šablóny a upravte ju:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Vytvorte štandardné rozloženie
mkdir -p src infra
```

Typické finálne rozloženie vyzerá takto:

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

Toto je jadro šablóny. Hovorí azd, čo nasadiť a ako:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Pole `metadata.template` sa používa v telemetrii galérie na sledovanie používania. Použite konvenciu `name@version`.

---

## Krok 3: Parameterizujte infraštruktúru

Najdôležitejšie pravidlo pre *opakovane použiteľnú* šablónu: **nikdy nezadávajte napevno názvy, regióny alebo hodnoty špecifické pre predplatné.** Používajte parametre a vzor tokenov zdrojov, aby rovnaká šablóna fungovala v predplatnom kohokoľvek.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Dve veci robia túto šablónu priateľskou:

1. **Značka `azd-env-name`** — azd ju používa na sledovanie a upratovanie zdrojov podľa prostredia.
2. **Token zdroja `uniqueString(...)`** — vytvára stabilný, globálne unikátny príponový reťazec, aby sa názvy nepotkýnali.

Poskytnite zodpovedajúci súbor parametrov, ktorý číta hodnoty, ktoré azd z prostredia vkladá:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd automaticky nahrádza `${AZURE_ENV_NAME}` a `${AZURE_LOCATION}` z aktuálneho prostredia.

---

## Krok 4: Lokálne otestujte svoju šablónu

Pred zdieľaním overte, že šablóna funguje zoči-voči čistému stavu.

**Testujte z lokálneho priečinka** (netreba použiť Git push):

```bash
# Z prázdneho adresára inicializujte pomocou lokálnej šablóny cesty
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provision + nasadenie od začiatku do konca
azd auth login
azd up
```

**Potom otestujte odstránenie** — dobrá šablóna dôkladne uprace:

```bash
azd down --force --purge
```

Ak `azd down` zanechá zdroje, pravdepodobne vám chýba značka `azd-env-name` na zdroji.

> **Tip:** Najprv spustite `azd provision --preview`. Vykoná sa čo-ak analýza a zobrazia sa chyby šablóny pred vytvorením akéhokoľvek zdroja.

---

## Krok 5: Publikujte šablónu

Nahrajte repozitár na GitHub (verziu verejnú, ak chcete, aby ju používali iní):

```bash
gh repo create my-azd-template --public --source=. --push
```

Teraz ju môže používať ktokoľvek:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Krok 6 (voliteľné): Odoslať do Awesome AZD

Galéria [Awesome AZD](https://azure.github.io/awesome-azd/) obsahuje šablóny komunity. Na zaradenie by váš repozitár mal obsahovať:

- ✅ Jasný `README.md` s predpokladmi, diagram architektúry a poznámky o nákladoch
- ✅ Fungujúci `azure.yaml` s `metadata.template`
- ✅ Infraštruktúru, ktorá sa čisto zriaďuje v novom predplatnom
- ✅ Súbor `LICENSE`
- ✅ (Odporúčané) `.devcontainer/` pre jedným kliknutím Codespaces

Odoslať to môžete otvorením pull requestu, ktorý pridá vašu šablónu do dátového súboru galérie podľa príručky príspevkov v [Awesome AZD repozitári](https://github.com/Azure/awesome-azd).

---

## Bežné úskalia

| Úskalie | Riešenie |
|---------|----------|
| Napevno zadané názvy zdrojov | Použiť token zdroja `uniqueString()` |
| `azd down` nechá zdroje | Označiť každý zdroj (alebo skupinu zdrojov) značkou `azd-env-name` |
| Šablóna funguje u vás, zlyháva u iných | Odstrániť ID predplatných, tenantov a predpoklady o regiónoch |
| Výstupy nie sú prepojené s aplikáciou | Exportovať `SERVICE_<NAME>_ENDPOINT_URL` a ďalšie `AZURE_*` výstupy |
| Odmietnutie príspevku do galérie | Pridať `README.md`, `LICENSE` a `metadata.template` |

---

## Zhrnutie

- Šablóna je len Git repozitár s `azure.yaml`, `infra/` a vaším kódom.
- Parameterizujte všetko—mená, regióny a ID—aby to fungovalo kdekoľvek.
- Vždy označujte zdroje značkou `azd-env-name`, aby `azd down` fungoval.
- Najprv otestujte lokálne pomocou `azd init --template <local-path>` pred zverejnením.
- Pridajte metadáta a README, aby ste mohli odoslať do Awesome AZD.

---

## 🔗 Navigácia

| Smer | Zdroj |
|-----------|----------|
| **Predchádzajúce** | [Sprievodca nasadením](deployment-guide.md) |
| **Domov kapitoly** | [Kapitola 4: Infrastruktúra ako kód](README.md) |
| **Nasledujúca kapitola** | [Kapitola 5: Riešenia s viacerými agentmi](../chapter-05-multi-agent/README.md) |

## 📖 Súvisiace zdroje

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Oficiálna dokumentácia azd šablón](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->