# Wdrażanie modeli AI za pomocą Azure Developer CLI

**Nawigacja po rozdziale:**
- **📚 Strona kursu głównego**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 2 - AI-First Development
- **⬅️ Poprzedni**: [Agenci AI](agents.md)
- **➡️ Następny**: [Laboratorium AI Workshop](ai-workshop-lab.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

Ten przewodnik zawiera kompleksowe instrukcje dotyczące wdrażania modeli AI za pomocą szablonów AZD, obejmujące wszystko od wyboru modelu po wzorce wdrożenia produkcyjnego.

> **Przegląd wydania (2026-11-04):** Powiązane zmiany w CLI zostały sprawdzone względem `azd` `1.37.2`; dostępność modeli, wersje i limity zależą od regionu i subskrypcji. `azd deploy --timeout <seconds>` kontroluje okno wdrożenia usługi, nie gwarantuje aktywacji agenta. Zobacz [aktualne notatki wydania i wskazówki migracyjne AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Spis treści

- [Strategia wyboru modelu](#model-selection-strategy)
- [Konfiguracja AZD dla modeli AI](#azd-configuration-for-ai-models)
- [Wzorce wdrożeń](#deployment-patterns)
- [Zarządzanie modelem](#model-management)
- [Rozważania produkcyjne](#production-considerations)
- [Monitorowanie i obserwowalność](#monitoring-and-observability)

## Strategia wyboru modelu

### Modele Azure OpenAI w Microsoft Foundry

Wybierz odpowiedni model dla swojego przypadku użycia:

Deklaruj wdrożenia modeli w Bicep (poniżej), a nie w dowolnych ustawieniach `services.*.config.AZURE_OPENAI_MODELS`. AZD nie interpretuje takiego ustawienia jako listy zasobów modeli. `project` usługi wskazuje na źródło aplikacji, a nie jej katalog `infra/`.

Przykłady używają opublikowanej wersji `gpt-4.1-mini` **`2025-04-14`** oraz wersji embeddingu **`1`**. Upewnij się, że wersja modelu i SKU wdrożenia są obsługiwane w Twoim regionie/konta docelowego przed provisioningiem.

### Planowanie pojemności modelu

| Typ modelu | Przypadek użycia | Przykładowe zapotrzebowanie na tokeny | Rozważania kosztowe |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Q&A | 10,000-50,000 TPM | Benchmark koszt i jakość dla twojego obciążenia |
| gpt-4.1 | Złożone zadania | 20,000-100,000 TPM | Oceń wzrost jakości względem kosztu tokenów |
| text-embedding-3-large | Wyszukiwanie, RAG | 30,000-120,000 TPM | Uwzględnij ruch oraz przyjmowanie danych |
| Whisper | Mowa na tekst | Planuj używając długości audio i limitów zapytań | Nie stosuj formuły TPM dla modeli tekstowych |

TPM oznacza tokeny na minutę. Dla tych standardowych wdrożeń tekstowych, ARM `sku.capacity` jest w **jednostkach 1,000-TPM**, a nie pojedynczych TPM (pojemność `10` oznacza 10,000 TPM). Współczynniki RPM do TPM różnią się w zależności od typu modelu/wdrożenia; zweryfikuj oba limity wobec [dokumentacji limitów](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Te zakresy są przykładami, a nie zaleceniami rozmiarów.

## Konfiguracja AZD dla modeli AI

### Konfiguracja szablonu Bicep

Twórz wdrożenia modeli za pomocą szablonów Bicep:

```bicep
// infra/main.bicep
param openAiAccountName string
param location string = resourceGroup().location

@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
    sku: {
      name: 'Standard'
      capacity: 10
    }
  }
  {
    name: 'text-embedding-3-large'
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
    sku: {
      name: 'Standard'
      capacity: 30
    }
  }
]

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAiAccountName
  location: location
  kind: 'OpenAI'
  properties: {
    customSubDomainName: openAiAccountName
    disableLocalAuth: true
    networkAcls: {
      defaultAction: 'Allow'
    }
    publicNetworkAccess: 'Enabled'
  }
  sku: {
    name: 'S0'
  }
}

@batchSize(1)
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = [for deployment in openAiModelDeployments: {
  parent: openAi
  name: deployment.name
  properties: {
    model: deployment.model
  }
  sku: deployment.sku
}]
```

To jest przykład infrastruktury programistycznej **ograniczonej do grupy zasobów**, nie kompletny szablon aplikacji AZD. Konto umożliwia dostęp przez sieć publiczną i wymaga uwierzytelnienia Entra ID/RBAC (`Cognitive Services OpenAI User` dla wywołujących). Produkcja wymaga prywatnego punktu końcowego, DNS oraz łączności aplikacji opisanej w Rozdziale 8. AZD potrzebuje też głównego szablonu/mapowania parametrów i zasobów hosta aplikacji; użyj działającego przykładu dla pełnego wdrożenia.

### Zmienne środowiskowe

Skonfiguruj środowisko aplikacji:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Są to nazwy definiowane przez aplikację; podłącz je do konfiguracji hosta. Punkt końcowy Azure OpenAI v1 używany przez poniższy stan zdrowia nie wymaga przestarzałego parametru zapytania `api-version`; starsi klienci `AzureOpenAI` tak, więc stosuj generowanie API używane przez twoją aplikację.

## Wzorce wdrożeń

### Wzorzec 1: Wdrożenie w pojedynczym regionie

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

Najlepsze dla:
- Rozwoju i testów
- Aplikacji dla pojedynczego rynku
- Optymalizacji kosztów

### Wzorzec 2: Wdrożenie wieloregionalne

```bicep
// Illustrative fragment: extend the complete account declaration above.
// Each region must support the selected model/SKU and have quota.
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Pominięte właściwości konta/SKU muszą być dostarczone; fragment nie jest gotowy do wdrożenia w obecnej formie. Wdroż modele w każdym koncie oraz zaimplementuj routing/przełączanie awaryjne i kontrolę lokalizacji danych oddzielnie.

Najlepsze dla:
- Aplikacji globalnych
- Wysokiej dostępności
- Rozkładu obciążenia

### Wzorzec 3: Wdrożenie hybrydowe

Połącz modele Microsoft Foundry z innymi usługami AI:

Następujące fragmenty zakładają, że nazwy i `location` są dostarczone przez otaczający szablon.

```bicep
// Hybrid AI services
resource cognitiveServices 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: cognitiveServicesName
  location: location
  kind: 'CognitiveServices'
  properties: {
    customSubDomainName: cognitiveServicesName
  }
  sku: {
    name: 'S0'
  }
}

resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  properties: {
    customSubDomainName: documentIntelligenceName
  }
  sku: {
    name: 'S0'
  }
}
```

## Zarządzanie modelem

### Kontrola wersji

Śledź wersje modelu w konfiguracji aplikacji lub IaC. Ten JSON jest **przykładem definiowanym przez aplikację**, nie wbudowanym schematem modelu AZD; konieczne jest zaimplementowanie i wdrożenie zapasowego mechanizmu:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2025-04-14",
      "fallback": "gpt-4.1"
    },
    "embedding": {
      "name": "text-embedding-3-large",
      "version": "1"
    }
  }
}
```

### Aktualizacje modelu

Użyj hooka AZD do odczytu statusu dostępności, następnie zaktualizuj IaC i zdeplojuj:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Uruchamiaj `azd up` **poza** hookiem, aby zastosować zmiany infrastruktury modelu i wdrożyć kod. Nigdy nie wywołuj `azd deploy` z hooka `predeploy`: wywołuje to rekursywnie ten sam hook. `azd deploy --timeout 1800` przedłuża limit czasu wdrożenia aplikacji; nie aktualizuje zasobów Bicep.

### Testy A/B

Poniższy przykład zasobu wybiera nazwę wdrożenia i pojemność; tworzy **jedno** wdrożenie, nie test A/B. Do rzeczywistego eksperymentu stwórz dwie różne zasoby wdrożeniowe, kieruj kontrolowaną część żądań do każdego i porównuj jakość, opóźnienia oraz koszty. Zakłada `openAi` z przykładu konta:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## Rozważania produkcyjne

### Planowanie pojemności

Oblicz wymaganą pojemność na podstawie wzorców użycia:

```python
# Capacity calculation example
import math
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return math.ceil(total_tpm * (1 + safety_margin))

# Example usage
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

Oczekiwany wynik: `Required capacity: 9100 TPM`. Przy jednostkach pojemności 1,000-TPM zaokrąglaj w górę do co najmniej `10`, następnie zweryfikuj szacunki RPM i limitów usługi specyficzne dla modelu (włączając budżet żądanego wyjścia). Ten szacunek zapotrzebowania na tokeny nie gwarantuje braku ograniczeń.

### Konfiguracja automatycznego skalowania

Skonfiguruj autoskalowanie dla Container Apps:

**Częściowy zasób:** scal ustawienia `template.scale` z pełnym Container App z lokalizacją, środowiskiem zarządzanym, obrazem kontenera, zasobami i ingress. Skalowanie replik nie zwiększa limitu modelu.

```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  name: containerAppName
  properties: {
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-rule'
            http: {
              metadata: {
                concurrentRequests: '10'
              }
            }
          }
          {
            name: 'cpu-rule'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '70'
              }
            }
          }
        ]
      }
    }
  }
}
```

### Optymalizacja kosztów

Wdróż kontrolę kosztów:

**Ilustracyjny zasób budżetu:** ustaw `budgetStartDate` na pierwszy dzień bieżącego miesiąca w UTC (np. `2026-11-01T00:00:00Z` dla tego przeglądu) i zmień adres kontaktowy. Start musi spełniać obecne wymagania dotyczące daty usługi. Budżety alarmują o opóźnieniach w danych rozliczeniowych; nie zatrzymują wydatków.

```bicep
param budgetStartDate string

