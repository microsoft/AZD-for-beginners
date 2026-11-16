# Vytvoření vlastního azd šablony

**Navigace kapitolou:**
- **📚 Domů kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 4 - Infrastruktura jako kód a nasazení
- **⬅️ Předchozí**: [Průvodce nasazením](deployment-guide.md)
- **🚀 Další kapitola**: [Kapitola 5: Multi-agentní řešení](../chapter-05-multi-agent/README.md)

> Přezkoumáno podle `azd 1.37.2` (listopad 2026). Toto je **průvodce tvorbou s částečnými soubory**, nikoli kompletní šablona: musíte dodat aplikační kód a `modules/web.bicep` s jeho prostředím, registrem, Container App a výstupy před nasazením. Při této kontrole nebylo provedeno Azure provisioning.

## Úvod

Dosud jste *používali* šablony s `azd init --template <name>`. Jakmile máte rozložení projektu, které se vašemu týmu líbí – například Container App s Cosmos DB a správným monitorováním – budete chtít z něj vytvořit opakovaně použitelnou šablonu. Šablona je jen Git repozitář s předvídatelnou strukturou, kterou azd umí načíst. Tato lekce vám ukáže, jak vytvořit šablonu od základů, otestovat ji a (volitelně) publikovat v komunitní galerii.

## Cíle učení

Na konci této lekce budete:
- Rozumět tomu, co dělá složku "azd šablonou"
- Znáte požadované soubory a rozložení složek
- Přidat `azure.yaml` a `infra/`, které mohou ostatní znovu používat
- Testovat vaši šablonu lokálně před sdílením
- Publikovat ji a (volitelně) odeslat do Awesome AZD

## Výsledky učení

Po dokončení této lekce budete schopni:
- Vytvořit kostru nového repozitáře šablony
- Parametrizovat infrastrukturu tak, aby fungovala v každém předplatném
- Validovat šablonu pomocí `azd init` a `azd up`
- Přidat metadata požadovaná komunitní galerií

---

## Co je šablona vlastně?

Azd šablona je **Git repozitář**, který obsahuje minimálně:

| Soubor / složka | Účel | Povinné? |
|---------------|---------|-----------|
| `azure.yaml` | Popis služeb, hostitelů a poskytovatele infrastruktury | ✅ Ano |
| `infra/` | Definice provisioning v Bicep nebo Terraform | Povinné pro tento explicitní IaC příklad; projekty s generovanou infrastrukturou mohou vynechat |
| `src/` (nebo váš kód) | Aplikační kód, který azd nasazuje | Povinné pro služby založené na zdrojovém kódu; ne všechny šablony obsahují kód aplikace |
| `README.md` | Jak používat šablonu | ✅ Důrazně doporučeno |
| `.azdo/` nebo `.github/` | Definice CI/CD pipeline | Volitelné |
| `.devcontainer/` | Reprodukovatelné vývojové prostředí | Volitelné |
| `azure.yaml` `metadata` | Identita/telemetrie šablony | Doporučeno; publikace Git repozitáře to nevyžaduje |

Není v tom žádná magie: když spustíte `azd init --template you/your-repo`, azd naklonuje repozitář a načte `azure.yaml`.

---

## Krok 1: Vytvořte kostru repozitáře

Vytvořte strukturu složek ručně nebo začněte z minimální šablony a upravte ji:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Typické dokončené uspořádání vypadá takto:

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

To je srdcem šablony. Říká azd, co a jak nasadit:

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

> Pole `metadata.template` používá galerie telemetrie k počítání použití. Použijte konvenci `name@version`.

---

## Krok 3: Parameterizujte infrastrukturu

Nejdůležitější pravidlo pro *opakovaně použitelnou* šablonu: **nikdy nezakódujte názvy, oblasti nebo hodnoty specifické pro předplatné.** Používejte parametry a vzor resource token, aby šablona fungovala v předplatném kohokoli.

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

Dvě věci dělají tuto šablonu přátelskou:

1. **`azd-env-name` tag** — azd ho používá k sledování a úklidu zdrojů dle prostředí.
2. **`uniqueString(...)` resource token** — vytváří stabilní hash příponu ke snížení kolizí; není to záruka globální jedinečnosti.

