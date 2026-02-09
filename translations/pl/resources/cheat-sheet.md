# Command Cheat Sheet - Podstawowe polecenia AZD

**Szybkie odniesienie do wszystkich rozdziałów**
- **📚 Strona kursu**: [AZD dla początkujących](../README.md)
- **📖 Szybki start**: [Rozdział 1: Podstawy i szybki start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Polecenia AI**: [Rozdział 2: Rozwój AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Zaawansowane**: [Rozdział 4: Infrastruktura jako kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Wprowadzenie

Ten obszerny cheat sheet zapewnia szybkie odniesienie do najczęściej używanych poleceń Azure Developer CLI, zorganizowanych według kategorii z praktycznymi przykładami. Idealny do szybkich wyszukiwań podczas tworzenia, rozwiązywania problemów i codziennych operacji z projektami azd.

## Cele nauki

Korzystając z tego cheat sheeta, będziesz:
- Miał natychmiastowy dostęp do podstawowych poleceń i składni Azure Developer CLI
- Rozumiał organizację poleceń według funkcjonalnych kategorii i zastosowań
- Mógł odnosić się do praktycznych przykładów dla typowych scenariuszy tworzenia i wdrażania
- Uzyska szybki dostęp do poleceń rozwiązywania problemów
- Znalazł zaawansowane opcje konfiguracyjne i personalizacyjne
- Oddzielnie zarządzał środowiskami i wielośrodowiskowymi przepływami pracy

## Wyniki nauki

Regularne odniesienia do tego cheat sheeta pozwolą Ci:
- Wykonywać polecenia azd pewnie bez konieczności przeglądania pełnej dokumentacji
- Szybko rozwiązywać typowe problemy za pomocą odpowiednich poleceń diagnostycznych
- Efektywnie zarządzać wieloma środowiskami i scenariuszami wdrożeń
- Stosować zaawansowane funkcje i opcje konfiguracyjne azd według potrzeb
- Diagnozować problemy z wdrożeniami korzystając z systematycznych sekwencji poleceń
- Optymalizować przepływy pracy dzięki skutecznemu wykorzystaniu skrótów i opcji azd

## Polecenia rozpoczęcia pracy

### Uwierzytelnianie
```bash
# Zaloguj się do Azure za pomocą AZD
azd auth login

# Zaloguj się do Azure CLI (AZD używa tego w tle)
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

### Inicjowanie projektu
```bash
# Przeglądaj dostępne szablony
azd template list

# Inicjalizuj z szablonu
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicjalizuj w bieżącym katalogu
azd init .

# Inicjalizuj z niestandardową nazwą
azd init --template todo-nodejs-mongo my-awesome-app
```

## Główne polecenia wdrożeniowe

### Kompletny przepływ wdrożenia
```bash
# Wdróż wszystko (prowizja + wdrożenie)
azd up

# Wdróż bez wyświetlania monitów potwierdzenia
azd up --confirm-with-no-prompt

# Wdróż do określonego środowiska
azd up --environment production

# Wdróż z niestandardowymi parametrami
azd up --parameter location=westus2
```

### Tylko infrastruktura
```bash
# Przygotuj zasoby Azure
azd provision

# 🧪 Podgląd zmian infrastruktury
azd provision --preview
# Pokazuje symulację zasobów, które zostałyby utworzone/modyfikowane/usunięte
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

### Kompilacja i pakowanie
```bash
# Buduj aplikacje
azd package

# Buduj określoną usługę
azd package --service api
```

## 🌍 Zarządzanie środowiskiem

### Operacje na środowisku
```bash
# Wypisz wszystkie środowiska
azd env list

# Utwórz nowe środowisko
azd env new development
azd env new staging --location westus2

# Wybierz środowisko
azd env select production

# Pokaż bieżące środowisko
azd env show

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
# Wypisz całą konfigurację
azd config list

# Ustaw domyślne wartości globalne
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Usuń konfigurację
azd config unset defaults.location

# Zresetuj całą konfigurację
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

# Otwórz metryki na żywo Application Insights
azd monitor --live

# Otwórz panel logów Application Insights
azd monitor --logs

# Otwórz przegląd Application Insights
azd monitor --overview
```

### Podgląd logów kontenera
```bash
# Przeglądaj logi za pomocą Azure CLI (dla Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Śledź logi w czasie rzeczywistym
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Przeglądaj logi z Azure Portal
azd monitor --logs
```

### Zapytania w Log Analytics
```bash
# Uzyskaj dostęp do analizy dzienników za pomocą portalu Azure
azd monitor --logs

# Zapytania dzienników za pomocą Azure CLI
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

# Oczyść zasoby miękko usunięte
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

# Wyświetl bieżącą konfigurację
azd config list
```

## 🔧 Polecenia zaawansowane

### Pipeline i CI/CD
```bash
# Skonfiguruj GitHub Actions
azd pipeline config

# Skonfiguruj Azure DevOps
azd pipeline config --provider azdo

# Pokaż konfigurację potoku
azd pipeline show
```

### Zarządzanie infrastrukturą
```bash
# Generuj szablony infrastruktury
azd infra generate

# 🧪 Podgląd infrastruktury i planowanie
azd provision --preview
# Symuluje tworzenie infrastruktury bez wdrażania
# Analizuje szablony Bicep/Terraform i pokazuje:
# - Zasoby do dodania (zielony +)
# - Zasoby do modyfikacji (żółty ~)
# - Zasoby do usunięcia (czerwony -)
# Bezpieczne uruchomienie - brak faktycznych zmian w środowisku Azure

# Syntetyzuje infrastrukturę z azure.yaml
azd infra synth
```

### Informacje o projekcie
```bash
# Pokaż status projektu i punkty końcowe
azd show

# Pokaż szczegółowe informacje o projekcie w formacie JSON
azd show --output json

# Pobierz punkty końcowe usługi
azd show --output json | jq '.services'
```

## 🎯 Szybkie przepływy pracy

### Przepływ pracy przy tworzeniu
```bash
# Rozpocznij nowy projekt
azd init --template todo-nodejs-mongo
cd my-project

# Wdróż na środowisko deweloperskie
azd env new dev
azd up

# Wprowadź zmiany i wdroż ponownie
azd deploy

# Otwórz panel monitoringu
azd monitor --live
```

### Wielośrodowiskowy przepływ pracy
```bash
# Konfiguruj środowiska
azd env new dev
azd env new staging  
azd env new production

# Wdróż na środowisko deweloperskie
azd env select dev
azd up

# Testuj i promuj na środowisko staging
azd env select staging
azd up

# Wdróż na produkcję
azd env select production
azd up
```

### Przepływ pracy rozwiązywania problemów
```bash
# Włącz tryb debugowania
export AZD_DEBUG=true

# Sprawdź status wdrożenia
azd show

# Zweryfikuj konfigurację
azd config list

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
azd config list

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
echo $AZD_CONFIG_DIR  # Zwykle ~/.azd
```

## 🎨 Formatowanie wyjścia

### Wyjście JSON
```bash
# Pobierz dane wyjściowe JSON do skryptów
azd show --output json
azd env list --output json
azd config list --output json

# Parsuj za pomocą jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Wyjście w tabeli
```bash
# Formatuj jako tabelę
azd env list --output table

# Wyświetl wdrożone usługi
azd show --output json | jq '.services | keys'
```

## 🔧 Najczęstsze kombinacje poleceń

### Skrypt sprawdzający stan
```bash
#!/bin/bash
# Szybkie sprawdzenie stanu zdrowia
azd show
azd env show
azd monitor --logs
```

### Walidacja wdrożenia
```bash
#!/bin/bash
# Weryfikacja przed wdrożeniem
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

### Szybkie naprawy
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

# Tylko ponowne zapewnienie infrastruktury
azd provision

# Tylko ponowne wdrożenie aplikacji
azd deploy
```

## 💡 Profesjonalne wskazówki

### Aliasy przyspieszające pracę
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

# Szybkie wdrożenie z monitorowaniem
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Status środowiska
azd-status() {
    echo "Current environment:"
    azd env show
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

# Pokaż wersję i informacje o kompilacji
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

**Wskazówka**: Dodaj ten cheat sheet do ulubionych i użyj `Ctrl+F`, aby szybko znaleźć potrzebne polecenia!

---

**Nawigacja**
- **Poprzednia lekcja**: [Kontrole wstępne](../docs/pre-deployment/preflight-checks.md)
- **Następna lekcja**: [Słownik](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć staramy się zapewnić dokładność, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy traktować jako dokument wiążący. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego, ludzkiego tłumaczenia. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->