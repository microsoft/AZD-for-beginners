# Warsztaty AI: Przygotowanie Twoich Rozwiązań AI do Wdrożenia z AZD

**Nawigacja po rozdziale:**
- **📚 Strona główna kursu**: [AZD Dla Początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 2 - Rozwój AI-First
- **⬅️ Poprzedni**: [Wdrażanie modelu AI](ai-model-deployment.md)
- **➡️ Następny**: [Najlepsze praktyki produkcyjne AI](production-ai-practices.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

## Przegląd warsztatów

Ten praktyczny laboratorium prowadzi programistów przez proces przejęcia istniejącego szablonu AI i wdrożenia go za pomocą Azure Developer CLI (AZD). Nauczysz się podstawowych wzorców dla produkcyjnych wdrożeń AI przy użyciu usług Microsoft Foundry.

> **Notatka walidacyjna (2026-03-25):** Warsztaty zostały przetestowane z `azd` w wersji `1.23.12`. Jeśli Twoja lokalna instalacja jest starsza, zaktualizuj AZD przed rozpoczęciem, aby proces uwierzytelniania, szablonu i wdrożenia był zgodny z poniższymi krokami.

**Czas trwania:** 2-3 godziny  
**Poziom:** Średnio zaawansowany  
**Wymagania wstępne:** Podstawowa znajomość Azure, zaznajomienie z koncepcjami AI/ML

## 🎓 Cele nauki

Pod koniec warsztatu będziesz umiał:
- ✅ Przekształcić istniejącą aplikację AI do użycia szablonów AZD
- ✅ Skonfigurować usługi Microsoft Foundry z AZD
- ✅ Wdrożyć bezpieczne zarządzanie poświadczeniami dla usług AI
- ✅ Wdrażać gotowe do produkcji aplikacje AI z monitoringiem
- ✅ Rozwiązywać typowe problemy z wdrożeniami AI

## Wymagania wstępne

### Wymagane narzędzia
- Zainstalowany [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Zainstalowany [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Zainstalowany [Git](https://git-scm.com/)
- Edytor kodu (zalecany VS Code)

### Zasoby Azure
- Subskrypcja Azure z dostępem współtwórcy
- Dostęp do usług Microsoft Foundry Models (lub możliwość zgłoszenia dostępu)
- Uprawnienia do tworzenia grup zasobów

### Wiedza wstępna
- Podstawowa znajomość usług Azure
- Znajomość interfejsów wiersza poleceń
- Podstawowe koncepcje AI/ML (API, modele, prompt-y)

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

Jeśli pracujesz w wielu dzierżawach lub subskrypcja nie jest wykrywana automatycznie, spróbuj ponownie używając `azd auth login --tenant-id <tenant-id>`.

2. **Sklonuj repozytorium warsztatowe:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moduł 1: Zrozumienie struktury AZD dla aplikacji AI

### Anatomia szablonu AI AZD

Poznaj kluczowe pliki w gotowym do AI szablonie AZD:

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

### **Ćwiczenie laboratoryjne 1.1: Przegląd konfiguracji**

1. **Zbadaj plik azure.yaml:**
```bash
cat azure.yaml
```

**Na co zwracać uwagę:**
- Definicje usług dla komponentów AI
- Mapowania zmiennych środowiskowych
- Konfiguracje hosta

2. **Przejrzyj główną infrastrukturę w main.bicep:**
```bash
cat infra/main.bicep
```

**Kluczowe wzorce AI do zidentyfikowania:**
- Provisioning usługi Microsoft Foundry Models
- Integracja Azure AI Search
- Bezpieczne zarządzanie kluczami
- Konfiguracje zabezpieczeń sieciowych

### **Punkt dyskusyjny:** Dlaczego te wzorce są ważne dla AI

- **Zależności usług:** Aplikacje AI często wymagają wielu skoordynowanych usług
- **Bezpieczeństwo:** Klucze API i punkty końcowe muszą być bezpiecznie zarządzane
- **Skalowalność:** Obciążenia AI mają unikalne wymagania skalowania
- **Zarządzanie kosztami:** Usługi AI mogą być kosztowne, jeśli nie są właściwie skonfigurowane

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
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Krok 2.2: Wdrożenie infrastruktury i aplikacji

1. **Wdroż za pomocą AZD:**
```bash
azd up
```

**Co się dzieje podczas `azd up`:**
- ✅ Provisionowana usługa Microsoft Foundry Models
- ✅ Tworzona usługa Azure AI Search
- ✅ Konfiguracja App Service dla aplikacji webowej
- ✅ Ustawienia sieci i zabezpieczeń
- ✅ Wdrażanie kodu aplikacji
- ✅ Konfiguracja monitorowania i logowania

2. **Monitoruj postęp wdrożenia** i odnotuj tworzone zasoby.

### Krok 2.3: Weryfikacja wdrożenia

1. **Sprawdź utworzone zasoby:**
```bash
azd show
```

2. **Otwórz wdrożoną aplikację:**
```bash
azd show
```

Otwórz adres webowy widoczny w wyniku `azd show`.

3. **Przetestuj funkcje AI:**
   - Przejdź do aplikacji webowej
   - Wypróbuj przykładowe zapytania
   - Zweryfikuj działanie odpowiedzi AI

### **Ćwiczenie laboratoryjne 2.1: Ćwiczenia z rozwiązywania problemów**

**Scenariusz:** Wdrożenie powiodło się, ale AI nie odpowiada.

**Typowe problemy do sprawdzenia:**
1. **Klucze API OpenAI**: Sprawdź, czy są poprawnie ustawione
2. **Dostępność modelu**: Sprawdź, czy Twój region obsługuje model
3. **Łączność sieciowa**: Upewnij się, że usługi się komunikują
4. **Uprawnienia RBAC**: Zweryfikuj dostęp aplikacji do OpenAI

**Polecenia debugowania:**
```bash
# Sprawdź zmienne środowiskowe
azd env get-values

# Wyświetl logi wdrożenia
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Sprawdź status wdrożenia OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moduł 3: Dostosowywanie aplikacji AI do Twoich potrzeb

### Krok 3.1: Modyfikacja konfiguracji AI

1. **Zaktualizuj model OpenAI:**
```bash
# Zmień na inny model (jeśli dostępny w twoim regionie)
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

**Zadanie:** Skonfiguruj szablon pod kątem ekonomicznego rozwoju.

**Zadania:**
1. Zidentyfikuj, które SKU można ustawić na darmowe/podstawowe poziomy
2. Skonfiguruj zmienne środowiskowe dla minimalnych kosztów
3. Wdróż i porównaj koszty z konfiguracją produkcyjną

**Podpowiedzi:**
- Używaj poziomu F0 (darmowy) dla usług Azure AI, kiedy to możliwe
- W środowisku deweloperskim stosuj podstawowy poziom dla Search Service
- Rozważ użycie planu Consumption dla Functions

## Moduł 4: Bezpieczeństwo i najlepsze praktyki produkcyjne

### Krok 4.1: Bezpieczne zarządzanie poświadczeniami

**Aktualne wyzwanie:** Wiele aplikacji AI trzyma klucze API na twardo lub w niebezpiecznym przechowywaniu.

**Rozwiązanie AZD:** Integracja Managed Identity + Key Vault.

1. **Przejrzyj konfigurację bezpieczeństwa w szablonie:**
```bash
# Szukaj konfiguracji Key Vault i Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Sprawdź działanie Managed Identity:**
```bash
# Sprawdź, czy aplikacja internetowa ma poprawną konfigurację tożsamości
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Bezpieczeństwo sieci

1. **Włącz prywatne punkty końcowe** (jeśli nie skonfigurowano):

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
- [ ] Brak zakodowanych sekretów w kodzie lub konfiguracji
- [ ] Wykorzystanie Managed Identity do uwierzytelniania usług
- [ ] Key Vault przechowuje wrażliwe dane konfiguracyjne
- [ ] Ograniczony dostęp sieciowy
- [ ] Włączony monitoring i logowanie

## Moduł 5: Konwersja własnej aplikacji AI

### Krok 5.1: Arkusz oceny

**Przed konwersją aplikacji**, odpowiedz na pytania:

1. **Architektura aplikacji:**
   - Jakie usługi AI używa Twoja aplikacja?
   - Jakie zasoby obliczeniowe są potrzebne?
   - Czy wymaga bazy danych?
   - Jakie są zależności między usługami?

2. **Wymagania bezpieczeństwa:**
   - Jakie dane wrażliwe obsługuje Twoja aplikacja?
   - Jakie wymagania zgodności musisz spełnić?
   - Czy potrzebujesz prywatnej sieci?

3. **Wymagania skalowania:**
   - Jakie jest oczekiwane obciążenie?
   - Czy potrzebujesz automatycznego skalowania?
   - Czy istnieją wymagania regionalne?

### Krok 5.2: Utwórz swój szablon AZD

**Postępuj według wzoru, żeby skonwertować aplikację:**

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

### **Ćwiczenie laboratoryjne 5.1: Wyzwanie tworzenia szablonu**

**Zadanie:** Stwórz szablon AZD dla aplikacji AI do przetwarzania dokumentów.

**Wymagania:**
- Microsoft Foundry Models do analizy treści
- Document Intelligence do OCR
- Konto Storage na dokumenty przesyłane
- Function App do logiki przetwarzania
- Aplikacja webowa jako interfejs użytkownika

**Bonus:**
- Dodaj właściwe obsługiwanie błędów
- Uwzględnij szacowanie kosztów
- Skonfiguruj panele monitoringu

## Moduł 6: Rozwiązywanie typowych problemów

### Typowe problemy z wdrożeniem

#### Problem 1: Przekroczenie limitu kwoty w usłudze OpenAI
**Objawy:** Wdrożenie nie powiodło się z powodu błędu limitu
**Rozwiązania:**
```bash
# Sprawdź aktualne limity
az cognitiveservices usage list --location eastus

# Poproś o zwiększenie limitu lub spróbuj inny region
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
**Kroki dochodzenia:**
1. Sprawdź metryki wydajności w Application Insights
2. Przejrzyj metryki usługi OpenAI w portalu Azure
3. Zweryfikuj łączność sieciową i opóźnienia

**Rozwiązania:**
- Wdróż cache dla często zadawanych zapytań
- Używaj odpowiedniego modelu OpenAI dla swojego przypadku użycia
- Rozważ read replicas przy dużym obciążeniu

### **Ćwiczenie laboratoryjne 6.1: Wyzwanie debugowania**

**Scenariusz:** Wdrożenie powiodło się, ale aplikacja zwraca błędy 500.

**Zadania debugowania:**
1. Sprawdź logi aplikacji
2. Zweryfikuj łączność usług
3. Przetestuj uwierzytelnianie
4. Przejrzyj konfigurację

**Narzędzia do użycia:**
- `azd show` do przeglądu wdrożenia
- Portal Azure do szczegółowych logów usług
- Application Insights do telemetrii aplikacji

## Moduł 7: Monitoring i optymalizacja

### Krok 7.1: Skonfiguruj kompleksowy monitoring

1. **Utwórz niestandardowe panele:**

Przejdź do portalu Azure i utwórz panel z:
- Liczba i latencja żądań do OpenAI
- Wskaźniki błędów aplikacji
- Wykorzystanie zasobów
- Śledzenie kosztów

2. **Ustaw alerty:**
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

1. **Analizuj aktualne koszty:**
```bash
# Użyj Azure CLI, aby pobrać dane dotyczące kosztów
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Wprowadź kontrolę kosztów:**
- Ustaw alerty budżetowe
- Stosuj polityki autoskalowania
- Implementuj cache zapytań
- Monitoruj wykorzystanie tokenów OpenAI

### **Ćwiczenie laboratoryjne 7.1: Optymalizacja wydajności**

**Zadanie:** Optymalizuj aplikację AI pod kątem wydajności i kosztów.

**Metryki do poprawy:**
- Zmniejsz średni czas odpowiedzi o 20%
- Zmniejsz miesięczne koszty o 15%
- Utrzymaj dostępność 99,9%

**Strategie do wypróbowania:**
- Implementacja cache odpowiedzi
- Optymalizacja promptów pod kątem efektywności tokenów
- Użycie odpowiednich SKU zasobów obliczeniowych
- Prawidłowa konfiguracja autoskalowania

## Ostateczne wyzwanie: Kompleksowe wdrożenie

### Scenariusz wyzwania

Twoim zadaniem jest stworzyć produkcyjnego chatbota obsługującego klientów zasilanego AI, z wymaganiami:

**Wymagania funkcjonalne:**
- Interfejs webowy do interakcji z klientem
- Integracja z Microsoft Foundry Models do odpowiedzi
- Możliwość wyszukiwania dokumentów przy użyciu Azure AI Search
- Integracja z istniejącą bazą klientów
- Obsługa wielu języków

**Wymagania niefunkcjonalne:**
- Obsługa 1000 jednoczesnych użytkowników
- SLA dostępności na poziomie 99,9%
- Zgodność z SOC 2
- Koszt poniżej 500 USD/miesiąc
- Wdrożenie w wielu środowiskach (dev, staging, prod)

### Kroki wdrożeniowe

1. Zaprojektuj architekturę  
2. Stwórz szablon AZD  
3. Zaimplementuj środki bezpieczeństwa  
4. Skonfiguruj monitoring i alerty  
5. Utwórz pipeline'y wdrożeniowe  
6. Udokumentuj rozwiązanie  

### Kryteria oceny

- ✅ **Funkcjonalność**: Czy spełnia wszystkie wymagania?  
- ✅ **Bezpieczeństwo**: Czy zastosowano najlepsze praktyki?  
- ✅ **Skalowalność**: Czy poradzi sobie z obciążeniem?  
- ✅ **Utrzymanie**: Czy kod i infrastruktura są dobrze zorganizowane?  
- ✅ **Koszty**: Czy utrzymuje się w budżecie?  

## Dodatkowe zasoby

### Dokumentacja Microsoft
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentacja usługi Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentacja Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Przykładowe szablony
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Zasoby społeczności
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Świetne szablony AZD](https://azure.github.io/awesome-azd/)

## 🎓 Certyfikat ukończenia

Gratulacje! Ukończyłeś laboratorium AI Workshop. Powinieneś teraz umieć:

- ✅ Konwertować istniejące aplikacje AI na szablony AZD
- ✅ Wdrażać gotowe do produkcji aplikacje AI
- ✅ Wdrażać najlepsze praktyki bezpieczeństwa dla obciążeń AI
- ✅ Monitorować i optymalizować wydajność aplikacji AI
- ✅ Rozwiązywać typowe problemy z wdrożeniem

### Kolejne kroki
1. Zastosuj te wzorce w swoich własnych projektach AI
2. Przyczyniaj się do społeczności, udostępniając szablony
3. Dołącz do Microsoft Foundry Discord, aby uzyskać stałe wsparcie
4. Poznaj zaawansowane tematy, takie jak wdrożenia wieloregionalne

---

**Opinie o warsztatach**: Pomóż nam ulepszyć ten warsztat, dzieląc się swoimi doświadczeniami na kanale [Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 2 - Rozwój AI w pierwszej kolejności
- **⬅️ Poprzedni**: [Wdrożenie modelu AI](ai-model-deployment.md)
- **➡️ Następny**: [Najlepsze praktyki produkcyjne AI](production-ai-practices.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

**Potrzebujesz pomocy?** Dołącz do naszej społeczności, aby uzyskać wsparcie i dyskusje na temat wdrożeń AZD i AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->