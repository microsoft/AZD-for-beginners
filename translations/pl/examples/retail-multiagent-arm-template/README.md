<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T17:14:06+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "pl"
}
-->
# Rozwiązanie Retail Multi-Agent - Wdrożenie szablonu ARM

**Rozdział 5: Pakiet wdrożeniowy produkcyjny**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Powiązany rozdział**: [Rozdział 5: Zaawansowane rozwiązania Multi-Agent AI](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Przewodnik scenariusza**: [Kompletna implementacja](../retail-scenario.md)
- **🎯 Szybkie wdrożenie**: [Jedno kliknięcie](../../../../examples/retail-multiagent-arm-template)

Ten katalog zawiera kompletny szablon Azure Resource Manager (ARM) do wdrożenia rozwiązania Multi-Agent Customer Support w branży detalicznej, zapewniając infrastrukturę jako kod dla całej architektury.

## 🎯 Co zostanie wdrożone

### Główna infrastruktura
- **Usługi Azure OpenAI** (wieloregionalne dla wysokiej dostępności)
  - Region główny: GPT-4o dla agenta obsługi klienta
  - Region dodatkowy: GPT-4o-mini dla agenta magazynowego  
  - Region trzeci: Model osadzania tekstu
  - Region oceny: Model oceny GPT-4o
- **Azure AI Search** z funkcjami wyszukiwania wektorowego
- **Azure Storage Account** z kontenerami blobów na dokumenty i przesyłane pliki
- **Środowisko Azure Container Apps** z automatycznym skalowaniem
- **Container Apps** dla routera agentów i interfejsu frontendowego
- **Azure Cosmos DB** do przechowywania historii czatów
- **Azure Key Vault** do zarządzania tajemnicami (opcjonalnie)
- **Application Insights** i Log Analytics do monitorowania (opcjonalnie)
- **Document Intelligence** do przetwarzania dokumentów
- **Bing Search API** do informacji w czasie rzeczywistym

### Tryby wdrożenia

| Tryb | Opis | Zastosowanie | Zasoby |
|------|------|--------------|--------|
| **Minimalny** | Kosztowo zoptymalizowane podstawowe wdrożenie | Rozwój, testowanie | Podstawowe SKU, jeden region, zmniejszona pojemność |
| **Standardowy** | Zrównoważone wdrożenie dla obciążeń produkcyjnych | Produkcja, umiarkowana skala | Standardowe SKU, wieloregionalne, standardowa pojemność |
| **Premium** | Wysoka wydajność, wdrożenie klasy korporacyjnej | Korporacja, duża skala | Premium SKU, wieloregionalne, wysoka pojemność |

## 📋 Wymagania wstępne

1. **Azure CLI** zainstalowane i skonfigurowane
2. **Aktywna subskrypcja Azure** z wystarczającymi limitami
3. **Odpowiednie uprawnienia** do tworzenia zasobów w docelowej subskrypcji
4. **Limity zasobów** dla:
   - Azure OpenAI (sprawdź dostępność regionalną)
   - Container Apps (różni się w zależności od regionu)
   - AI Search (zalecany standardowy poziom lub wyższy)

## 🚀 Szybkie wdrożenie

### Opcja 1: Korzystanie z Azure CLI

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Opcja 2: Korzystanie z Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Opcja 3: Bezpośrednio przez Azure CLI

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Opcje konfiguracji

### Parametry szablonu

| Parametr | Typ | Domyślny | Opis |
|----------|-----|----------|------|
| `projectName` | string | "retail" | Prefiks dla wszystkich nazw zasobów |
| `location` | string | Lokalizacja grupy zasobów | Główny region wdrożenia |
| `secondaryLocation` | string | "westus2" | Dodatkowy region dla wdrożenia wieloregionalnego |
| `tertiaryLocation` | string | "francecentral" | Region dla modelu osadzania |
| `environmentName` | string | "dev" | Oznaczenie środowiska (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Konfiguracja wdrożenia (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Włącz wdrożenie wieloregionalne |
| `enableMonitoring` | bool | true | Włącz Application Insights i logowanie |
| `enableSecurity` | bool | true | Włącz Key Vault i zwiększone bezpieczeństwo |

### Dostosowanie parametrów

Edytuj `azuredeploy.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ Przegląd architektury

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 Użycie skryptu wdrożeniowego

Skrypt `deploy.sh` zapewnia interaktywne doświadczenie wdrożeniowe:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Funkcje skryptu

- ✅ **Walidacja wymagań wstępnych** (Azure CLI, status logowania, pliki szablonów)
- ✅ **Zarządzanie grupą zasobów** (tworzy, jeśli nie istnieje)
- ✅ **Walidacja szablonu** przed wdrożeniem
- ✅ **Monitorowanie postępu** z kolorowym wyjściem
- ✅ **Wyświetlanie wyników wdrożenia**
- ✅ **Wskazówki po wdrożeniu**

## 📊 Monitorowanie wdrożenia

### Sprawdź status wdrożenia

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Wyniki wdrożenia

Po pomyślnym wdrożeniu dostępne są następujące wyniki:

- **URL interfejsu frontendowego**: Publiczny punkt końcowy dla interfejsu webowego
- **URL routera**: Punkt końcowy API dla routera agentów
- **Punkty końcowe OpenAI**: Główne i dodatkowe punkty końcowe usługi OpenAI
- **Usługa wyszukiwania**: Punkt końcowy usługi Azure AI Search
- **Konto Storage**: Nazwa konta Storage dla dokumentów
- **Key Vault**: Nazwa Key Vault (jeśli włączone)
- **Application Insights**: Nazwa usługi monitorowania (jeśli włączone)

## 🔧 Konfiguracja po wdrożeniu

### 1. Konfiguracja indeksu wyszukiwania

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. Przesyłanie danych początkowych

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Testowanie punktów końcowych agentów

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Konfiguracja aplikacji kontenerowych

Szablon ARM wdraża obrazy kontenerów zastępczych. Aby wdrożyć rzeczywisty kod agentów:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ Rozwiązywanie problemów

### Typowe problemy

#### 1. Przekroczony limit Azure OpenAI

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Niepowodzenie wdrożenia aplikacji kontenerowych

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Inicjalizacja usługi wyszukiwania

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Walidacja wdrożenia

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Rozważania dotyczące bezpieczeństwa

### Zarządzanie kluczami
- Wszystkie tajemnice są przechowywane w Azure Key Vault (jeśli włączone)
- Aplikacje kontenerowe używają zarządzanej tożsamości do uwierzytelniania
- Konta Storage mają domyślne ustawienia bezpieczeństwa (tylko HTTPS, brak publicznego dostępu do blobów)

### Bezpieczeństwo sieci
- Aplikacje kontenerowe używają sieci wewnętrznej, gdy to możliwe
- Usługa wyszukiwania skonfigurowana z opcją prywatnych punktów końcowych
- Cosmos DB skonfigurowane z minimalnymi niezbędnymi uprawnieniami

### Konfiguracja RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Optymalizacja kosztów

### Szacunkowe koszty (miesięczne, USD)

| Tryb | OpenAI | Aplikacje kontenerowe | Wyszukiwanie | Storage | Całkowity szacowany koszt |
|------|--------|------------------------|--------------|---------|---------------------------|
| Minimalny | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standardowy | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Monitorowanie kosztów

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Aktualizacje i konserwacja

### Aktualizacje szablonu
- Kontroluj wersje plików szablonów ARM
- Testuj zmiany najpierw w środowisku rozwojowym
- Używaj trybu wdrożenia inkrementalnego do aktualizacji

### Aktualizacje zasobów
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Kopie zapasowe i odzyskiwanie
- Automatyczne kopie zapasowe Cosmos DB włączone
- Funkcja miękkiego usuwania w Key Vault włączona
- Rewizje aplikacji kontenerowych utrzymywane dla cofnięcia zmian

## 📞 Wsparcie

- **Problemy z szablonem**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Wsparcie Azure**: [Portal wsparcia Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Społeczność**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Gotowy do wdrożenia swojego rozwiązania multi-agent?**

Rozpocznij od: `./deploy.sh -g myResourceGroup`

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby zapewnić poprawność tłumaczenia, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.