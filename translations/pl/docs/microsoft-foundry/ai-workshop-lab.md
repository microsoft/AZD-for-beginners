# Warsztaty AI: Tworzenie rozwiązań AI gotowych do wdrożenia z AZD

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 2 - Rozwój AI-First
- **⬅️ Poprzedni**: [Wdrożenie modelu AI](ai-model-deployment.md)
- **➡️ Następny**: [Najlepsze praktyki AI w produkcji](production-ai-practices.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../getting-started/configuration.md)

## Przegląd warsztatów

Te praktyczne warsztaty prowadzą programistów przez proces wykorzystania istniejącego szablonu AI i wdrożenia go za pomocą Azure Developer CLI (AZD). Nauczysz się kluczowych wzorców wdrożeń AI w środowisku produkcyjnym z wykorzystaniem usług Microsoft Foundry.

**Czas trwania:** 2-3 godziny  
**Poziom:** Średniozaawansowany  
**Wymagania wstępne:** Podstawowa znajomość Azure, zaznajomienie z koncepcjami AI/ML

## 🎓 Cele nauki

Po ukończeniu tych warsztatów będziesz w stanie:
- ✅ Przekształcić istniejącą aplikację AI w szablon AZD
- ✅ Skonfigurować usługi Microsoft Foundry za pomocą AZD
- ✅ Wdrożyć bezpieczne zarządzanie poświadczeniami dla usług AI
- ✅ Wdrożyć aplikacje AI gotowe do produkcji z monitoringiem
- ✅ Rozwiązywać typowe problemy związane z wdrażaniem AI

## Wymagania wstępne

