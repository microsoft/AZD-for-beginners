# Podstawy AZD - Podstawowe Pojęcia i Fundamenty

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 1 - Fundamenty i szybki start
- **⬅️ Poprzedni**: [Przegląd kursu](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Następny**: [Instalacja i konfiguracja](installation.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Wprowadzenie

> Sprawdzono względem `azd 1.37.2` (listopad 2026). Polecenia bash używają cytowanych symboli zastępczych, które musisz zastąpić. Szablony workflow używają `.` do inicjalizacji bieżącego katalogu; bez argumentu katalogu inicjalizacja szablonu tworzy podkatalog i nie zmienia katalogu roboczego powłoki. Zaawansowane snippet-y są ilustracyjne, nie kompletne projekty.

Ta lekcja wprowadza Cię do Azure Developer CLI (azd), potężnego narzędzia wiersza poleceń, które przyspiesza Twoją drogę od lokalnego rozwoju do wdrożenia w Azure. Poznasz podstawowe pojęcia, kluczowe funkcje i zrozumiesz, jak azd upraszcza wdrażanie aplikacji natywnych dla chmury.

## Cele nauki

Do końca tej lekcji:
- Zrozumiesz, czym jest Azure Developer CLI i jaki ma główny cel
- Poznasz podstawowe pojęcia dotyczące szablonów, środowisk i usług
- Odkryjesz kluczowe funkcje, w tym rozwój oparty na szablonach i Infrastrukturę jako Kod
- Zrozumiesz strukturę projektu azd i workflow
- Będziesz przygotowany do instalacji i konfiguracji azd dla swojego środowiska deweloperskiego

## Rezultaty nauki

Po ukończeniu tej lekcji będziesz potrafił:
- Wyjaśnić rolę azd w nowoczesnych workflowach rozwoju chmurowego
- Zidentyfikować składniki struktury projektu azd
- Opisać, jak szablony, środowiska i usługi współpracują
- Zrozumieć korzyści z Infrastrukturą jako Kod z azd
- Rozpoznać różne polecenia azd i ich zastosowania

## Czym jest Azure Developer CLI (azd)?

Azure Developer CLI (azd) to narzędzie wiersza poleceń zaprojektowane, by przyspieszyć Twoją drogę od lokalnego rozwoju do wdrożenia w Azure. Upraszcza proces budowania, wdrażania i zarządzania aplikacjami natywnymi dla chmury na platformie Azure.

### Co można wdrażać za pomocą azd?

azd obsługuje szeroki zakres obciążeń — i lista stale rośnie. Dziś możesz używać azd do wdrażania:

| Typ obciążenia | Przykłady | Ten sam workflow? |
|---------------|----------|----------------|
| **Tradycyjne aplikacje** | Aplikacje webowe, REST API, strony statyczne | ✅ `azd up` |
| **Usługi i mikrousługi** | Aplikacje kontenerowe, Function Apps, backendy wielousługowe | ✅ `azd up` |
| **Aplikacje zasilane AI** | Aplikacje czatu z Microsoft Foundry Models, rozwiązania RAG z AI Search | ✅ `azd up` |
| **Inteligentne agenty** | Agenty hostowane w Foundry, orkiestracje wieloagentowe | ✅ `azd up` |

Kluczową rzeczą jest to, że **cykl życia azd pozostaje taki sam, niezależnie od tego, co wdrażasz**. Inicjujesz projekt, tworzysz infrastrukturę, wdrażasz kod, monitorujesz aplikację i sprzątasz — niezależnie czy to prosta strona internetowa czy zaawansowany agent AI.

Ta ciągłość jest zaprojektowana celowo. azd traktuje możliwości AI jako kolejny rodzaj usługi, z której aplikacja może korzystać, a nie coś zasadniczo innego. Punkt końcowy czatu wspierany przez Microsoft Foundry Models to z perspektywy azd po prostu kolejna usługa do skonfigurowania i wdrożenia.

### 🎯 Dlaczego warto używać AZD? Porównanie z życia

Porównajmy wdrożenie prostej aplikacji webowej z bazą danych:

#### ❌ BEZ AZD: Ręczne wdrożenie w Azure (30+ minut)

**Ilustracyjne porównanie Bash, nie jest starterem działającej aplikacji.** Zakłada istniejący kod aplikacji, unikalne nazwy zasobów, uwierzytelnienie Azure CLI oraz wymagane rozszerzenia CLI. Skorzystaj z ćwiczenia szablonowego poniżej dla obsługiwanego procesu end-to-end.

```bash
# Step 1: Create resource group
az group create --name myapp-rg --location eastus

# Step 2: Create App Service Plan
az appservice plan create --name myapp-plan \
  --resource-group myapp-rg \
  --sku B1 --is-linux

# Step 3: Create Web App
az webapp create --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --plan myapp-plan \
  --runtime "NODE:22-lts"

# Step 4: Create Cosmos DB account (10-15 minutes)
az cosmosdb create --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --kind MongoDB

# Step 5: Create database
az cosmosdb mongodb database create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --name tododb

# Step 6: Create collection
az cosmosdb mongodb collection create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --database-name tododb \
  --name todos

# Step 7: Get connection string
CONN_STR=$(az cosmosdb keys list \
  --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --type connection-strings \
  --query "connectionStrings[0].connectionString" -o tsv)

# Step 8: Configure app settings
az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings MONGODB_URI="$CONN_STR"

# Step 9: Enable logging
az webapp log config --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --application-logging filesystem \
  --detailed-error-messages true

# Step 10: Set up Application Insights
az monitor app-insights component create \
  --app myapp-insights \
  --location eastus \
  --resource-group myapp-rg

# Step 11: Link App Insights to Web App
INSTRUMENTATION_KEY=$(az monitor app-insights component show \
  --app myapp-insights \
  --resource-group myapp-rg \
  --query "instrumentationKey" -o tsv)

az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings APPINSIGHTS_INSTRUMENTATIONKEY="$INSTRUMENTATION_KEY"

# Step 12: Build application locally
npm install
npm run build

# Step 13: Create deployment package
zip -r app.zip . -x "*.git*" "node_modules/*"

# Step 14: Deploy application
az webapp deployment source config-zip \
  --resource-group myapp-rg \
  --name myapp-web-unique123 \
  --src app.zip

# Step 15: Wait and pray it works 🙏
# (No automated validation, manual testing required)
```

**Problemy:**
- ❌ 15+ poleceń do zapamiętania i wykonania w kolejności
- ❌ 30-45 minut pracy ręcznej
- ❌ Łatwo popełnić błędy (literówki, złe parametry)
- ❌ Wymagane jawne zarządzanie poświadczeniami; logi debugowania i śledzenie powłoki mogą je ujawniać
- ❌ Brak automatycznego cofania w razie błędu
- ❌ Trudne do odtworzenia dla członków zespołu
- ❌ Za każdym razem inne (niepowtarzalne)

#### ✅ Z AZD: Automatyczne wdrożenie (5 poleceń, 10-15 minut)

```bash
# Step 1: Initialize from template
azd init --template todo-nodejs-mongo .

# Step 2: Authenticate
azd auth login

# Step 3: Select the environment created during init
azd env select dev

# Step 4: Preview changes (optional but recommended)
azd provision --preview

# Step 5: Deploy everything
azd up

# ✨ Done! Everything is deployed, configured, and monitored
```

**Korzyści:**
- ✅ **5 poleceń** zamiast 15+ kroków ręcznych
- ✅ **10-15 minut** łącznego czasu (głównie oczekiwanie na Azure)
- ✅ **Mniej błędów ręcznych** - spójny, oparty na szablonie workflow
- ✅ **Bezpieczne zarządzanie sekretami** - wiele szablonów korzysta z zarządzanego przez Azure magazynu sekretów
- ✅ **Powtarzalne wdrożenia** - ten sam workflow za każdym razem
- ✅ **Powtarzalne definicje infrastruktury** - z zastrzeżeniem limitów, dostępności regionów i wersji szablonów
- ✅ **Gotowe dla zespołu** - każdy może wdrażać używając tych samych poleceń
- ✅ **Infrastruktura jako Kod** - szablony Bicep kontrolowane wersjami
- ✅ **Monitoring zdefiniowany w szablonie** - Application Insights, kiedy jest uwzględniony w szablonie

### Czas i niezawodność

Powyzsze czasy są szacunkowe, nie benchmarkami. azd zmniejsza liczbę poleceń do skoordynowania, ale nie gwarantuje czasu wdrożenia, nie eliminuje błędów ani nie zapewnia automatycznego cofania aplikacji/bazy danych. Trzymaj działające wersje w kontroli źródła i testuj procedury odzyskiwania.

## Kluczowe Pojęcia

### Szablony
Szablony stanowią fundament azd. Zawierają:
- **Kod aplikacji** - Twój kod źródłowy i zależności
- **Definicje infrastruktury** - zasoby Azure zdefiniowane w Bicep lub Terraform
- **Pliki konfiguracyjne** - Ustawienia i zmienne środowiskowe
- **Skrypty wdrożeniowe** - Automatyczne workflow wdrożenia

### Środowiska
Środowiska reprezentują różne cele wdrożenia:
- **Development** - do testów i rozwoju
- **Staging** - środowisko przedprodukcyjne
- **Production** - produkcyjne środowisko na żywo

Każde środowisko utrzymuje własne:
- Nazwę środowiska i wartości; izolacja zasobów zależy od szablonu infrastruktury
- Ustawienia konfiguracyjne
- Stan wdrożenia

### Usługi
Usługi w `azure.yaml` opisują komponenty aplikacji do wdrożenia:
- **Frontend** - aplikacje webowe, SPA
- **Backend** - API, mikrousługi

Bazy danych i magazyny są zwykle tworzone jako zasoby infrastruktury, nie jako wymyślone hosty usług takie jak `host: postgres`.

## Kluczowe Funkcje

### 1. Rozwój oparty na szablonach
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template "<template-name>" .
```

### 2. Infrastruktura jako Kod
- **Bicep** - specyficzny dla Azure język dziedzinowy
- **Terraform** - narzędzie multi-cloud do zarządzania infrastrukturą
- Bicep kompiluje się do szablonów ARM; surowy JSON ARM nie jest osobnym wbudowanym `infra.provider`.

### 3. Zintegrowane workflowy
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup

# 🧪 NEW: Preview infrastructure changes before deployment (SAFE)
azd provision --preview    # Simulate infrastructure deployment without making changes

azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

#### 🛡️ Bezpieczne planowanie infrastruktury z podglądem
Polecenie `azd provision --preview` to przełom w bezpiecznych wdrożeniach:
- **Analiza na sucho** - pokazuje, co zostanie stworzone, zmodyfikowane lub usunięte
- **Brak zastosowania infrastruktury** - przegląda zmiany dostawcy; najpierw sprawdź hooki projektu, ponieważ hooki mogą uruchamiać polecenia z efektami ubocznymi
- **Współpraca zespołowa** - udostępnia wyniki podglądu przed wdrożeniem
- **Planowanie kosztów** - sprawdź proponowane SKU, potem wyceń je w Azure Pricing Calculator; podgląd nie oblicza cen

```bash
# Example preview workflow
azd provision --preview           # See what will change
# Review the output, discuss with team
azd provision                     # Apply changes with confidence
```

### 📊 Wizualizacja: Workflow rozwoju AZD

```mermaid
graph LR
    %% Initialization Phase
    subgraph Setup & Init
        A[azd init] -->|Initialize project| B[azd auth login]
        B -->|Authenticate| C[azd env new]
        C -->|Create environment| D{First deployment?}
    end

    %% Deployment Phase
    D -->|Yes| E[azd up]
    D -->|No| F[azd provision --preview]
    
    F -->|Review changes| G[azd provision]
    
    %% Operational Phase
    E -->|Provisions & deploys| H((Resources running))
    G -->|Updates infrastructure| H
    
    H -->|Monitor logs/metrics| I[azd monitor]
    
    %% Daily Dev Loop
    J[azd deploy] -->|Redeploy code only| H
    H -->|Make code changes| J
    
    %% Cleanup
    H -->|Teardown resources| K[azd down]

    %% Styling
    style A fill:#e1f5fe,stroke:#01579b,stroke-width:2px
    style E fill:#c8e6c9,stroke:#2e7d32,stroke-width:2px
    style F fill:#fff9c4,stroke:#fbc02d,stroke-width:2px
    style H fill:#d1c4e9,stroke:#512da8,stroke-width:2px
    style J fill:#e1f5fe,stroke:#01579b,stroke-width:1px
    style K fill:#ffcdd2,stroke:#c62828,stroke-width:2px
```

**Objaśnienie workflow:**
1. **Init** - zacznij od szablonu lub nowego projektu
2. **Auth** - uwierzytelnij się w Azure
3. **Environment** - stwórz izolowane środowisko wdrożeniowe
4. **Preview** - 🆕 Najpierw zawsze podglądaj zmiany infrastruktury (bezpieczna praktyka)
5. **Provision** - twórz/aktualizuj zasoby Azure
6. **Deploy** - wypchnij kod swojej aplikacji
7. **Monitor** - obserwuj wydajność aplikacji
8. **Iterate** - wprowadzaj zmiany i ponownie wdrażaj kod
9. **Cleanup** - usuń zasoby, gdy skończysz

### 4. Zarządzanie środowiskami
```bash
# Create and manage environments
azd env new "<environment-name>"
azd env select "<environment-name>"
azd env list
```

### 5. Rozszerzenia i polecenia AI

azd korzysta z systemu rozszerzeń, aby dodać funkcje wykraczające poza podstawowy CLI. Jest to szczególnie przydatne w obciążeniach AI:

```bash
# List available extensions
azd extension list

# Install the GA Foundry bundle (requires azd >= 1.37.0)
azd ext install microsoft.foundry

# Initialize an AI agent project interactively
azd ai agent init

# Test a deployed agent (shows latency and time-to-first-byte)
azd ai agent invoke

# Start the MCP server for AI-assisted development (Alpha)
azd mcp start
```

**Cykl życia agenta, od początku do końca.** Zestaw oficjalny `microsoft.foundry` zawiera `azure.ai.agents` oraz sześć innych podstawowych rozszerzeń. Zainstaluj `azure.ai.evaluations` osobno do oceny. Użyj `azd >= 1.37.0` w tym workflow. Nie musisz mieć ich wszystkich od pierwszego dnia:

| Etap | Polecenie | Co robi |
|-------|---------|--------------|
| **Scaffold** | `azd ai agent init --template <path-to-azure.yaml>` | Przyjmij aktualny szablon projektu agenta |
| **Uruchom lokalnie** | `azd ai agent run`, potem `azd ai agent invoke --local "Test prompt"` w innym terminalu | Przeglądaj aktywność lokalną w Agent Inspector; wywołania modeli nadal korzystają z Azure |
| **Wdrożenie** | `azd deploy` | Dla agentów hostowanych w trybie kodowym, prześlij źródło do zdalnego builda Foundry |
| **Testowanie** | `azd ai agent invoke` | Wywołaj agenta i zobacz czas odpowiedzi |
| **Pomiary** | `azd ai eval init`, `generate`, `run start` | Konfiguruj, wdrażaj i wykonuj oceny za pomocą oddzielnego rozszerzenia |
| **Doskonalenie** | `azd ai agent optimize --eval <evaluation-name> --optimize-model <optimizer-deployment>` | Wykorzystaj kompatybilną ocenę do optymalizacji agenta |
| **Inspekcja** | `azd ai agent endpoint show` | Zobacz konfigurację działającego punktu końcowego |
| **Sprzątanie** | `azd ai agent delete` | Usuń hostowanego agenta i wszystkie jego wersje |

> Zacznij od [przewodnika po hostowanym agencie GA](../chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga), który obejmuje wymagania wstępne, provisioning i bezpieczne sprzątanie. Rozszerzenia są omówione dalej w referencji [Polecenia AI CLI AZD](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

## 📁 Struktura projektu

Typowa struktura projektu azd:
```
my-app/
├── .azure/                  # Local environments and selected-environment config
│   ├── config.json
│   └── dev/.env
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
Lokalny wybór domyślnego środowiska projektu (ilustracyjne; zarządzane przez azd):
```json
{
  "defaultEnvironment": "dev"
}
```

## 🎪 Typowe workflowy z ćwiczeniami praktycznymi

> **💡 Wskazówka naukowa:** Wykonuj te ćwiczenia w kolejności, aby stopniowo rozwijać umiejętności AZD.

### 🎯 Ćwiczenie 1: Zainicjuj swój pierwszy projekt

**Cel:** Utworzyć projekt AZD i poznać jego strukturę

**Kroki:**
```bash
# Use a proven template
mkdir azd-basics-practice
cd azd-basics-practice
# Choose "dev" for the environment name when prompted
azd init --template todo-nodejs-mongo .

# Explore the generated files
ls -la  # View all files including hidden ones

# Key files created:
# - azure.yaml (main config)
# - infra/ (infrastructure code)
# - src/ (application code)
```

**✅ Sukces:** Masz katalogi azure.yaml, infra/ oraz src/

---

### 🎯 Ćwiczenie 2: Wdrożenie do Azure

**Cel:** Kompleksowe wdrożenie end-to-end

**Kroki:**
```bash
# 1. Authenticate
azd auth login

# 2. Select the dev environment created in Exercise 1
azd env select dev
azd env set AZURE_LOCATION eastus

# 3. Preview changes (RECOMMENDED)
azd provision --preview

# 4. Deploy everything
azd up

# 5. Verify deployment
azd show    # View your app URL
```

**Przewidywany czas:** 10-15 minut  
**✅ Sukces:** Adres URL aplikacji otwiera się w przeglądarce

---

### 🎯 Ćwiczenie 3: Wiele środowisk

**Cel:** Wdrożenie do dev i staging

**Kroki:**
```bash
# Already have dev, create staging
azd env new staging
azd env set AZURE_LOCATION westus2
azd up

# Switch between them
azd env list
azd env select dev
```

**✅ Sukces:** Dwie oddzielne grupy zasobów w Azure Portal

**Sprzątanie:** Ćwiczenie 3 tworzy drugie płatne wdrożenie. Usuń oba po zakończeniu:

```bash
azd down --environment dev
azd down --environment staging
```

---

### 🛡️ Niszczycielskie sprzątanie: `azd down --force --purge`

Gdy chcesz celowo usunąć zasoby Azure wybranego środowiska:

```bash
azd down --force --purge
```

**Co robi:**
- `--force`: Brak monitów o potwierdzenie
- `--purge`: Usuwa również trwale obsługiwane zasoby miękko usunięte (np. Key Vaults), jeśli ochrona przed usunięciem pozwala. Nie usuwa lokalnego katalogu `.azure/`.

**Użyj, gdy:** zakończysz z używalnym środowiskiem. Nie traktuj niszczycielskiego sprzątania jako pierwszej odpowiedzi na błąd uwierzytelnienia, limitu lub konfiguracji.

---

## 🎪 Oryginalny wzorzec workflow

### Rozpoczynanie nowego projektu
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo .

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Cykl rozwojowy
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
azd down --force --purge # Deletes this environment's discovered Azure resources; review before forcing deletion.
```

## Zrozumienie `azd down --force --purge`
Polecenie `azd down --force --purge` jest potężnym sposobem na całkowite usunięcie środowiska azd i wszystkich powiązanych zasobów. Oto szczegóły działania poszczególnych flag:
```
--force
```
- Pomija pytania o potwierdzenie.
- Przydatne do automatyzacji lub skryptów, gdzie ręczny input jest niemożliwy.
- Nie omija uprawnień, ochrony przed usunięciem ani błędów podczas usuwania.

```
--purge
```
Trwale usuwa obsługiwane miękko usunięte zasoby Azure bez dodatkowego potwierdzenia. Ochrona przed oczyszczeniem i uprawnienia nadal obowiązują. Nie usuwa **lokalnych środowisk** ani folderu `.azure/`.


### Dlaczego używać obu?
Używaj obu tylko wtedy, gdy zamierzasz usunąć zasoby Azure wybranego środowiska i oczyścić zasoby możliwe do odzyskania. Jest to destrukcyjne czyszczenie, a nie ogólna naprawa lub reset stanu lokalnego.

Jest to szczególnie pomocne po ręcznym usuwaniu zasobów w portalu Azure lub podczas zmiany szablonów, środowisk lub konwencji nazewnictwa grup zasobów.


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

## 🔐 Uwierzytelnianie i poświadczenia

Rozróżnij uwierzytelnianie wdrożenia (`azd auth login`) od uwierzytelniania SDK aplikacji (`DefaultAzureCredential`). Są one oddzielne. azd domyślnie nie używa poświadczeń Azure CLI.

### Uwierzytelnianie Azure CLI (`az login`)

Uruchom `azd auth login` dla azd. Poniższe polecenia Azure CLI są opcjonalne i uwierzytelniają polecenia `az` osobno:

```bash
# Interactive login (opens browser)
az login

# Login with specific tenant
az login --tenant "<tenant-id>"

# Login with service principal
az login --service-principal -u "<app-id>" -p "<password>" --tenant "<tenant-id>"

# Check current login status
az account show

# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Przebieg uwierzytelniania
1. **Interaktywne logowanie**: Otwiera domyślną przeglądarkę w celu uwierzytelnienia
2. **Przepływ kodu urządzenia**: Dla środowisk bez dostępu do przeglądarki
3. **Service Principal**: Do scenariuszy automatyzacji i CI/CD
4. **Managed Identity**: Dla aplikacji hostowanych w Azure

### Łańcuch DefaultAzureCredential

`DefaultAzureCredential` to typ poświadczeń, który zapewnia uproszczone doświadczenie uwierzytelniania, automatycznie próbując kilka źródeł poświadczeń w określonej kolejności:

#### Łańcuch poświadczeń SDK aplikacji

Dokładny łańcuch zależy od języka SDK Azure Identity, wersji, zainstalowanych wtyczek i opcji. Ten diagram jest koncepcyjny, a nie stałą sekwencją uwierzytelniania azd; nowsze SDK mogą również zawierać poświadczenia Azure Developer CLI.
```mermaid
graph TD
    A[DefaultAzureCredential] --> B[Environment Variables]
    B --> C[Workload Identity]
    C --> D[Managed Identity]
    D --> E[Visual Studio]
    E --> F[Visual Studio Code]
    F --> G[Azure CLI]
    G --> H[Azure PowerShell]
    H --> I[Interactive Browser]
```

#### 1. Zmienne środowiskowe
```bash
# Set environment variables for service principal
export AZURE_CLIENT_ID="<app-id>"
export AZURE_CLIENT_SECRET="<password>"
export AZURE_TENANT_ID="<tenant-id>"
```

#### 2. Tożsamość obciążenia (Kubernetes/GitHub Actions)
Używane automatycznie w:
- Azure Kubernetes Service (AKS) z Workload Identity
- GitHub Actions z federacją OIDC
- Inne scenariusze tożsamości federowanej

#### 3. Managed Identity
Dla zasobów Azure, takich jak:
- Maszyny wirtualne
- App Service
- Azure Functions
- Container Instances

```bash
# Inspect a deployed Container App's configured identity (requires az login)
az containerapp show --name "<app-name>" --resource-group "<rg-name>" --query identity
```

#### 4. Integracja narzędzi deweloperskich
- **Visual Studio**: Automatycznie używa zalogowanego konta
- **VS Code**: Obsługa zależy od SDK i jego konfiguracji brokera/wtyczek
- **Azure CLI**: Używa poświadczeń `az login` (najczęstsze dla lokalnego rozwoju)

### Konfiguracja uwierzytelniania AZD

```bash
# Method 1: Direct azd authentication (recommended)
azd auth login

# Method 2: Direct azd authentication
azd auth login --use-device-code  # For headless environments

# Method 3: Check authentication status
azd auth login --check-status

# Method 4: Logout and re-authenticate
azd auth logout
azd auth login
```

### Najlepsze praktyki uwierzytelniania

#### Dla lokalnego rozwoju
```bash
# 1. Log in to azd
azd auth login

# 2. Select the subscription for this initialized environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 3. Check azd sign-in details (read the status message)
azd auth login --check-status
```

#### Dla pipeline’ów CI/CD
```yaml
# Partial GitHub Actions steps: assumes checkout, azd installation,
# required AZURE_* environment values, and pipeline secret configuration.
- name: Deploy with azd
  run: |
    azd auth login --client-id ${{ secrets.AZURE_CLIENT_ID }} \
                    --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
                    --tenant-id ${{ secrets.AZURE_TENANT_ID }}
    azd up --no-prompt
```

#### Dla środowisk produkcyjnych
- Używaj **Managed Identity** podczas działania na zasobach Azure
- Używaj **Service Principal** do scenariuszy automatyzacji
- Unikaj przechowywania poświadczeń w kodzie lub plikach konfiguracyjnych
- Używaj **Azure Key Vault** dla wrażliwych konfiguracji

### Typowe problemy z uwierzytelnianiem i rozwiązania

#### Problem: "Nie znaleziono subskrypcji"
```bash
# Solution: Set default subscription
az account list --output table
az account set --subscription "<subscription-id>"
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"
```

#### Problem: "Niewystarczające uprawnienia"
```bash
# Solution: Check and assign required roles
az role assignment list --assignee $(az account show --query user.name --output tsv)

# Common required roles:
# - Contributor (for resource management)
# - User Access Administrator (for role assignments)
```

#### Problem: "Ważność tokena wygasła"
```bash
# Solution: Re-authenticate
az logout
az login
azd auth logout
azd auth login
```

### Uwierzytelnianie w różnych scenariuszach

#### Lokalny rozwój
```bash
# Personal development account
az login
azd auth login
```

#### Praca zespołowa
```bash
# Use specific tenant for organization
az login --tenant contoso.onmicrosoft.com
azd auth login --tenant-id "<tenant-id>"
```

#### Scenariusze wielodostępne
```bash
# Switch between tenants
az login --tenant tenant1.onmicrosoft.com
azd auth login --tenant-id "<tenant-1-id>"
# Select an environment configured with tenant 1's subscription
azd env select tenant1-dev
# Deploy to tenant 1
azd up

az login --tenant tenant2.onmicrosoft.com  
azd auth login --tenant-id "<tenant-2-id>"
azd env select tenant2-dev
# Deploy to tenant 2
azd up
```

### Aspekty bezpieczeństwa

1. **Przechowywanie poświadczeń**: Nigdy nie przechowuj poświadczeń w kodzie źródłowym
2. **Ograniczenie zakresu**: Stosuj zasadę najmniejszych uprawnień dla service principal
3. **Rotacja tokenów**: Regularnie rotuj tajne klucze service principal
4. **Śledzenie audytu**: Monitoruj działania uwierzytelniania i wdrażania
5. **Bezpieczeństwo sieci**: Stosuj prywatne punkty końcowe, gdy to możliwe

### Rozwiązywanie problemów z uwierzytelnianiem

```bash
# Debug authentication issues
azd auth login --check-status
az account show
az account get-access-token

# Common diagnostic commands
whoami                          # Current user context
az ad signed-in-user show      # Microsoft Entra ID user details
az group list                  # Test resource access
```

## Odkrywanie poleceń

### Odkrywanie
```bash
azd template list              # Browse templates
azd template list --help       # Template discovery options
azd init --help               # Initialization options
```

### Zarządzanie projektem
```bash
azd show                     # Project overview
azd env list                # Available environments and selected default
azd config show            # Configuration settings
```

### Monitorowanie
```bash
azd monitor                  # Open Azure portal monitoring
azd monitor --logs           # View application logs
azd monitor --live           # View live metrics
azd pipeline config          # Set up CI/CD
```

## Najlepsze praktyki

### 1. Używaj znaczących nazw
```bash
# Good
azd env new production-east
azd init --template todo-nodejs-mongo .

# Avoid
azd env new env1
azd init --template template1 .
```

### 2. Wykorzystuj szablony
- Zaczynaj od istniejących szablonów
- Dostosuj je do swoich potrzeb
- Twórz wielokrotnego użytku szablony dla swojej organizacji

### 3. Izolacja środowiska
- Używaj osobnych środowisk dla dev/staging/prod
- Nigdy nie wdrażaj bezpośrednio do produkcji z lokalnej maszyny
- Używaj pipeline’ów CI/CD do wdrożeń produkcyjnych

### 4. Zarządzanie konfiguracją
- Używaj managed identity i Key Vault dla sekretów; zwykłe wartości `azd env set` są przechowywane lokalnie w postaci jawnej
- Przechowuj konfigurację w kontroli wersji
- Dokumentuj ustawienia specyficzne dla środowiska

## Postępy w nauce

### Początkujący (tydzień 1-2)
1. Zainstaluj azd i uwierzytelnij się
2. Wdróż prosty szablon
3. Zrozum strukturę projektu
4. Naucz się podstawowych poleceń (up, down, deploy)

### Średniozaawansowany (tydzień 3-4)
1. Dostosuj szablony
2. Zarządzaj wieloma środowiskami
3. Zrozum kod infrastruktury
4. Skonfiguruj pipeline’y CI/CD

### Zaawansowany (tydzień 5+)
1. Twórz własne szablony
2. Zaawansowane wzorce infrastruktury
3. Wdrożenia w wielu regionach
4. Konfiguracje klasy korporacyjnej

## Następne kroki

**📖 Kontynuuj naukę rozdziału 1:**
- [Instalacja i konfiguracja](installation.md) - Zainstaluj i skonfiguruj azd
- [Twój pierwszy projekt](first-project.md) - Zakończ praktyczny samouczek
- [Przewodnik po konfiguracji](../chapter-03-configuration/configuration.md) - Zaawansowane opcje konfiguracyjne

**🎯 Gotowy na następny rozdział?**
- [Rozdział 2: Rozwój w podejściu AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md) - Zacznij budować aplikacje AI

## Dodatkowe zasoby

- [Przegląd Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Galeria szablonów](https://azure.github.io/awesome-azd/)
- [Przykłady społeczności](https://github.com/Azure-Samples)

---

## 🙋 Często zadawane pytania

### Pytania ogólne

**P: Jaka jest różnica między AZD a Azure CLI?**

O: Azure CLI (`az`) służy do zarządzania pojedynczymi zasobami Azure. AZD (`azd`) służy do zarządzania całymi aplikacjami:

```bash
# Azure CLI - Low-level resource management
az webapp create --name myapp --resource-group rg
az sql server create --name myserver --resource-group rg
# ...many more commands needed

# AZD - Application-level management
azd up  # Deploys entire app with all resources
```

**Myśl o tym tak:**
- `az` = Operowanie pojedynczymi klockami Lego
- `azd` = Praca z kompletnymi zestawami Lego

---

**P: Czy muszę znać Bicep lub Terraform, aby używać AZD?**

O: Nie! Zacznij od szablonów:
```bash
# Use existing template - no IaC knowledge needed
azd init --template todo-nodejs-mongo .
azd up
```

Możesz nauczyć się Bicep później, aby dostosować infrastrukturę. Szablony dostarczają działające przykłady do nauki.

---

**P: Ile kosztuje uruchomienie szablonów AZD?**

O: Koszty różnią się w zależności od regionu, SKU, czasu działania, trybu bazy danych i użycia modelu. Środowisko deweloperskie może generować znaczne miesięczne opłaty nawet w stanie bezczynności; nie zakładaj uniwersalnego zakresu 50-150 USD:

```bash
# Preview resource changes (not prices)
azd provision --preview

# Always cleanup when not using
azd down --force --purge  # Removes all resources
```

**Profesjonalna wskazówka:** Korzystaj z bezpłatnych poziomów, gdzie dostępne:
- App Service: warstwa F1 (Bezpłatna)
- Azure OpenAI: brak gwarantowanego ogólnego miesięcznego darmowego limitu tokenów; sprawdź aktualny cennik modeli i ofertę
- Cosmos DB: kwalifikujące się konta z gwarantowaną przepustowością mogą wybrać bezpłatny poziom; szablony serverless nie kwalifikują się automatycznie

---

**P: Czy mogę używać AZD z istniejącymi zasobami Azure?**

O: Tak, ale łatwiej zacząć od nowa. AZD działa najlepiej, gdy zarządza pełnym cyklem życia. Dla istniejących zasobów:

```bash
# Option 1: Import existing resources (advanced)
azd init
# Then modify infra/ to reference existing resources

# Option 2: Start fresh (recommended)
azd init --template "<verified-template-name>" .
azd up  # Creates new environment
```

---

**P: Jak udostępnić projekt kolegom z zespołu?**

O: Skonfiguruj projekt AZD w Git (ALE NIE katalogu .azure):

```bash
# Already in .gitignore by default
.azure/        # Contains secrets and environment data
*.env          # Environment variables

# Team members then:
git clone "<your-repo>"
# Change into the cloned repository before running the remaining commands.
azd auth login
azd env new "<their-name>-dev"
azd up
```

Wszyscy mają identyczną infrastrukturę z tych samych szablonów.

---

### Pytania dotyczące rozwiązywania problemów

**P: "azd up" nie powiodło się w połowie. Co robić?**

O: Sprawdź błąd, napraw, a następnie spróbuj ponownie:

```bash
# Capture detailed diagnostics (redact sensitive values before sharing)
azd up --debug

# Common fixes:

# 1. If quota exceeded:
azd env set AZURE_LOCATION "westus2"  # Try different region

# 2. If resource name conflict:
azd down --force --purge  # Clean slate
azd up  # Retry

# 3. If auth expired:
az login
azd auth login
azd up
```

**Najczęstszy problem:** wybrana błędna subskrypcja Azure
```bash
az account list --output table
az account set --subscription "<correct-subscription>"
azd env set AZURE_SUBSCRIPTION_ID "<correct-subscription-id>"
```

---

**P: Jak wdrożyć tylko zmiany w kodzie bez reprowizji?**

O: Użyj `azd deploy` zamiast `azd up`:

```bash
azd up          # First time: provision + deploy (slow)

# Make code changes...

azd deploy      # Subsequent times: deploy only (fast)
```

Porównanie czasu:
- `azd up`: 10-15 minut (prowizjonuje infrastrukturę)
- `azd deploy`: 2-5 minut (tylko kod)

---

**P: Czy mogę dostosować szablony infrastruktury?**

O: Tak! Edytuj pliki Bicep w `infra/`:

```bash
# After azd init
cd infra/
code main.bicep  # Edit in VS Code

# Preview changes
azd provision --preview

# Apply changes
azd provision
```

**Wskazówka:** Zacznij od małych zmian - najpierw zmień SKU:
```bicep
// infra/main.bicep
sku: {
  name: 'B1'  // Change to 'P1V2' for production
}
```

---

**P: Jak usunąć wszystko, co utworzył AZD?**

O: Jedno polecenie usuwa wszystkie zasoby:

```bash
azd down --force --purge

# This deletes:
# - Azure resources/resource groups discovered for the selected environment
# - Supported soft-deleted resources, if purge protection allows
# Local .azure files remain; shared/external resources may remain too.
```

**Uruchamiaj to zawsze, gdy:**
- Zakończysz testowanie szablonu
- Przechodzisz do innego projektu
- Chcesz zacząć od nowa

**Sprawdź koszty:** Potwierdź usunięcie w Azure i sprawdź zasoby pozostawione lub współdzielone. Wcześniej naliczone opłaty nadal obowiązują.

---

**P: Co jeśli przypadkowo usunąłem zasoby w Azure Portal?**

O: Stan AZD może się rozbiec. Podejście z czystą kartą:

```bash
# 1. Delete remaining resources only if that is your intent
azd down --force --purge

# 2. Start fresh
azd up

# Alternative: Let AZD detect and fix
azd provision  # Will create missing resources
```

---

### Pytania zaawansowane

**P: Czy mogę używać AZD w pipeline’ach CI/CD?**

O: Tak! Przykład GitHub Actions:

```yaml
# .github/workflows/deploy.yml
name: Deploy with AZD

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Install azd
        run: curl -fsSL https://aka.ms/install-azd.sh | bash
      
      - name: Azure Login
        run: |
          azd auth login \
            --client-id ${{ secrets.AZURE_CLIENT_ID }} \
            --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
            --tenant-id ${{ secrets.AZURE_TENANT_ID }}
      
      - name: Deploy
        env:
          AZURE_ENV_NAME: dev
          AZURE_LOCATION: ${{ vars.AZURE_LOCATION }}
          AZURE_SUBSCRIPTION_ID: ${{ vars.AZURE_SUBSCRIPTION_ID }}
        run: azd up --no-prompt
```

---

**P: Jak obsługiwać sekrety i dane wrażliwe?**

O: Używaj bezpośrednio Key Vault. `azd env set` zapisuje zwykłe wartości do lokalnego pliku środowiskowego; nie tworzy automatycznie sejfu, nie przypisuje ról ani nie wstrzykuje sekretów do aplikacji.

```bash
# Interactive: create/select a Key Vault secret and save its reference
azd env set-secret DATABASE_PASSWORD
```

Musisz mieć odpowiednie uprawnienia do sejfu. Twoja infrastruktura/aplikacja musi nadal podłączyć sekret do jego konsumenta i przyznać tożsamości uruchomieniowej dostęp. Nie wyświetlaj rozwiązanych wartości sekretów w logach.

**Nigdy nie commituj:**
- katalogu `.azure/` (zawiera dane środowiskowe)
- plików `.env` (lokalne sekrety)
- Łańcuchów połączeń

---

**P: Czy mogę wdrożyć do wielu regionów?**

O: Tak, utwórz środowisko na region:

```bash
# East US environment
azd env new prod-eastus
azd env set AZURE_LOCATION eastus
azd up

# West Europe environment
azd env new prod-westeurope
azd env set AZURE_LOCATION westeurope
azd up

# Each environment is independent
azd env list
```

Dla prawdziwych aplikacji wieloregionalnych dostosuj szablony Bicep do jednoczesnego wdrażania w wielu regionach.

---

**P: Gdzie mogę uzyskać pomoc, jeśli utknę?**

1. **Dokumentacja AZD:** https://learn.microsoft.com/azure/developer/azure-developer-cli/
2. **GitHub Issues:** https://github.com/Azure/azure-dev/issues
3. **Discord:** [Azure Discord](https://discord.gg/microsoft-azure) - kanał #azure-developer-cli
4. **Stack Overflow:** Tag `azure-developer-cli`
5. **Ten kurs:** [Przewodnik rozwiązania problemów](../chapter-07-troubleshooting/common-issues.md)

**Profesjonalna wskazówka:** Przed zadaniem pytania uruchom:
```bash
azd show       # Shows current state
azd version    # Shows your version
```
Dołącz te informacje do pytania, aby szybciej uzyskać pomoc.

---

## 🎓 Co dalej?

Teraz rozumiesz podstawy AZD. Wybierz swoją ścieżkę:

### 🎯 Dla początkujących:
1. **Dalej:** [Instalacja i konfiguracja](installation.md) - Zainstaluj AZD na swojej maszynie
2. **Następnie:** [Twój pierwszy projekt](first-project.md) - Wdróż swoją pierwszą aplikację
3. **Ćwicz:** Wykonaj wszystkie 3 ćwiczenia z tej lekcji

### 🚀 Dla programistów AI:
1. **Przejdź do:** [Rozdział 2: Rozwój w podejściu AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)
2. **Wdróż:** W pustym katalogu projektu zacznij od `azd init --template get-started-with-ai-chat .`
3. **Ucz się:** Buduj podczas wdrożenia

### 🏗️ Dla doświadczonych programistów:
1. **Przejrzyj:** [Przewodnik konfiguracji](../chapter-03-configuration/configuration.md) - Zaawansowane ustawienia
2. **Zbadaj:** [Infrastruktura jako kod](../chapter-04-infrastructure/provisioning.md) - Dogłębne poznanie Bicep
3. **Twórz:** Twórz własne szablony dla swojego stosu

---

**Nawigacja w rozdziale:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 1 - Podstawy i szybki start  
- **⬅️ Poprzedni**: [Przegląd kursu](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Następny**: [Instalacja i konfiguracja](installation.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój w podejściu AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->