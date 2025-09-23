<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-09-23T14:22:35+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "pl"
}
-->
# Warsztat AI: Tworzenie Rozwiązań AI Gotowych do Wdrożenia z AZD

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 2 - Rozwój z AI na pierwszym miejscu
- **⬅️ Poprzedni**: [Wdrożenie modelu AI](ai-model-deployment.md)
- **➡️ Następny**: [Najlepsze praktyki AI w produkcji](production-ai-practices.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../getting-started/configuration.md)

## Przegląd warsztatu

Ten praktyczny warsztat prowadzi programistów przez proces wykorzystania istniejącego szablonu AI i wdrożenia go za pomocą Azure Developer CLI (AZD). Nauczysz się kluczowych wzorców wdrożeń AI w środowisku produkcyjnym, korzystając z usług Azure AI Foundry.

**Czas trwania:** 2-3 godziny  
**Poziom:** Średniozaawansowany  
**Wymagania wstępne:** Podstawowa wiedza o Azure, znajomość koncepcji AI/ML

## 🎓 Cele nauki

Po ukończeniu tego warsztatu będziesz w stanie:
- ✅ Przekształcić istniejącą aplikację AI w szablon AZD
- ✅ Skonfigurować usługi Azure AI Foundry za pomocą AZD
- ✅ Wdrożyć bezpieczne zarządzanie poświadczeniami dla usług AI
- ✅ Wdrożyć aplikacje AI gotowe do produkcji z monitoringiem
- ✅ Rozwiązywać typowe problemy związane z wdrożeniem AI

## Wymagania wstępne

