# Laboratorium Warsztatowe AI: Tworzenie Rozwiązań AI Gotowych do Wdrażania z AZD

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 2 - Rozwój z AI na pierwszym miejscu
- **⬅️ Poprzedni**: [Wdrażanie modelu AI](ai-model-deployment.md)
- **➡️ Następny**: [Dobre praktyki produkcyjne AI](../chapter-08-production/production-ai-practices.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

## Przegląd warsztatu

To praktyczne laboratorium prowadzi programistów przez proces wykorzystania istniejącego szablonu AI i wdrożenia go za pomocą Azure Developer CLI (AZD). Nauczysz się podstawowych wzorców wdrażania AI na produkcji z wykorzystaniem usług Microsoft Foundry.

> **Przegląd wydania (2026-11-04):** Instrukcje dotyczące poleceń AZD oraz nazwy przykładowych konfiguracji zostały sprawdzone względem wydania `azd` `1.37.2` oraz bieżącej konfiguracji powiązanego przykładu. To jest przegląd dokumentacji, a nie weryfikacja wdrożenia na żywo. Laboratorium RAG nie wymaga rozszerzenia agenta; do ocen agenta należy używać osobnego rozszerzenia `azure.ai.evaluations` i [aktualnego przebiegu oceny](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), a nie starszych poleceń oceny agenta.

**Czas trwania:** 2-3 godziny  
**Poziom:** Średniozaawansowany  
**Wymagania wstępne:** Podstawowa znajomość Azure, znajomość koncepcji AI/ML

## 🎓 Cele nauczania

Po zakończeniu tego warsztatu będziesz potrafił:
- ✅ Zbadać istniejący szablon AI AZD i zaplanować konwersję własnej aplikacji
- ✅ Skonfigurować usługi Microsoft Foundry za pomocą AZD
- ✅ Wdrożyć bezpieczne zarządzanie poświadczeniami dla usług AI
- ✅ Wdrożyć referencyjną aplikację AI z monitorowaniem
- ✅ Rozwiązywać typowe problemy we wdrażaniu AI

## Wymagania wstępne

### Wymagane narzędzia
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) zainstalowany
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) zainstalowany
- [Git](https://git-scm.com/) zainstalowany
- Edytor kodu (zalecany VS Code)

Bloki poleceń używają składni Bash (w tym kontynuacji linii i `grep`). Na Windows użyj Git Bash/WSL lub przetłumacz je na PowerShell. Zainstaluj też narzędzia językowe, menedżera pakietów i kontenerów wymienione w [lokalnej konfiguracji środowiska próbki](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Zasoby Azure
- Subskrypcja Azure z uprawnieniami do tworzenia zasobów i przypisywania ról (sam Contributor nie może tworzyć przypisań RBAC; użyj autoryzowanego administratora ról lub równoważnego dokumentowanego w próbce)
- Dostęp do usług Microsoft Foundry Models (lub możliwość zgłoszenia się o dostęp)
- Uprawnienia do tworzenia grup zasobów

### Wymagania dotyczące wiedzy
- Podstawowa znajomość usług Azure
- Znajomość interfejsów wiersza poleceń
- Podstawowe pojęcia AI/ML (API, modele, zapytania)

## Konfiguracja laboratorium

### Krok 1: Przygotowanie środowiska

1. **Zweryfikuj instalację narzędzi:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Jeśli pracujesz w wielu tenantach lub subskrypcja nie jest wykrywana automatycznie, spróbuj ponownie z `azd auth login --tenant-id <tenant-id>`.

2. **Sklonuj repozytorium warsztatu:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moduł 1: Zrozumienie struktury AZD dla aplikacji AI

### Budowa szablonu AI AZD

Poznaj kluczowe pliki w szablonie AI-ready AZD:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

Przykład pobrany może się zmieniać; `.azure/` pojawia się po inicjalizacji środowiska, niekoniecznie w świeżym klonie. Sprawdź faktyczny checkout zamiast tworzyć brakujące katalogi, by dopasować ten schemat.

### **Ćwiczenie 1.1: Przegląd konfiguracji**

1. **Zbadaj plik azure.yaml:**
```bash
cat azure.yaml
```

**Na co zwrócić uwagę:**
- Definicje usług dla komponentów AI
- Mapowanie zmiennych środowiskowych
- Konfiguracje hostów

2. **Przejrzyj infrastrukturę main.bicep:**
```bash
cat infra/main.bicep
```

**Kluczowe wzorce AI do zidentyfikowania:**
- Prowizjonowanie usługi Microsoft Foundry Models
- Integracja Azure AI Search
- Bezpieczne zarządzanie kluczami
- Konfiguracje zabezpieczeń sieci

### **Punkt dyskusji:** Dlaczego te wzorce są ważne dla AI

- **Zależności usług**: aplikacje AI często wymagają wielu skoordynowanych usług
- **Bezpieczeństwo**: Klucze API i punkty końcowe wymagają bezpiecznego zarządzania
- **Skalowalność**: obciążenia AI mają unikalne wymagania skalowania
- **Zarządzanie kosztami**: usługi AI mogą być kosztowne, jeśli nie są prawidłowo skonfigurowane

## Moduł 2: Wdrożenie pierwszej aplikacji AI

### Krok 2.1: Inicjalizacja środowiska

1. **Stwórz nowe środowisko AZD:**
```bash
azd env new myai-workshop
```

2. **Ustaw wymagane parametry:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Krok 2.2: Wdrożenie infrastruktury i aplikacji

1. **Wdroż z użyciem AZD:**
```bash
azd up
```

**Co się dzieje podczas `azd up`:**
- ✅ Prowizjonuje usługę Microsoft Foundry Models
- ✅ Tworzy usługę Azure AI Search
- ✅ Konfiguruje Azure Container Apps dla backendu i dołączonego frontendu (domyślnie w bieżącej próbce)
- ✅ Konfiguruje sieć i zabezpieczenia
- ✅ Wdraża kod aplikacji
- ✅ Ustawia monitorowanie i logowanie

2. **Monitoruj postęp wdrożenia** i odnotuj tworzone zasoby.

### Krok 2.3: Weryfikacja wdrożenia

1. **Sprawdź wdrożone zasoby:**
```bash
azd show
```

2. **Otwórz wdrożoną aplikację:**
```bash
azd show
```

Otwórz punkt końcowy webowy pokazany w wyniku `azd show`.

3. **Przetestuj funkcje AI:**
   - Przejdź do aplikacji webowej
   - Wypróbuj przykładowe zapytania
   - Sprawdź poprawność odpowiedzi AI

### **Ćwiczenie 2.1: Praktyka rozwiązywania problemów**

**Scenariusz**: Wdrożenie zakończyło się sukcesem, ale AI nie odpowiada.

**Typowe problemy do sprawdzenia:**
1. **Uwierzytelnianie**: Sprawdź zarządzaną tożsamość i przypisania ról; sprawdzaj klucze API tylko jeśli specjalnie włączyłeś uwierzytelnianie oparte na kluczach
2. **Dostępność modelu**: Sprawdź, czy twój region obsługuje model
3. **Łączność sieciowa**: Upewnij się, że usługi mogą się komunikować
4. **Uprawnienia RBAC**: Sprawdź, czy aplikacja ma dostęp do OpenAI

**Polecenia debugowania:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moduł 3: Dostosowywanie aplikacji AI do Twoich potrzeb

### Krok 3.1: Modyfikacja konfiguracji AI

1. **Zaktualizuj model OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Dodaj dodatkowe usługi AI:**

Edytuj `infra/main.bicep`, aby dodać Document Intelligence:

Poniższy fragment jest ilustracyjny, nie kompletnym szablonem. Próbka może już tworzyć usługi przetwarzania dokumentów: sprawdź jej aktualną infrastrukturę przed dodaniem duplikatów zasobów. Własne dodatki wymagają podłączenia wyjść, tożsamości i konfiguracji aplikacji.

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

**Dobra praktyka**: różne konfiguracje dla środowiska deweloperskiego i produkcyjnego.

1. **Utwórz środowisko produkcyjne:**
```bash
azd env new myai-production
```

2. **Ustaw parametry specyficzne dla produkcji:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Nazwy pochodzą z [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) próbki. `azd env set` przechowuje wartość, ale nie aktywuje dowolnej zmiennej: szablon musi ją wykorzystać. Przed wyłączeniem dostępu publicznego zapoznaj się z [przewodnikiem izolacji sieci](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) próbki i użyj `azd up` do zastosowania zmian infrastruktury. SKU OpenAI `S0` sam nie decyduje o przepustowości modelu; liczą się też typ i pojemność wdrożenia modelu.

### **Ćwiczenie 3.1: Optymalizacja kosztów**

**Zadanie**: Skonfiguruj szablon pod kątem opłacalnego rozwoju.

**Zadania:**
1. Wybierz środowisko warsztatowe do wyrzucenia: `azd env select myai-workshop`.
2. Zanotuj bieżące SKU Search i pojemność modelu z `infra/main.parameters.json` i wybranego środowiska.
3. Skorzystaj z poniższych obsługiwanych wartości po potwierdzeniu limitów modelu/regionu:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Zweryfikuj SKU Search i wybraną pojemność wdrożenia w portalu oraz oszacuj różnicę za pomocą kalkulatora cen. Nie oczekuj natychmiastowej aktualizacji danych rozliczeniowych.

**Kryteria sukcesu:** Search korzysta z Basic, wdrożenie chat ma zadaną obsługiwaną pojemność, a aplikacja odpowiada na przykładowe pytanie. Pojemność `10` to przydział limitu prędkości, nie rabat na cenę tokena. Zmiany tieru Search mogą być ograniczone lub wymagać ponownego utworzenia; nie eksperymentuj na zasobach produkcyjnych. F0 jest specyficzne dla usługi i nie jest SKU modelu Azure OpenAI.

## Moduł 4: Bezpieczeństwo i najlepsze praktyki produkcyjne

### Krok 4.1: Bezpieczne zarządzanie poświadczeniami

**Aktualne wyzwanie**: Wiele aplikacji AI na stałe koduje klucze API lub używa niebezpiecznej pamięci.

**Rozwiązanie AZD**: Managed Identity + integracja z Key Vault.

1. **Sprawdź konfigurację bezpieczeństwa w twoim szablonie:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Zweryfikuj działanie Managed Identity:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Bezpieczeństwo sieci

1. **Włącz prywatne punkty końcowe** za pomocą obsługiwanej konfiguracji sieci próbki (jeśli jeszcze nie jest skonfigurowane).

Dla własnego szablonu ten fragment ilustruje połączenie z punktem końcowym OpenAI. Wymaga on też VNet, konfiguracji prywatnego DNS i łączności aplikacji; nie wklejaj go bez zmian do próbki, która ma już moduły prywatnych punktów końcowych:
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
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Włącz integrację Application Insights przykładu:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Instrumentacja próbki wysyła telemetrykę; dowolna zmienna `OPENAI_MONITOR_ENABLED` nie włącza metryk AI. Sprawdź ślady wywołań modelu, opóźnienia, błędy i zużycie tokenów, unikając rejestrowania wrażliwych zapytań lub odpowiedzi.

### **Ćwiczenie 4.1: Audyt bezpieczeństwa**

**Zadanie**: Przejrzyj wdrożenie pod kątem najlepszych praktyk bezpieczeństwa.

**Lista kontrolna:**
- [ ] Brak na stałe zakodowanych sekretów w kodzie lub konfiguracji
- [ ] Managed Identity używana do uwierzytelniania między usługami
- [ ] Key Vault przechowuje wrażliwe konfiguracje
- [ ] Dostęp sieciowy odpowiednio ograniczony
- [ ] Włączone monitorowanie i logowanie

## Moduł 5: Konwersja własnej aplikacji AI

### Krok 5.1: Arkusz oceny

**Przed konwersją aplikacji** odpowiedz na te pytania:

1. **Architektura aplikacji:**
   - Jakie usługi AI wykorzystuje twoja aplikacja?
   - Jakie zasoby obliczeniowe są potrzebne?
   - Czy potrzebuje bazy danych?
   - Jakie są zależności między usługami?

2. **Wymagania bezpieczeństwa:**
   - Jakie wrażliwe dane obsługuje twoja aplikacja?
   - Jakie masz wymagania zgodności?
   - Czy potrzebujesz sieci prywatnej?

3. **Wymagania skalowania:**
   - Jaka jest spodziewana liczba użytkowników/obciążenie?
   - Czy potrzebne jest automatyczne skalowanie?
   - Czy istnieją wymagania regionalne?

### Krok 5.2: Utwórz swój szablon AZD

**Postępuj według tego wzoru, aby przekształcić aplikację:**

**Tylko szkielet:** Ta sekcja nie zawiera kodu API/WWW, infrastruktury hosta, wdrożeń modelu, tożsamości/RBAC ani kompletnego `main.parameters.json`. Scoped do grupy zasobów Bicep ilustruje składanie modułów; typowy punkt wejścia scoped do subskrypcji AZD musi tworzyć grupę zasobów i wywoływać ten moduł w tym zakresie. Nie spodziewaj się, że `azd up` wdroży kompletną aplikację po skopiowaniu tylko tych fragmentów. Dla działającej bazy nadal korzystaj z szablonu RAG z Modułu 1.

1. **Utwórz podstawową strukturę:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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

3. **Stwórz szablony infrastruktury:**

**infra/main.bicep** - szablon główny:
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Ćwiczenie 5.1: Wyzwanie tworzenia szablonu**

**Zadanie**: Stwórz szablon AZD dla aplikacji AI przetwarzającej dokumenty.

**Wymagania:**
- Microsoft Foundry Models do analizy treści
- Document Intelligence do OCR
- Konto Storage dla przesyłania dokumentów
- Function App dla logiki przetwarzania
- Aplikacja webowa dla interfejsu użytkownika

**Dodatkowe punkty:**
- Dodaj właściwe obsługiwanie błędów
- Dołącz oszacowanie kosztów
- Skonfiguruj pulpity monitorujące

## Moduł 6: Rozwiązywanie typowych problemów

### Typowe problemy z wdrożeniem

#### Problem 1: Przekroczono limit usług OpenAI
**Objawy:** Wdrożenie nie powiodło się z powodu błędu limitu
**Rozwiązania:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Model niedostępny w regionie
**Objawy:** AI nie odpowiada lub błędy wdrożenia modelu
**Rozwiązania:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Problem 3: Problemy z uprawnieniami
**Objawy:** Błędy 403 Forbidden przy wywołaniach usług AI
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
- Wprowadź cache dla często zadawanych zapytań
- Używaj odpowiedniego modelu OpenAI dla zastosowania
- Skaluj repliki aplikacji dopiero po sprawdzeniu limitów RPM/TPM modelu; wdrożenia Azure OpenAI nie udostępniają ogólnej opcji "repliki odczytowej" jak w bazach danych

### **Ćwiczenie 6.1: Wyzwanie debugowania**

**Scenariusz**: Wdrożenie powiodło się, ale aplikacja zwraca błędy 500.

**Zadania debugowania:**
1. Sprawdź logi aplikacji
2. Zweryfikuj łączność usług
3. Testowanie uwierzytelniania
4. Przegląd konfiguracji

**Narzędzia do użycia:**
- `azd show` do przeglądu wdrożenia
- Portal Azure do szczegółowych dzienników usług
- Application Insights do telemetrii aplikacji

## Moduł 7: Monitorowanie i optymalizacja

### Krok 7.1: Ustaw kompleksowe monitorowanie

1. **Utwórz własne pulpity nawigacyjne:**

Przejdź do portalu Azure i utwórz pulpit nawigacyjny z:
- Liczbą i opóźnieniami żądań OpenAI
- Wskaźnikami błędów aplikacji
- Wykorzystaniem zasobów
- Śledzeniem kosztów

2. **Skonfiguruj alerty:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Sprawdź, czy komponent wysyła telemetrię żądań i dodaj grupę akcji, jeśli są potrzebne powiadomienia. Metryka to liczba, nie procent błędów; alert na podstawie wskaźnika wymaga odpowiedniego zapytania i mianownika.

### Krok 7.2: Optymalizacja kosztów

1. **Analizuj bieżące koszty:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Zamień miejsce na daty. Obsługa API zużycia zależy od umowy rozliczeniowej; jeśli nie ma szczegółów użycia, skorzystaj z Cost Management w portalu. Koszty są z opóźnieniem, to nie jest test w czasie rzeczywistym.

2. **Wprowadź kontrolę kosztów:**
- Skonfiguruj alerty budżetowe
- Używaj polityk autoskalowania
- Wdróż buforowanie żądań
- Monitoruj użycie tokenów dla OpenAI

### **Ćwiczenie laboratoryjne 7.1: Optymalizacja wydajności**

**Zadanie**: Optymalizuj swoją aplikację AI pod kątem wydajności i kosztów.

**Wskaźniki do poprawy:**
- Skróć średni czas odpowiedzi o 20%
- Zmniejsz miesięczne koszty o 15%
- Zdefiniuj SLO dostępności na poziomie 99,9% i okres pomiaru (krótkie laboratorium nie pozwala pokazać miesięcznej dostępności)

**Strategie do wypróbowania:**
- Wdroż buforowanie odpowiedzi
- Optymalizuj prompt pod kątem efektywności tokenów
- Używaj odpowiednich SKU obliczeniowych
- Skonfiguruj prawidłowe autoskalowanie

## Wyzwanie końcowe: Implementacja end-to-end

### Scenariusz wyzwania

To jest **opcjonalne wyzwanie architektoniczne/projektowe**, nie dostarczone ćwiczenie do uruchomienia lub certyfikacja produkcyjna. Zaproponuj chatbota obsługi klienta zasilanego AI i udokumentuj, które wymagania wymagają dalszej implementacji i dowodów:

**Wymagania funkcjonalne:**
- Interfejs webowy do interakcji z klientami
- Integracja z Microsoft Foundry Models dla odpowiedzi
- Możliwość wyszukiwania dokumentów za pomocą Azure AI Search
- Integracja z istniejącą bazą danych klientów
- Obsługa wielu języków

**Wymagania niefunkcjonalne:**
- Obsługa 1000 jednoczesnych użytkowników
- SLA dostępności 99,9%
- Zgodność SOC 2
- Koszt poniżej 500 USD/miesiąc
- Wdrożenie w wielu środowiskach (dev, staging, prod)

To są hipotetyczne ograniczenia interesariuszy, a nie jednocześnie gwarantowane wyniki. Zdefiniuj szybkość żądań, rozmiar promptów/odpowiedzi i czas trwania sesji przed szacowaniem kosztów; 1000 jednoczesnych użytkowników nie definiuje obciążenia ani nie potwierdza wykonalności budżetu 500 USD. SOC 2 to wynik audytu organizacyjnego, nie funkcja włączana przez szablon AZD. Zidentyfikuj kompromisy i odrzuć niewykonalne ograniczenia z uzasadnieniem.

### Kroki implementacji

1. **Zaprojektuj architekturę**
2. **Utwórz szablon AZD**
3. **Zaimplementuj środki bezpieczeństwa**
4. **Skonfiguruj monitorowanie i alerty**
5. **Utwórz pipeline’y wdrożeniowe**
6. **Udokumentuj rozwiązanie**

### Kryteria oceny

- ✅ **Funkcjonalność**: Czy wykazano wdrożone możliwości i jasno zaznaczono pozostałe luki?
- ✅ **Bezpieczeństwo**: Czy wdrożono najlepsze praktyki?
- ✅ **Skalowalność**: Czy poradzi sobie z obciążeniem?
- ✅ **Utrzymywalność**: Czy kod i infrastruktura są dobrze zorganizowane?
- ✅ **Koszty**: Czy mieszczą się w budżecie?

## Dodatkowe zasoby

### Dokumentacja Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Przykładowe szablony
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Zasoby społeczności
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Punkt kontrolny ukończenia

Gratulacje! Ukończyłeś laboratorium warsztatowe AI. Teraz powinieneś potrafić:

- ✅ Wyjaśnić, jak dostosować istniejącą aplikację AI do szablonu AZD
- ✅ Wdrożyć i przetestować referencyjną aplikację AI
- ✅ Wdrożyć najlepsze praktyki bezpieczeństwa dla obciążeń AI
- ✅ Monitorować i optymalizować wydajność aplikacji AI
- ✅ Rozwiązywać typowe problemy z wdrożeniem

**Sprzątanie:** Uruchom `azd env list`, wybierz każde środowisko jednorazowe utworzone w tym laboratorium (`myai-workshop`, a jeśli wdrożono `myai-production`/`myai-quota-test`) i uruchom `azd down` w każdym. Przejrzyj plan usuwania; samo usunięcie lokalnej konfiguracji środowiska nie usuwa zasobów Azure. Unikaj `--purge`, chyba że rozumiesz nieodwracalne usuwanie zasobów w stanie miękkiego usunięcia.

### Kolejne kroki
1. Zastosuj te wzorce w swoich własnych projektach AI
2. Wnieś wkład, udostępniając szablony społeczności
3. Dołącz do Microsoft Foundry Discord, aby uzyskać wsparcie
4. Poznaj zaawansowane tematy, takie jak wdrożenia wieloregionalne

---

**Opinie o warsztacie**: Pomóż nam ulepszyć ten warsztat, dzieląc się swoimi doświadczeniami na kanale [Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD For Beginners](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 2 - Rozwój z myślą o AI
- **⬅️ Poprzedni**: [Wdrożenie modelu AI](ai-model-deployment.md)
- **➡️ Następny**: [Najlepsze praktyki produkcyjnego AI](../chapter-08-production/production-ai-practices.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

**Potrzebujesz pomocy?** Dołącz do naszej społeczności, aby uzyskać wsparcie i dyskusje na temat AZD i wdrożeń AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->