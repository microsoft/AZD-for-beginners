<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a8d383064bdb1ee923677a145de53ea",
  "translation_date": "2025-11-20T00:15:59+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "pl"
}
-->
# Rozwiązanie Retail Multi-Agent - Szablon Infrastruktury

**Rozdział 5: Pakiet wdrożenia produkcyjnego**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Powiązany rozdział**: [Rozdział 5: Rozwiązania AI Multi-Agent](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Przewodnik scenariusza**: [Kompletna architektura](../retail-scenario.md)
- **🎯 Szybkie wdrożenie**: [Jedno kliknięcie](../../../../examples/retail-multiagent-arm-template)

> **⚠️ TYLKO SZABLON INFRASTRUKTURY**  
> Ten szablon ARM wdraża **zasoby Azure** dla systemu multi-agentowego.  
>  
> **Co zostanie wdrożone (15-25 minut):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, modele osadzeń w 3 regionach)
> - ✅ Usługa wyszukiwania AI (pusta, gotowa do tworzenia indeksów)
> - ✅ Aplikacje kontenerowe (obrazy zastępcze, gotowe na Twój kod)
> - ✅ Storage, Cosmos DB, Key Vault, Application Insights
>  
> **Co NIE jest uwzględnione (wymaga rozwoju):**
> - ❌ Kod implementacji agentów (Agent Klienta, Agent Magazynu)
> - ❌ Logika routingu i punkty końcowe API
> - ❌ Interfejs użytkownika czatu
> - ❌ Schematy indeksów wyszukiwania i potoki danych
> - ❌ **Szacowany czas rozwoju: 80-120 godzin**
>  
> **Użyj tego szablonu, jeśli:**
> - ✅ Chcesz przygotować infrastrukturę Azure dla projektu multi-agentowego
> - ✅ Planujesz osobno rozwijać implementację agentów
> - ✅ Potrzebujesz infrastruktury gotowej do produkcji
>  
> **Nie używaj, jeśli:**
> - ❌ Oczekujesz natychmiastowego działającego demo multi-agentowego
> - ❌ Szukasz kompletnych przykładów kodu aplikacji

## Przegląd

Ten katalog zawiera kompleksowy szablon Azure Resource Manager (ARM) do wdrożenia **fundamentów infrastruktury** systemu wsparcia klienta opartego na multi-agentach. Szablon przygotowuje wszystkie niezbędne usługi Azure, odpowiednio skonfigurowane i połączone, gotowe do rozwoju Twojej aplikacji.

**Po wdrożeniu będziesz mieć:** Infrastrukturę Azure gotową do produkcji  
**Aby ukończyć system, potrzebujesz:** Kodu agentów, interfejsu użytkownika i konfiguracji danych (zobacz [Przewodnik architektury](../retail-scenario.md))

## 🎯 Co zostanie wdrożone

### Podstawowa infrastruktura (stan po wdrożeniu)

✅ **Usługi Azure OpenAI** (Gotowe do wywołań API)
  - Główny region: wdrożenie GPT-4o (pojemność 20K TPM)
  - Region zapasowy: wdrożenie GPT-4o-mini (pojemność 10K TPM)
  - Trzeci region: model osadzeń tekstowych (pojemność 30K TPM)
  - Region oceny: model oceniający GPT-4o (pojemność 15K TPM)
  - **Status:** W pełni funkcjonalne - można natychmiast wykonywać wywołania API

✅ **Azure AI Search** (Puste - gotowe do konfiguracji)
  - Włączone możliwości wyszukiwania wektorowego
  - Standardowy poziom z 1 partycją, 1 repliką
  - **Status:** Usługa działa, ale wymaga utworzenia indeksu
  - **Wymagane działanie:** Utwórz indeks wyszukiwania zgodnie z Twoim schematem

✅ **Azure Storage Account** (Puste - gotowe do przesyłania danych)
  - Kontenery blob: `documents`, `uploads`
  - Bezpieczna konfiguracja (tylko HTTPS, brak dostępu publicznego)
  - **Status:** Gotowe do przyjmowania plików
  - **Wymagane działanie:** Prześlij dane o produktach i dokumenty

⚠️ **Środowisko aplikacji kontenerowych** (Wdrożone obrazy zastępcze)
  - Aplikacja routera agentów (domyślny obraz nginx)
  - Aplikacja frontendowa (domyślny obraz nginx)
  - Skonfigurowane automatyczne skalowanie (0-10 instancji)
  - **Status:** Działające kontenery zastępcze
  - **Wymagane działanie:** Zbuduj i wdroż swoje aplikacje agentów

