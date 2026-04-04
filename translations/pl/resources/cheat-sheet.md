# Command Cheat Sheet - Podstawowe Polecenia AZD

**Szybki przewodnik po wszystkich rozdziałach**
- **📚 Strona kursu**: [AZD dla początkujących](../README.md)
- **📖 Szybki start**: [Rozdział 1: Podstawy i szybki start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Polecenia AI**: [Rozdział 2: Development z AI w centrum uwagi](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Zaawansowane**: [Rozdział 4: Infrastruktura jako kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Wprowadzenie

Ten kompleksowy cheat sheet zapewnia szybki dostęp do najczęściej używanych poleceń Azure Developer CLI, pogrupowanych według kategorii z praktycznymi przykładami. Idealny do szybkiego sprawdzania podczas tworzenia, rozwiązywania problemów i codziennych operacji z projektami azd.

## Cele nauki

Korzystając z tego cheat sheeta, będziesz:
- Miał natychmiastowy dostęp do podstawowych poleceń i składni Azure Developer CLI
- Rozumiał organizację poleceń według funkcjonalnych kategorii i zastosowań
- Mógł odwoływać się do praktycznych przykładów typowych scenariuszy tworzenia i wdrażania
- Miał dostęp do poleceń diagnostycznych do szybkiego rozwiązywania problemów
- Łatwo znajdował zaawansowane opcje konfiguracji i dostosowywania
- Korzystał z poleceń zarządzania środowiskiem i przepływów pracy wielośrodowiskowych

## Efekty nauki

Regularne korzystanie z tego cheat sheeta pozwoli Ci:
- Wykonywać polecenia azd pewnie, bez odwoływania się do pełnej dokumentacji
- Szybko rozwiązywać typowe problemy za pomocą odpowiednich poleceń diagnostycznych
- Efektywnie zarządzać wieloma środowiskami i scenariuszami wdrożeń
- Stosować zaawansowane funkcje azd i opcje konfiguracji według potrzeb
- Rozwiązywać problemy z wdrożeniem, korzystając z systematycznych sekwencji poleceń
- Optymalizować przepływy pracy poprzez skuteczne użycie skrótów i opcji azd

## Polecenia startowe

### Uwierzytelnianie
```bash
# Zaloguj się do Azure za pomocą AZD
azd auth login

# Zaloguj się do Azure CLI (AZD używa tego pod spodem)
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

# Zainicjuj z niestandardową nazwą
azd init --template todo-nodejs-mongo my-awesome-app
```

## Podstawowe polecenia wdrożeniowe

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

# 🧪 Podgląd zmian w infrastrukturze
azd provision --preview
# Pokazuje symulację, jakie zasoby zostałyby utworzone/zmodyfikowane/usunięte
# Podobne do 'terraform plan' lub 'bicep what-if' - bezpieczne do uruchomienia, bez zastosowania zmian
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
# Buduj aplikacje
azd package

# Buduj określoną usługę
azd package --service api
```

## 🌍 Zarządzanie środowiskiem

### Operacje na środowisku
```bash
# Wyświetl wszystkie środowiska
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
# Wypisz wszystkie konfiguracje
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

# Pobierz punkty końcowe usługi
azd show --output json
```

## 📊 Monitorowanie i diagnostyka

### Panel monitorowania
```bash
# Otwórz pulpit monitorowania portalu Azure
azd monitor

# Otwórz metryki na żywo w Application Insights
azd monitor --live

# Otwórz panel dzienników Application Insights
azd monitor --logs

# Otwórz przegląd Application Insights
azd monitor --overview
```

### Przeglądanie logów kontenera
```bash
# Wyświetlaj logi za pomocą Azure CLI (dla aplikacji kontenerowych)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Śledź logi w czasie rzeczywistym
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Wyświetlaj logi z portalu Azure
azd monitor --logs
```

### Zapytania Log Analytics
```bash
# Uzyskaj dostęp do analizy dzienników za pomocą portalu Azure
azd monitor --logs

# Zapytaj dzienniki za pomocą Azure CLI
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

# Całkowite oczyszczenie
azd down --force --purge
```

### Aktualizacje
```bash
# Sprawdź aktualizacje azd
azd version

# Pobierz aktualną wersję
azd version

# Zobacz aktualną konfigurację
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
# Generowanie szablonów infrastruktury
azd infra generate

# 🧪 Podgląd i planowanie infrastruktury
azd provision --preview
# Symuluje provisionowanie infrastruktury bez wdrażania
# Analizuje szablony Bicep/Terraform i pokazuje:
# - Zasoby do dodania (zielony +)
# - Zasoby do modyfikacji (żółty ~)
# - Zasoby do usunięcia (czerwony -)
# Bezpieczne do uruchomienia - brak rzeczywistych zmian w środowisku Azure

# Syntezuj infrastrukturę z azure.yaml
azd infra synth
```

### Informacje o projekcie
```bash
# Pokaż status projektu i końcówki
azd show

# Pokaż szczegółowe informacje o projekcie w formacie JSON
azd show --output json

# Pobierz końcówki serwisu
azd show --output json | jq '.services'
```

## 🤖 Polecenia AI i rozszerzenia

### Rozszerzenia AZD
```bash
# Wyświetl wszystkie dostępne rozszerzenia (w tym AI)
azd extension list

# Zainstaluj rozszerzenie agentów Foundry
azd extension install azure.ai.agents

# Zainstaluj rozszerzenie dopasowywania parametrów
azd extension install azure.ai.finetune

# Zainstaluj rozszerzenie niestandardowych modeli
azd extension install azure.ai.models

# Zaktualizuj wszystkie zainstalowane rozszerzenia
azd extension upgrade --all
```

### Polecenia agenta AI
```bash
# Inicjalizuj projekt agenta z manifestu
azd ai agent init -m <manifest-path-or-uri>

# Wybierz konkretny projekt Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Określ katalog źródłowy agenta
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Wybierz docelowe środowisko hostingu
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### Serwer MCP (Alpha)
```bash
# Uruchom serwer MCP dla swojego projektu
azd mcp start

# Zarządzaj zgodą na narzędzia dla operacji MCP
azd copilot consent list
```

### Generowanie infrastruktury
```bash
# Generuj pliki IaC z definicji Twojego projektu
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

# Wdróż do środowiska deweloperskiego
azd env new dev
azd up

# Wprowadź zmiany i wdroż ponownie
azd deploy

# Otwórz panel monitoringu
azd monitor --live
```

### Przepływ pracy wielośrodowiskowej
```bash
# Skonfiguruj środowiska
azd env new dev
azd env new staging  
azd env new production

# Wdróż na środowisko deweloperskie
azd env select dev
azd up

# Przetestuj i promuj do środowiska testowego
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
# Pokaż bieżącą strukturę katalogów
tree /f  # Windows
find . -type f  # Linux/macOS

# Przejdź do katalogu głównego projektu azd
cd $(azd root)

# Pokaż katalog konfiguracji azd
echo $AZD_CONFIG_DIR  # Zazwyczaj ~/.azd
```

## 🎨 Formatowanie wyjścia

### Wyjście JSON
```bash
# Pobierz wynik JSON do skryptów
azd show --output json
azd env list --output json
azd config show --output json

# Parsuj za pomocą jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Wyjście tabelaryczne
```bash
# Sformatuj jako tabelę
azd env list --output table

# Wyświetl wdrożone usługi
azd show --output json | jq '.services | keys'
```

## 🔧 Popularne kombinacje poleceń

### Skrypt sprawdzający stan
```bash
#!/bin/bash
# Szybkie sprawdzenie stanu zdrowia
azd show
azd env get-values
azd monitor --logs
```

### Walidacja wdrożenia
```bash
#!/bin/bash
# Wstępna walidacja przed wdrożeniem
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

### Skrypt czyszczący zasoby
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
# Odzyskaj po nieudanym wdrożeniu - wyczyść i wdroż ponownie
azd down --force --purge
azd up

# Ponownie przygotuj tylko infrastrukturę
azd provision

# Wdroż ponownie tylko aplikację
azd deploy
```

## 💡 Pro wskazówki

### Alias'y dla szybszego przepływu pracy
```bash
# Dodaj do swojego .bashrc lub .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Skróty funkcji
```bash
# Szybkie przełączanie środowiska
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

**Wskazówka**: Dodaj ten cheat sheet do zakładek i użyj `Ctrl+F`, aby szybko znaleźć potrzebne polecenia!

---

**Nawigacja**
- **Poprzednia lekcja**: [Kontrole wstępne](../docs/pre-deployment/preflight-checks.md)
- **Następna lekcja**: [Słownik](glossary.md)

---

> **💡 Chcesz pomoc z poleceniami Azure w edytorze?** Zainstaluj [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) za pomocą `npx skills add microsoft/github-copilot-for-azure` — 37 umiejętności dla AI, Foundry, wdrożeń, diagnostyki i innych.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony przy użyciu automatycznej usługi tłumaczeniowej [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dokładamy starań, aby tłumaczenie było jak najdokładniejsze, prosimy mieć na uwadze, że automatyczne przekłady mogą zawierać błędy lub niedokładności. Oryginalny dokument w języku źródłowym powinien być uznawany za źródło autorytatywne. W przypadku informacji o krytycznym znaczeniu zaleca się skorzystanie z profesjonalnego, ludzkiego tłumaczenia. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z wykorzystania tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->