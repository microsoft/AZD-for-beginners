# Twój Pierwszy Projekt - Praktyczny Kurs

**Nawigacja po rozdziale:**
- **📚 Strona główna kursu**: [AZD Dla Początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [Instalacja i konfiguracja](installation.md)
- **➡️ Następny**: [Przynieś własną aplikację](bring-your-own-app.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój AI-Pierwszy](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Wprowadzenie

Witamy w Twoim pierwszym projekcie Azure Developer CLI! Wdrożysz aplikację todo z frontendem React, API Node.js i bazą danych Azure Cosmos DB. Szablon zachowuje historyczną nazwę `todo-nodejs-mongo`; jego aktualna infrastruktura korzysta z Cosmos DB jako NoSQL, więc zapoznaj się z pobranym plikiem README i `infra/` zamiast wywnioskować API bazy danych na podstawie nazwy.

> Przejrzano w oparciu o `azd 1.37.2` i publiczny szablon w listopadzie 2026. Poniższe przykłady używają Basha; wyodrębnianie JSON wymaga także `jq`. Wdrożenia Azure wiążą się z opłatami i nie były wykonywane podczas tej recenzji.

## Cele nauki

Realizując ten kurs, nauczysz się:
- Opanować workflow inicjalizacji projektu azd z wykorzystaniem szablonów
- Zrozumieć strukturę projektu Azure Developer CLI i pliki konfiguracyjne
- Wykonać pełne wdrożenie aplikacji do Azure wraz z provisioningiem infrastruktury
- Wdrażać aktualizacje aplikacji i strategie ponownego wdrażania
- Zarządzać wieloma środowiskami dla rozwoju i testów
- Stosować praktyki czyszczenia zasobów i zarządzania kosztami

## Rezultaty nauki

Po ukończeniu będziesz potrafił:
- Samodzielnie inicjalizować i konfigurować projekty azd ze szablonów
- Sprawnie nawigować i modyfikować struktury projektów azd
- Wdrażać aplikacje full-stack do Azure jednym poleceniem
- Rozwiązywać typowe problemy z wdrożeniem i uwierzytelnianiem
- Zarządzać wieloma środowiskami Azure na różnych etapach wdrożenia
- Wprowadzać ciągłe procesy wdrażania dla aktualizacji aplikacji

## Rozpoczęcie pracy

### Lista wymagań wstępnych
- ✅ Zainstalowany Azure Developer CLI ([Przewodnik instalacji](installation.md))
- ✅ Uwierzytelnienie AZD zakończone z użyciem `azd auth login`
- ✅ Git zainstalowany na Twoim systemie
- ✅ Node.js 22 LTS (lub wersja zgodna z pobranym szablonem)
- ✅ Visual Studio Code (zalecane)

Zanim przejdziesz dalej, uruchom validator konfiguracji z katalogu głównego repozytorium:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Sprawdź swoją konfigurację
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Sprawdź opcjonalne uwierzytelnienie Azure CLI

```bash
az account show
```

### Sprawdź wersję Node.js
```bash
node --version
```

## Krok 1: Wybierz i zainicjuj szablon

Zacznijmy od popularnego szablonu aplikacji todo z frontendem React i backendem API w Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Co się właśnie stało?
- Pobranie kodu szablonu do lokalnego katalogu
- Utworzono plik `azure.yaml` z definicjami usług
- Skonfigurowano kod infrastruktury w katalogu `infra/`
- Utworzono konfigurację środowiska

## Krok 2: Zbadaj strukturę projektu

Przyjrzyjmy się, co utworzył azd:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Powinieneś zobaczyć:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Kluczowe pliki do zrozumienia

**azure.yaml** - Serce twojego projektu azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definicja infrastruktury:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Krok 3: Dostosuj swój projekt (opcjonalnie)

Przed wdrożeniem możesz dostosować aplikację:

### Zmodyfikuj frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Wprowadź prostą zmianę:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Skonfiguruj zmienne środowiskowe
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Te dwie niestandardowe wartości demonstrują wyłącznie lokalne przechowywanie. Domyślny szablon nie korzysta z `WEBSITE_TITLE` ani `API_VERSION`, więc nie zmieniają one aplikacji. Wyraźna edycja źródła powyżej zmienia wyświetlany tytuł.

## Krok 4: Wdrożenie do Azure

Teraz ekscytująca część - wdroż wszystko do Azure!

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

Workflow zapewnia provisioning infrastruktury oraz pakietowanie/wdrożenie kodu. Kolejność można dostosować za pomocą `workflows.up` w `azure.yaml`; ten szablon określa provisioning, a następnie deploy. Nie polegaj na jednej uniwersalnej kolejności faz dla każdego szablonu.

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
Kliknij na URL podany w wyniku wdrożenia lub uzyskaj go w dowolnym momencie:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Przetestuj aplikację Todo
1. **Dodaj zadanie do listy** - Kliknij „Dodaj Todo” i wpisz zadanie
2. **Oznacz jako ukończone** - Zaznacz wykonane zadania
3. **Usuń zadania** - Usuń todo, których już nie potrzebujesz

### Monitoruj swoją aplikację
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Zweryfikuj swoje wdrożenie

Zanim przejdziesz dalej, przejdź szybko przez tę listę kontrolną, aby potwierdzić, że wszystko faktycznie działa — nie zakładaj, że „wdrożenie powiodło się” oznacza „aplikacja działa”:

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Wdrożenie jest zweryfikowane, gdy:**
- ✅ `azd show` listuje osiągalny URL punktu końcowego
- ✅ URL otwiera się w przeglądarce bez błędów
- ✅ Kluczowe funkcje działają (dodawanie/ukończenie/usuwanie todo)
- ✅ `azd monitor --logs` pokazuje przychodzące żądania bez nieoczekiwanych błędów

Jeśli którykolwiek test nie powiódł się, przejdź do [Rozdziału 7: Rozwiązywanie problemów](../chapter-07-troubleshooting/README.md).

## Krok 6: Wprowadź zmiany i wdroż ponownie

Wprowadźmy zmianę i zobaczmy, jak łatwo ją zaktualizować:

### Zmodyfikuj API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
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

Utwórz środowisko staging do testów przed produkcją:

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

## Krok 8: Posprzątaj zasoby

Po zakończeniu eksperymentów posprzątaj, aby uniknąć dalszych opłat:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Klasyczna aplikacja vs. aplikacja zasilana AI: Ten sam workflow

Właśnie wdrożyłeś tradycyjną aplikację webową. A co, gdybyś chciał wdrożyć aplikację wspieraną AI — np. aplikację czatu opartą na modelach Microsoft Foundry?

Dobra wiadomość: **workflow jest identyczny.**

| Krok | Klasyczna aplikacja Todo | Aplikacja czatu AI |
|------|-------------------------|------------------|
| Inicjalizacja (pusty katalog) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Uwierzytelnianie | `azd auth login` | `azd auth login` |
| Wdrożenie | `azd up` | `azd up` |
| Monitorowanie | `azd monitor` | `azd monitor` |
| Sprzątanie | `azd down --force --purge` | `azd down --force --purge` |

Polecenia cyklu życia są takie same, ale wymagania wstępne różnią się. Szablon AI może wymagać dostępu do modeli, limitów regionalnych, przetwarzania danych i dodatkowej konfiguracji. Przeczytaj jego README przed wdrożeniem; `azd up` nie może dostarczyć brakujących uprawnień ani limitów.

To jest podstawowa zasada azd: **jeden workflow, każdy rodzaj pracy.** Umiejętności, które ćwiczyłeś w tym kursie — inicjalizacja, wdrażanie, monitorowanie, redeploy i sprzątanie — mają takie samo zastosowanie do aplikacji i agentów AI.

---

## Czego się nauczyłeś

Gratulacje! Udało Ci się:
- ✅ Zainicjalizować projekt azd ze szablonu
- ✅ Poznać strukturę projektu i kluczowe pliki
- ✅ Wdrożyć aplikację full-stack do Azure
- ✅ Wprowadzić zmiany w kodzie i wdrożyć je ponownie
- ✅ Zarządzać wieloma środowiskami
- ✅ Posprzątać zasoby

## 🎯 Ćwiczenia walidujące umiejętności

### Ćwiczenie 1: Wdrożenie innego szablonu (15 minut)
**Cel**: Udowodnij opanowanie azd init i workflow wdrożenia

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Kryteria sukcesu:**
- [ ] Aplikacja wdraża się bez błędów
- [ ] Można uzyskać dostęp do aplikacji poprzez URL w przeglądarce
- [ ] Aplikacja działa poprawnie (dodawanie/usuwanie todo)
- [ ] Wszystkie zasoby zostały prawidłowo posprzątane

### Ćwiczenie 2: Dostosowanie konfiguracji (20 minut)
**Cel**: Ćwicz przechowywanie wartości lokalnych środowiska bez mylenia ich z konfiguracją uruchomieniową

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Kryteria sukcesu:**
- [ ] Utworzenie niestandardowego środowiska zakończone powodzeniem
- [ ] Zmienne środowiskowe ustawione i możliwe do odczytu
- [ ] `azd env get-value APP_TITLE` wypisuje `My Custom Todo App`
- [ ] Potrafi wyjaśnić, dlaczego wartości te nie zmieniają domyślnej aplikacji bez konsumowania ich przez kod/infrastrukturę

### Ćwiczenie 3: Workflow wielośrodowiskowy (25 minut)
**Cel**: Opanuj zarządzanie środowiskami i strategie wdrożeniowe

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kryteria sukcesu:**
- [ ] Utworzono dwa środowiska o różnych konfiguracjach
- [ ] Oba środowiska wdrożono pomyślnie
- [ ] Możliwość przełączania się między środowiskami za pomocą `azd env select`
- [ ] Zmienne środowiskowe różnią się między środowiskami
- [ ] Pomyślnie posprzątano oba środowiska

## 📊 Twój postęp

**Czas poświęcony**: ~60-90 minut  
**Nabyte umiejętności**:
- ✅ Inicjalizacja projektu na podstawie szablonu
- ✅ Provisioning zasobów Azure
- ✅ Workflow wdrożeń aplikacji
- ✅ Zarządzanie środowiskami
- ✅ Zarządzanie konfiguracją
- ✅ Sprzątanie zasobów i zarządzanie kosztami

**Następny poziom**: Jesteś gotowy na [Przewodnik konfiguracji](../chapter-03-configuration/configuration.md), aby poznać zaawansowane wzorce konfiguracji!

## Rozwiązywanie typowych problemów

### Błędy uwierzytelniania
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Niepowodzenia wdrożeń
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
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

## Następne kroki

Teraz, gdy ukończyłeś swój pierwszy projekt, poznaj te zaawansowane tematy:

### 1. Dostosuj infrastrukturę
- [Infrastruktura jako kod](../chapter-04-infrastructure/provisioning.md)
- [Dodaj infrastrukturę bazy danych](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Skonfiguruj CI/CD
- [Przewodnik wdrożeń](../chapter-04-infrastructure/deployment-guide.md) - Kompletny workflow CI/CD
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfiguracja pipeline

### 3. Najlepsze praktyki produkcyjne
- [Przewodnik wdrożeń](../chapter-04-infrastructure/deployment-guide.md) - Bezpieczeństwo, wydajność i monitorowanie

### 4. Poznaj więcej szablonów
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Dodatkowe zasoby

### Materiały edukacyjne
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrum Architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Społeczność i wsparcie
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Społeczność Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Szablony i przykłady
- [Oficjalna galeria szablonów](https://azure.github.io/awesome-azd/)
- [Społecznościowe szablony](https://github.com/Azure/awesome-azd)
- [Źródło szablonu Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Gratulacje z ukończenia swojego pierwszego projektu azd!** Jesteś teraz gotów, aby zbudować i wdrożyć niesamowite aplikacje na Azure z pełnym przekonaniem.

---

**Nawigacja po rozdziale:**
- **📚 Strona główna kursu**: [AZD Dla Początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [Instalacja i konfiguracja](installation.md)
- **➡️ Następny**: [Przynieś własną aplikację](bring-your-own-app.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój AI-Pierwszy](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->