✅ **Azure Cosmos DB** (Puste - gotowe na dane)
  - Wstępnie skonfigurowana baza danych i kontener
  - Optymalizacja dla operacji o niskim opóźnieniu
  - Włączony TTL dla automatycznego czyszczenia
  - **Status:** Gotowe do przechowywania historii czatów

✅ **Azure Key Vault** (Opcjonalne - gotowe na tajemnice)
  - Włączone miękkie usuwanie
  - Skonfigurowane RBAC dla zarządzanych tożsamości
  - **Status:** Gotowe do przechowywania kluczy API i ciągów połączeń

✅ **Application Insights** (Opcjonalne - monitorowanie aktywne)
  - Połączone z Log Analytics workspace
  - Skonfigurowane niestandardowe metryki i alerty
  - **Status:** Gotowe do odbierania telemetrii z Twoich aplikacji

✅ **Document Intelligence** (Gotowe do wywołań API)
  - Poziom S0 dla obciążeń produkcyjnych
  - **Status:** Gotowe do przetwarzania przesłanych dokumentów

✅ **Bing Search API** (Gotowe do wywołań API)
  - Poziom S1 dla wyszukiwań w czasie rzeczywistym
  - **Status:** Gotowe do zapytań wyszukiwania w sieci

### Tryby wdrożenia

| Tryb | Pojemność OpenAI | Instancje kontenerów | Poziom wyszukiwania | Redundancja przechowywania | Najlepsze dla |
|------|------------------|----------------------|---------------------|----------------------------|---------------|
| **Minimalny** | 10K-20K TPM | 0-2 repliki | Podstawowy | LRS (Lokalny) | Dev/test, nauka, proof-of-concept |
| **Standardowy** | 30K-60K TPM | 2-5 replik | Standardowy | ZRS (Strefowy) | Produkcja, umiarkowany ruch (<10K użytkowników) |
| **Premium** | 80K-150K TPM | 5-10 replik, strefowa redundancja | Premium | GRS (Geo) | Przedsiębiorstwa, duży ruch (>10K użytkowników), SLA 99,99% |

**Wpływ na koszty:**
- **Minimalny → Standardowy:** ~4x wzrost kosztów ($100-370/mies. → $420-1,450/mies.)
- **Standardowy → Premium:** ~3x wzrost kosztów ($420-1,450/mies. → $1,150-3,500/mies.)
- **Wybierz na podstawie:** Oczekiwanego obciążenia, wymagań SLA, ograniczeń budżetowych

**Planowanie pojemności:**
- **TPM (Tokeny na minutę):** Łącznie dla wszystkich wdrożeń modeli
- **Instancje kontenerów:** Zakres automatycznego skalowania (min-max replik)
- **Poziom wyszukiwania:** Wpływa na wydajność zapytań i limity rozmiaru indeksu

## 📋 Wymagania wstępne

### Wymagane narzędzia
1. **Azure CLI** (wersja 2.50.0 lub nowsza)
   ```bash
   az --version  # Sprawdź wersję
   az login      # Uwierzytelnij
   ```

2. **Aktywna subskrypcja Azure** z dostępem Właściciela lub Współtwórcy
   ```bash
   az account show  # Zweryfikuj subskrypcję
   ```

### Wymagane limity Azure

Przed wdrożeniem sprawdź wystarczające limity w docelowych regionach:

```bash
# Sprawdź dostępność Azure OpenAI w swoim regionie
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Zweryfikuj limit OpenAI (przykład dla gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Sprawdź limit Container Apps
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Minimalne wymagane limity:**
- **Azure OpenAI:** 3-4 wdrożenia modeli w różnych regionach
  - GPT-4o: 20K TPM (Tokeny na minutę)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Uwaga:** GPT-4o może być na liście oczekujących w niektórych regionach - sprawdź [dostępność modeli](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Aplikacje kontenerowe:** Zarządzane środowisko + 2-10 instancji kontenerów
- **AI Search:** Poziom standardowy (Podstawowy niewystarczający dla wyszukiwania wektorowego)
- **Cosmos DB:** Standardowa przepustowość

**Jeśli limit jest niewystarczający:**
1. Przejdź do Azure Portal → Limity → Poproś o zwiększenie
2. Lub użyj Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Rozważ alternatywne regiony z dostępnością

## 🚀 Szybkie wdrożenie

### Opcja 1: Użycie Azure CLI

```bash
# Sklonuj lub pobierz pliki szablonu
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Uczyń skrypt wdrożeniowy wykonywalnym
chmod +x deploy.sh

