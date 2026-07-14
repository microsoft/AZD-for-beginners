# Warsztat AI: Uczynienie Twoich Rozwiązań AI Gotowymi do Wdrażania z AZD

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 2 - Rozwój z AI na pierwszym miejscu
- **⬅️ Poprzedni**: [Wdrażanie modeli AI](ai-model-deployment.md)
- **➡️ Następny**: [Najlepsze praktyki produkcyjnego AI](production-ai-practices.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

## Przegląd warsztatu

Ten praktyczny lab prowadzi deweloperów przez proces wykorzystania istniejącego szablonu AI i wdrożenia go za pomocą Azure Developer CLI (AZD). Nauczysz się podstawowych wzorców wdrażania produkcyjnego AI z wykorzystaniem usług Microsoft Foundry.

> **Uwaga dotycząca walidacji (2026-07-13):** Warsztat został przetestowany z `azd` w wersji `1.27.1`. Jeśli Twoja lokalna instalacja jest starsza, zaktualizuj AZD przed rozpoczęciem, aby proces uwierzytelniania, szablonu i wdrożenia odpowiadał poniższym krokom.

**Czas trwania:** 2-3 godziny  
**Poziom:** Średniozaawansowany  
**Wymagania wstępne:** Podstawowa znajomość Azure, zaznajomienie z koncepcjami AI/ML

## 🎓 Cele nauki

Po zakończeniu tego warsztatu będziesz potrafił:
- ✅ Przekształcić istniejącą aplikację AI do użycia szablonów AZD
- ✅ Skonfigurować usługi Microsoft Foundry z użyciem AZD
- ✅ Zaimplementować bezpieczne zarządzanie poświadczeniami dla usług AI
- ✅ Wdrożyć gotowe do produkcji aplikacje AI z monitorowaniem
- ✅ Rozwiązywać typowe problemy z wdrażaniem AI

## Wymagania wstępne

### Wymagane narzędzia
- Zainstalowany [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Zainstalowany [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Zainstalowany [Git](https://git-scm.com/)
- Edytor kodu (zalecany VS Code)

### Zasoby Azure
- Subskrypcja Azure z dostępem uczestnika
- Dostęp do usług Microsoft Foundry Models (lub możliwość uzyskania dostępu)
- Uprawnienia do tworzenia grup zasobów

### Wiedza wymagana
- Podstawowa znajomość usług Azure
- Znajomość interfejsów wiersza poleceń
- Podstawowe koncepcje AI/ML (API, modele, prompt)

## Konfiguracja laboratorium

### Krok 1: Przygotowanie środowiska

1. **Zweryfikuj instalacje narzędzi:**
```bash
# Sprawdź instalację AZD
azd version

# Sprawdź Azure CLI
az --version

# Zaloguj się do Azure dla workflow AZD
azd auth login

# Zaloguj się do Azure CLI tylko jeśli planujesz uruchamiać polecenia az podczas diagnostyki
az login
```

Jeśli pracujesz w wielu tenantach lub twoja subskrypcja nie jest wykrywana automatycznie, spróbuj ponownie z `azd auth login --tenant-id <tenant-id>`.

2. **Sklonuj repozytorium warsztatu:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moduł 1: Zrozumienie struktury AZD dla aplikacji AI

### Anatomia szablonu AZD gotowego na AI

Poznaj kluczowe pliki w szablonie AZD przystosowanym do AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Ćwiczenie laboratoryjne 1.1: Zbadaj konfigurację**

1. **Przeanalizuj plik azure.yaml:**
```bash
cat azure.yaml
```

**Na co zwrócić uwagę:**
- Definicje usług dla komponentów AI
- Mapowania zmiennych środowiskowych
- Konfiguracje hosta

2. **Przejrzyj główną infrastrukturę w main.bicep:**
```bash
cat infra/main.bicep
```

**Kluczowe wzorce AI do zidentyfikowania:**
- Udostępnianie usługi Microsoft Foundry Models
- Integracja z Azure AI Search
- Bezpieczne zarządzanie kluczami
- Konfiguracje zabezpieczeń sieciowych

### **Punkt dyskusji:** Dlaczego te wzorce są ważne dla AI

- **Zależności usług**: Aplikacje AI często wymagają współdziałania wielu usług
- **Bezpieczeństwo**: Klucze API i punkt końcowy muszą być bezpiecznie zarządzane
- **Skalowalność**: Obciążenia AI mają unikalne potrzeby skalowania
- **Zarządzanie kosztami**: Usługi AI mogą być kosztowne, jeśli nie są odpowiednio skonfigurowane

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
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Krok 2.2: Wdrożenie infrastruktury i aplikacji

1. **Wdrożenie za pomocą AZD:**
```bash
azd up
```

**Co dzieje się podczas `azd up`:**
- ✅ Provisionowanie usługi Microsoft Foundry Models
- ✅ Utworzenie usługi Azure AI Search
- ✅ Konfiguracja App Service dla aplikacji webowej
- ✅ Konfiguracja sieci i zabezpieczeń
- ✅ Wdrożenie kodu aplikacji
- ✅ Ustawienie monitoringu i logowania

2. **Monitoruj postęp wdrożenia** i notuj tworzone zasoby.

### Krok 2.3: Zweryfikuj wdrożenie

1. **Sprawdź wdrożone zasoby:**
```bash
azd show
```

2. **Otwórz wdrożoną aplikację:**
```bash
azd show
```

Otwórz endpoint webowy pokazany w wyniku `azd show`.

3. **Przetestuj funkcjonalność AI:**
   - Wejdź do aplikacji webowej
   - Wypróbuj przykładowe zapytania
   - Zweryfikuj, czy AI odpowiada poprawnie

### **Ćwiczenie laboratoryjne 2.1: Ćwiczenie rozwiązywania problemów**

**Scenariusz**: Twoje wdrożenie zakończyło się sukcesem, ale AI nie reaguje.

**Typowe problemy do sprawdzenia:**
1. **Klucze API OpenAI**: Sprawdź, czy są poprawnie ustawione
2. **Dostępność modelu**: Sprawdź, czy Twoja lokalizacja obsługuje model
3. **Łączność sieciowa**: Upewnij się, że usługi mogą się komunikować
4. **Uprawnienia RBAC**: Zweryfikuj, czy aplikacja ma dostęp do OpenAI

**Polecenia do debugowania:**
```bash
# Sprawdź zmienne środowiskowe
azd env get-values

# Zobacz logi wdrożenia
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Sprawdź status wdrożenia OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moduł 3: Dostosowywanie aplikacji AI do własnych potrzeb

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

**Dobra praktyka**: Różne konfiguracje dla środowiska deweloperskiego i produkcyjnego.

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

### **Ćwiczenie laboratoryjne 3.1: Optymalizacja kosztów**

**Wyzwanie**: Skonfiguruj szablon na potrzeby rozwijania przy minimalnych kosztach.

**Zadania:**
1. Zidentyfikuj, które SKU można ustawić na darmowe/podstawowe poziomy
2. Skonfiguruj zmienne środowiskowe dla minimalnych kosztów
3. Wdróż i porównaj koszty z konfiguracją produkcyjną

**Wskazówki do rozwiązania:**
- Używaj poziomu F0 (darmowy) dla usług Azure AI, jeśli to możliwe
- Używaj poziomu Basic dla usługi Search w środowisku deweloperskim
- Rozważ użycie planu Consumption dla Functions

## Moduł 4: Bezpieczeństwo i najlepsze praktyki produkcyjne

### Krok 4.1: Bezpieczne zarządzanie poświadczeniami

**Aktualne wyzwanie**: Wiele aplikacji AI ma na stałe w kodzie klucze API lub używa niebezpiecznego przechowywania.

**Rozwiązanie AZD**: Managed Identity + integracja z Key Vault.

1. **Przejrzyj konfigurację bezpieczeństwa w szablonie:**
```bash
# Poszukaj konfiguracji Key Vault i Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Zweryfikuj, czy Managed Identity działa:**
```bash
# Sprawdź, czy aplikacja internetowa ma poprawną konfigurację tożsamości
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Bezpieczeństwo sieci

1. **Włącz prywatne punkty końcowe** (jeśli nie są skonfigurowane):

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

### Krok 4.3: Monitoring i obserwowalność

1. **Skonfiguruj Application Insights:**
```bash
# Application Insights powinno być skonfigurowane automatycznie
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

**Zadanie:** Przejrzyj swoje wdrożenie pod kątem najlepszych praktyk bezpieczeństwa.

**Lista kontrolna:**
- [ ] Brak zakodowanych na stałe sekretów w kodzie lub konfiguracji
- [ ] Użycie Managed Identity do uwierzytelniania rozwiązań usługowych
- [ ] Key Vault przechowuje wrażliwe dane konfiguracyjne
- [ ] Dostęp sieciowy jest odpowiednio ograniczony
- [ ] Monitoring i logowanie są włączone

## Moduł 5: Konwersja własnej aplikacji AI

### Krok 5.1: Arkusz oceny

**Przed konwersją swojej aplikacji**, odpowiedz na poniższe pytania:

1. **Architektura aplikacji:**
   - Jakie usługi AI wykorzystuje Twoja aplikacja?
   - Jakie zasoby obliczeniowe są potrzebne?
   - Czy potrzebuje bazy danych?
   - Jakie są zależności między usługami?

2. **Wymagania dotyczące bezpieczeństwa:**
   - Jakie wrażliwe dane przetwarza aplikacja?
   - Jakie masz wymogi zgodności?
   - Czy potrzebne jest prywatne sieciowanie?

3. **Wymagania skalowania:**
   - Jakie przewidujesz obciążenie?
   - Czy wymagasz auto-skalingu?
   - Czy są wymagania regionalne?

### Krok 5.2: Utwórz swój szablon AZD

**Postępuj według tego wzorca, żeby przekonwertować aplikację:**

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

**Wyzwanie:** Utwórz szablon AZD dla aplikacji AI do przetwarzania dokumentów.

**Wymagania:**
- Microsoft Foundry Models do analizy treści
- Document Intelligence do OCR
- Konto Storage na przesyłane dokumenty
- Function App na logikę przetwarzania
- Aplikacja webowa do interfejsu użytkownika

**Dodatkowe punkty:**
- Dodaj odpowiednie obsługi błędów
- Uwzględnij szacunek kosztów
- Skonfiguruj panele monitoringu

## Moduł 6: Rozwiązywanie typowych problemów

### Typowe problemy podczas wdrażania

#### Problem 1: Przekroczony limit usługi OpenAI
**Objawy:** Błąd przekroczenia limitu podczas wdrożenia
**Rozwiązania:**
```bash
# Sprawdź bieżące limity
az cognitiveservices usage list --location eastus

# Zażądaj zwiększenia limitu lub spróbuj innego regionu
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Model niedostępny w regionie
**Objawy:** AI nie odpowiada lub występują błędy wdrażania modelu
**Rozwiązania:**
```bash
# Sprawdź dostępność modelu według regionu
az cognitiveservices model list --location eastus

# Aktualizuj do dostępnego modelu
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
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
**Kroki do zbadania:**
1. Sprawdź metryki wydajności w Application Insights
2. Przejrzyj metryki usługi OpenAI w portalu Azure
3. Zweryfikuj łączność sieciową i opóźnienia

**Rozwiązania:**
- Wdroż cache'owanie dla często zadawanych zapytań
- Użyj odpowiedniego modelu OpenAI do swojego przypadku użycia
- Rozważ repliki do odczytu dla scenariuszy wysokiego obciążenia

### **Ćwiczenie laboratoryjne 6.1: Wyzwanie debugowania**

**Scenariusz:** Twoje wdrożenie zakończyło się sukcesem, ale aplikacja zwraca błędy 500.

**Zadania debugowania:**
1. Przejrzyj logi aplikacji
2. Zweryfikuj łączność usług
3. Przetestuj uwierzytelnianie
4. Sprawdź konfigurację

**Narzędzia do użycia:**
- `azd show` do przeglądu wdrożenia
- Portal Azure do szczegółowych logów usług
- Application Insights do telemetrii aplikacji

## Moduł 7: Monitoring i optymalizacja

### Krok 7.1: Skonfiguruj kompleksowy monitoring

1. **Utwórz niestandardowe panele sterowania:**

Przejdź do portalu Azure i utwórz panel z:
- Liczbą i opóźnieniami zapytań OpenAI
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

1. **Analiza aktualnych kosztów:**
```bash
# Użyj Azure CLI, aby uzyskać dane dotyczące kosztów
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Wdrożenie kontroli kosztów:**
- Skonfiguruj alerty budżetowe
- Użyj polityk autoskalowania
- Wdroż cache'owanie zapytań
- Monitoruj zużycie tokenów OpenAI

### **Ćwiczenie laboratoryjne 7.1: Optymalizacja wydajności**

**Zadanie:** Optymalizuj swoją aplikację AI pod kątem wydajności i kosztów.

**Wskaźniki do poprawy:**
- Skrócenie średniego czasu odpowiedzi o 20%
- Zmniejszenie miesięcznych kosztów o 15%
- Utrzymanie dostępności na poziomie 99.9%

**Strategie do wypróbowania:**
- Wdroż cache'owanie odpowiedzi
- Optymalizuj prompt pod kątem efektywności tokenów
- Użyj odpowiednich SKU zasobów obliczeniowych
- Skonfiguruj właściwe autoskalowanie

## Wyzwanie końcowe: Implementacja end-to-end

### Scenariusz wyzwania

Masz zadanie stworzyć gotowego do produkcji chatbota obsługi klienta opartego na AI z następującymi wymaganiami:

**Wymagania funkcjonalne:**
- Interfejs webowy do interakcji z klientami
- Integracja z Microsoft Foundry Models do odpowiedzi
- Możliwość wyszukiwania dokumentów przy użyciu Azure AI Search
- Integracja z istniejącą bazą klientów
- Obsługa wielu języków

**Wymagania niefunkcjonalne:**
- Obsługa 1000 jednoczesnych użytkowników
- SLA na poziomie 99.9%
- Zgodność z SOC 2
- Koszt poniżej 500 USD/miesiąc
- Wdrożenie do wielu środowisk (dev, staging, prod)

### Kroki implementacji

1. **Zaprojektuj architekturę**
2. **Utwórz szablon AZD**
3. **Wdróż środki bezpieczeństwa**
4. **Skonfiguruj monitoring i alerty**
5. **Utwórz pipeline'y wdrożeniowe**
6. **Udokumentuj rozwiązanie**

### Kryteria oceny

- ✅ **Funkcjonalność**: Czy spełnia wszystkie wymagania?
- ✅ **Bezpieczeństwo**: Czy zastosowano najlepsze praktyki?
- ✅ **Skalowalność**: Czy poradzi sobie z obciążeniem?
- ✅ **Utrzymywalność**: Czy kod i infrastruktura są dobrze zorganizowane?
- ✅ **Koszt**: Czy trzyma budżet?

## Dodatkowe zasoby

### Dokumentacja Microsoft
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentacja Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentacja Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Przykładowe szablony
- [Aplikacja czatu Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Szybki start aplikacji czatu OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Zasoby społeczności
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Świetne szablony AZD](https://azure.github.io/awesome-azd/)

## 🎓 Certyfikat ukończenia

Gratulacje! Ukończyłeś Laboratorium Warsztatów AI. Teraz powinieneś być w stanie:

- ✅ Konwertować istniejące aplikacje AI na szablony AZD
- ✅ Wdrażać aplikacje AI gotowe do produkcji
- ✅ Wdrażać najlepsze praktyki zabezpieczeń dla obciążeń AI
- ✅ Monitorować i optymalizować wydajność aplikacji AI
- ✅ Rozwiązywać typowe problemy z wdrożeniem

### Kolejne kroki
1. Stosuj te wzorce w swoich własnych projektach AI
2. Wnoś szablony z powrotem do społeczności
3. Dołącz do Microsoft Foundry Discord, aby otrzymywać wsparcie na bieżąco
4. Poznaj zaawansowane tematy, takie jak wdrożenia wieloregionalne

---

**Opinie o warsztatach**: Pomóż nam ulepszyć te warsztaty, dzieląc się swoimi doświadczeniami na kanale [Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Nawigacja po rozdziałach:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 2 - Rozwój AI w pierwszej kolejności
- **⬅️ Poprzedni**: [Wdrażanie modeli AI](ai-model-deployment.md)
- **➡️ Następny**: [Najlepsze praktyki AI produkcyjnego](production-ai-practices.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

**Potrzebujesz pomocy?** Dołącz do naszej społeczności, aby uzyskać wsparcie i dyskusję na temat AZD i wdrożeń AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->