### Wymagane narzędzia
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) zainstalowany
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) zainstalowany
- [Git](https://git-scm.com/) zainstalowany
- Edytor kodu (zalecany VS Code)

### Zasoby Azure
- Subskrypcja Azure z dostępem typu contributor
- Dostęp do usług Azure OpenAI (lub możliwość złożenia wniosku o dostęp)
- Uprawnienia do tworzenia grup zasobów

### Wymagana wiedza
- Podstawowa znajomość usług Azure
- Zaznajomienie z interfejsami wiersza poleceń
- Podstawowe koncepcje AI/ML (API, modele, prompty)

## Przygotowanie warsztatów

### Krok 1: Przygotowanie środowiska

1. **Zweryfikuj instalację narzędzi:**
```bash
# Sprawdź instalację AZD
azd version

# Sprawdź Azure CLI
az --version

# Zaloguj się do Azure
az login
azd auth login
```

2. **Sklonuj repozytorium warsztatowe:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moduł 1: Zrozumienie struktury AZD dla aplikacji AI

### Anatomia szablonu AZD gotowego na AI

Poznaj kluczowe pliki w szablonie AZD gotowym na AI:

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

2. **Przejrzyj infrastrukturę main.bicep:**
```bash
cat infra/main.bicep
```

**Kluczowe wzorce AI do zidentyfikowania:**
- Tworzenie usługi Azure OpenAI
- Integracja Cognitive Search
- Bezpieczne zarządzanie kluczami
- Konfiguracje bezpieczeństwa sieci

### **Punkt dyskusji:** Dlaczego te wzorce są ważne dla AI

- **Zależności usług**: Aplikacje AI często wymagają wielu skoordynowanych usług
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
# Ustaw preferowany region Azure
azd env set AZURE_LOCATION eastus

# Opcjonalnie: Ustaw konkretny model OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Krok 2.2: Wdrożenie infrastruktury i aplikacji

1. **Wdrożenie za pomocą AZD:**
```bash
azd up
```

**Co się dzieje podczas `azd up`:**
- ✅ Tworzy usługę Azure OpenAI
- ✅ Tworzy usługę Cognitive Search
- ✅ Konfiguruje App Service dla aplikacji webowej
- ✅ Konfiguruje sieć i bezpieczeństwo
- ✅ Wdraża kod aplikacji
- ✅ Konfiguruje monitoring i logowanie

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

**Scenariusz**: Twoje wdrożenie zakończyło się sukcesem, ale AI nie odpowiada.

**Typowe problemy do sprawdzenia:**
1. **Klucze API OpenAI**: Zweryfikuj, czy są poprawnie ustawione
2. **Dostępność modelu**: Sprawdź, czy Twój region obsługuje model
3. **Łączność sieciowa**: Upewnij się, że usługi mogą się komunikować
4. **Uprawnienia RBAC**: Zweryfikuj, czy aplikacja ma dostęp do OpenAI

**Polecenia debugowania:**
```bash
# Sprawdź zmienne środowiskowe
azd env get-values

# Wyświetl logi wdrożenia
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Sprawdź status wdrożenia OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moduł 3: Dostosowanie aplikacji AI do własnych potrzeb

### Krok 3.1: Modyfikacja konfiguracji AI

1. **Zaktualizuj model OpenAI:**
```bash
# Zmień na inny model (jeśli dostępny w Twoim regionie)
azd env set AZURE_OPENAI_MODEL gpt-4

# Ponownie wdroż z nową konfiguracją
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

**Najlepsza praktyka**: Różne konfiguracje dla środowiska deweloperskiego i produkcyjnego.

1. **Utwórz środowisko produkcyjne:**
```bash
azd env new myai-production
```

2. **Ustaw parametry specyficzne dla produkcji:**
```bash
# Produkcja zazwyczaj używa wyższych SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Włącz dodatkowe funkcje bezpieczeństwa
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Ćwiczenie 3.1: Optymalizacja kosztów**

**Wyzwanie**: Skonfiguruj szablon dla oszczędnego rozwoju.

**Zadania:**
1. Zidentyfikuj, które SKU można ustawić na poziom darmowy/podstawowy
2. Skonfiguruj zmienne środowiskowe dla minimalnych kosztów
3. Wdróż i porównaj koszty z konfiguracją produkcyjną

**Wskazówki do rozwiązania:**
- Użyj poziomu F0 (darmowego) dla Cognitive Services, jeśli to możliwe
- Użyj poziomu Basic dla Search Service w środowisku deweloperskim
- Rozważ użycie planu Consumption dla Functions

## Moduł 4: Bezpieczeństwo i najlepsze praktyki produkcyjne

### Krok 4.1: Bezpieczne zarządzanie poświadczeniami

**Obecne wyzwanie**: Wiele aplikacji AI twardo koduje klucze API lub używa niebezpiecznego przechowywania.

**Rozwiązanie AZD**: Integracja Managed Identity + Key Vault.

1. **Przejrzyj konfigurację bezpieczeństwa w swoim szablonie:**
```bash
# Szukaj konfiguracji Key Vault i Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Zweryfikuj działanie Managed Identity:**
```bash
# Sprawdź, czy aplikacja internetowa ma poprawną konfigurację tożsamości
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
# Usługi Application Insights powinny być automatycznie skonfigurowane
# Sprawdź konfigurację:
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

## Moduł 5: Przekształcanie własnej aplikacji AI

### Krok 5.1: Arkusz oceny

**Przed przekształceniem swojej aplikacji** odpowiedz na te pytania:

1. **Architektura aplikacji:**
   - Jakie usługi AI wykorzystuje Twoja aplikacja?
   - Jakie zasoby obliczeniowe są potrzebne?
   - Czy wymaga bazy danych?
   - Jakie są zależności między usługami?

2. **Wymagania bezpieczeństwa:**
   - Jakie dane wrażliwe obsługuje Twoja aplikacja?
   - Jakie masz wymagania dotyczące zgodności?
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

# Zainicjuj szablon AZD
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
- Uwzględnij oszacowanie kosztów
- Skonfiguruj pulpity monitorujące

## Moduł 6: Rozwiązywanie typowych problemów

### Typowe problemy z wdrożeniem

#### Problem 1: Przekroczony limit usługi OpenAI
**Objawy:** Wdrożenie kończy się błędem limitu
**Rozwiązania:**
```bash
# Sprawdź bieżące limity
az cognitiveservices usage list --location eastus

# Poproś o zwiększenie limitu lub spróbuj inny region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Model niedostępny w regionie
**Objawy:** Odpowiedzi AI zawodzą lub błędy wdrożenia modelu
**Rozwiązania:**
```bash
# Sprawdź dostępność modelu według regionu
az cognitiveservices model list --location eastus

# Zaktualizuj do dostępnego modelu
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problem 3: Problemy z uprawnieniami
**Objawy:** Błędy 403 Forbidden podczas wywoływania usług AI
**Rozwiązania:**
```bash
# Sprawdź przypisania ról
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Dodaj brakujące role
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
- Wdrożenie cache dla często zadawanych zapytań
- Użycie odpowiedniego modelu OpenAI dla Twojego przypadku
- Rozważ replikację odczytu dla scenariuszy dużego obciążenia

### **Ćwiczenie 6.1: Wyzwanie debugowania**

**Scenariusz**: Twoje wdrożenie zakończyło się sukcesem, ale aplikacja zwraca błędy 500.

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
- Liczbą żądań i opóźnieniami OpenAI
- Wskaźnikami błędów aplikacji
- Wykorzystaniem zasobów
- Śledzeniem kosztów

2. **Skonfiguruj alerty:**
```bash
# Alarm dla wysokiego współczynnika błędów
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
# Użyj Azure CLI, aby uzyskać dane o kosztach
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Wprowadź kontrolę kosztów:**
- Skonfiguruj alerty budżetowe
- Użyj zasad autoskalowania
- Wdrożenie cache dla zapytań
- Monitoruj użycie tokenów dla OpenAI

### **Ćwiczenie 7.1: Optymalizacja wydajności**

**Zadanie**: Optymalizuj swoją aplikację AI pod kątem wydajności i kosztów.

**Metryki do poprawy:**
- Zmniejsz średni czas odpowiedzi o 20%
- Zredukuj miesięczne koszty o 15%
- Utrzymaj dostępność na poziomie 99,9%

**Strategie do wypróbowania:**
- Wdrożenie cache odpowiedzi
- Optymalizacja promptów pod kątem efektywności tokenów
- Użycie odpowiednich SKU obliczeniowych
- Skonfiguruj odpowiednie autoskalowanie

## Ostateczne wyzwanie: Wdrożenie end-to-end

### Scenariusz wyzwania

Twoim zadaniem jest stworzenie gotowego do produkcji chatbota obsługującego klientów z wykorzystaniem AI, spełniającego następujące wymagania:

**Wymagania funkcjonalne:**
- Interfejs webowy do interakcji z klientami
- Integracja z Azure OpenAI do odpowiedzi
- Możliwość wyszukiwania dokumentów za pomocą Cognitive Search
- Integracja z istniejącą bazą danych klientów
- Obsługa wielu języków

**Wymagania niefunkcjonalne:**
- Obsługa 1000 równoczesnych użytkowników
- SLA na poziomie 99,9%
- Zgodność z SOC 2
- Koszt poniżej 500 USD/miesiąc
- Wdrożenie do wielu środowisk (dev, staging, prod)

### Kroki wdrożenia

1. **Zaprojektuj architekturę**
2. **Utwórz szablon AZD**
3. **Wdrożenie środków bezpieczeństwa**
4. **Skonfiguruj monitoring i alerty**
5. **Utwórz pipeline wdrożeniowy**
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
- [Dokumentacja Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Przykładowe szablony
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
-
Gratulacje! Ukończyłeś warsztat AI. Teraz powinieneś być w stanie:

- ✅ Przekształcać istniejące aplikacje AI w szablony AZD
- ✅ Wdrażać aplikacje AI gotowe do produkcji
- ✅ Wdrażać najlepsze praktyki bezpieczeństwa dla obciążeń AI
- ✅ Monitorować i optymalizować wydajność aplikacji AI
- ✅ Rozwiązywać typowe problemy związane z wdrożeniem

### Kolejne kroki
1. Zastosuj te wzorce w swoich własnych projektach AI
2. Wnieś szablony z powrotem do społeczności
3. Dołącz do Discorda Microsoft Foundry, aby uzyskać wsparcie na bieżąco
4. Zgłębiaj zaawansowane tematy, takie jak wdrożenia w wielu regionach

---

**Opinie o warsztacie**: Pomóż nam ulepszyć ten warsztat, dzieląc się swoimi doświadczeniami na [kanale #Azure Discord Microsoft Foundry](https://discord.gg/microsoft-azure).

---

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 2 - Rozwój z AI na pierwszym miejscu
- **⬅️ Poprzedni**: [Wdrożenie modelu AI](ai-model-deployment.md)
- **➡️ Następny**: [Najlepsze praktyki dla AI w produkcji](production-ai-practices.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../getting-started/configuration.md)

**Potrzebujesz pomocy?** Dołącz do naszej społeczności, aby uzyskać wsparcie i prowadzić dyskusje na temat AZD i wdrożeń AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za źródło autorytatywne. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->