@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2024-08-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 1000
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@yourcompany.com'
        ]
      }
    }
  }
}
```

## Monitorowanie i obserwowalność

### Integracja z Application Insights

Skonfiguruj monitorowanie obciążeń AI:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

```

Fragment zasobu zakłada `applicationInsightsName`, `location` i istniejący `logAnalyticsWorkspace`. Tworzy monitoring, ale nie instrumentuje aplikacji ani nie tworzy niestandardowych metryk.

### Niestandardowe metryki

Śledź metryki specyficzne dla AI:

Użyj obsługiwanego [dystrybucji Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), a nie przestarzałego `applicationinsights` Python SDK. Zainstaluj `azure-monitor-opentelemetry`, skonfiguruj `APPLICATIONINSIGHTS_CONNECTION_STRING` i zainicjuj raz przy starcie:

```python
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

configure_azure_monitor()
tracer = trace.get_tracer(__name__)

def record_request(model: str, tokens: int, latency_ms: int, success: bool):
    with tracer.start_as_current_span("AI_Model_Request") as span:
        span.set_attribute("ai.model", model)
        span.set_attribute("ai.tokens", tokens)
        span.set_attribute("ai.latency_ms", latency_ms)
        span.set_attribute("ai.success", success)
```

To ilustruje emisję atrybutów, nie rzeczywistą instrumentację wywołań modelu. Otocz faktyczne żądanie spanem, aby zmierzyć czas trwania; przejrzyj `dependencies`/`traces` w Application Insights. Nie wysyłaj promptów, odpowiedzi, kluczy ani surowych komunikatów wyjątku z danymi wrażliwymi.

