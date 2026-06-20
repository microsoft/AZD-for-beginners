# Authoring Your Own azd Template

**Chapter Navigation:**
- **📚 Course Home**: [AZD dla początkujących](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous**: [Przewodnik wdrożenia](deployment-guide.md)
- **🚀 Next Chapter**: [Rozdział 5: Rozwiązania wieloagentowe](../chapter-05-multi-agent/README.md)

> Zweryfikowano przy użyciu `azd 1.25.6` w czerwcu 2026.

## Introduction

Do tej pory *korzystałeś* z szablonów przy użyciu `azd init --template <name>`. Ale gdy masz układ projektu, który podoba się zespołowi — na przykład Container App z Cosmos DB i odpowiednim monitorowaniem — zechcesz przekształcić go we własny, wielokrotnego użytku szablon. Szablon to po prostu repozytorium Git z przewidywalną strukturą, którą azd potrafi odczytać. Ta lekcja pokaże, jak zbudować taki szablon od zera, przetestować go i (opcjonalnie) opublikować w galerii społeczności.

## Learning Goals

Po ukończeniu tej lekcji będziesz:
- Rozumieć, co sprawia, że folder jest „szablonem azd”
- Znać wymagane pliki i układ folderów
- Dodać `azure.yaml` i `infra/`, których inni będą mogli używać
- Przetestować swój szablon lokalnie przed udostępnieniem
- Opublikować go i (opcjonalnie) zgłosić do Awesome AZD

## Learning Outcomes

Po ukończeniu tej lekcji będziesz potrafić:
- Szkieletować nowe repozytorium szablonu
- Parametryzować infrastrukturę, aby działała w dowolnym subskrypcji
- Walidować szablon za pomocą `azd init` i `azd up`
- Dodać metadane wymagane przez galerię społeczności

---

## What Is a Template, Really?

Szablon azd to **repozytorium Git**, które zawiera, co najmniej:

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | Opisuje usługi, hosty i dostawcę infrastruktury | ✅ Tak |
| `infra/` | Bicep, Terraform lub Pulumi, które provisionują zasoby | ✅ Tak |
| `src/` (or your code) | Kod aplikacji, który azd wdraża | ✅ Tak |
| `README.md` | Jak używać szablonu | ✅ Zdecydowanie zalecane |
| `.azdo/` or `.github/` | Definicje pipeline CI/CD | Opcjonalne |
| `.devcontainer/` | Powtarzalne środowisko deweloperskie | Opcjonalne |
| `azure.yaml` `metadata` | Informacje dla galerii i telemetrii | Opcjonalne (wymagane do publikacji) |

Nie ma tu nic magicznego: gdy uruchomisz `azd init --template you/your-repo`, azd sklonuje repozytorium i odczyta `azure.yaml`.

---

## Step 1: Scaffold the Repository

Utwórz strukturę folderów ręcznie lub zacznij od minimalnego szablonu i edytuj go:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Utwórz standardowy układ
mkdir -p src infra
```

A typowy skończony układ wygląda następująco:

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

## Step 2: Write `azure.yaml`

To jest serce szablonu. Mówi azd, co wdrożyć i jak:

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

> Pole `metadata.template` to to, czego telemetria galerii używa do zliczania użycia. Użyj konwencji `name@version`.

---

## Step 3: Parameterize the Infrastructure

Najważniejsza zasada dla *wielokrotnego użytku* szablonu: **nigdy nie hardkoduj nazw, regionów ani wartości specyficznych dla subskrypcji.** Używaj parametrów i wzorca tokenów zasobów, aby ten sam szablon działał w subskrypcji każdej osoby.

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

Dwie rzeczy sprawiają, że to jest przyjazne dla szablonów:

1. **`azd-env-name` tag** — azd używa go do śledzenia i czyszczenia zasobów per środowisko.
2. **`uniqueString(...)` resource token** — generuje stabilny, globalnie unikalny sufiks, aby nazwy się nie zderzały.

Dostarcz dopasowany plik parametrów, który odczytuje wartości, które azd wstrzykuje ze środowiska:

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

azd zastępuje `${AZURE_ENV_NAME}` i `${AZURE_LOCATION}` z bieżącego środowiska automatycznie.

---

## Step 4: Test Your Template Locally

Przed udostępnieniem udowodnij, że szablon działa z czystego stanu.

**Testuj z lokalnego folderu** (nie jest wymagane push do Git):

```bash
# Z pustego katalogu zainicjuj, używając lokalnej ścieżki do szablonu
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Prowizjonowanie i pełne wdrożenie
azd auth login
azd up
```

**Następnie przetestuj usuwanie** — dobry szablon czyści wszystko całkowicie:

```bash
azd down --force --purge
```

Jeśli `azd down` pozostawia zasoby, prawdopodobnie pominąłeś tag `azd-env-name` na jakimś zasobie.

> **Wskazówka:** uruchom najpierw `azd provision --preview`. Wykona to what-if i ujawni błędy szablonu zanim jakikolwiek zasób zostanie utworzony.

---

## Step 5: Publish the Template

Wypchnij repozytorium na GitHub (publiczne, jeśli chcesz, by inni mogli go używać):

```bash
gh repo create my-azd-template --public --source=. --push
```

Każdy może teraz użyć go:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Step 6 (Optional): Submit to Awesome AZD

Galeria [Awesome AZD](https://azure.github.io/awesome-azd/) wymienia szablony społeczności. Aby zostać wymienionym, Twoje repo powinno zawierać:

- ✅ Jasny `README.md` z wymaganiami wstępnymi, diagramem architektury i informacjami o kosztach
- ✅ Działający `azure.yaml` z `metadata.template`
- ✅ Infrastrukturę, która provisionuje się czysto w świeżej subskrypcji
- ✅ Plik `LICENSE`
- ✅ (Zalecane) `.devcontainer/` dla jednego kliknięcia w Codespaces

Zgłoś je, otwierając pull request, który dodaje Twój szablon do pliku danych galerii, zgodnie z przewodnikiem kontrybucji w repozytorium [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Common Pitfalls

| Pułapka | Rozwiązanie |
|---------|-------------|
| Hardcoded resource names | Użyj tokena zasobu `uniqueString()` |
| `azd down` leaves resources | Otaguj każdy zasób (lub grupę zasobów) tagiem `azd-env-name` |
| Template works for you, fails for others | Usuń identyfikatory subskrypcji, identyfikatory tenantów i założenia dotyczące regionów |
| Outputs not wired into the app | Eksportuj `SERVICE_<NAME>_ENDPOINT_URL` i inne wyjścia `AZURE_*` |
| Gallery submission rejected | Dodaj `README.md`, `LICENSE` i `metadata.template` |

---

## Summary

- Szablon to po prostu repozytorium Git z `azure.yaml`, `infra/` i Twoim kodem.
- Parametryzuj wszystko — nazwy, regiony i identyfikatory — aby działało wszędzie.
- Zawsze oznaczaj zasoby tagiem `azd-env-name`, aby `azd down` działał.
- Testuj lokalnie za pomocą `azd init --template <local-path>` przed publikacją.
- Dodaj metadane i README, by zgłosić do Awesome AZD.

---

## 🔗 Navigation

| Direction | Resource |
|-----------|----------|
| **Previous** | [Przewodnik wdrożenia](deployment-guide.md) |
| **Chapter Home** | [Chapter 4: Infrastructure as Code](README.md) |
| **Next Chapter** | [Rozdział 5: Rozwiązania wieloagentowe](../chapter-05-multi-agent/README.md) |

## 📖 Related Resources

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Oficjalna dokumentacja szablonów azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->