# Wdróż z domyślnymi ustawieniami
./deploy.sh -g myResourceGroup

# Wdróż na produkcję z funkcjami premium
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Opcja 2: Użycie Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Opcja 3: Bezpośrednio za pomocą Azure CLI

```bash
# Utwórz grupę zasobów
az group create --name myResourceGroup --location eastus2

# Wdróż szablon
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Czas wdrożenia

### Czego się spodziewać

| Faza | Czas trwania | Co się dzieje |
|------|--------------|---------------||
| **Walidacja szablonu** | 30-60 sekund | Azure sprawdza składnię szablonu ARM i parametry |
| **Tworzenie grupy zasobów** | 10-20 sekund | Tworzy grupę zasobów (jeśli potrzebna) |
| **Wdrażanie OpenAI** | 5-8 minut | Tworzy 3-4 konta OpenAI i wdraża modele |
| **Aplikacje kontenerowe** | 3-5 minut | Tworzy środowisko i wdraża kontenery zastępcze |
| **Wyszukiwanie i przechowywanie** | 2-4 minuty | Wdraża usługę wyszukiwania AI i konta przechowywania |
| **Cosmos DB** | 2-3 minuty | Tworzy bazę danych i konfiguruje kontenery |
| **Konfiguracja monitorowania** | 2-3 minuty | Konfiguruje Application Insights i Log Analytics |
| **Konfiguracja RBAC** | 1-2 minuty | Konfiguruje zarządzane tożsamości i uprawnienia |
| **Całkowite wdrożenie** | **15-25 minut** | Gotowa infrastruktura |

**Po wdrożeniu:**
- ✅ **Infrastruktura gotowa:** Wszystkie usługi Azure wdrożone i działające
- ⏱️ **Rozwój aplikacji:** 80-120 godzin (Twoja odpowiedzialność)
- ⏱️ **Konfiguracja indeksu:** 15-30 minut (wymaga Twojego schematu)
- ⏱️ **Przesyłanie danych:** Zależy od rozmiaru zestawu danych
- ⏱️ **Testowanie i walidacja:** 2-4 godziny

---

## ✅ Weryfikacja sukcesu wdrożenia

### Krok 1: Sprawdź wdrożenie zasobów (2 minuty)

```bash
# Zweryfikuj, czy wszystkie zasoby zostały pomyślnie wdrożone
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Oczekiwane:** Pusta tabela (wszystkie zasoby pokazują status "Succeeded")

### Krok 2: Zweryfikuj wdrożenia Azure OpenAI (3 minuty)

```bash
# Wymień wszystkie konta OpenAI
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Sprawdź wdrożenia modeli dla głównego regionu
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Oczekiwane:** 
- 3-4 konta OpenAI (główny, zapasowy, trzeci, region oceny)
- 1-2 wdrożenia modeli na konto (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Krok 3: Przetestuj punkty końcowe infrastruktury (5 minut)

```bash
# Pobierz adresy URL aplikacji kontenerowej
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Przetestuj punkt końcowy routera (odpowie obraz zastępczy)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Oczekiwane:** 
- Aplikacje kontenerowe pokazują status "Running"
- Zastępczy nginx odpowiada kodem HTTP 200 lub 404 (brak kodu aplikacji)

### Krok 4: Zweryfikuj dostęp do API Azure OpenAI (3 minuty)

