# Vytvoření vlastního azd šablony

**Navigace kapitolou:**
- **📚 Domů kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 4 - Infrastruktura jako kód & nasazení
- **⬅️ Předchozí**: [Průvodce nasazením](deployment-guide.md)
- **🚀 Další kapitola**: [Kapitola 5: Víceagentní řešení](../chapter-05-multi-agent/README.md)

> Validováno na `azd 1.27.1` v červenci 2026.

## Úvod

Dosud jste *používali* šablony pomocí `azd init --template <name>`. Jakmile však máte rozvržení projektu, které se vašemu týmu líbí — například Container App s Cosmos DB a správným monitorováním — budete chtít vytvořit vlastní znovupoužitelnou šablonu. Šablona je jednoduše Git repozitář s předvídatelnou strukturou, kterou azd umí číst. V této lekci uvidíte, jak vytvořit šablonu od začátku, otestovat ji a (volitelně) publikovat do komunitní galerie.

## Cíle učení

Na konci této lekce budete:
- Rozumět, co dělá složku "azd šablonou"
- Znát požadované soubory a rozložení složek
- Přidat `azure.yaml` a `infra/`, které mohou ostatní znovu použít
- Otestovat svou šablonu lokálně před sdílením
- Publikovat ji a (volitelně) odeslat do Awesome AZD

## Výsledky učení

Po dokončení této lekce budete umět:
- Vytvořit novou šablonu repozitáře
- Parametrizovat infrastrukturu tak, aby fungovala v jakémkoli předplatném
- Validovat šablonu pomocí `azd init` a `azd up`
- Přidat metadata, které komunita galerie vyžaduje

---

## Co je to šablona vlastně?

Azd šablona je **Git repozitář**, který obsahuje minimálně:

| Soubor / složka | Účel | Povinné? |
|---------------|---------|-----------|
| `azure.yaml` | Popisuje služby, hostitele a poskytovatele infrastruktury | ✅ Ano |
| `infra/` | Bicep, Terraform nebo Pulumi pro provisionování zdrojů | ✅ Ano |
| `src/` (nebo váš kód) | Kód aplikace, který azd nasazuje | ✅ Ano |
| `README.md` | Jak šablonu používat | ✅ Silně doporučeno |
| `.azdo/` nebo `.github/` | Definice CI/CD pipeline | Nepovinné |
| `.devcontainer/` | Reprodukovatelné vývojové prostředí | Nepovinné |
| `azure.yaml` `metadata` | Informace o galerii + telemetrii | Nepovinné (povinné pro publikaci) |

Není zde žádná magie: když spustíte `azd init --template you/your-repo`, azd naklonuje repozitář a přečte `azure.yaml`.

---

## Krok 1: Vytvořte strukturu repozitáře

Vytvořte strukturu složek ručně nebo začněte z minimální šablony a upravte ji:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Vytvořit standardní rozvržení
mkdir -p src infra
```

Typické dokončené rozložení vypadá takto:

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

## Krok 2: Napište `azure.yaml`

Toto je srdcem šablony. Říká azd, co má nasadit a jak:

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

> Pole `metadata.template` používá galerie telemetrie pro počítání použití. Použijte konvenci `name@version`.

---

## Krok 3: Parametrizujte infrastrukturu

Jediné nejdůležitější pravidlo pro *znovupoužitelnou* šablonu: **nikdy nezadávejte pevně názvy, oblasti nebo hodnoty specifické pro předplatné.** Používejte parametry a vzor tokenu zdroje, aby stejná šablona fungovala v libovolném předplatném.

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

Dvě věci dělají tuto šablonu vhodnou pro šablony:

1. **Tag `azd-env-name`** — azd jej používá ke sledování a úklidu zdrojů podle prostředí.
2. **Token zdroje `uniqueString(...)`** — vytváří stabilní, globálně unikátní příponu, aby se názvy nekolidovaly.

Přidejte odpovídající soubor parametrů, který čte hodnoty, které azd vkládá ze prostředí:

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

azd automaticky nahrazuje `${AZURE_ENV_NAME}` a `${AZURE_LOCATION}` z aktuálního prostředí.

---

## Krok 4: Otestujte svou šablonu lokálně

Před sdílením ověřte, že šablona funguje ze čistého stavu.

**Testujte z lokální složky** (není potřeba push do Gitu):

```bash
# Z prázdného adresáře inicializujte pomocí vaší lokální cesty šablony
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Kompletní zřízení a nasazení od začátku do konce
azd auth login
azd up
```

**Pak otestujte odstranění** — dobrá šablona vše kompletně smaže:

```bash
azd down --force --purge
```

Pokud `azd down` nechává zdroje, pravděpodobně jste zapomněli na tag `azd-env-name` na některém zdroji.

> **Tip:** nejprve spusťte `azd provision --preview`. Provede what-if analýzu a ukáže chyby šablony před vytvořením jakéhokoli zdroje.

---

## Krok 5: Publikujte šablonu

Nahrajte repozitář na GitHub (veřejný, pokud chcete, aby jej ostatní používali):

```bash
gh repo create my-azd-template --public --source=. --push
```

Nyní ji může používat kdokoliv:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Krok 6 (volitelný): Odešlete do Awesome AZD

Galerie [Awesome AZD](https://azure.github.io/awesome-azd/) uvádí komunitní šablony. Aby byl váš repozitář zařazen, měl by obsahovat:

- ✅ Jasný `README.md` s předpoklady, diagramem architektury a poznámkami o nákladech
- ✅ Funkční `azure.yaml` s `metadata.template`
- ✅ Infrastrukturu, která se čistě provisionuje v novém předplatném
- ✅ Soubor `LICENSE`
- ✅ (Doporučeno) `.devcontainer/` pro jedno-klikové Codespaces

Odeslat můžete vytvořením pull requestu, který přidá vaši šablonu do datového souboru galerie podle pokynů v příručce přispívání v [Awesome AZD repozitáři](https://github.com/Azure/awesome-azd).

---

## Běžné problémy

| Problém | Řešení |
|---------|-----|
| Pevně zadaná jména zdrojů | Použijte token zdroje `uniqueString()` |
| `azd down` nechává zdroje | Označte každý zdroj (nebo skupinu zdrojů) tagem `azd-env-name` |
| Šablona funguje pro vás, ale ne pro ostatní | Odstraňte ID předplatného, ID tenantů a předpoklady o oblastech |
| Výstupy nejsou propojeny s aplikací | Exportujte `SERVICE_<NAME>_ENDPOINT_URL` a další výstupy `AZURE_*` |
| Zamítnutí odeslání do galerie | Přidejte `README.md`, `LICENSE` a `metadata.template` |

---

## Shrnutí

- Šablona je jen Git repozitář s `azure.yaml`, `infra/` a vaším kódem.
- Vše parametrizujte — jména, oblasti i ID — aby fungovala kdekoliv.
- Vždy označujte zdroje tagem `azd-env-name`, aby `azd down` fungovalo.
- Testujte lokálně pomocí `azd init --template <local-path>` před publikováním.
- Přidejte metadata a README pro odeslání do Awesome AZD.

---

## 🔗 Navigace

| Směr | Zdroj |
|-----------|----------|
| **Předchozí** | [Průvodce nasazením](deployment-guide.md) |
| **Domů kapitoly** | [Kapitola 4: Infrastruktura jako kód](README.md) |
| **Další kapitola** | [Kapitola 5: Víceagentní řešení](../chapter-05-multi-agent/README.md) |

## 📖 Související zdroje

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Oficiální dokumentace azd šablon](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->