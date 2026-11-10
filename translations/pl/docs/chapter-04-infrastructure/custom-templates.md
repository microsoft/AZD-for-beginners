# Tworzenie Własnego Szablonu azd

**Nawigacja po rozdziale:**
- **📚 Strona główna kursu**: [AZD dla Początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 4 - Infrastruktura jako Kod & Wdrażanie
- **⬅️ Poprzedni**: [Przewodnik po wdrożeniu](deployment-guide.md)
- **🚀 Następny rozdział**: [Rozdział 5: Rozwiązania wieloagentowe](../chapter-05-multi-agent/README.md)

> Przejrzano względem `azd 1.37.2` (listopad 2026). To jest **przewodnik tworzenia z częściowymi plikami**, a nie kompletny szablon: musisz dostarczyć kod aplikacji oraz `modules/web.bicep` z jego środowiskiem, rejestrem, Container App i wynikami przed wdrożeniem. Provisioning w Azure nie był wykonany w tej recenzji.

## Wprowadzenie

Jak dotąd *korzystałeś* z szablonów za pomocą `azd init --template <name>`. Ale gdy masz już układ projektu, który spodobał się Twojemu zespołowi — np. Container App z Cosmos DB i odpowiednim monitoringiem — będziesz chciał zamienić go we własny szablon do wielokrotnego użytku. Szablon to po prostu repozytorium Git o przewidywalnej strukturze, które azd potrafi czytać. Ta lekcja pokazuje, jak zbudować taki szablon od podstaw, przetestować go i (opcjonalnie) opublikować w galerii społeczności.

## Cele nauki

Po zakończeniu tej lekcji będziesz:
- Rozumieć, co sprawia, że folder jest „szablonem azd”
- Znać wymagane pliki i układ folderów
- Dodać `azure.yaml` i `infra/`, których inni mogą użyć ponownie
- Testować swój szablon lokalnie przed udostępnieniem
- Opublikować go i (opcjonalnie) zgłosić do Awesome AZD

## Rezultaty nauki

Po ukończeniu lekcji będziesz potrafił:
- Szkieletować nowe repozytorium szablonu
- Parametryzować infrastrukturę, aby działała w dowolnej subskrypcji
- Weryfikować szablon za pomocą `azd init` i `azd up`
- Dodać metadane wymagane przez galerię społeczności

---

## Czym naprawdę jest szablon?

Szablon azd to **repozytorium Git**, które zawiera co najmniej:

| Plik / folder | Cel | Wymagane? |
|---------------|---------|-----------|
| `azure.yaml` | Opisuje usługi, hosty i dostawcę infrastuktury | ✅ Tak |
| `infra/` | Definicje provisioningu Bicep lub Terraform | Wymagane dla tego przykładu explicit-IaC; projekty generujące infrastrukturę mogą pominąć |
| `src/` (lub Twój kod) | Kod aplikacji wdrażany przez azd | Wymagany dla usług opartych na źródłach; nie wszystkie szablony zawierają kod aplikacji |
| `README.md` | Jak używać szablonu | ✅ Mocno zalecane |
| `.azdo/` lub `.github/` | Definicje pipeline CI/CD | Opcjonalne |
| `.devcontainer/` | Powtarzalne środowisko deweloperskie | Opcjonalne |
| `azure.yaml` `metadata` | Tożsamość/telemetria szablonu | Zalecane; publikacja repozytorium Git tego nie wymaga |

Nie ma tu nic magicznego: gdy uruchamiasz `azd init --template you/your-repo`, azd klonuje repozytorium i czyta `azure.yaml`.

---

## Krok 1: Wygeneruj strukturę repozytorium

Utwórz strukturę folderów ręcznie lub zacznij od minimalnego szablonu i go edytuj:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Typowy gotowy układ wygląda tak:

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

To jest serce szablonu. Mówi azd, co wdrażać i jak:

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

> Pole `metadata.template` jest używane przez telemetrię galerii do liczenia użyć. Użyj konwencji `name@version`.

---

## Krok 3: Parametryzuj infrastrukturę

Najważniejsza zasada dla *wielokrotnego użycia* szablonu: **nigdy nie koduj na sztywno nazw, regionów ani wartości specyficznych dla subskrypcji.** Używaj parametrów i wzorca tokena zasobów, aby ten sam szablon działał w każdej subskrypcji.

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

Dwie rzeczy czynią ten szablon przyjaznym:

1. **Tag `azd-env-name`** — azd używa go do śledzenia i czyszczenia zasobów per środowisko.
2. **Token zasobu `uniqueString(...)`** — generuje stabilny sufiks hash, by zmniejszyć kolizje; nie gwarantuje globalnej unikalności.

Brakujący `modules/web.bicep` musi akceptować `name`, `location` i `tags`, stworzyć środowisko/rejestr Container Apps i aplikację, oznaczyć aplikację tagiem `azd-service-name: web` oraz eksportować `uri`. Musi także ujawnić wartości rejestru potrzebne dla wybranego procesu budowy/wdrażania (np. `AZURE_CONTAINER_REGISTRY_ENDPOINT` z modułu głównego). Sam wyjściowy endpoint nie konfiguruje wykrywania usług, ustawień aplikacji ani uwierzytelniania rejestru.

Dostarcz odpowiadający plik parametrów, który odczytuje wartości wstrzykiwane przez azd ze środowiska:

Zapisz następujący jako `infra/main.parameters.json`:

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

azd automatycznie zastępuje `${AZURE_ENV_NAME}` i `${AZURE_LOCATION}` z aktualnego środowiska.

---

## Krok 4: Testuj szablon lokalnie

Przed udostępnieniem upewnij się, że szablon działa od czystego stanu.

**Testuj z lokalnego folderu** (nie wymaga wysłania do Git):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Następnie przetestuj sprzątanie** — dobry szablon czyści wszystko dokładnie:

```bash
azd down --force --purge
```

Jeśli `azd down` pozostawia zasoby, sprawdź wykrywanie środowiska/grupy zasobów, zasoby zewnętrzne/współdzielone, uprawnienia, blokady i ochronę przed usunięciem. `--purge` nie usuwa lokalnego stanu `.azure/`.

> **Wskazówka:** po dostarczeniu wszystkich brakujących plików uruchom najpierw `azd provision --preview`. Sprawdź hooki przed podglądem, ponieważ mogą wykonywać polecenia z efektami ubocznymi. Podgląd nie jest szacowaniem kosztów ani gwarancją sukcesu provisioningu.

---

## Krok 5: Opublikuj szablon

Wypchnij repozytorium do GitHub (publiczne, jeśli chcesz, aby inni mogli go używać):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Teraz każdy może go używać:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Krok 6 (opcjonalny): Zgłoś do Awesome AZD

Galeria [Awesome AZD](https://azure.github.io/awesome-azd/) zawiera szablony społeczności. Aby zostać wymienionym, Twój repozytorium powinno zawierać:

- ✅ Jasny `README.md` z wymaganiami wstępnymi, diagramem architektury i notatkami dotyczącej kosztów
- ✅ Działający `azure.yaml` z `metadata.template`
- ✅ Infrastrukturę, która poprawnie się uruchamia na nowym subskrypcji
- ✅ Plik `LICENSE`
- ✅ (Zalecane) `.devcontainer/` do jednego kliknięcia w Codespaces

Prześlij, otwierając pull request, który dodaje Twój szablon do pliku danych galerii, zgodnie z przewodnikiem wkładu w repozytorium [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Typowe pułapki

| Pułapka | Naprawa |
|---------|-----|
| Na sztywno zapisane nazwy zasobów | Użyj tokenu zasobu `uniqueString()` |
| `azd down` pozostawia zasoby | Oznacz każdy zasób (lub grupę zasobów) za pomocą `azd-env-name` |
| Szablon działa u Ciebie, ale nie u innych | Usuń ID subskrypcji, ID dzierżawy i założenia dotyczące regionu |
| Wyjścia nie powiązane z aplikacją | Dopasuj `azd-service-name`/`resourceName` dla wdrożenia i explicite mapuj wyjścia do ustawień aplikacji |
| Odrzucono zgłoszenie do galerii | Dodaj `README.md`, `LICENSE` i `metadata.template` |

---

## Podsumowanie

- Szablon to po prostu repozytorium Git z `azure.yaml`, `infra/` oraz Twoim kodem.
- Parametryzuj wszystko — nazwy, regiony i ID — tak, aby działało wszędzie.
- Zawsze oznaczaj zasoby `azd-env-name`, aby `azd down` działało.
- Testuj lokalnie przy pomocy `azd init --template <local-path>` przed publikacją.
- Dodaj metadane i README, aby zgłosić do Awesome AZD.

---

## 🔗 Nawigacja

| Kierunek | Zasób |
|-----------|----------|
| **Poprzedni** | [Przewodnik wdrożeniowy](deployment-guide.md) |
| **Strona rozdziału** | [Rozdział 4: Infrastruktura jako kod](README.md) |
| **Następny rozdział** | [Rozdział 5: Rozwiązania wieloagentowe](../chapter-05-multi-agent/README.md) |

## 📖 Powiązane zasoby

- [Provisioning Resources](provisioning.md)
- [Galeria Awesome AZD](https://azure.github.io/awesome-azd/)
- [Oficjalna dokumentacja szablonów azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->