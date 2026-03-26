# Laboratorium Warsztatów AI: Tworzenie rozwiązań AI możliwych do wdrożenia za pomocą AZD

**Nawigacja po rozdziałach:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 2 - AI-First Development
- **⬅️ Poprzedni**: [Wdrożenie modelu AI](ai-model-deployment.md)
- **➡️ Następny**: [Najlepsze praktyki produkcyjnego AI](production-ai-practices.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

## Przegląd warsztatów

To praktyczne laboratorium prowadzi deweloperów przez proces wykorzystania istniejącego szablonu AI i wdrożenia go za pomocą Azure Developer CLI (AZD). Nauczysz się kluczowych wzorców dla produkcyjnych wdrożeń AI z użyciem usług Microsoft Foundry.

**Czas trwania:** 2-3 godziny  
**Poziom:** Średniozaawansowany  
**Wymagania wstępne:** Podstawowa znajomość Azure, znajomość koncepcji AI/ML

## 🎓 Cele nauki

Po ukończeniu tego warsztatu będziesz potrafił:
- ✅ Przekształcić istniejącą aplikację AI do użycia szablonów AZD
- ✅ Skonfigurować usługi Microsoft Foundry z AZD
- ✅ Wdrożyć bezpieczne zarządzanie poświadczeniami dla usług AI
- ✅ Wdrożyć aplikacje AI gotowe do produkcji z monitoringiem
- ✅ Rozwiązywać typowe problemy podczas wdrożenia AI

## Wymagania wstępne

### Wymagane narzędzia
- Zainstalowany [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Zainstalowany [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Zainstalowany [Git](https://git-scm.com/)
- Edytor kodu (zalecany VS Code)

### Zasoby Azure
- Subskrypcja Azure z uprawnieniami współautora
- Dostęp do usług Microsoft Foundry Models (lub możliwość uzyskania dostępu)
- Uprawnienia do tworzenia grup zasobów

### Wymagana wiedza
- Podstawowa znajomość usług Azure
- Znajomość interfejsów wiersza poleceń
- Podstawowe pojęcia AI/ML (API, modele, zapytania)

## Konfiguracja laboratorium

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

2. **Sklonuj repozytorium warsztatów:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moduł 1: Zrozumienie struktury AZD dla aplikacji AI

### Budowa szablonu AZD dla AI

Poznaj kluczowe pliki w szablonie AZD gotowym na AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Ćwiczenie laboratoryjne 1.1: Eksploracja konfiguracji**

1. **Przeanalizuj plik azure.yaml:**
```bash
cat azure.yaml
```

**Na co zwrócić uwagę:**
- Definicje usług dla komponentów AI
- Mapowania zmiennych środowiskowych
- Konfiguracje hostów

2. **Przejrzyj główną infrastrukturę main.bicep:**
```bash
cat infra/main.bicep
```

**Kluczowe wzorce AI do zidentyfikowania:**
- Provisioning usługi Microsoft Foundry Models
- Integracja z Cognitive Search
- Bezpieczne zarządzanie kluczami
- Konfiguracje zabezpieczeń sieciowych

### **Punkt dyskusji:** Dlaczego te wzorce są ważne dla AI

- **Zależności usług:** Aplikacje AI często wymagają kilku skoordynowanych usług
- **Bezpieczeństwo:** Klucze API i punkty końcowe muszą być zabezpieczone
- **Skalowalność:** Obciążenia AI mają unikalne wymagania skalowania
- **Zarządzanie kosztami:** Usługi AI mogą być kosztowne, jeśli są źle skonfigurowane

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

### Krok 2.2: Wdrażanie infrastruktury i aplikacji

1. **Wdróż za pomocą AZD:**
```bash
azd up
```

**Co się dzieje podczas `azd up`:**
- ✅ Provisioning usługi Microsoft Foundry Models
- ✅ Tworzenie usługi Cognitive Search
- ✅ Konfiguracja App Service dla aplikacji webowej
- ✅ Konfiguracja sieci i zabezpieczeń
- ✅ Wdrożenie kodu aplikacji
- ✅ Ustawienie monitoringu i logowania

2. **Monitoruj postęp wdrożenia** i zwróć uwagę na tworzone zasoby.

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
   - Zweryfikuj poprawność odpowiedzi AI

### **Ćwiczenie laboratoryjne 2.1: Ćwiczenia z rozwiązywania problemów**

**Scenariusz**: Twoje wdrożenie powiodło się, ale AI nie odpowiada.

**Typowe problemy do sprawdzenia:**
1. **Klucze API OpenAI**: Sprawdź, czy są poprawnie ustawione
2. **Dostępność modelu**: Sprawdź, czy region obsługuje model
3. **Łączność sieciowa**: Upewnij się, że usługi mogą się komunikować
4. **Uprawnienia RBAC**: Zweryfikuj, czy aplikacja ma dostęp do OpenAI

**Polecenia do debugowania:**
```bash
# Sprawdź zmienne środowiskowe
azd env get-values

# Zobacz dzienniki wdrożenia
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Sprawdź status wdrożenia OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moduł 3: Dostosowywanie aplikacji AI do Twoich potrzeb

### Krok 3.1: Modyfikacja konfiguracji AI

1. **Zaktualizuj model OpenAI:**
```bash
# Zmień na inny model (jeśli dostępny w Twoim regionie)
azd env set AZURE_OPENAI_MODEL gpt-4.1

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

**Najlepsza praktyka**: różne konfiguracje dla środowiska deweloperskiego i produkcyjnego.

1. **Utwórz środowisko produkcyjne:**
```bash
azd env new myai-production
```

2. **Ustaw parametry specyficzne dla produkcji:**
```bash
# Produkcja zazwyczaj używa wyższych numerów SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Włącz dodatkowe funkcje bezpieczeństwa
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Ćwiczenie laboratoryjne 3.1: Optymalizacja kosztów**

**Wyzwanie**: Skonfiguruj szablon pod kątem efektywności kosztowej w fazie rozwoju.

**Zadania:**
1. Zidentyfikuj, które SKU można ustawić na darmowe/podstawowe poziomy
2. Skonfiguruj zmienne środowiskowe dla minimalnych kosztów
3. Wdróż i porównaj koszty z konfiguracją produkcyjną

**Wskazówki do rozwiązania:**
- Używaj poziomu F0 (darmowego) dla usług Cognitive Services, gdy to możliwe
- Używaj podstawowego poziomu dla Search Service w środowisku deweloperskim
- Rozważ użycie planu Consumption dla Functions

## Moduł 4: Bezpieczeństwo i najlepsze praktyki produkcyjne

### Krok 4.1: Bezpieczne zarządzanie poświadczeniami

**Aktualne wyzwanie**: Wiele aplikacji AI na twardo zapisuje klucze API albo używa niebezpiecznego przechowywania.

**Rozwiązanie AZD**: Managed Identity + integracja z Key Vault.

1. **Przejrzyj konfigurację zabezpieczeń w swoim szablonie:**
```bash
# Poszukaj konfiguracji Key Vault i Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Zweryfikuj działanie Managed Identity:**
```bash
# Sprawdź, czy aplikacja internetowa ma poprawną konfigurację tożsamości
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Bezpieczeństwo sieci

1. **Włącz prywatne punkty końcowe** (jeśli nie są już skonfigurowane):

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
# Application Insights powinno być automatycznie skonfigurowane
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

### **Ćwiczenie laboratoryjne 4.1: Audyt bezpieczeństwa**

**Zadanie**: Przejrzyj swoje wdrożenie pod kątem najlepszych praktyk bezpieczeństwa.

**Lista kontrolna:**
- [ ] Brak twardo zakodowanych sekretów w kodzie lub konfiguracji
- [ ] Użycie Managed Identity do uwierzytelniania między usługami
- [ ] Klucz Key Vault przechowuje dane wrażliwe
- [ ] Ograniczony i właściwy dostęp sieciowy
- [ ] Włączony monitoring i logowanie

## Moduł 5: Konwersja własnej aplikacji AI

### Krok 5.1: Arkusz oceny

**Przed konwersją aplikacji** odpowiedz na następujące pytania:

1. **Architektura aplikacji:**
   - Jakie usługi AI wykorzystuje Twoja aplikacja?
   - Jakie zasoby obliczeniowe są potrzebne?
   - Czy wymaga bazy danych?
   - Jakie są zależności między usługami?

2. **Wymagania bezpieczeństwa:**
   - Jakie wrażliwe dane obsługuje Twoja aplikacja?
   - Jakie wymagania zgodności masz do spełnienia?
   - Czy potrzebujesz prywatnej sieci?

3. **Wymagania dotyczące skalowania:**
   - Jakie jest oczekiwane obciążenie?
   - Czy potrzebujesz automatycznego skalowania?
   - Czy są wymagania regionalne?

### Krok 5.2: Utwórz swój szablon AZD

**Postępuj zgodnie z tym wzorcem, aby przekonwertować aplikację:**

1. **Utwórz podstawową strukturę:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicjalizuj szablon AZD
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

**infra/main.bicep** - główny szablon:
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

**infra/modules/openai.bicep** - moduł OpenAI:
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

### **Ćwiczenie laboratoryjne 5.1: Wyzwanie tworzenia szablonu**

**Wyzwanie**: Stwórz szablon AZD dla aplikacji AI do przetwarzania dokumentów.

**Wymagania:**
- Microsoft Foundry Models do analizy zawartości
- Document Intelligence do OCR
- Konto Storage do przesyłania dokumentów
- Function App dla logiki przetwarzania
- Aplikacja webowa dla interfejsu użytkownika

**Dodatkowe punkty:**
- Dodaj prawidłową obsługę błędów
- Dołącz szacowanie kosztów
- Skonfiguruj pulpit monitorujący

## Moduł 6: Rozwiązywanie typowych problemów

### Typowe problemy z wdrożeniem

#### Problem 1: Przekroczono limit usługi OpenAI
**Objawy:** Wdrożenie nie powiodło się z błędem limitu
**Rozwiązania:**
```bash
# Sprawdź bieżące limity
az cognitiveservices usage list --location eastus

# Zażądaj zwiększenia limitu lub spróbuj inny region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Model niedostępny w regionie
**Objawy:** AI nie odpowiada lub błędy wdrożenia modelu
**Rozwiązania:**
```bash
# Sprawdź dostępność modelu według regionu
az cognitiveservices model list --location eastus

# Aktualizuj do dostępnego modelu
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problem 3: Problemy z uprawnieniami
**Objawy:** Błędy 403 Forbidden przy wywołaniach usług AI
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
**Kroki do zbadania:**
1. Sprawdź Application Insights dla metryk wydajności
2. Przejrzyj metryki usługi OpenAI w portalu Azure
3. Zweryfikuj łączność sieciową i opóźnienia

**Rozwiązania:**
- Wdrażaj cachowanie dla często zadawanych zapytań
- Używaj odpowiedniego modelu OpenAI dla danego przypadku użycia
- Rozważ repliki do odczytu dla scenariuszy dużego obciążenia

### **Ćwiczenie laboratoryjne 6.1: Wyzwanie debugowania**

**Scenariusz**: Wdrożenie powiodło się, ale aplikacja zwraca błędy 500.

**Zadania debugowania:**
1. Sprawdź logi aplikacji
2. Zweryfikuj łączność usług
3. Przetestuj uwierzytelnianie
4. Przejrzyj konfigurację

**Narzędzia do użycia:**
- `azd show` do przeglądu wdrożenia
- Portal Azure dla szczegółowych logów usług
- Application Insights dla telemetrii aplikacji

## Moduł 7: Monitoring i optymalizacja

### Krok 7.1: Ustaw kompleksowy monitoring

1. **Utwórz niestandardowe pulpity:**

Przejdź do portalu Azure i utwórz pulpit z:
- Liczbą i latencją zapytań OpenAI
- Wskaźnikami błędów aplikacji
- Wykorzystaniem zasobów
- Śledzeniem kosztów

2. **Skonfiguruj alerty:**
```bash
# Alert o wysokim wskaźniku błędów
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Krok 7.2: Optymalizacja kosztów

1. **Analizuj bieżące koszty:**
```bash
# Użyj Azure CLI, aby pobrać dane o kosztach
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Wprowadź kontrole kosztów:**
- Ustaw alerty budżetowe
- Stosuj polityki autoskalowania
- Wdroż cachowanie zapytań
- Monitoruj zużycie tokenów dla OpenAI

### **Ćwiczenie laboratoryjne 7.1: Optymalizacja wydajności**

**Zadanie**: Optymalizuj swoją aplikację AI pod kątem wydajności i kosztów.

**Metryki do poprawy:**
- Skróć średni czas odpowiedzi o 20%
- Zmniejsz miesięczne koszty o 15%
- Utrzymaj dostępność na poziomie 99,9%

**Strategie do wypróbowania:**
- Wdroż cachowanie odpowiedzi
- Optymalizuj zapytania dla efektywności tokenów
- Użyj odpowiednich SKU obliczeniowych
- Skonfiguruj właściwe autoskalowanie

## Ostateczne wyzwanie: Kompleksowa implementacja

### Scenariusz wyzwania

Masz za zadanie stworzyć produkcyjnego chatbota obsługującego klientów AI z następującymi wymaganiami:

**Wymagania funkcjonalne:**
- Interfejs webowy do interakcji z klientem
- Integracja z Microsoft Foundry Models dla odpowiedzi
- Możliwość wyszukiwania dokumentów z użyciem Cognitive Search
- Integracja z istniejącą bazą klientów
- Obsługa wielu języków

**Wymagania niefunkcjonalne:**
- Obsługa 1000 jednoczesnych użytkowników
- SLA dostępności 99,9%
- Zgodność SOC 2
- Koszt poniżej 500 USD/miesiąc
- Wdrożenie w wielu środowiskach (dev, staging, prod)

### Kroki implementacji

1. Zaprojektuj architekturę  
2. Stwórz szablon AZD  
3. Wdróż środki bezpieczeństwa  
4. Skonfiguruj monitoring i alerty  
5. Utwórz pipeline’y wdrożeniowe  
6. Udokumentuj rozwiązanie  

### Kryteria oceny

- ✅ **Funkcjonalność**: Czy spełnia wszystkie wymagania?
- ✅ **Bezpieczeństwo**: Czy wdrożone są najlepsze praktyki?
- ✅ **Skalowalność**: Czy obsłuży obciążenie?
- ✅ **Utrzymywalność**: Czy kod i infrastruktura są dobrze zorganizowane?
- ✅ **Koszt**: Czy mieści się w budżecie?

## Dodatkowe zasoby

### Dokumentacja Microsoft
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentacja Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentacja Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Przykładowe szablony
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Zasoby społecznościowe
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certyfikat ukończenia

Gratulacje! Ukończyłeś Laboratorium Warsztatów AI. Powinieneś teraz potrafić:
- ✅ Konwertuj istniejące aplikacje AI na szablony AZD
- ✅ Wdróż aplikacje AI gotowe do produkcji
- ✅ Wdrażaj najlepsze praktyki bezpieczeństwa dla obciążeń AI
- ✅ Monitoruj i optymalizuj wydajność aplikacji AI
- ✅ Rozwiązuj typowe problemy z wdrożeniem

### Kolejne kroki
1. Zastosuj te wzorce w swoich własnych projektach AI
2. Wnieś szablony z powrotem do społeczności
3. Dołącz do Discorda Microsoft Foundry, aby uzyskać ciągłe wsparcie
4. Poznaj zaawansowane tematy, takie jak wdrożenia wieloregionalne

---

**Opinie z warsztatów**: Pomóż nam ulepszyć ten warsztat, dzieląc się swoimi doświadczeniami na [kanale #Azure Discorda Microsoft Foundry](https://discord.gg/microsoft-azure).

---

**Nawigacja po rozdziałach:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 2 - Rozwój AI na pierwszym miejscu
- **⬅️ Poprzedni**: [Wdrożenie modelu AI](ai-model-deployment.md)
- **➡️ Następny**: [Najlepsze praktyki produkcji AI](production-ai-practices.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

**Potrzebujesz pomocy?** Dołącz do naszej społeczności, aby uzyskać wsparcie i dyskutować o AZD oraz wdrożeniach AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony przy użyciu usługi tłumaczeń AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dążymy do dokładności, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku rodzinnym powinien być uważany za źródło autorytatywne. W przypadku informacji o krytycznym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z wykorzystania tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->