### Kontrole stanu zdrowia

Wdróż monitorowanie stanu zdrowia usług AI:

Zainstaluj `fastapi`, `uvicorn`, `httpx` i `azure-identity`. Ustaw powyższe zmienne punktu końcowego/wdrożenia i nadaj wywołującemu uprawnienia `Cognitive Services OpenAI User`. Ten **readiness probe** używa Azure OpenAI v1 data plane z Entra ID; wykonuje płatne wywołanie modelu. Uruchom z `uvicorn health:app` po zapisaniu jako `health.py`. Używaj osobnej lekkiej kontroli liveness, ograniczaj częstość/wyniki cache gotowości i nie udostępniaj tego endpointu publicznie bez kontroli dostępu.

```python
# health.py
import os
from fastapi import FastAPI, HTTPException
import httpx
from azure.identity.aio import DefaultAzureCredential

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        async with DefaultAzureCredential() as credential:
            token = await credential.get_token("https://ai.azure.com/.default")
        endpoint = os.environ["AZURE_OPENAI_ENDPOINT"].rstrip("/")
        async with httpx.AsyncClient(timeout=20.0) as client:
            response = await client.post(
                f"{endpoint}/openai/v1/chat/completions",
                headers={"Authorization": f"Bearer {token.token}"},
                json={
                    "model": os.environ["AZURE_OPENAI_CHAT_DEPLOYMENT"],
                    "messages": [{"role": "user", "content": "Reply OK."}],
                    "max_completion_tokens": 8,
                },
            )
        response.raise_for_status()
        return {"status": "healthy"}
    except Exception:
        # Record sanitized internal diagnostics, not service responses/tokens.
        raise HTTPException(status_code=503, detail="AI readiness check failed") from None
```

Oczekiwane: `GET /health/ai-models` zwraca `200 {"status":"healthy"}` gdy skonfigurowane wdrożenie chatu jest używalne, lub `503` bez ujawniania szczegółów wewnętrznych. Lista wdrożeń to operacja w płaszczyźnie zarządzania i nie jest ważną sondą zdrowia płaszczyzny danych.

## Kolejne kroki

1. **Przejrzyj [Przewodnik integracji Microsoft Foundry](microsoft-foundry-integration.md)** dotyczący wzorców integracji usług
2. **Ukończ [Laboratorium AI Workshop](ai-workshop-lab.md)**, aby zdobyć praktyczne doświadczenie
3. **Wdróż [praktyki produkcyjne AI](../chapter-08-production/production-ai-practices.md)** dla wdrożeń korporacyjnych
4. **Poznaj [Przewodnik rozwiązywania problemów AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** dotyczący typowych problemów

## Zasoby

- [Dostępność modeli Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Skalowanie Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Optymalizacja kosztów modelu AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Nawigacja po rozdziale:**
- **📚 Strona kursu głównego**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 2 - AI-First Development
- **⬅️ Poprzedni**: [Agenci AI](agents.md)
- **➡️ Następny**: [Laboratorium AI Workshop](ai-workshop-lab.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->