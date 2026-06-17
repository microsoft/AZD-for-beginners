# Vytvoření vlastní šablony azd

**Navigace kapitoly:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 4 - Infrastruktura jako kód a nasazení
- **⬅️ Předchozí**: [Průvodce nasazením](deployment-guide.md)
- **🚀 Další kapitola**: [Kapitola 5: Řešení s více agenty](../chapter-05-multi-agent/README.md)

> Ověřeno s `azd 1.25.6` v červnu 2026.

## Úvod

Doposud jste *používali* šablony pomocí `azd init --template <name>`. Jakmile budete mít rozložení projektu, které se vašemu týmu líbí—například Container App s Cosmos DB a vhodným monitorováním—bude vhodné změnit ho na znovupoužitelnou šablonu. Šablona je jen Git repozitář s předvídatelnou strukturou, kterou azd umí číst. Tato lekce vám ukáže, jak ji vytvořit od začátku, otestovat a (volitelně) publikovat do komunitní galerie.

## Cíle učení

Na konci této lekce budete:
- Rozumět tomu, co dělá složku "azd template"
- Znát požadované soubory a strukturu složek
- Přidat `azure.yaml` a `infra/`, které mohou ostatní znovupoužít
- Otestovat šablonu lokálně před sdílením
- Publikovat ji a (volitelně) odeslat do Awesome AZD

## Výsledky učení

Po dokončení této lekce budete schopni:
- Vytvořit nový repozitář šablony
- Parametrizovat infrastrukturu tak, aby fungovala v libovolném předplatném
- Ověřit šablonu pomocí `azd init` a `azd up`
- Přidat metadata, která požaduje komunitní galerie

---

## Co je šablona ve skutečnosti?

Azd šablona je **Git repozitář**, který obsahuje alespoň:

| Soubor / složka | Účel | Požadováno? |
|---------------|---------|-----------|
| `azure.yaml` | Popisuje služby, hostitele a poskytovatele infra | ✅ Ano |
| `infra/` | Bicep, Terraform nebo Pulumi, které provisionují zdroje | ✅ Ano |
| `src/` (nebo váš kód) | Aplikační kód, který azd nasazuje | ✅ Ano |
| `README.md` | Jak šablonu používat | ✅ Důrazně doporučeno |
| `.azdo/` nebo `.github/` | Definice CI/CD pipeline | Volitelné |
| `.devcontainer/` | Reprodukovatelné vývojové prostředí | Volitelné |
| `azure.yaml` `metadata` | Informace pro galerii a telemetrii | Volitelné (vyžadováno pro publikování) |

Není na tom nic magického: když spustíte `azd init --template you/your-repo`, azd klonuje repozitář a přečte `azure.yaml`.

---

## Krok 1: Vytvořte strukturu repozitáře

Vytvořte strukturu složek ručně nebo začněte z minimální šablony a upravte ji:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Vytvořte standardní rozvržení
mkdir -p src infra
```

Typické hotové uspořádání vypadá takto:

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

Tohle je jádro šablony. Říká azd, co nasadit a jak:

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

> Pole `metadata.template` je to, co galerie využívá pro telemetrii k počítání použití. Použijte konvenci `name@version`.

---

## Krok 3: Parametrizujte infrastrukturu

Nejdůležitější pravidlo pro *znovupoužitelnou* šablonu: **nikdy nezakódovávejte napevno názvy, regiony nebo hodnoty specifické pro předplatné.** Používejte parametry a vzor resource token, aby stejná šablona fungovala v předplatném kohokoli.

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

Dvě věci činí tuto šablonu přívětivou:

1. **`azd-env-name` tag** — azd ho používá k sledování a úklidu zdrojů pro každé prostředí.
2. **`uniqueString(...)` resource token** — vytváří stabilní, globálně jedinečnou příponu, aby se názvy nekolidovaly.

Přidejte odpovídající soubor parametrů, který čte hodnoty, které azd injektuje z prostředí:

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

## Krok 4: Otestujte šablonu lokálně

Před sdílením prokažte, že šablona funguje ze čistého stavu.

**Testujte ze místní složky** (není potřeba žádné pushnutí do Gitu):

```bash
# V prázdném adresáři inicializujte pomocí lokální cesty k šabloně
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Zajistit prostředky a provést nasazení od začátku do konce
azd auth login
azd up
```

**Pak otestujte odstranění**—dobrá šablona vše kompletně smaže:

```bash
azd down --force --purge
```

Pokud `azd down` nechá za sebou zdroje, pravděpodobně vám na některém zdroji chybí tag `azd-env-name`.

> **Tip:** spusťte nejprve `azd provision --preview`. Provede what-if a odhalí chyby šablony dříve, než se vytvoří jakýkoli zdroj.

---

## Krok 5: Publikujte šablonu

Nahrajte repozitář na GitHub (veřejný, pokud chcete, aby jej ostatní používali):

```bash
gh repo create my-azd-template --public --source=. --push
```

Kdokoli ho nyní může použít:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Krok 6 (volitelně): Odeslat do Awesome AZD

Galerie [Awesome AZD](https://azure.github.io/awesome-azd/) uvádí komunitní šablony. Aby bylo vaše repo zařazeno, mělo by obsahovat:

- ✅ Jasný `README.md` s předpoklady, diagramem architektury a poznámkami k nákladům
- ✅ Funkční `azure.yaml` s `metadata.template`
- ✅ Infrastrukturu, která se bez problémů nasadí v čistém předplatném
- ✅ Soubor `LICENSE`
- ✅ (Doporučeno) `.devcontainer/` pro snadné spuštění v Codespaces

Odešlete to otevřením pull requestu, který přidá vaši šablonu do datového souboru galerie, podle pokynů pro přispívání v repozitáři [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Běžné problémy

| Problém | Řešení |
|---------|-----|
| Napevno zadané názvy zdrojů | Použijte resource token `uniqueString()` |
| `azd down` zanechá zdroje | Označte každý zdroj (nebo skupinu prostředků) tagem `azd-env-name` |
| Šablona funguje u vás, selhává u ostatních | Odstraňte ID předplatného, ID tenanta a předpoklady ohledně regionu |
| Výstupy nejsou propojeny s aplikací | Exportujte `SERVICE_<NAME>_ENDPOINT_URL` a další `AZURE_*` výstupy |
| Odmítnutí přidání do galerie | Přidejte `README.md`, `LICENSE` a `metadata.template` |

---

## Shrnutí

- Šablona je jen Git repozitář s `azure.yaml`, `infra/` a vaším kódem.
- Parametrizujte vše — názvy, regiony a ID — aby to běželo kdekoli.
- Vždy označujte zdroje tagem `azd-env-name`, aby `azd down` fungoval.
- Otestujte lokálně pomocí `azd init --template <local-path>` před publikováním.
- Přidejte metadata a README pro podání do Awesome AZD.

---

## 🔗 Navigace

| Směr | Zdroj |
|-----------|----------|
| **Předchozí** | [Průvodce nasazením](deployment-guide.md) |
| **Domov kapitoly** | [Kapitola 4: Infrastruktura jako kód](README.md) |
| **Další kapitola** | [Kapitola 5: Řešení s více agenty](../chapter-05-multi-agent/README.md) |

## 📖 Související zdroje

- [Zřizování zdrojů](provisioning.md)
- [Galerie Awesome AZD](https://azure.github.io/awesome-azd/)
- [Oficiální dokumentace šablon azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->