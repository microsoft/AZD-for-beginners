# Tworzenie Własnego Szablonu azd

**Nawigacja po rozdziale:**
- **📚 Strona główna kursu**: [AZD dla Początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 4 - Infrastruktura jako kod & Wdrażanie
- **⬅️ Poprzedni**: [Przewodnik po wdrażaniu](deployment-guide.md)
- **🚀 Następny rozdział**: [Rozdział 5: Rozwiązania wieloagentowe](../chapter-05-multi-agent/README.md)

> Zweryfikowano na `azd 1.27.1` w lipcu 2026.

## Wprowadzenie

Jak dotąd *korzystałeś* z szablonów za pomocą `azd init --template <nazwa>`. Ale gdy tylko masz układ projektu, który podoba się twojemu zespołowi — na przykład Container App z Cosmos DB i odpowiednim monitorowaniem — będziesz chciał przekształcić go w własny, wielokrotnego użytku szablon. Szablon to po prostu repozytorium Git o przewidywalnej strukturze, którą azd potrafi odczytać. Ta lekcja pokaże, jak zbudować taki szablon od podstaw, przetestować go i (opcjonalnie) opublikować w galerii społeczności.

## Cele nauki

Pod koniec tej lekcji będziesz:
- Rozumieć, co sprawia, że folder jest „szablonem azd”
- Znać wymagane pliki i układ folderów
- Dodać `azure.yaml` i `infra/` tak, aby inni mogli ich używać
- Testować swój szablon lokalnie przed udostępnieniem
- Opublikować go i (opcjonalnie) zgłosić do Awesome AZD

## Efekty nauki

Po ukończeniu tej lekcji będziesz potrafił:
- Szkieletować nowe repozytorium szablonu
- Parametryzować infrastrukturę, aby działała w dowolnym subskrypcji
- Weryfikować szablon za pomocą `azd init` i `azd up`
- Dodawać metadane wymagane przez galerię społeczności

---

## Czym Właściwie Jest Szablon?

Szablon azd to **repozytorium Git**, które zawiera przynajmniej:

| Plik / folder | Przeznaczenie | Wymagany? |
|---------------|--------------|-----------|
| `azure.yaml` | Opisuje usługi, hosty i dostawcę infrastruktury | ✅ Tak |
| `infra/` | Bicep, Terraform lub Pulumi do provisioningu zasobów | ✅ Tak |
| `src/` (lub twój kod) | Kod aplikacji wdrażany przez azd | ✅ Tak |
| `README.md` | Jak używać szablonu | ✅ Gorąco zalecany |
| `.azdo/` lub `.github/` | Definicje pipeline CI/CD | Opcjonalne |
| `.devcontainer/` | Powtarzalne środowisko deweloperskie | Opcjonalne |
| `azure.yaml` `metadata` | Informacje o galerii + telemetryczne | Opcjonalne (wymagane do publikacji) |

Nie ma tu nic magicznego: kiedy uruchamiasz `azd init --template you/your-repo`, azd klonuje repozytorium i czyta `azure.yaml`.

---

## Krok 1: Szkieletowanie Repozytorium

Utwórz strukturę folderów ręcznie lub zacznij od minimalnego szablonu i edytuj go:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Utwórz standardowy układ
mkdir -p src infra
```

Typowa gotowa struktura wygląda tak:

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

## Krok 2: Napisz `azure.yaml`

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

> Pole `metadata.template` jest używane przez telemetry galerię do liczenia użycia. Użyj konwencji `nazwa@wersja`.

---

## Krok 3: Parametryzacja Infrastruktury

Najważniejsza zasada *wielokrotnego użytku* szablonu: **nigdy nie umieszczaj na stałe nazw, regionów ani wartości specyficznych dla subskrypcji.** Używaj parametrów oraz wzorca tokenów zasobów, aby ten sam szablon działał w dowolnej subskrypcji.

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

Dwie rzeczy czynią ten szablon przyjaznym do szablonowania:

1. **Tag `azd-env-name`** — azd używa go do śledzenia i sprzątania zasobów per środowisko.
2. **Token zasobu `uniqueString(...)`** — generuje stabilny, globalnie unikalny sufiks, aby nazwy się nie pokrywały.

Dodaj odpowiadający plik parametrów, który odczytuje wartości wstrzykiwane przez azd ze środowiska:

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

azd automatycznie podstawia `${AZURE_ENV_NAME}` i `${AZURE_LOCATION}` z bieżącego środowiska.

---

## Krok 4: Przetestuj Swoje Szablony Lokalnie

Przed udostępnieniem upewnij się, że szablon działa z czystego stanu.

**Testuj z lokalnego folderu** (nie jest wymagane wypychanie do Git):

```bash
# Z pustego katalogu, zainicjalizuj używając lokalnej ścieżki szablonu
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisionowanie + wdrożenie od początku do końca
azd auth login
azd up
```

**Następnie przetestuj usuwanie** — dobry szablon sprząta wszystko do końca:

```bash
azd down --force --purge
```

Jeśli `azd down` zostawia zasoby, prawdopodobnie przegapiłeś tag `azd-env-name` na jakimś zasobie.

> **Wskazówka:** najpierw uruchom `azd provision --preview`. Wykonuje on symulację co by było i ujawnia błędy szablonu przed utworzeniem zasobów.

---

## Krok 5: Opublikuj Szablon

Wypchnij repozytorium do GitHub (publiczne, jeśli chcesz, by inni mogli go używać):

```bash
gh repo create my-azd-template --public --source=. --push
```

Każdy teraz może go użyć:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Krok 6 (Opcjonalnie): Zgłoś do Awesome AZD

Galeria [Awesome AZD](https://azure.github.io/awesome-azd/) zawiera szablony społecznościowe. Aby zostać wymienionym, twoje repozytorium powinno zawierać:

- ✅ Jasny `README.md` ze wstępem, diagramem architektury i uwagami o kosztach
- ✅ Działający `azure.yaml` z `metadata.template`
- ✅ Infrastrukturę, która poprawnie provisionuje się w świeżej subskrypcji
- ✅ Plik `LICENSE`
- ✅ (Zalecane) `.devcontainer/` do uruchamiania Codespaces jednym kliknięciem

Zgłoś, otwierając pull request, który dodaje twój szablon do pliku danych galerii, według przewodnika wkładu w repozytorium [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Częste Pułapki

| Pułapka | Naprawa |
|---------|---------|
| Nazwy zasobów na stałe zakodowane | Używaj tokena zasobu `uniqueString()` |
| `azd down` zostawia zasoby | Oznacz każdy zasób (lub grupę zasobów) tagiem `azd-env-name` |
| Szablon działa u ciebie, ale nie u innych | Usuń stałe ID subskrypcji, ID dzierżawy i założenia dotyczące regionu |
| Wyniki nie są podłączone do aplikacji | Eksportuj `SERVICE_<NAME>_ENDPOINT_URL` i inne wyjścia `AZURE_*` |
| Odrzucenie zgłoszenia przez galerię | Dodaj `README.md`, `LICENSE` i `metadata.template` |

---

## Podsumowanie

- Szablon to po prostu repozytorium Git z `azure.yaml`, `infra/` i twoim kodem.
- Parametryzuj wszystko — nazwy, regiony i ID — żeby działał wszędzie.
- Zawsze oznaczaj zasoby tagiem `azd-env-name`, aby `azd down` działał poprawnie.
- Testuj lokalnie z `azd init --template <local-path>` przed publikacją.
- Dodaj metadane i README, aby zgłosić do Awesome AZD.

---

## 🔗 Nawigacja

| Kierunek | Zasób |
|-----------|--------|
| **Poprzedni** | [Przewodnik po wdrażaniu](deployment-guide.md) |
| **Strona domu rozdziału** | [Rozdział 4: Infrastruktura jako kod](README.md) |
| **Następny rozdział** | [Rozdział 5: Rozwiązania wieloagentowe](../chapter-05-multi-agent/README.md) |

## 📖 Powiązane zasoby

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Oficjalna dokumentacja szablonów azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->