### Wymagane narzędzia
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) zainstalowany
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) zainstalowany
- [Git](https://git-scm.com/) zainstalowany
- Edytor kodu (zalecany VS Code)

### Zasoby Azure
- Subskrypcja Azure z dostępem na poziomie współtwórcy
- Dostęp do usług Azure OpenAI (lub możliwość uzyskania dostępu)
- Uprawnienia do tworzenia grup zasobów

### Wymagana wiedza
- Podstawowe zrozumienie usług Azure
- Znajomość interfejsów wiersza poleceń
- Podstawowe koncepcje AI/ML (API, modele, podpowiedzi)

## Konfiguracja warsztatu

### Krok 1: Przygotowanie środowiska

1. **Zweryfikuj instalację narzędzi:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Sklonuj repozytorium warsztatu:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```


## Moduł 1: Zrozumienie struktury AZD dla aplikacji AI

### Anatomia szablonu AZD gotowego na AI

Poznaj kluczowe pliki w szablonie AZD przygotowanym dla AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```


### **Ćwiczenie 1.1: Eksploracja konfiguracji**

1. **Przeanalizuj plik azure.yaml:**
```bash
cat azure.yaml
```

**Na co zwrócić uwagę:**
- Definicje usług dla komponentów AI
- Mapowanie zmiennych środowiskowych
- Konfiguracje hosta

2. **Przejrzyj główny plik infrastruktury main.bicep:**
```bash
cat infra/main.bicep
```

**Kluczowe wzorce AI do zidentyfikowania:**
- Udostępnianie usługi Azure OpenAI
- Integracja z Cognitive Search
- Bezpieczne zarządzanie kluczami
- Konfiguracje bezpieczeństwa sieci

### **Punkt dyskusji:** Dlaczego te wzorce są ważne dla AI

- **Zależności usług**: Aplikacje AI często wymagają współpracy wielu usług
- **Bezpieczeństwo**: Klucze API i punkty końcowe muszą być bezpiecznie zarządzane
- **Skalowalność**: Obciążenia AI mają unikalne wymagania dotyczące skalowania
- **Zarządzanie kosztami**: Usługi AI mogą być kosztowne, jeśli nie są odpowiednio skonfigurowane

## Moduł 2: Wdrożenie pierwszej aplikacji AI

### Krok 2.1: Inicjalizacja środowiska

1. **Utwórz nowe środowisko AZD:**
```bash
azd env new myai-workshop
```

2. **Ustaw wymagane parametry:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```


### Krok 2.2: Wdrożenie infrastruktury i aplikacji

1. **Wdrożenie za pomocą AZD:**
```bash
azd up
```

**Co się dzieje podczas `azd up`:**
- ✅ Udostępnienie usługi Azure OpenAI
- ✅ Utworzenie usługi Cognitive Search
- ✅ Konfiguracja App Service dla aplikacji webowej
- ✅ Konfiguracja sieci i bezpieczeństwa
- ✅ Wdrożenie kodu aplikacji
- ✅ Konfiguracja monitoringu i logowania

2. **Monitoruj postęp wdrożenia** i zanotuj tworzone zasoby.

### Krok 2.3: Weryfikacja wdrożenia

1. **Sprawdź wdrożone zasoby:**
```bash
azd show
```

2. **Otwórz wdrożoną aplikację:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Przetestuj funkcjonalność AI:**
   - Przejdź do aplikacji webowej
   - Wypróbuj przykładowe zapytania
   - Zweryfikuj, czy odpowiedzi AI działają poprawnie

### **Ćwiczenie 2.1: Praktyka rozwiązywania problemów**

**Scenariusz**: Wdrożenie zakończyło się sukcesem, ale AI nie odpowiada.

**Typowe problemy do sprawdzenia:**
1. **Klucze API OpenAI**: Zweryfikuj, czy są poprawnie ustawione
2. **Dostępność modelu**: Sprawdź, czy Twój region obsługuje model
3. **Łączność sieciowa**: Upewnij się, że usługi mogą się komunikować
4. **Uprawnienia RBAC**: Zweryfikuj, czy aplikacja ma dostęp do OpenAI

**Polecenia debugowania:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```


## Moduł 3: Dostosowanie aplikacji AI do własnych potrzeb

### Krok 3.1: Modyfikacja konfiguracji AI

1. **Zaktualizuj model OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Dodaj dodatkowe usługi AI:**

Edytuj `infra/main.bicep`, aby dodać Document Intelligence:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```


### Krok 3.2: Konfiguracje specyficzne dla środowiska

**Najlepsza praktyka**: Różne konfiguracje dla rozwoju i produkcji.

1. **Utwórz środowisko produkcyjne:**
```bash
azd env new myai-production
```

2. **Ustaw parametry specyficzne dla produkcji:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```


### **Ćwiczenie 3.1: Optymalizacja kosztów**

**Wyzwanie**: Skonfiguruj szablon dla oszczędnego rozwoju.

**Zadania:**
1. Zidentyfikuj, które SKU można ustawić na darmowe/podstawowe poziomy
2. Skonfiguruj zmienne środowiskowe dla minimalnych kosztów
3. Wdróż i porównaj koszty z konfiguracją produkcyjną

**Wskazówki do rozwiązania:**
- Użyj poziomu F0 (darmowego) dla Cognitive Services, jeśli to możliwe
- Użyj poziomu Basic dla Search Service w rozwoju
- Rozważ użycie planu Consumption dla Functions

## Moduł 4: Bezpieczeństwo i najlepsze praktyki produkcyjne

### Krok 4.1: Bezpieczne zarządzanie poświadczeniami

**Obecne wyzwanie**: Wiele aplikacji AI twardo koduje klucze API lub używa niebezpiecznego przechowywania.

**Rozwiązanie AZD**: Integracja Managed Identity + Key Vault.

1. **Przejrzyj konfigurację bezpieczeństwa w swoim szablonie:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Zweryfikuj działanie Managed Identity:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```


### Krok 4.2: Bezpieczeństwo sieci

1. **Włącz prywatne punkty końcowe** (jeśli nie są jeszcze skonfigurowane):

Dodaj do swojego szablonu bicep:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```


### Krok 4.3: Monitoring i obserwowalność

1. **Skonfiguruj Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Ustaw monitoring specyficzny dla AI:**

Dodaj niestandardowe metryki dla operacji AI:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```


### **Ćwiczenie 4.1: Audyt bezpieczeństwa**

**Zadanie**: Przejrzyj swoje wdrożenie pod kątem najlepszych praktyk bezpieczeństwa.

**Lista kontrolna:**
- [ ] Brak twardo zakodowanych sekretów w kodzie lub konfiguracji
- [ ] Managed Identity używane do uwierzytelniania między usługami
- [ ] Key Vault przechowuje wrażliwe konfiguracje
- [ ] Dostęp do sieci jest odpowiednio ograniczony
- [ ] Monitoring i logowanie są włączone

## Moduł 5: Przekształcenie własnej aplikacji AI

### Krok 5.1: Arkusz oceny

**Przed przekształceniem swojej aplikacji** odpowiedz na te pytania:

1. **Architektura aplikacji:**
   - Jakie usługi AI wykorzystuje Twoja aplikacja?
   - Jakie zasoby obliczeniowe są potrzebne?
   - Czy wymaga bazy danych?
   - Jakie są zależności między usługami?

2. **Wymagania bezpieczeństwa:**
   - Jakie dane wrażliwe obsługuje Twoja aplikacja?
   - Jakie wymagania dotyczące zgodności musisz spełnić?
   - Czy potrzebujesz prywatnej sieci?

3. **Wymagania dotyczące skalowania:**
   - Jakie jest oczekiwane obciążenie?
   - Czy potrzebujesz automatycznego skalowania?
   - Czy są wymagania regionalne?

### Krok 5.2: Utwórz swój szablon AZD

**Postępuj według tego wzorca, aby przekształcić swoją aplikację:**

1. **Utwórz podstawową strukturę:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **Utwórz azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Utwórz szablony infrastruktury:**

**infra/main.bicep** - Główny szablon:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - Moduł OpenAI:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```


### **Ćwiczenie 5.1: Wyzwanie tworzenia szablonu**

**Wyzwanie**: Utwórz szablon AZD dla aplikacji AI do przetwarzania dokumentów.

**Wymagania:**
- Azure OpenAI do analizy treści
- Document Intelligence do OCR
- Konto Storage do przesyłania dokumentów
- Function App do logiki przetwarzania
- Aplikacja webowa dla interfejsu użytkownika

**Dodatkowe punkty:**
- Dodaj odpowiednie obsługi błędów
- Uwzględnij szacowanie kosztów
- Skonfiguruj pulpity monitorowania

## Moduł 6: Rozwiązywanie typowych problemów

### Typowe problemy z wdrożeniem

#### Problem 1: Przekroczony limit usługi OpenAI
**Objawy:** Wdrożenie kończy się błędem limitu
**Rozwiązania:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```


#### Problem 2: Model niedostępny w regionie
**Objawy:** Odpowiedzi AI zawodzą lub błędy wdrożenia modelu
**Rozwiązania:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```


#### Problem 3: Problemy z uprawnieniami
**Objawy:** Błędy 403 Forbidden podczas wywoływania usług AI
**Rozwiązania:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```


### Problemy z wydajnością

#### Problem 4: Wolne odpowiedzi AI
**Kroki dochodzenia:**
1. Sprawdź metryki wydajności w Application Insights
2. Przejrzyj metryki usługi OpenAI w portalu Azure
3. Zweryfikuj łączność sieciową i opóźnienia

**Rozwiązania:**
- Wprowadź buforowanie dla typowych zapytań
- Użyj odpowiedniego modelu OpenAI dla swojego przypadku użycia
- Rozważ repliki odczytu dla scenariuszy dużego obciążenia

### **Ćwiczenie 6.1: Wyzwanie debugowania**

**Scenariusz**: Wdrożenie zakończyło się sukcesem, ale aplikacja zwraca błędy 500.

**Zadania debugowania:**
1. Sprawdź logi aplikacji
2. Zweryfikuj łączność usług
3. Przetestuj uwierzytelnianie
4. Przejrzyj konfigurację

**Narzędzia do użycia:**
- `azd show` dla przeglądu wdrożenia
- Portal Azure dla szczegółowych logów usług
- Application Insights dla telemetrii aplikacji

## Moduł 7: Monitoring i optymalizacja

### Krok 7.1: Skonfiguruj kompleksowy monitoring

1. **Utwórz niestandardowe pulpity:**

Przejdź do portalu Azure i utwórz pulpit z:
- Liczbą żądań OpenAI i opóźnieniami
- Wskaźnikami błędów aplikacji
- Wykorzystaniem zasobów
- Śledzeniem kosztów

2. **Skonfiguruj alerty:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```


### Krok 7.2: Optymalizacja kosztów

1. **Analizuj obecne koszty:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Wprowadź kontrolę kosztów:**
- Skonfiguruj alerty budżetowe
- Użyj polityk autoskalowania
- Wprowadź buforowanie żądań
- Monitoruj użycie tokenów dla OpenAI

### **Ćwiczenie 7.1: Optymalizacja wydajności**

**Zadanie**: Optymalizuj swoją aplikację AI pod kątem wydajności i kosztów.

**Metryki do poprawy:**
- Zmniejsz średni czas odpowiedzi o 20%
- Zredukuj miesięczne koszty o 15%
- Utrzymaj dostępność na poziomie 99,9%

**Strategie do wypróbowania:**
- Wprowadź buforowanie odpowiedzi
- Optymalizuj podpowiedzi dla efektywności tokenów
- Użyj odpowiednich SKU obliczeniowych
- Skonfiguruj odpowiednie autoskalowanie

## Ostateczne wyzwanie: Implementacja od początku do końca

### Scenariusz wyzwania

Twoim zadaniem jest stworzenie gotowego do produkcji chatbota obsługującego klientów, opartego na AI, z następującymi wymaganiami:

**Wymagania funkcjonalne:**
- Interfejs webowy dla interakcji z klientami
- Integracja z Azure OpenAI dla odpowiedzi
- Możliwość wyszukiwania dokumentów za pomocą Cognitive Search
- Integracja z istniejącą bazą danych klientów
- Obsługa wielu języków

**Wymagania niefunkcjonalne:**
- Obsługa 1000 równoczesnych użytkowników
- SLA dostępności na poziomie 99,9%
- Zgodność z SOC 2
- Koszt poniżej 500 USD miesięcznie
- Wdrożenie do wielu środowisk (dev, staging, prod)

### Kroki implementacji

1. **Zaprojektuj architekturę**
2. **Utwórz szablon AZD**
3. **Wprowadź środki bezpieczeństwa**
4. **Skonfiguruj monitoring i alerty**
5. **Utwórz pipeline'y wdrożeniowe**
6. **Udokumentuj rozwiązanie**

### Kryteria oceny

- ✅ **Funkcjonalność**: Czy spełnia wszystkie wymagania?
- ✅ **Bezpieczeństwo**: Czy wdrożono najlepsze praktyki?
- ✅ **Skalowalność**: Czy może obsłużyć obciążenie?
- ✅ **Utrzymanie**: Czy kod i infrastruktura są dobrze zorganizowane?
- ✅ **Koszt**: Czy mieści się w budżecie?

## Dodatkowe zasoby

### Dokumentacja Microsoft
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentacja Azure OpenAI Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentacja Azure AI Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Przykładowe szablony
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat
Gratulacje! Ukończyłeś warsztat AI. Teraz powinieneś być w stanie:

- ✅ Przekształcać istniejące aplikacje AI w szablony AZD
- ✅ Wdrażać aplikacje AI gotowe do produkcji
- ✅ Wdrażać najlepsze praktyki bezpieczeństwa dla obciążeń AI
- ✅ Monitorować i optymalizować wydajność aplikacji AI
- ✅ Rozwiązywać typowe problemy związane z wdrażaniem

### Kolejne kroki
1. Zastosuj te wzorce w swoich własnych projektach AI
2. Wnieś swój wkład, udostępniając szablony społeczności
3. Dołącz do Discorda Azure AI Foundry, aby uzyskać wsparcie na bieżąco
4. Zgłębiaj zaawansowane tematy, takie jak wdrożenia w wielu regionach

---

**Opinie o warsztacie**: Pomóż nam ulepszyć ten warsztat, dzieląc się swoimi doświadczeniami na [kanale #Azure Discorda Azure AI Foundry](https://discord.gg/microsoft-azure).

---

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 2 - Rozwój zorientowany na AI
- **⬅️ Poprzedni**: [Wdrażanie modelu AI](ai-model-deployment.md)
- **➡️ Następny**: [Najlepsze praktyki dla produkcyjnych aplikacji AI](production-ai-practices.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../getting-started/configuration.md)

**Potrzebujesz pomocy?** Dołącz do naszej społeczności, aby uzyskać wsparcie i uczestniczyć w dyskusjach na temat AZD i wdrożeń AI.

---

