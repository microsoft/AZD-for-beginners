# Vytváranie vlastnej šablóny azd

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD For Beginners](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 4 - Infrastruktúra ako kód a nasadenie
- **⬅️ Predchádzajúce**: [Sprievodca nasadením](deployment-guide.md)
- **🚀 Ďalšia kapitola**: [Kapitola 5: Riešenia s viacerými agentmi](../chapter-05-multi-agent/README.md)

> Overené voči `azd 1.25.6` v júni 2026.

## Úvod

Doteraz ste *používali* šablóny s `azd init --template <name>`. Ale keď budete mať rozloženie projektu, ktoré váš tím preferuje—napríklad Container App s Cosmos DB a vhodným monitorovaním—budete chcieť premeniť ho na znovupoužiteľnú šablónu. Šablóna je len Git repozitár s predvídateľnou štruktúrou, ktorú vie azd prečítať. Táto lekcia vám ukáže, ako ju vytvoriť od začiatku, otestovať a (voliteľne) zverejniť v galérii komunity.

## Ciele učenia

Na konci tejto lekcie budete:
- Pochopiť, čo robí priečinok "azd template"
- Poznať potrebné súbory a rozloženie priečinkov
- Pridať `azure.yaml` a `infra/`, ktoré môžu ostatní znovu použiť
- Otestovať šablónu lokálne pred zdieľaním
- Zverejniť ju a (voliteľne) odoslať do Awesome AZD

## Výsledky učenia

Po dokončení tejto lekcie budete schopní:
- Vytvoriť základný repozitár šablóny
- Parametrizovať infraštruktúru tak, aby fungovala v ľubovoľnom predplatnom
- Overiť šablónu pomocou `azd init` a `azd up`
- Pridať metaúdaje, ktoré vyžaduje galéria komunity

---

## Čo je to vlastne šablóna?

Azd šablóna je **Git repozitár**, ktorý obsahuje minimálne:

| Súbor / priečinok | Účel | Povinné? |
|---------------|---------|-----------|
| `azure.yaml` | Popisuje služby, hostiteľov a poskytovateľa infraštruktúry | ✅ Áno |
| `infra/` | Bicep, Terraform alebo Pulumi, ktoré zriaďujú zdroje | ✅ Áno |
| `src/` (or your code) | Kód aplikácie, ktorý azd nasadí | ✅ Áno |
| `README.md` | Ako používať šablónu | ✅ Dôrazne odporúčané |
| `.azdo/` or `.github/` | Definície CI/CD pipeline | Voliteľné |
| `.devcontainer/` | Reprodukovateľné vývojové prostredie | Voliteľné |
| `azure.yaml` `metadata` | Informácie do galérie a telemetrie | Voliteľné (potrebné na publikovanie) |

Nie je za tým žiadna mágia: keď spustíte `azd init --template you/your-repo`, azd sklonuje repozitár a prečíta `azure.yaml`.

---

## Krok 1: Vytvorenie štruktúry repozitára

Vytvorte štruktúru priečinkov ručne alebo začnite z minimálnej šablóny a upravte ju:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Vytvorte štandardné rozloženie
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

## Krok 2: Napísať `azure.yaml`

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

> Pole `metadata.template` je to, čo telemetria galérie používa na počítanie použitia. Použite konvenciu `name@version`.

---

## Krok 3: Parametrizujte infraštruktúru

Najdôležitejšie pravidlo pre *znovupoužiteľnú* šablónu: **nikdy nezakódujte napevno mená, regióny ani hodnoty špecifické pre predplatné.** Používajte parametre a vzor resource token, aby tá istá šablóna fungovala v predplatnom kohokoľvek.

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

Dve veci robia šablónu vhodnou pre znovupoužitie:

1. **`azd-env-name` tag** — azd ho používa na sledovanie a čistenie zdrojov podľa prostredia.
2. **`uniqueString(...)` resource token** — vygeneruje stabilný, globálne jedinečný suffix, takže mená sa nebudú prekrývať.

Poskytnite zodpovedajúci súbor parametrov, ktorý načítava hodnoty, ktoré azd vloží zo prostredia:

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

azd automaticky nahradí `${AZURE_ENV_NAME}` a `${AZURE_LOCATION}` hodnotami z aktuálneho prostredia.

---

## Krok 4: Otestujte šablónu lokálne

Pred zdieľaním overte, že šablóna funguje z čistého stavu.

**Testujte z lokálneho priečinka** (nie je potrebné posielať do Gitu):

```bash
# Z prázdneho adresára inicializujte pomocou lokálnej cesty k šablóne
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Zabezpečenie infraštruktúry a nasadenie od začiatku do konca
azd auth login
azd up
```

**Potom otestujte odstránenie** — dobrá šablóna sa úplne vyčistí:

```bash
azd down --force --purge
```

Ak `azd down` zanecháva prostriedky, pravdepodobne ste zabudli pridať tag `azd-env-name` na niektorý zdroj.

> **Tip:** spustite najprv `azd provision --preview`. Vykoná what-if (simuláciu) a odhalí chyby v šablóne skôr, než sa vytvorí akýkoľvek zdroj.

---

## Krok 5: Zverejnenie šablóny

Pošlite repozitár na GitHub (verejný, ak chcete, aby ho používali ďalší):

```bash
gh repo create my-azd-template --public --source=. --push
```

Teraz ho môže použiť ktokoľvek:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Krok 6 (voliteľné): Odoslať do Awesome AZD

Galéria [Awesome AZD](https://azure.github.io/awesome-azd/) obsahuje komunitné šablóny. Aby ste boli zaradení, váš repozitár by mal obsahovať:

- ✅ Jasný `README.md` s požiadavkami, architektonickým diagramom a poznámkami o nákladoch
- ✅ Funkčný `azure.yaml` s `metadata.template`
- ✅ Infraštruktúru, ktorá sa nasadí čisto v novom predplatnom
- ✅ Súbor `LICENSE`
- ✅ (Odporúčané) `.devcontainer/` pre spustenie Codespaces jedným klikom

Odoslať to môžete otvorením pull requestu, ktorý pridá vašu šablónu do dátového súboru galérie, podľa príručky prispievania v [repozitári Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Bežné úskalia

| Problém | Riešenie |
|---------|-----|
| Napevno zadané mená zdrojov | Použiť `uniqueString()` resource token |
| `azd down` zanecháva prostriedky | Otagujte každý zdroj (alebo skupinu zdrojov) tagom `azd-env-name` |
| Šablóna funguje u vás, zlyháva u iných | Odstráňte ID predplatného, ID tenanta a predpoklady týkajúce sa regiónu |
| Výstupy nie sú prepojené s aplikáciou | Exportujte `SERVICE_<NAME>_ENDPOINT_URL` a ďalšie výstupy `AZURE_*` |
| Odmietnuté zaradenie do galérie | Pridajte `README.md`, `LICENSE` a `metadata.template` |

---

## Zhrnutie

- Šablóna je len Git repozitár s `azure.yaml`, `infra/` a vaším kódom.
- Parametrizujte všetko — mená, regióny a ID — aby fungovala kdekoľvek.
- Vždy označujte zdroje tagom `azd-env-name`, aby `azd down` fungoval.
- Otestujte lokálne s `azd init --template <local-path>` pred publikovaním.
- Pridajte metaúdaje a README, aby ste mohli odoslať šablónu do Awesome AZD.

---

## 🔗 Navigácia

| Smer | Zdroj |
|-----------|----------|
| **Predchádzajúce** | [Sprievodca nasadením](deployment-guide.md) |
| **Domov kapitoly** | [Kapitola 4: Infrastruktúra ako kód](README.md) |
| **Ďalšia kapitola** | [Kapitola 5: Riešenia s viacerými agentmi](../chapter-05-multi-agent/README.md) |

## 📖 Súvisiace zdroje

- [Zriaďovanie zdrojov](provisioning.md)
- [Galéria Awesome AZD](https://azure.github.io/awesome-azd/)
- [Oficiálna dokumentácia šablón azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->