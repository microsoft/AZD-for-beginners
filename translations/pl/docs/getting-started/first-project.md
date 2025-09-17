<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-09-17T16:40:22+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "pl"
}
-->
# Twój Pierwszy Projekt - Praktyczny Samouczek

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [Instalacja i konfiguracja](installation.md)
- **➡️ Następny**: [Konfiguracja](configuration.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój oparty na AI](../ai-foundry/azure-ai-foundry-integration.md)

## Wprowadzenie

Witaj w swoim pierwszym projekcie z Azure Developer CLI! Ten kompleksowy praktyczny samouczek przeprowadzi Cię przez proces tworzenia, wdrażania i zarządzania aplikacją full-stack na platformie Azure za pomocą azd. Będziesz pracować z rzeczywistą aplikacją typu "todo", która zawiera frontend w React, backend API w Node.js oraz bazę danych MongoDB.

## Cele nauki

Po ukończeniu tego samouczka:
- Opanujesz proces inicjalizacji projektu azd za pomocą szablonów
- Zrozumiesz strukturę projektu Azure Developer CLI oraz pliki konfiguracyjne
- Wykonasz pełne wdrożenie aplikacji na Azure wraz z przygotowaniem infrastruktury
- Wprowadzisz aktualizacje aplikacji i strategie ponownego wdrażania
- Zarządzisz wieloma środowiskami dla rozwoju i testów
- Zastosujesz praktyki czyszczenia zasobów i zarządzania kosztami

## Efekty nauki

Po ukończeniu będziesz w stanie:
- Samodzielnie inicjalizować i konfigurować projekty azd na podstawie szablonów
- Skutecznie poruszać się po strukturze projektu azd i wprowadzać zmiany
- Wdrażać aplikacje full-stack na Azure za pomocą pojedynczych poleceń
- Rozwiązywać typowe problemy związane z wdrożeniem i uwierzytelnianiem
- Zarządzać wieloma środowiskami Azure dla różnych etapów wdrożenia
- Wdrażać ciągłe procesy wdrożeniowe dla aktualizacji aplikacji

## Pierwsze kroki

### Lista kontrolna wymagań wstępnych
- ✅ Zainstalowany Azure Developer CLI ([Przewodnik instalacji](installation.md))
- ✅ Zainstalowany i uwierzytelniony Azure CLI
- ✅ Zainstalowany Git na Twoim systemie
- ✅ Node.js 16+ (wymagane dla tego samouczka)
- ✅ Visual Studio Code (zalecane)

### Zweryfikuj konfigurację
```bash
# Check azd installation
azd version
```
### Zweryfikuj uwierzytelnienie Azure

```bash
az account show
```

### Sprawdź wersję Node.js
```bash
node --version
```

## Krok 1: Wybierz i zainicjalizuj szablon

Zacznijmy od popularnego szablonu aplikacji typu "todo", który zawiera frontend w React oraz backend API w Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Co się właśnie wydarzyło?
- Pobranie kodu szablonu do lokalnego katalogu
- Utworzenie pliku `azure.yaml` z definicjami usług
- Przygotowanie kodu infrastruktury w katalogu `infra/`
- Utworzenie konfiguracji środowiska

## Krok 2: Zbadaj strukturę projektu

Przyjrzyjmy się, co azd dla nas stworzył:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Powinieneś zobaczyć:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Kluczowe pliki do zrozumienia

**azure.yaml** - Serce Twojego projektu azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definicja infrastruktury:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Krok 3: Dostosuj swój projekt (opcjonalne)

Przed wdrożeniem możesz dostosować aplikację:

### Zmień frontend
```bash
# Open the React app component
code src/web/src/App.tsx
```

Wprowadź prostą zmianę:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Skonfiguruj zmienne środowiskowe
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Krok 4: Wdróż na Azure

Teraz czas na ekscytującą część - wdrożenie wszystkiego na Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Co dzieje się podczas wdrożenia?

Polecenie `azd up` wykonuje następujące kroki:
1. **Provision** (`azd provision`) - Tworzy zasoby Azure
2. **Package** - Buduje kod aplikacji
3. **Deploy** (`azd deploy`) - Wdraża kod na zasoby Azure

### Oczekiwany wynik
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Krok 5: Przetestuj swoją aplikację

### Uzyskaj dostęp do aplikacji
Kliknij na URL podany w wynikach wdrożenia lub uzyskaj go w dowolnym momencie:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Przetestuj aplikację typu "todo"
1. **Dodaj zadanie** - Kliknij "Add Todo" i wpisz zadanie
2. **Oznacz jako ukończone** - Zaznacz ukończone zadania
3. **Usuń zadania** - Usuń zadania, które nie są już potrzebne

### Monitoruj swoją aplikację
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Krok 6: Wprowadź zmiany i ponownie wdroż

Wprowadźmy zmianę i zobaczmy, jak łatwo jest zaktualizować:

### Zmień API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Dodaj niestandardowy nagłówek odpowiedzi:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Wdróż tylko zmiany w kodzie
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Krok 7: Zarządzaj wieloma środowiskami

Utwórz środowisko testowe, aby sprawdzić zmiany przed produkcją:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Porównanie środowisk
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Krok 8: Wyczyść zasoby

Gdy skończysz eksperymentować, wyczyść zasoby, aby uniknąć dalszych opłat:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Czego się nauczyłeś

Gratulacje! Udało Ci się:
- Zainicjalizować projekt azd na podstawie szablonu
- Zbadać strukturę projektu i kluczowe pliki
- Wdrożyć aplikację full-stack na Azure
- Wprowadzić zmiany w kodzie i ponownie wdrożyć
- Zarządzać wieloma środowiskami
- Wyczyścić zasoby

## Rozwiązywanie typowych problemów

### Problemy z uwierzytelnieniem
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Niepowodzenia wdrożenia
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Konflikty nazw zasobów
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Problemy z portami/siecią
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Kolejne kroki

Po ukończeniu pierwszego projektu, zapoznaj się z tymi zaawansowanymi tematami:

### 1. Dostosowanie infrastruktury
- [Infrastruktura jako kod](../deployment/provisioning.md)
- [Dodawanie baz danych, magazynów i innych usług](../deployment/provisioning.md#adding-services)

### 2. Konfiguracja CI/CD
- [Integracja z GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Najlepsze praktyki produkcyjne
- [Konfiguracje bezpieczeństwa](../deployment/best-practices.md#security)
- [Optymalizacja wydajności](../deployment/best-practices.md#performance)
- [Monitorowanie i logowanie](../deployment/best-practices.md#monitoring)

### 4. Odkryj więcej szablonów
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Dodatkowe zasoby

### Materiały edukacyjne
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrum architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Społeczność i wsparcie
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Społeczność Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Szablony i przykłady
- [Oficjalna galeria szablonów](https://azure.github.io/awesome-azd/)
- [Szablony społeczności](https://github.com/Azure-Samples/azd-templates)
- [Wzorce dla przedsiębiorstw](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulacje z ukończenia swojego pierwszego projektu azd!** Teraz jesteś gotowy, aby z pewnością budować i wdrażać niesamowite aplikacje na Azure.

---

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [Instalacja i konfiguracja](installation.md)
- **➡️ Następny**: [Konfiguracja](configuration.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój oparty na AI](../ai-foundry/azure-ai-foundry-integration.md)
- **Następna lekcja**: [Przewodnik wdrożeniowy](../deployment/deployment-guide.md)

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za źródło autorytatywne. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.