Chybějící `modules/web.bicep` musí přijmout `name`, `location` a `tags`, nakonfigurovat prostředí/registr a aplikaci Container Apps, označit aplikaci tagem `azd-service-name: web` a exportovat `uri`. Také musí zpřístupnit hodnoty registru potřebné vybraným build/deploy procesem (například `AZURE_CONTAINER_REGISTRY_ENDPOINT` z kořenového modulu). Pouhý výstup endpointa nezajišťuje service discovery, nastavení aplikace ani autentizaci registru.

Poskytněte odpovídající parametry soubor, který načítá hodnoty, které azd injektuje z prostředí:

Uložte následující jako `infra/main.parameters.json`:

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

azd automaticky nahrazuje `${AZURE_ENV_NAME}` a `${AZURE_LOCATION}` z aktuálního prostředí.

---

## Krok 4: Lokálně otestujte vaši šablonu

Před sdílením ověřte, že šablona funguje od čistého stavu.

**Testujte ze složky lokálně** (není potřeba Git push):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Pak otestujte teardown** — dobrá šablona vše řádně uklidí:

```bash
azd down --force --purge
```

Pokud `azd down` zanechá zdroje, zkontrolujte objevování prostředí/skupiny zdrojů, externí/společné zdroje, oprávnění, zámky a ochranu proti vymazání. `--purge` neodstraní lokální stav `.azure/`.

> **Tip:** po doplnění všech chybějících souborů spusťte nejdříve `azd provision --preview`. Prohlédněte si hooks před preview, protože mohou spustit příkazy side-effect. Preview není odhad ceny ani záruka úspěšného provisioningu.

---

## Krok 5: Publikujte šablonu

Nahrajte repozitář na GitHub (veřejný, pokud jej chcete sdílet s ostatními):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Nyní ji může kdokoli používat:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Krok 6 (volitelně): Přidejte do Awesome AZD

Galerie [Awesome AZD](https://azure.github.io/awesome-azd/) uvádí komunitní šablony. Aby bylo vaše repo zařazeno, mělo by obsahovat:

- ✅ Přehledný `README.md` s předpoklady, diagramem architektury a poznámkami k nákladům
- ✅ Funkční `azure.yaml` s `metadata.template`
- ✅ Infrastrukturu, kterou lze čistě nasadit v novém předplatném
- ✅ Soubor `LICENSE`
- ✅ (doporučeno) `.devcontainer/` pro jedním kliknutím Codespaces

Přihlaste ji otevřením pull requestu, který přidá šablonu do datového souboru galerie podle příručky příspěvků v [Awesome AZD repozitáři](https://github.com/Azure/awesome-azd).

---

## Běžné úskalí

| Úskalí | Oprava |
|---------|-----|
| Zakódované názvy zdrojů | Použijte `uniqueString()` resource token |
| `azd down` ponechává prostředky | Označte každý zdroj (nebo skupinu zdrojů) pomocí `azd-env-name` |
| Šablona funguje pro vás, selhává u jiných | Odeberte předpoklady o ID předplatného, ID nájemce a oblasti |
| Výstupy nejsou zapojeny do aplikace | Sladte `azd-service-name`/`resourceName` pro nasazení a explicitně namapujte výstupy do nastavení aplikace |
| Odeslání do galerie zamítnuto | Přidejte `README.md`, `LICENSE` a `metadata.template` |

---

## Souhrn

- Šablona je jen Git úložiště s `azure.yaml`, `infra/` a vaším kódem.
- Parametrizujte vše — názvy, oblasti a ID — aby to fungovalo kdekoliv.
- Vždy označujte zdroje pomocí `azd-env-name`, aby `azd down` fungoval.
- Testujte lokálně pomocí `azd init --template <local-path>` před publikováním.
- Přidejte metadata a README pro odeslání do Awesome AZD.

---

## 🔗 Navigace

| Směr | Zdroj |
|-----------|----------|
| **Předchozí** | [Deployment Guide](deployment-guide.md) |
| **Domů kapitoly** | [Chapter 4: Infrastructure as Code](README.md) |
| **Další kapitola** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 Související zdroje

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Official azd template documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->