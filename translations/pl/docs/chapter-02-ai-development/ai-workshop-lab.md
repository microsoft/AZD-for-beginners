# Laboratorium Warsztatowe AI: Spraw, aby Twoje rozwiązania AI były wdrażalne za pomocą AZD

**Nawigacja po rozdziale:**  
- **📚 Strona kursu głównego**: [AZD dla początkujących](../../README.md)  
- **📖 Aktualny rozdział**: Rozdział 2 - Rozwój zorientowany na AI  
- **⬅️ Poprzedni**: [Wdrażanie modelu AI](ai-model-deployment.md)  
- **➡️ Następny**: [Najlepsze praktyki produkcyjne AI](production-ai-practices.md)  
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)  

## Przegląd warsztatu

To praktyczne laboratorium prowadzi deweloperów przez proces wykorzystania istniejącego szablonu AI i jego wdrożenia za pomocą Azure Developer CLI (AZD). Nauczysz się kluczowych wzorców wdrażania AI do produkcji z użyciem usług Microsoft Foundry.

> **Uwaga dotycząca walidacji (2026-03-25):** Warsztat został przetestowany z `azd` `1.23.12`. Jeśli Twoja lokalna instalacja jest starsza, zaktualizuj AZD przed rozpoczęciem, aby autoryzacja, szablon i proces wdrożenia odpowiadały poniższym krokom.

**Czas trwania:** 2-3 godziny  
**Poziom:** Średniozaawansowany  
**Wymagania wstępne:** Podstawowa znajomość Azure, znajomość koncepcji AI/ML  

## 🎓 Cele nauki

Na koniec tego warsztatu będziesz potrafił:  
- ✅ Konwertować istniejącą aplikację AI, aby korzystała z szablonów AZD  
- ✅ Konfigurować usługi Microsoft Foundry z AZD  
- ✅ Implementować bezpieczne zarządzanie poświadczeniami dla usług AI  
- ✅ Wdrażać aplikacje AI gotowe do produkcji z monitoringiem  
- ✅ Diagnozować typowe problemy z wdrożeniem AI  

## Wymagania wstępne

