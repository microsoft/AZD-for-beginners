# 4. Konfiguracja szablonu

!!! tip "PO ZAKOŃCZENIU TEGO MODUŁU BĘDZIESZ W STANIE"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Zacznij od rzeczywistego szablonu

Otwórz [`azure.yaml` w sekcji Zacznij z agentami AI](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) w repozytorium, które zainicjowałeś. Szablon źródłowy może się zmieniać niezależnie od tego warsztatu. Poniższy **wyciąg** był sprawdzany 4 listopada 2026; nie jest zastępstwem pełnego pliku:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` identyfikuje projekt AZD; `metadata.template` rejestruje wersję szablonu.
- `requiredVersions.azd` jest minimalną wersją szablonu, a nie zaleceniem pozostania przy starej wersji CLI. Użyj aktualnej wspieranej wersji AZD.
- `services` definiuje cele wdrażania aplikacji. Ten szablon wdraża swoją Python API i frontend jako jedną usługę Container Apps.
- `project` jest względem `azure.yaml`.
- `remoteBuild` żąda zdalnego budowania kontenera. Twoja tożsamość nadal musi mieć wymagane uprawnienia w Azure.

Pliki Bicep szablonu pod `infra/`, a nie samą listą `services` deklarują zasoby takie jak Microsoft Foundry, wdrożenia modeli, magazyn i opcjonalne AI Search.

## 2. Zrozum haczyki cyklu życia

Przejrzyj sekcję `hooks` i odwołujące się do niej skrypty zanim uruchomisz szablon. Sprawdzona wersja zawiera:

| Haczyk | Cel | Ważne zachowanie |
|------|---------|--------------------|
| `preup` | Walidacja wejść środowiskowych szablonu przed przepływem `up` | Skrypty powłoki specyficzne dla platformy mogą zatrzymać przepływ w przypadku niepowodzenia |
| `postdeploy` | Uruchomienie specyficznej konfiguracji szablonu po wdrożeniu aplikacji | Sprawdź `continueOnError` i dane wyjściowe skryptu; udane wdrożenie nie oznacza, że każde zadanie konfiguracji zakończyło się sukcesem |

Ta wersja **nie zawiera** starszego haczyka `postprovision` / `write_env` pokazywanego w wcześniejszych materiałach warsztatowych. Nie kopiuj odwołań haczyków do skryptów, które już nie istnieją.

Klucze haczyków wybierają zdarzenia cyklu życia; `posix` i `windows` wybierają implementacje platformy. `shell`, `run`, `interactive` i `continueOnError` kontrolują wykonanie. To wykonywalne skrypty z Twoimi uprawnieniami, więc przeglądaj je tak jak kod aplikacji.

Zobacz [dokumentację haczyków AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) dla kompletnego cyklu życia.

## 3. Śledź dane wejściowe środowiska do infrastruktury

Uruchom te polecenia z zainicjowanego repozytorium przykładowego:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Sprawdź `infra/main.parameters.json`, aby zobaczyć, które zmienne środowiskowe szablon faktycznie wykorzystuje. Ustawienie dowolnej nazwy przez `azd env set` nie zmienia automatycznie zasobu Azure.

Przejrzane domyślne wartości obejmują:

| Dane wejściowe | Domyślna wartość / cel |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; jednostki limitu zależą od modelu i typu wdrożenia |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; pozostaw wyłączone, chyba że obsługa danych została przeglądnięta |

To dane wejściowe specyficzne dla przykładu, a nie globalne ustawienia AZD. Sprawdź [dokumentację wsparcia modelu i regionu](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) oraz limit w Twojej subskrypcji przed wyborem modelu, SKU, pojemności lub lokalizacji. Nie interpretuj każdej jednostki pojemności jako 1000 tokenów na minutę.

Aby wybrać inny model czatu, zaktualizuj kompatybilną **nazwę, wersję, format, SKU i pojemność razem**, stosując się do [przewodnika personalizacji przykładu](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Zmiana tylko nazwy może pozostawić niekompatybilną wersję lub typ wdrożenia.

## 4. Ćwiczenie: włącz opcjonalne wyszukiwanie i śledzenie

!!! warning "Te ustawienia mogą dodać zasoby podlegające opłatom"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

Zmiany w infrastrukturze wymagają provisioning; sam `azd deploy` tylko wdraża usługi aplikacyjne. Aby uzyskać indeksowanie wyszukiwania i obsługiwane opcje pobierania, postępuj według [przewodnika AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). W celu monitorowania skorzystaj z [przewodnika obserwowalności](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Nie włączaj przechwytywania zawartości prompt/response na rzeczywistych danych klientów bez wymaganego zgody, kontroli dostępu, polityki przechowywania i redakcji.

## 5. Istniejące zasoby i CI/CD

Aby ponownie użyć projekt Foundry, postępuj zgodnie z [instrukcjami dotyczącymi istniejących zasobów](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) przykładu. Ustawienie `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` zmienia ścieżkę wdrażania; w tym scenariuszu szablon nie tworzy dla Ciebie Application Insights ani AI Search. Sprawdź wyraźnie zależności, przypisania ról i wdrożenia modeli.

Sekcja `pipeline.variables` kontroluje wartości przekazywane do generowanej linii produkcyjnej; nie jest to magazyn tajemnic i nie tworzy zasobów Azure. Preferuj zarządzaną tożsamość w aplikacji i OIDC dla CI/CD. Pliki środowiskowe AZD są w postaci tekstu i nie powinny być commitowane.

AZD obsługuje import zaufanego, lokalnie przygotowanego pliku dotenv:

```bash
azd env set --file .env
```

Przejrzyj ten plik przed importem i nie wyświetlaj plików środowiskowych zawierających tajemnice w terminalach współdzielonych lub logach CI.

## 6. Sprawdź swoją wiedzę

- Która usługa `azure.yaml` wdraża aplikację?
- Który parametr infrastruktury konsumuje każdą wartość, którą zmieniłeś?
- Które zmiany wymagają provisioning zamiast tylko wdrożenia?
- Czy wybrany region i subskrypcja wspierały model i limit?
- Czy wszystkie haczyki konfiguracji zakończyły się sukcesem i czy możesz potwierdzić zachowanie wdrożonej aplikacji?

Kontynuuj do [Personalizuj szablon](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->