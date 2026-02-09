# AI Workshop Lab: Uczynienie Twoich Rozwiązań AI Możliwymi do Wdrożenia przy użyciu AZD

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD For Beginners](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 2 - Rozwój ukierunkowany na AI
- **⬅️ Poprzedni**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Następny**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Następny rozdział**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Przegląd warsztatów

Ten praktyczny lab prowadzi programistów przez proces przekształcania istniejącego szablonu AI i wdrażania go za pomocą Azure Developer CLI (AZD). Nauczysz się podstawowych wzorców dla wdrożeń AI w produkcji z wykorzystaniem usług Microsoft Foundry.

**Czas trwania:** 2–3 godziny  
**Poziom:** Średniozaawansowany  
**Wymagania wstępne:** Podstawowa znajomość Azure, zaznajomienie z koncepcjami AI/ML

## 🎓 Cele nauki

Pod koniec tego warsztatu będziesz w stanie:
- ✅ Przekształcić istniejącą aplikację AI, aby używała szablonów AZD
- ✅ Skonfigurować usługi Microsoft Foundry przy użyciu AZD
- ✅ Zaimplementować bezpieczne zarządzanie poświadczeniami dla usług AI
- ✅ Wdrożyć aplikacje AI gotowe do produkcji z monitorowaniem
- ✅ Rozwiązywać typowe problemy z wdrażaniem AI

## Wymagania wstępne

### Wymagane narzędzia
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) zainstalowany
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) zainstalowany
- [Git](https://git-scm.com/) zainstalowany
- Edytor kodu (zalecane VS Code)

### Zasoby Azure
- Subskrypcja Azure z dostępem na poziomie contributor
- Dostęp do usług Azure OpenAI (lub możliwość uzyskania dostępu)
- Uprawnienia do tworzenia grup zasobów

### Wiedza wymagana
- Podstawowe zrozumienie usług Azure
- Znajomość interfejsów wiersza poleceń
- Podstawowe koncepcje AI/ML (API, modele, prompty)

## Przygotowanie labu

### Krok 1: Przygotowanie środowiska

1. **Zweryfikuj instalacje narzędzi:**
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

### Budowa szablonu AI AZD

Zapoznaj się z kluczowymi plikami w szablonie AZD przygotowanym dla AI:

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

### **Ćwiczenie labowe 1.1: Przegląd konfiguracji**

1. **Przejrzyj plik azure.yaml:**
```bash
cat azure.yaml
```

**Na co zwrócić uwagę:**
- Definicje usług dla komponentów AI
- Mapowania zmiennych środowiskowych
- Konfiguracje hosta

2. **Przejrzyj infra/main.bicep infrastruktury:**
```bash
cat infra/main.bicep
```

**Kluczowe wzorce AI do zidentyfikowania:**
- Provisioning usługi Azure OpenAI
- Integracja z Cognitive Search
- Bezpieczne zarządzanie kluczami
- Konfiguracje bezpieczeństwa sieci

### **Punkt dyskusji:** Dlaczego te wzorce są ważne dla AI

- **Zależności usług**: Aplikacje AI często wymagają wielu skoordynowanych usług
- **Bezpieczeństwo**: Klucze API i punkty końcowe muszą być zarządzane bezpiecznie
- **Skalowalność**: Obciążenia AI mają specyficzne wymagania skalowania
- **Zarządzanie kosztami**: Usługi AI mogą być kosztowne, jeśli nie są poprawnie skonfigurowane

## Moduł 2: Wdróż swoją pierwszą aplikację AI

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

### Krok 2.2: Wdróż infrastrukturę i aplikację

1. **Wdróż przy użyciu AZD:**
```bash
azd up
```

**Co dzieje się podczas `azd up`:**
- ✅ Provisionuje usługę Azure OpenAI
- ✅ Tworzy usługę Cognitive Search
- ✅ Konfiguruje App Service dla aplikacji webowej
- ✅ Konfiguruje sieć i zabezpieczenia
- ✅ Wdraża kod aplikacji
- ✅ Ustawia monitorowanie i logowanie

2. **Monitoruj postęp wdrożenia** i zanotuj tworzone zasoby.

### Krok 2.3: Zweryfikuj wdrożenie

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
   - Zweryfikuj, czy odpowiedzi AI działają

### **Ćwiczenie labowe 2.1: Ćwiczenie z rozwiązywania problemów**

**Scenariusz**: Wdrożenie zakończyło się powodzeniem, ale AI nie odpowiada.

**Typowe problemy do sprawdzenia:**
1. **Klucze API OpenAI**: Sprawdź, czy są poprawnie ustawione
2. **Dostępność modelu**: Sprawdź, czy Twój region obsługuje model
3. **Łączność sieciowa**: Upewnij się, że usługi mogą się komunikować
4. **Uprawnienia RBAC**: Sprawdź, czy aplikacja ma dostęp do OpenAI

**Polecenia do debugowania:**
```bash
# Sprawdź zmienne środowiskowe
azd env get-values

# Wyświetl logi wdrożenia
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Sprawdź status wdrożenia OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moduł 3: Dostosowywanie aplikacji AI do Twoich potrzeb

### Krok 3.1: Zmodyfikuj konfigurację AI

1. **Zaktualizuj model OpenAI:**
```bash
# Zmień na inny model (jeśli dostępny w Twoim regionie)
azd env set AZURE_OPENAI_MODEL gpt-4

# Wdróż ponownie nową konfigurację
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

**Dobra praktyka**: Różne konfiguracje dla środowiska deweloperskiego i produkcyjnego.

1. **Utwórz środowisko produkcyjne:**
```bash
azd env new myai-production
```

2. **Ustaw parametry specyficzne dla produkcji:**
```bash
# W środowisku produkcyjnym zazwyczaj używa się wyższych SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Włącz dodatkowe funkcje bezpieczeństwa
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Ćwiczenie labowe 3.1: Optymalizacja kosztów**

**Wyzwanie**: Skonfiguruj szablon tak, aby był opłacalny w środowisku deweloperskim.

**Zadania:**
1. Zidentyfikuj, które SKU można ustawić na bezpłatne/podstawowe poziomy
2. Skonfiguruj zmienne środowiskowe dla minimalnych kosztów
3. Wdróż i porównaj koszty z konfiguracją produkcyjną

**Wskazówki rozwiązania:**
- Użyj F0 (free) tier dla Cognitive Services, gdy to możliwe
- Użyj Basic tier dla Search Service w środowisku deweloperskim
- Rozważ użycie planu Consumption dla Functions

## Moduł 4: Bezpieczeństwo i najlepsze praktyki produkcyjne

### Krok 4.1: Bezpieczne zarządzanie poświadczeniami

**Aktualne wyzwanie**: Wiele aplikacji AI ma zakodowane na stałe klucze API lub używa niepewnego magazynu.

**Rozwiązanie AZD**: Managed Identity + integracja z Key Vault.

1. **Przejrzyj konfigurację bezpieczeństwa w swoim szablonie:**
```bash
# Sprawdź konfigurację Key Vault i zarządzanej tożsamości
grep -r "keyVault\|managedIdentity" infra/
```

2. **Zweryfikuj, że Managed Identity działa:**
```bash
# Sprawdź, czy aplikacja internetowa ma poprawną konfigurację tożsamości
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Bezpieczeństwo sieci

1. **Włącz prywatne punkty końcowe** (jeśli nie są jeszcze skonfigurowane):

Dodaj do szablonu bicep:
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

### Krok 4.3: Monitorowanie i obserwowalność

1. **Skonfiguruj Application Insights:**
```bash
# Application Insights powinien być automatycznie skonfigurowany
# Sprawdź konfigurację:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Skonfiguruj monitorowanie specyficzne dla AI:**

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

### **Ćwiczenie labowe 4.1: Audyt bezpieczeństwa**

**Zadanie**: Przejrzyj swoje wdrożenie pod kątem najlepszych praktyk bezpieczeństwa.

**Lista kontrolna:**
- [ ] Brak zakodowanych na stałe sekretów w kodzie lub konfiguracji
- [ ] Managed Identity używana do uwierzytelniania między usługami
- [ ] Key Vault przechowuje poufne konfiguracje
- [ ] Dostęp sieciowy jest prawidłowo ograniczony
- [ ] Monitorowanie i logowanie są włączone

## Moduł 5: Przekształcenie własnej aplikacji AI

### Krok 5.1: Arkusz oceny

**Przed przekształceniem aplikacji**, odpowiedz na te pytania:

1. **Architektura aplikacji:**
   - Jakich usług AI używa Twoja aplikacja?
   - Jakie zasoby obliczeniowe są potrzebne?
   - Czy wymaga bazy danych?
   - Jakie są zależności między usługami?

2. **Wymagania bezpieczeństwa:**
   - Jakie dane wrażliwe przetwarza Twoja aplikacja?
   - Jakie wymagania zgodności musisz spełnić?
   - Czy potrzebujesz prywatnej sieci?

3. **Wymagania dotyczące skalowania:**
   - Jakie jest przewidywane obciążenie?
   - Czy potrzebujesz autoskalowania?
   - Czy są wymagania regionalne?

### Krok 5.2: Utwórz swój szablon AZD

**Postępuj według tego wzorca, aby przekształcić swoją aplikację:**

1. **Utwórz podstawową strukturę:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Zainicjalizuj szablon AZD
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

**infra/main.bicep** - Szablon główny:
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

### **Ćwiczenie labowe 5.1: Wyzwanie tworzenia szablonu**

**Wyzwanie**: Stwórz szablon AZD dla aplikacji AI do przetwarzania dokumentów.

**Wymagania:**
- Azure OpenAI do analizy treści
- Document Intelligence do OCR
- Storage Account do przesyłania dokumentów
- Function App do logiki przetwarzania
- Aplikacja webowa dla interfejsu użytkownika

**Punkty dodatkowe:**
- Dodaj odpowiednie obsługi błędów
- Dołącz estymację kosztów
- Skonfiguruj panele monitorujące

## Moduł 6: Rozwiązywanie typowych problemów

### Typowe problemy z wdrożeniem

#### Problem 1: Przekroczony limit usług OpenAI
**Objawy:** Wdrożenie nie powiodło się z błędem limitu
**Rozwiązania:**
```bash
# Sprawdź aktualne limity
az cognitiveservices usage list --location eastus

# Poproś o zwiększenie limitu lub spróbuj innego regionu
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Model niedostępny w regionie
**Objawy:** Odpowiedzi AI nie działają lub występują błędy wdrożenia modelu
**Rozwiązania:**
```bash
# Sprawdź dostępność modelu według regionu
az cognitiveservices model list --location eastus

# Zaktualizuj do dostępnego modelu
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problem 3: Problemy z uprawnieniami
**Objawy:** Błędy 403 Forbidden przy wywoływaniu usług AI
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
**Kroki dochodzeniowe:**
1. Sprawdź Application Insights pod kątem metryk wydajności
2. Przejrzyj metryki usługi OpenAI w portalu Azure
3. Zweryfikuj łączność sieciową i opóźnienia

**Rozwiązania:**
- Zaimplementuj cache dla często zadawanych zapytań
- Użyj odpowiedniego modelu OpenAI dla Twojego przypadku użycia
- Rozważ repliki do odczytu dla scenariuszy o dużym obciążeniu

### **Ćwiczenie labowe 6.1: Wyzwanie debugowania**

**Scenariusz**: Wdrożenie zakończyło się powodzeniem, ale aplikacja zwraca błędy 500.

**Zadania debugowania:**
1. Sprawdź logi aplikacji
2. Zweryfikuj łączność usług
3. Przetestuj uwierzytelnianie
4. Przejrzyj konfigurację

**Narzędzia do użycia:**
- `azd show` dla przeglądu wdrożenia
- Portal Azure dla szczegółowych logów usług
- Application Insights dla telemetrii aplikacji

## Moduł 7: Monitorowanie i optymalizacja

### Krok 7.1: Skonfiguruj kompleksowe monitorowanie

1. **Utwórz niestandardowe panele:**

Przejdź do portalu Azure i utwórz pulpit z:
- Liczbą żądań do OpenAI i opóźnieniem
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

2. **Wdrożenie mechanizmów kontroli kosztów:**
- Skonfiguruj alerty budżetowe
- Użyj polityk autoskalowania
- Zaimplementuj cache zapytań
- Monitoruj zużycie tokenów dla OpenAI

### **Ćwiczenie labowe 7.1: Optymalizacja wydajności**

**Zadanie**: Optymalizuj swoją aplikację AI pod kątem wydajności i kosztów.

**Metryki do poprawy:**
- Zmniejszyć średni czas odpowiedzi o 20%
- Zmniejszyć miesięczne koszty o 15%
- Utrzymać 99,9% dostępności

**Strategie do wypróbowania:**
- Zaimplementuj cache odpowiedzi
- Optymalizuj prompting dla efektywności tokenów
- Używaj odpowiednich SKU obliczeniowych
- Skonfiguruj właściwe autoskalowanie

## Finałowe wyzwanie: Implementacja end-to-end

### Scenariusz wyzwania

Zadano Ci stworzenie gotowego do produkcji chatbota obsługującego klientów z następującymi wymaganiami:

**Wymagania funkcjonalne:**
- Interfejs webowy dla interakcji z klientami
- Integracja z Azure OpenAI dla odpowiedzi
- Możliwość wyszukiwania dokumentów przy użyciu Cognitive Search
- Integracja z istniejącą bazą klientów
- Obsługa wielu języków

**Wymagania niefunkcjonalne:**
- Obsługa 1000 jednoczesnych użytkowników
- SLA dostępności 99,9%
- Zgodność SOC 2
- Koszt poniżej 500 USD/miesiąc
- Wdrożenie do wielu środowisk (dev, staging, prod)

### Kroki implementacji

1. **Zaprojektuj architekturę**
2. **Utwórz szablon AZD**
3. **Zaimplementuj środki bezpieczeństwa**
4. **Skonfiguruj monitorowanie i alertowanie**
5. **Utwórz pipeline’y wdrożeń**
6. **Udokumentuj rozwiązanie**

### Kryteria oceny

- ✅ **Funkcjonalność**: Czy spełnia wszystkie wymagania?
- ✅ **Bezpieczeństwo**: Czy wdrożono najlepsze praktyki?
- ✅ **Skalowalność**: Czy poradzi sobie z obciążeniem?
- ✅ **Utrzymywalność**: Czy kod i infrastruktura są dobrze zorganizowane?
- ✅ **Koszt**: Czy mieści się w budżecie?

## Dodatkowe zasoby

### Dokumentacja Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Przykładowe szablony
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Zasoby społeczności
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certyfikat ukończenia
Gratulacje! Ukończyłeś laboratorium warsztatu AI. Teraz powinieneś być w stanie:

- ✅ Konwertować istniejące aplikacje AI na szablony AZD
- ✅ Wdrażać aplikacje AI gotowe do produkcji
- ✅ Wdrażać najlepsze praktyki bezpieczeństwa dla obciążeń AI
- ✅ Monitorować i optymalizować wydajność aplikacji AI
- ✅ Rozwiązywać typowe problemy z wdrożeniem

### Kolejne kroki
1. Zastosuj te wzorce w swoich projektach AI
2. Przekaż szablony z powrotem do społeczności
3. Dołącz do Discorda Microsoft Foundry, aby uzyskać bieżące wsparcie
4. Poznaj zaawansowane tematy, takie jak wdrożenia wieloregionowe

---

**Opinie o warsztacie**: Pomóż nam ulepszyć ten warsztat, dzieląc się swoimi doświadczeniami na [kanale Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Nawigacja po rozdziałach:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 2 - Rozwój z priorytetem AI
- **⬅️ Poprzedni**: [Wdrażanie modelu AI](ai-model-deployment.md)
- **➡️ Następny**: [Dobre praktyki AI w produkcji](production-ai-practices.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

**Potrzebujesz pomocy?** Dołącz do naszej społeczności, aby uzyskać wsparcie i prowadzić dyskusje na temat AZD i wdrożeń AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Zastrzeżenie:
Ten dokument został przetłumaczony przy użyciu usługi tłumaczeniowej opartej na sztucznej inteligencji [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dokładamy starań, aby tłumaczenie było jak najbardziej poprawne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Za wiążący należy uznać oryginalny dokument w jego języku źródłowym. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego, ludzkiego tłumaczenia. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->