### Wymagane narzędzia  
- Zainstalowany [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- Zainstalowany [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)  
- Zainstalowany [Git](https://git-scm.com/)  
- Edytor kodu (zalecany VS Code)  

### Zasoby Azure  
- Subskrypcja Azure z uprawnieniami współtwórcy  
- Dostęp do usług Microsoft Foundry Models (lub możliwość ubiegania się o dostęp)  
- Uprawnienia do tworzenia grup zasobów  

### Wiedza wymagana  
- Podstawowa znajomość usług Azure  
- Znajomość interfejsów wiersza poleceń  
- Podstawowe koncepcje AI/ML (API, modele, zapytania)  

## Konfiguracja laboratorium

### Krok 1: Przygotowanie środowiska

1. **Zweryfikuj instalacje narzędzi:**  
```bash
# Sprawdź instalację AZD
azd version

# Sprawdź Azure CLI
az --version

# Zaloguj się do Azure dla przepływów pracy AZD
azd auth login

# Zaloguj się do Azure CLI tylko jeśli planujesz wykonywać polecenia az podczas diagnostyki
az login
```
  
Jeśli pracujesz na wielu tenantach lub subskrypcja nie jest wykrywana automatycznie, ponów próbę z `azd auth login --tenant-id <tenant-id>`.  

2. **Sklonuj repozytorium warsztatu:**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## Moduł 1: Zrozumienie struktury AZD dla aplikacji AI

### Budowa szablonu AZD dla AI

Zapoznaj się z kluczowymi plikami w szablonie AZD gotowym na AI:

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
  
### **Ćwiczenie labowe 1.1: Eksploracja konfiguracji**

1. **Przeanalizuj plik azure.yaml:**  
```bash
cat azure.yaml
```
  
**Na co zwrócić uwagę:**  
- Definicje usług dla komponentów AI  
- Mapowania zmiennych środowiskowych  
- Konfiguracje hostów  

2. **Przejrzyj infrastrukturę w main.bicep:**  
```bash
cat infra/main.bicep
```
  
**Kluczowe wzorce AI do zidentyfikowania:**  
- Provisioning usługi Microsoft Foundry Models  
- Integracja z Cognitive Search  
- Bezpieczne zarządzanie kluczami  
- Konfiguracje bezpieczeństwa sieciowego  

### **Punkt dyskusji:** Dlaczego te wzorce są ważne dla AI

- **Zależności usług:** Aplikacje AI często wymagają wielu skoordynowanych usług  
- **Bezpieczeństwo:** Klucze API i punkty końcowe muszą być zarządzane bezpiecznie  
- **Skalowalność:** Obciążenia AI mają unikalne wymagania skalowania  
- **Zarządzanie kosztami:** Usługi AI mogą być kosztowne bez właściwej konfiguracji  

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

# Opcjonalnie: ustaw konkretny model OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```
  
### Krok 2.2: Wdrożenie infrastruktury i aplikacji

1. **Wdróż za pomocą AZD:**  
```bash
azd up
```
  
**Co dzieje się podczas `azd up`:**  
- ✅ Provisionuje usługę Microsoft Foundry Models  
- ✅ Tworzy usługę Cognitive Search  
- ✅ Konfiguruje App Service dla aplikacji webowej  
- ✅ Ustawia konfiguracje sieci i zabezpieczeń  
- ✅ Wdraża kod aplikacji  
- ✅ Ustawia monitoring i logowanie  

2. **Monitoruj postęp wdrożenia** i zanotuj powstające zasoby.

### Krok 2.3: Zweryfikuj swoje wdrożenie

1. **Sprawdź wdrożone zasoby:**  
```bash
azd show
```
  
2. **Otwórz wdrożoną aplikację:**  
```bash
azd show
```
  
Otwórz punkt końcowy pokazany w wyniku `azd show`.

3. **Przetestuj funkcjonalność AI:**  
   - Przejdź do aplikacji webowej  
   - Wypróbuj przykładowe zapytania  
   - Zweryfikuj działanie odpowiedzi AI  

### **Ćwiczenie labowe 2.1: Praktyka rozwiązywania problemów**

**Scenariusz:** Wdrożenie zakończyło się sukcesem, ale AI nie odpowiada.

**Typowe problemy do sprawdzenia:**  
1. **Klucze API OpenAI:** Zweryfikuj, czy są poprawnie ustawione  
2. **Dostępność modelu:** Sprawdź, czy Twój region obsługuje model  
3. **Łączność sieciowa:** Upewnij się, że usługi mogą się komunikować  
4. **Uprawnienia RBAC:** Sprawdź, czy aplikacja ma dostęp do OpenAI  

**Polecenia debugowania:**  
```bash
# Sprawdź zmienne środowiskowe
azd env get-values

# Wyświetl logi wdrożenia
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Sprawdź status wdrożenia OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## Moduł 3: Dostosowanie aplikacji AI do Twoich potrzeb

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

**Najlepsza praktyka:** Oddzielna konfiguracja dla środowiska deweloperskiego i produkcyjnego.

1. **Utwórz środowisko produkcyjne:**  
```bash
azd env new myai-production
```
  
2. **Ustaw parametry specyficzne dla produkcji:**  
```bash
# Produkcja zazwyczaj używa wyższych numerów SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Włącz dodatkowe funkcje zabezpieczeń
azd env set ENABLE_PRIVATE_ENDPOINTS true
```
  
### **Ćwiczenie labowe 3.1: Optymalizacja kosztów**

**Wyzwanie:** Skonfiguruj szablon dla ekonomicznego rozwoju.

**Zadania:**  
1. Zidentyfikuj, które SKU można ustawić na darmowe/podstawowe poziomy  
2. Skonfiguruj zmienne środowiskowe dla minimalnych kosztów  
3. Wdróż i porównaj koszty z konfiguracją produkcyjną  

**Wskazówki do rozwiązania:**  
- Używaj poziomu F0 (darmowy) dla Cognitive Services, gdy to możliwe  
- Używaj poziomu Basic dla Search Service w środowisku deweloperskim  
- Rozważ użycie planu Consumption dla Functions  

## Moduł 4: Bezpieczeństwo i najlepsze praktyki produkcyjne

### Krok 4.1: Bezpieczne zarządzanie poświadczeniami

**Aktualne wyzwanie:** Wiele aplikacji AI koduje klucze API lub używa niebezpiecznego przechowywania.

**Rozwiązanie AZD:** Managed Identity + integracja z Key Vault.

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
# Application Insights powinien być skonfigurowany automatycznie
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
  
### **Ćwiczenie labowe 4.1: Audyt bezpieczeństwa**

**Zadanie:** Przejrzyj swoje wdrożenie pod kątem najlepszych praktyk bezpieczeństwa.

**Lista kontrolna:**  
- [ ] Brak zakodowanych sekretów w kodzie lub konfiguracji  
- [ ] Użycie Managed Identity do uwierzytelniania między usługami  
- [ ] Key Vault przechowuje wrażliwe konfiguracje  
- [ ] Dostęp sieciowy jest odpowiednio ograniczony  
- [ ] Włączony monitoring i logowanie  

## Moduł 5: Konwersja własnej aplikacji AI

### Krok 5.1: Arkusz oceny

**Przed konwersją aplikacji**, odpowiedz na te pytania:

1. **Architektura aplikacji:**  
   - Jakie usługi AI są używane przez Twoją aplikację?  
   - Jakie zasoby obliczeniowe są potrzebne?  
   - Czy wymaga bazy danych?  
   - Jakie są zależności między usługami?  

2. **Wymagania bezpieczeństwa:**  
   - Jakie dane wrażliwe przetwarza aplikacja?  
   - Czy istnieją wymagania zgodności?  
   - Czy potrzebna jest prywatna sieć?  

3. **Wymagania skalowania:**  
   - Jakie jest oczekiwane obciążenie?  
   - Czy potrzebne jest autoskalowanie?  
   - Czy są wymagania regionalne?  

### Krok 5.2: Stwórz swój szablon AZD

**Postępuj według tego wzorca, aby przekonwertować aplikację:**

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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```
  
### **Ćwiczenie labowe 5.1: Wyzwanie tworzenia szablonu**

**Wyzwanie:** Stwórz szablon AZD dla aplikacji AI do przetwarzania dokumentów.

**Wymagania:**  
- Microsoft Foundry Models do analizy treści  
- Document Intelligence do OCR  
- Konto Storage dla przesyłania dokumentów  
- Function App dla logiki przetwarzania  
- Aplikacja webowa jako interfejs użytkownika  

**Dodatkowe punkty:**  
- Dodaj właściwą obsługę błędów  
- Uwzględnij szacowanie kosztów  
- Skonfiguruj dashboardy monitoringu  

## Moduł 6: Rozwiązywanie popularnych problemów

### Typowe problemy z wdrożeniem

#### Problem 1: Przekroczono limit usługi OpenAI  
**Objawy:** Wdrożenie kończy się błędem limitu  
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
1. Sprawdź metryki wydajności w Application Insights  
2. Przejrzyj metryki usługi OpenAI w portalu Azure  
3. Zweryfikuj łączność i opóźnienia sieci  

**Rozwiązania:**  
- Wdroż caching dla często powtarzanych zapytań  
- Użyj odpowiedniego modelu OpenAI do swojego przypadku  
- Rozważ repliki do odczytu przy dużym obciążeniu  

### **Ćwiczenie labowe 6.1: Wyzwanie debugowania**

**Scenariusz:** Wdrożenie zakończone sukcesem, ale aplikacja zwraca błędy 500.

**Zadania debugowania:**  
1. Sprawdź logi aplikacji  
2. Zweryfikuj łączność serwisów  
3. Przetestuj uwierzytelnianie  
4. Przejrzyj konfigurację  

**Narzędzia do użycia:**  
- `azd show` do podsumowania wdrożenia  
- Portal Azure do szczegółowych logów usług  
- Application Insights do telemetrii aplikacji  

## Moduł 7: Monitoring i optymalizacja

### Krok 7.1: Skonfiguruj kompleksowy monitoring

1. **Stwórz niestandardowe dashboardy:**  

Przejdź do portalu Azure i utwórz dashboard z:  
- Liczbą i opóźnieniami zapytań OpenAI  
- Wskaźnikami błędów aplikacji  
- Wykorzystaniem zasobów  
- Śledzeniem kosztów  

2. **Ustaw alerty:**  
```bash
# Alarm o wysokim wskaźniku błędów
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
# Użyj Azure CLI, aby uzyskać dane kosztów
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **Wdrażaj kontrolę kosztów:**  
- Ustaw alerty budżetowe  
- Zastosuj polityki autoskalowania  
- Implementuj caching zapytań  
- Monitoruj zużycie tokenów OpenAI  

### **Ćwiczenie labowe 7.1: Optymalizacja wydajności**

**Zadanie:** Zoptymalizuj swoją aplikację AI pod kątem wydajności i kosztów.

**Metryki do poprawy:**  
- Skrócenie średniego czasu odpowiedzi o 20%  
- Obniżenie miesięcznych kosztów o 15%  
- Utrzymanie dostępności na poziomie 99.9%  

**Strategie do wypróbowania:**  
- Wdroż caching odpowiedzi  
- Optymalizuj zapytania pod kątem efektywności tokenów  
- Używaj odpowiednich SKU obliczeniowych  
- Skonfiguruj odpowiednie autoskalowanie  

## Ostateczne wyzwanie: Implementacja end-to-end

### Scenariusz wyzwania

Masz za zadanie stworzyć produkcyjnego chatbota obsługującego klientów napędzanego AI z następującymi wymaganiami:

**Wymagania funkcjonalne:**  
- Interfejs webowy do interakcji z klientami  
- Integracja z Microsoft Foundry Models do generowania odpowiedzi  
- Wyszukiwanie dokumentów za pomocą Cognitive Search  
- Integracja z istniejącą bazą klientów  
- Wsparcie wielojęzyczne  

**Wymagania niefunkcjonalne:**  
- Obsługa 1000 użytkowników jednocześnie  
- SLA 99.9% czasu działania  
- Zgodność z SOC 2  
- Koszt poniżej 500 USD/miesiąc  
- Wdrożenie na wiele środowisk (dev, staging, prod)  

### Kroki implementacji

1. **Zaprojektuj architekturę**  
2. **Stwórz szablon AZD**  
3. **Wdróż środki bezpieczeństwa**  
4. **Skonfiguruj monitoring i alerty**  
5. **Stwórz potoki wdrożeniowe**  
6. **Udokumentuj rozwiązanie**  

### Kryteria oceny

- ✅ **Funkcjonalność:** Czy spełnia wszystkie wymagania?  
- ✅ **Bezpieczeństwo:** Czy wdrożono najlepsze praktyki?  
- ✅ **Skalowalność:** Czy potrafi obsługiwać obciążenie?  
- ✅ **Utrzymywalność:** Czy kod i infrastruktura są dobrze zorganizowane?  
- ✅ **Koszt:** Czy mieści się w budżecie?  

## Dodatkowe zasoby

### Dokumentacja Microsoft  
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Dokumentacja usługi Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)  
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

Gratulacje! Ukończyłeś laboratorium warsztatów AI. Teraz powinieneś być w stanie:

- ✅ Konwertować istniejące aplikacje AI na szablony AZD
- ✅ Wdrażać gotowe do produkcji aplikacje AI
- ✅ Wdrażać najlepsze praktyki bezpieczeństwa dla obciążeń AI
- ✅ Monitorować i optymalizować wydajność aplikacji AI
- ✅ Rozwiązywać typowe problemy z wdrożeniem

### Kolejne kroki
1. Zastosuj te wzorce w swoich własnych projektach AI
2. Wnieś szablony z powrotem do społeczności
3. Dołącz do Microsoft Foundry Discord, aby uzyskać ciągłe wsparcie
4. Poznaj zaawansowane tematy, takie jak wdrożenia wieloregionowe

---

**Opinie o warsztatach**: Pomóż nam ulepszyć ten warsztat, dzieląc się swoimi doświadczeniami na kanale [Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 2 - AI-First Development
- **⬅️ Poprzedni**: [Wdrażanie modelu AI](ai-model-deployment.md)
- **➡️ Następny**: [Najlepsze praktyki produkcyjnego AI](production-ai-practices.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

**Potrzebujesz pomocy?** Dołącz do naszej społeczności, aby uzyskać wsparcie i dyskusje na temat AZD i wdrożeń AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Dokument ten został przetłumaczony przy użyciu automatycznego serwisu tłumaczeniowego AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dążymy do dokładności, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być uznawany za źródło autorytatywne. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->