```bash
# Pobierz punkt końcowy OpenAI i klucz
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Przetestuj wdrożenie GPT-4o
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Oczekiwane:** Odpowiedź JSON z zakończeniem czatu (potwierdza funkcjonalność OpenAI)

### Co działa, a co nie

**✅ Działa po wdrożeniu:**
- Modele Azure OpenAI wdrożone i akceptujące wywołania API
- Usługa wyszukiwania AI działa (pusta, brak indeksów)
- Aplikacje kontenerowe działają (obrazy nginx zastępcze)
- Konta przechowywania dostępne i gotowe do przesyłania danych
- Cosmos DB gotowe do operacji na danych
- Application Insights zbiera telemetrię infrastruktury
- Key Vault gotowy do przechowywania tajemnic

**❌ Nie działa jeszcze (wymaga rozwoju):**
- Punkty końcowe agentów (brak wdrożonego kodu aplikacji)
- Funkcjonalność czatu (wymaga frontend + backend)
- Zapytania wyszukiwania (brak utworzonego indeksu wyszukiwania)
- Potok przetwarzania dokumentów (brak przesłanych danych)
- Niestandardowa telemetria (wymaga instrumentacji aplikacji)

**Kolejne kroki:** Zobacz [Konfiguracja po wdrożeniu](../../../../examples/retail-multiagent-arm-template), aby rozwijać i wdrażać swoją aplikację

---

## ⚙️ Opcje konfiguracji

### Parametry szablonu

| Parametr | Typ | Domyślny | Opis |
|----------|-----|----------|------|
| `projectName` | string | "retail" | Prefiks dla wszystkich nazw zasobów |
| `location` | string | Lokalizacja grupy zasobów | Główny region wdrożenia |
| `secondaryLocation` | string | "westus2" | Region zapasowy dla wdrożenia wieloregionowego |
| `tertiaryLocation` | string | "francecentral" | Region dla modelu osadzeń |
| `environmentName` | string | "dev" | Oznaczenie środowiska (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Konfiguracja wdrożenia (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Włącz wdrożenie wieloregionowe |
| `enableMonitoring` | bool | true | Włącz Application Insights i logowanie |
| `enableSecurity` | bool | true | Włącz Key Vault i zwiększone bezpieczeństwo |

### Dostosowywanie parametrów

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
# Pokaż pomoc
./deploy.sh --help

# Podstawowe wdrożenie
./deploy.sh -g myResourceGroup

# Zaawansowane wdrożenie z niestandardowymi ustawieniami
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Wdrożenie deweloperskie bez wielu regionów
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
# Wyświetl wdrożenia
az deployment group list --resource-group myResourceGroup --output table

# Pobierz szczegóły wdrożenia
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Obserwuj postęp wdrożenia
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Wyniki wdrożenia

Po pomyślnym wdrożeniu dostępne są następujące wyniki:

- **URL Frontendu**: Publiczny punkt końcowy dla interfejsu webowego
- **URL Routera**: Punkt końcowy API dla routera agentów
- **Punkty końcowe OpenAI**: Główne i zapasowe punkty końcowe usługi OpenAI
- **Usługa wyszukiwania**: Punkt końcowy usługi Azure AI Search
- **Konto przechowywania**: Nazwa konta przechowywania dla dokumentów
- **Key Vault**: Nazwa Key Vault (jeśli włączony)
- **Application Insights**: Nazwa usługi monitorowania (jeśli włączona)

## 🔧 Po wdrożeniu: Kolejne kroki
> **📝 Ważne:** Infrastruktura została wdrożona, ale musisz opracować i wdrożyć kod aplikacji.

### Faza 1: Opracowanie aplikacji agentów (Twoja odpowiedzialność)

Szablon ARM tworzy **puste aplikacje kontenerowe** z obrazami nginx jako placeholderami. Musisz:

**Wymagane prace rozwojowe:**
1. **Implementacja agentów** (30-40 godzin)
   - Agent obsługi klienta z integracją GPT-4o
   - Agent zarządzania zapasami z integracją GPT-4o-mini
   - Logika routingu agentów

2. **Rozwój frontendowy** (20-30 godzin)
   - Interfejs czatu (React/Vue/Angular)
   - Funkcjonalność przesyłania plików
   - Renderowanie i formatowanie odpowiedzi

3. **Usługi backendowe** (12-16 godzin)
   - Router FastAPI lub Express
   - Middleware uwierzytelniający
   - Integracja telemetrii

**Zobacz:** [Przewodnik architektury](../retail-scenario.md) dla szczegółowych wzorców implementacji i przykładów kodu

### Faza 2: Konfiguracja indeksu wyszukiwania AI (15-30 minut)

Utwórz indeks wyszukiwania zgodny z modelem danych:

```bash
# Pobierz szczegóły usługi wyszukiwania
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Utwórz indeks z Twoim schematem (przykład)
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**Zasoby:**
- [Projektowanie schematu indeksu wyszukiwania AI](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Konfiguracja wyszukiwania wektorowego](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Faza 3: Przesyłanie danych (czas zależny)

Gdy masz dane produktów i dokumenty:

```bash
# Pobierz szczegóły konta magazynowego
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Prześlij swoje dokumenty
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Przykład: Prześlij pojedynczy plik
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Faza 4: Budowa i wdrożenie aplikacji (8-12 godzin)

Gdy opracujesz kod agentów:

```bash
# 1. Utwórz Azure Container Registry (jeśli potrzebne)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Zbuduj i wypchnij obraz routera agenta
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Zbuduj i wypchnij obraz frontendowy
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Zaktualizuj Container Apps za pomocą swoich obrazów
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Skonfiguruj zmienne środowiskowe
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Faza 5: Testowanie aplikacji (2-4 godziny)

```bash
# Pobierz URL swojej aplikacji
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Przetestuj punkt końcowy agenta (po wdrożeniu kodu)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Sprawdź logi aplikacji
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Zasoby implementacyjne

**Architektura i projektowanie:**
- 📖 [Kompletny przewodnik architektury](../retail-scenario.md) - Szczegółowe wzorce implementacji
- 📖 [Wzorce projektowe dla systemów wieloagentowych](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Przykłady kodu:**
- 🔗 [Przykład czatu Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) - Wzorzec RAG
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Framework agentów (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Orkiestracja agentów (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Rozmowy wieloagentowe

**Szacowany całkowity nakład pracy:**
- Wdrożenie infrastruktury: 15-25 minut (✅ Zakończone)
- Rozwój aplikacji: 80-120 godzin (🔨 Twoja praca)
- Testowanie i optymalizacja: 15-25 godzin (🔨 Twoja praca)

## 🛠️ Rozwiązywanie problemów

### Typowe problemy

#### 1. Przekroczony limit Azure OpenAI

```bash
# Sprawdź bieżące wykorzystanie limitu
az cognitiveservices usage list --location eastus2

# Poproś o zwiększenie limitu
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Niepowodzenie wdrożenia aplikacji kontenerowych

```bash
# Sprawdź logi aplikacji kontenerowej
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Uruchom ponownie aplikację kontenerową
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Inicjalizacja usługi wyszukiwania

```bash
# Zweryfikuj status usługi wyszukiwania
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Przetestuj łączność z usługą wyszukiwania
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Walidacja wdrożenia

```bash
# Sprawdź, czy wszystkie zasoby zostały utworzone
az resource list \
  --resource-group myResourceGroup \
  --output table

# Sprawdź stan zasobów
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Rozważania dotyczące bezpieczeństwa

### Zarządzanie kluczami
- Wszystkie sekrety są przechowywane w Azure Key Vault (jeśli włączone)
- Aplikacje kontenerowe używają zarządzanej tożsamości do uwierzytelniania
- Konta magazynowe mają domyślne ustawienia bezpieczeństwa (tylko HTTPS, brak publicznego dostępu do blobów)

### Bezpieczeństwo sieci
- Aplikacje kontenerowe używają sieci wewnętrznej, gdy to możliwe
- Usługa wyszukiwania skonfigurowana z opcją prywatnych punktów końcowych
- Cosmos DB skonfigurowane z minimalnymi niezbędnymi uprawnieniami

### Konfiguracja RBAC
```bash
# Przypisz niezbędne role dla zarządzanej tożsamości
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Optymalizacja kosztów

### Szacunkowe koszty (miesięczne, USD)

| Tryb | OpenAI | Aplikacje kontenerowe | Wyszukiwanie | Magazyn | Całkowity szac. |
|------|--------|------------------------|--------------|---------|-----------------|
| Minimalny | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standardowy | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Monitorowanie kosztów

```bash
# Ustaw alerty budżetowe
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Aktualizacje i konserwacja

### Aktualizacje szablonów
- Kontroluj wersje plików szablonów ARM
- Testuj zmiany najpierw w środowisku deweloperskim
- Używaj trybu wdrożenia inkrementalnego do aktualizacji

### Aktualizacje zasobów
```bash
# Zaktualizuj z nowymi parametrami
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Kopie zapasowe i odzyskiwanie
- Automatyczne kopie zapasowe Cosmos DB włączone
- Funkcja soft delete w Key Vault włączona
- Rewizje aplikacji kontenerowych utrzymywane dla możliwości cofnięcia zmian

## 📞 Wsparcie

- **Problemy z szablonem**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Wsparcie Azure**: [Portal wsparcia Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Społeczność**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Gotowy do wdrożenia rozwiązania wieloagentowego?**

Rozpocznij od: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->