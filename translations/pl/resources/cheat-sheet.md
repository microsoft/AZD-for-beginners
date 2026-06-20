# Command Cheat Sheet - Podstawowe polecenia AZD

**Szybki dostęp do wszystkich rozdziałów**
- **📚 Strona kursu**: [AZD Dla początkujących](../README.md)
- **📖 Szybki start**: [Rozdział 1: Podstawy i szybki start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Polecenia AI**: [Rozdział 2: Rozwój z myślą o AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Zaawansowane**: [Rozdział 4: Infrastruktura jako kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Wprowadzenie

Ten obszerny cheat sheet zapewnia szybki dostęp do najczęściej używanych poleceń Azure Developer CLI, posegregowanych według kategorii z praktycznymi przykładami. Idealny do szybkiego sprawdzenia podczas pracy, rozwiązywania problemów i codziennych operacji z projektami azd.

## Cele nauki

Korzystając z tego cheat sheeta, będziesz mógł:
- Natychmiastowy dostęp do podstawowych poleceń i składni Azure Developer CLI
- Zrozumieć organizację poleceń według funkcjonalnych kategorii i przypadków użycia
- Odwoływać się do praktycznych przykładów dla typowych scenariuszy rozwoju i wdrażania
- Korzystać z poleceń diagnostycznych do szybkiego rozwiązywania problemów
- Znaleźć zaawansowane opcje konfiguracji i dostosowywania efektywnie
- Zarządzać środowiskami i wieloma środowiskami w przepływach pracy

## Efekty nauki

Regularne korzystanie z tego cheat sheeta umożliwi Ci:
- Pewne wykonywanie poleceń azd bez konieczności odnajdywania pełnej dokumentacji
- Szybkie rozwiązywanie typowych problemów przy użyciu odpowiednich poleceń diagnostycznych
- Sprawne zarządzanie wieloma środowiskami i scenariuszami wdrażania
- Stosowanie zaawansowanych funkcji azd oraz opcji konfiguracji w razie potrzeby
- Rozwiązywanie problemów z wdrożeniami za pomocą systematycznych sekwencji poleceń
- Optymalizację procesów dzięki skutecznemu wykorzystaniu skrótów i opcji azd

## Polecenia początkowe

### Uwierzytelnianie
```bash
# Zaloguj się do Azure za pomocą AZD
azd auth login

# Zaloguj się do Azure CLI (AZD korzysta z tego pod spodem)
az login

# Sprawdź bieżące konto
az account show

# Ustaw domyślną subskrypcję
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Wyloguj się z AZD
azd auth logout

# Wyloguj się z Azure CLI
az logout
```

### Inicjalizacja projektu
```bash
# Przeglądaj dostępne szablony
azd template list

# Zainicjuj z szablonu
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Zainicjuj w bieżącym katalogu
azd init .

# Zainicjuj z własną nazwą
azd init --template todo-nodejs-mongo my-awesome-app
```

## Podstawowe polecenia wdrażania

### Kompletny przepływ wdrożenia
```bash
# Wdróż wszystko (prowizja + wdrożenie)
azd up

# Wdróż bez potwierdzeń
azd up --confirm-with-no-prompt

# Wdróż do określonego środowiska
azd up --environment production

# Wdróż z niestandardowymi parametrami
azd up --parameter location=westus2
```

### Tylko infrastruktura
```bash
# Udostępnij zasoby Azure
azd provision

# 🧪 Podgląd zmian infrastruktury
azd provision --preview
# Pokazuje symulację, jakie zasoby zostałyby utworzone/modyfikowane/usunięte
# Podobne do 'terraform plan' lub 'bicep what-if' - bezpieczne do uruchomienia, bez wprowadzania zmian
```

### Tylko aplikacja
```bash
# Wdróż kod aplikacji
azd deploy

# Wdróż konkretną usługę
azd deploy --service web
azd deploy --service api

# Wdróż wszystkie usługi
azd deploy --all
```

### Budowanie i pakowanie
```bash
# Przywróć (pobierz) zależności aplikacji
azd restore

# Przywróć konkretną usługę
azd restore --service api

# Zbuduj artefakt do wdrożenia bez wdrażania
azd package

# Zbuduj konkretną usługę
azd package --service api
```

> **`azd restore`** pobiera zależności Twojej aplikacji (npm, pip, NuGet, Maven, itp.). Uruchamia się automatycznie podczas `azd package` oraz `azd deploy`, więc rzadko wywołujesz ją bezpośrednio — uruchom ją ręcznie, aby wcześniej pobrać zależności (np. aby rozgrzać cache CI lub później pracować offline).

> **`azd package`** buduje artefakt do wdrożenia (obraz kontenera lub zip) **bez** wysyłania go do Azure. Użyj go samodzielnie, aby zweryfikować poprawność budowania, zbadać output lub stworzyć artefakt, który zostanie wdrożony innym procesem później. `azd deploy` pakuje automatycznie, więc `azd package` potrzebujesz tylko wtedy, gdy chcesz mieć artefakt bez wdrażania.


## 🌍 Zarządzanie środowiskami

### Operacje na środowiskach
```bash
# Wypisz wszystkie środowiska
azd env list

# Utwórz nowe środowisko
azd env new development
azd env new staging --location westus2

# Wybierz środowisko
azd env select production

# Pokaż dostępne środowiska
azd env list

# Odśwież stan środowiska
azd env refresh
```

### Zmienne środowiskowe
```bash
# Ustaw zmienną środowiskową
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Pobierz zmienną środowiskową
azd env get API_KEY

# Wyświetl wszystkie zmienne środowiskowe
azd env get-values

# Usuń zmienną środowiskową
azd env unset DEBUG
```

## ⚙️ Polecenia konfiguracyjne

### Konfiguracja globalna
```bash
# Wyświetl wszystkie konfiguracje
azd config show

# Ustaw globalne domyślne wartości
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Usuń konfigurację
azd config unset defaults.location

# Zresetuj wszystkie konfiguracje
azd config reset
```

### Konfiguracja projektu
```bash
# Waliduj azure.yaml
azd config validate

# Pokaż informacje o projekcie
azd show

# Pobierz punkty końcowe usług
azd show --output json
```

## 📊 Monitorowanie i diagnostyka

### Panel monitorowania
```bash
# Otwórz pulpit monitorowania w portalu Azure
azd monitor

# Otwórz metryki na żywo w Application Insights
azd monitor --live

# Otwórz panel logów Application Insights
azd monitor --logs

# Otwórz przegląd Application Insights
azd monitor --overview
```

### Podgląd logów kontenera
```bash
# Wyświetl logi za pomocą Azure CLI (dla aplikacji kontenerowych)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Śledź logi w czasie rzeczywistym
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Wyświetl logi z Azure Portal
azd monitor --logs
```

### Zapytania Log Analytics
```bash
# Uzyskaj dostęp do analizy dzienników za pomocą portalu Azure
azd monitor --logs

# Zapytania do dzienników za pomocą Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Polecenia konserwacyjne

### Czyszczenie
```bash
# Usuń wszystkie zasoby Azure
azd down

# Wymuś usunięcie bez potwierdzenia
azd down --force

# Oczyść miękko usunięte zasoby
azd down --purge

# Całkowite sprzątanie
azd down --force --purge
```

### Aktualizacje
```bash
# Sprawdź aktualizacje azd
azd version

# Pobierz aktualną wersję
azd version

# Wyświetl aktualną konfigurację
azd config show
```

## 🔧 Polecenia zaawansowane

### Pipeline i CI/CD
```bash
# Skonfiguruj GitHub Actions
azd pipeline config

# Skonfiguruj Azure DevOps
azd pipeline config --provider azdo

# Pokaż konfigurację pipeline'u
azd pipeline show
```

### Zarządzanie infrastrukturą
```bash
# Generuj szablony infrastruktury
azd infra generate

# 🧪 Podgląd i planowanie infrastruktury
azd provision --preview
# Symuluje dostarczanie infrastruktury bez wdrażania
# Analizuje szablony Bicep/Terraform i pokazuje:
# - Zasoby do dodania (zielony +)
# - Zasoby do modyfikacji (żółty ~)
# - Zasoby do usunięcia (czerwony -)
# Bezpieczne do uruchomienia - brak faktycznych zmian w środowisku Azure

# Syntezuj infrastrukturę z azure.yaml
azd infra synth
```

### Informacje o projekcie
```bash
# Pokaż status projektu i punkty końcowe
azd show

# Pokaż szczegółowe informacje o projekcie jako JSON
azd show --output json

# Pobierz punkty końcowe usługi
azd show --output json | jq '.services'
```

## 🤖 Polecenia AI i rozszerzenia

### Rozszerzenia AZD
```bash
# Wypisz wszystkie dostępne rozszerzenia (w tym AI)
azd extension list

# Zainstaluj rozszerzenie agentów Foundry
azd extension install azure.ai.agents

# Zainstaluj rozszerzenie umiejętności agentów (wersja podglądowa)
azd extension install azure.ai.skills

# Zainstaluj rozszerzenie połączeń Foundry (wersja podglądowa)
azd extension install azure.ai.connections

# Zainstaluj rozszerzenie do dostrajania
azd extension install azure.ai.finetune

# Zainstaluj rozszerzenie niestandardowych modeli
azd extension install azure.ai.models

# Zaktualizuj wszystkie zainstalowane rozszerzenia
azd extension upgrade --all
```

### Polecenia agenta AI
```bash
# Zainicjuj projekt agenta z manifestu
azd ai agent init -m <manifest-path-or-uri>

# Określ docelowy projekt Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Wskaż katalog źródłowy agenta
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Wybierz docelowe hostowanie
azd ai agent init -m agent-manifest.yaml --host containerapp

# Przetestuj wdrożonego agenta (wypisuje opóźnienie + czas do pierwszego bajtu)
azd ai agent invoke

# Pokaż konfigurację endpointa na żywo
azd ai agent endpoint show

# Wygeneruj zbiór danych do oceny, a następnie zoptymalizuj agenta
azd ai agent eval generate
azd ai agent optimize

# Pobierz wdrożone źródło agenta hostowanego na bazie kodu
azd ai agent code download

# Usuń hostowanego agenta i wszystkie jego wersje (--force kończy aktywne sesje)
azd ai agent delete --force
```

### Serwer MCP (Alpha)
```bash
# Uruchom serwer MCP dla swojego projektu
azd mcp start

# Zarządzaj zgodą narzędzi na operacje MCP
azd copilot consent list
```

### Generowanie infrastruktury
```bash
# Generuj pliki IaC na podstawie definicji projektu
azd infra generate

# Syntezuj infrastrukturę z azure.yaml
azd infra synth
```

---

## 🎯 Szybkie przepływy pracy

### Przepływ pracy developerskiej
```bash
# Rozpocznij nowy projekt
azd init --template todo-nodejs-mongo
cd my-project

# Wdróż na środowisko deweloperskie
azd env new dev
azd up

# Wprowadź zmiany i ponownie wdroż
azd deploy

# Otwórz panel monitoringu
azd monitor --live
```

### Przepływ pracy wielośrodowiskowy
```bash
# Skonfiguruj środowiska
azd env new dev
azd env new staging  
azd env new production

# Wdróż na środowisko deweloperskie
azd env select dev
azd up

# Przetestuj i promuj do środowiska staging
azd env select staging
azd up

# Wdróż na produkcję
azd env select production
azd up
```

### Przepływ rozwiązywania problemów
```bash
# Włącz tryb debugowania
export AZD_DEBUG=true

# Sprawdź status wdrożenia
azd show

# Zweryfikuj konfigurację
azd config show

# Otwórz panel monitorowania dla logów
azd monitor --logs

# Sprawdź status zasobów
azd show --output json
```

## 🔍 Polecenia debugowania

### Informacje debugowania
```bash
# Włącz wyjście debugowania
export AZD_DEBUG=true
azd <command> --debug

# Wyłącz telemetrię dla czystszego wyjścia
export AZD_DISABLE_TELEMETRY=true

# Sprawdź bieżącą konfigurację
azd config show

# Sprawdź status uwierzytelniania
az account show
```

### Debugowanie szablonów
```bash
# Wyświetl dostępne szablony ze szczegółami
azd template list --output json

# Pokaż informacje o szablonie
azd template show <template-name>

# Zweryfikuj szablon przed inicjalizacją
azd template validate <template-name>
```

## 📁 Polecenia plików i katalogów

### Struktura projektu
```bash
# Pokaż obecną strukturę katalogów
tree /f  # Windows
find . -type f  # Linux/macOS

# Przejdź do katalogu głównego projektu azd
cd $(azd root)

# Pokaż katalog konfiguracji azd
echo $AZD_CONFIG_DIR  # Zwykle ~/.azd
```

## 🎨 Formatowanie outputu

### Output JSON
```bash
# Uzyskaj wyjście JSON do skryptów
azd show --output json
azd env list --output json
azd config show --output json

# Przetwórz za pomocą jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Output w tabeli
```bash
# Formatuj jako tabelę
azd env list --output table

# Wyświetl wdrożone usługi
azd show --output json | jq '.services | keys'
```

## 🔧 Popularne kombinacje poleceń

### Skrypt sprawdzania zdrowia
```bash
#!/bin/bash
# Szybki test stanu zdrowia
azd show
azd env get-values
azd monitor --logs
```

### Walidacja wdrożenia
```bash
#!/bin/bash
# Walidacja przed wdrożeniem
azd show
azd provision --preview  # Podgląd zmian przed wdrożeniem
az account show
```

### Porównanie środowisk
```bash
#!/bin/bash
# Porównaj środowiska
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Skrypt czyszczenia zasobów
```bash
#!/bin/bash
# Wyczyść stare środowiska
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Zmienne środowiskowe

### Popularne zmienne środowiskowe
```bash
# Konfiguracja Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Konfiguracja AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Konfiguracja aplikacji
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Polecenia awaryjne

### Szybkie poprawki
```bash
# Zresetuj uwierzytelnianie
az account clear
az login

# Wymuś odświeżenie środowiska
azd env refresh

# Ponownie wdroż wszystkie usługi
azd deploy

# Sprawdź status wdrożenia
azd show --output json
```

### Polecenia odzyskiwania
```bash
# Odzyskaj po nieudanym wdrożeniu - wyczyść i ponownie wdroż
azd down --force --purge
azd up

# Ponownie wyprowizuj tylko infrastrukturę
azd provision

# Ponownie wdroż tylko aplikację
azd deploy
```

## 💡 Profesjonalne wskazówki

### Alias-y dla szybszej pracy
```bash
# Dodaj do swojego .bashrc lub .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Skróty funkcji
```bash
# Szybkie przełączanie środowisk
azd-env() {
    azd env select $1 && azd show
}

# Szybkie wdrażanie z monitorowaniem
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Status środowiska
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Pomoc i dokumentacja

### Uzyskiwanie pomocy
```bash
# Ogólna pomoc
azd --help
azd help

# Pomoc specyficzna dla polecenia
azd up --help
azd env --help
azd config --help

# Pokaż informacje o wersji i kompilacji
azd version
azd version --output json
```

### Linki do dokumentacji
```bash
# Otwórz dokumentację w przeglądarce
azd docs

# Pokaż dokumentację szablonu
azd template show <template-name> --docs
```

---

**Wskazówka**: Dodaj ten cheat sheet do zakładek i użyj `Ctrl+F`, by szybko znaleźć potrzebne polecenia!

---

**Nawigacja**
- **Poprzednia lekcja**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Następna lekcja**: [Glosariusz](glossary.md)

---

> **💡 Chcesz pomocy z poleceniami Azure w swoim edytorze?** Zainstaluj [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) za pomocą `npx skills add microsoft/github-copilot-for-azure` — 37 umiejętności dla AI, Foundry, wdrażania, diagnostyki i więcej.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->