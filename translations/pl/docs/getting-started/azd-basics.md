<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-09T16:56:40+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "pl"
}
-->
# Podstawy AZD - Zrozumienie Azure Developer CLI

## Wprowadzenie

Ta lekcja wprowadza Cię do Azure Developer CLI (azd), potężnego narzędzia wiersza poleceń, które przyspiesza przejście od lokalnego rozwoju do wdrożenia w Azure. Dowiesz się o podstawowych koncepcjach, kluczowych funkcjach i zrozumiesz, jak azd upraszcza wdrażanie aplikacji natywnych dla chmury.

## Cele nauki

Po zakończeniu tej lekcji będziesz:
- Rozumieć, czym jest Azure Developer CLI i jego główny cel
- Poznać podstawowe koncepcje, takie jak szablony, środowiska i usługi
- Odkrywać kluczowe funkcje, w tym rozwój oparty na szablonach i Infrastructure as Code
- Rozumieć strukturę projektu azd i przepływ pracy
- Przygotowany do instalacji i konfiguracji azd w swoim środowisku deweloperskim

## Efekty nauki

Po ukończeniu tej lekcji będziesz w stanie:
- Wyjaśnić rolę azd w nowoczesnych przepływach pracy związanych z rozwojem w chmurze
- Zidentyfikować komponenty struktury projektu azd
- Opisać, jak szablony, środowiska i usługi współpracują ze sobą
- Zrozumieć korzyści płynące z Infrastructure as Code z azd
- Rozpoznać różne polecenia azd i ich zastosowania

## Czym jest Azure Developer CLI (azd)?

Azure Developer CLI (azd) to narzędzie wiersza poleceń zaprojektowane, aby przyspieszyć przejście od lokalnego rozwoju do wdrożenia w Azure. Upraszcza proces budowania, wdrażania i zarządzania aplikacjami natywnymi dla chmury w Azure.

## Podstawowe koncepcje

### Szablony
Szablony są podstawą azd. Zawierają:
- **Kod aplikacji** - Twój kod źródłowy i zależności
- **Definicje infrastruktury** - Zasoby Azure zdefiniowane w Bicep lub Terraform
- **Pliki konfiguracyjne** - Ustawienia i zmienne środowiskowe
- **Skrypty wdrożeniowe** - Zautomatyzowane przepływy pracy wdrożeniowe

### Środowiska
Środowiska reprezentują różne cele wdrożeniowe:
- **Rozwój** - Do testowania i rozwoju
- **Staging** - Środowisko przedprodukcyjne
- **Produkcja** - Środowisko produkcyjne na żywo

Każde środowisko posiada własne:
- Grupę zasobów Azure
- Ustawienia konfiguracyjne
- Stan wdrożenia

### Usługi
Usługi są elementami składowymi Twojej aplikacji:
- **Frontend** - Aplikacje webowe, SPA
- **Backend** - API, mikrousługi
- **Baza danych** - Rozwiązania do przechowywania danych
- **Przechowywanie** - Przechowywanie plików i obiektów blob

## Kluczowe funkcje

### 1. Rozwój oparty na szablonach
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Specjalistyczny język Azure
- **Terraform** - Narzędzie do infrastruktury wielochmurowej
- **ARM Templates** - Szablony Azure Resource Manager

### 3. Zintegrowane przepływy pracy
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
azd down          # Clean up resources
```

### 4. Zarządzanie środowiskami
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Struktura projektu

Typowa struktura projektu azd:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Pliki konfiguracyjne

### azure.yaml
Główny plik konfiguracyjny projektu:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Konfiguracja specyficzna dla środowiska:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Typowe przepływy pracy

### Rozpoczęcie nowego projektu
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Cykl rozwoju
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge
```

### Zarządzanie wieloma środowiskami
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Polecenia nawigacyjne

### Odkrywanie
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Zarządzanie projektem
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Monitorowanie
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Najlepsze praktyki

### 1. Używaj znaczących nazw
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Wykorzystuj szablony
- Rozpocznij od istniejących szablonów
- Dostosuj je do swoich potrzeb
- Twórz szablony wielokrotnego użytku dla swojej organizacji

### 3. Izolacja środowisk
- Używaj oddzielnych środowisk dla rozwoju/staging/produkcji
- Nigdy nie wdrażaj bezpośrednio do produkcji z lokalnej maszyny
- Używaj pipeline'ów CI/CD do wdrożeń produkcyjnych

### 4. Zarządzanie konfiguracją
- Używaj zmiennych środowiskowych dla danych wrażliwych
- Przechowuj konfigurację w systemie kontroli wersji
- Dokumentuj ustawienia specyficzne dla środowiska

## Postęp w nauce

### Początkujący (Tydzień 1-2)
1. Zainstaluj azd i uwierzytelnij się
2. Wdróż prosty szablon
3. Zrozum strukturę projektu
4. Naucz się podstawowych poleceń (up, down, deploy)

### Średniozaawansowany (Tydzień 3-4)
1. Dostosuj szablony
2. Zarządzaj wieloma środowiskami
3. Zrozum kod infrastruktury
4. Skonfiguruj pipeline'y CI/CD

### Zaawansowany (Tydzień 5+)
1. Twórz własne szablony
2. Zaawansowane wzorce infrastruktury
3. Wdrożenia wieloregionowe
4. Konfiguracje na poziomie przedsiębiorstwa

## Kolejne kroki

- [Instalacja i konfiguracja](installation.md) - Zainstaluj i skonfiguruj azd
- [Twój pierwszy projekt](first-project.md) - Praktyczny samouczek
- [Przewodnik konfiguracji](configuration.md) - Zaawansowane opcje konfiguracji

## Dodatkowe zasoby

- [Przegląd Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Galeria szablonów](https://azure.github.io/awesome-azd/)
- [Przykłady społeczności](https://github.com/Azure-Samples)

---

**Nawigacja**
- **Poprzednia lekcja**: [README](../../README.md)
- **Następna lekcja**: [Instalacja i konfiguracja](installation.md)

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.