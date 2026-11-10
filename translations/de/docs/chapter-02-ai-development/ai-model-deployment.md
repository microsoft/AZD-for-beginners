# Bereitstellung von KI-Modellen mit Azure Developer CLI

**Kapitelnavigation:**
- **📚 Kursstartseite**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-First-Entwicklung
- **⬅️ Vorheriges**: [KI-Agenten](agents.md)
- **➡️ Nächstes**: [KI-Workshop-Labor](ai-workshop-lab.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

Dieser Leitfaden liefert umfassende Anleitungen zur Bereitstellung von KI-Modellen mit AZD-Vorlagen, die alles von der Modellauswahl bis zu Produktionsbereitstellungsmustern abdecken.

> **Versionsüberprüfung (2026-11-04):** Zugehörige CLI-Änderungen wurden gegen `azd` `1.37.2` geprüft; Verfügbarkeit von Modellen, Versionen und Kontingent bleiben regions- und abonnementsabhängig. `azd deploy --timeout <seconds>` steuert das Zeitfenster der Service-Bereitstellung, aber keine Garantie für Agentenaktivierung. Siehe [aktuelle Versionshinweise und KI-Migrationshinweise](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Inhaltsverzeichnis

- [Modellauswahlstrategie](#model-selection-strategy)
- [AZD-Konfiguration für KI-Modelle](#azd-configuration-for-ai-models)
- [Bereitstellungsmuster](#deployment-patterns)
- [Modellverwaltung](#model-management)
- [Produktionsüberlegungen](#production-considerations)
- [Überwachung und Beobachtbarkeit](#monitoring-and-observability)

## Modellauswahlstrategie

### Azure OpenAI-Modelle in Microsoft Foundry

Wählen Sie das richtige Modell für Ihren Anwendungsfall:

Deklarieren Sie Modellbereitstellungen in Bicep (siehe unten), nicht in beliebigen `services.*.config.AZURE_OPENAI_MODELS`-Einstellungen. AZD interpretiert solche Einstellungen nicht als Liste von Modellressourcen. Der `project` eines Dienstes zeigt auf den Anwendungscode, nicht sein `infra/`-Verzeichnis.

Die Beispiele verwenden die veröffentlichte `gpt-4.1-mini` Version **`2025-04-14`** und Einbettungsversion **`1`**. Stellen Sie sicher, dass Modellversion und Bereitstellungssku in Ihrer Zielregion/Ihrem Konto unterstützt werden, bevor Sie bereitstellen.

### Modellkapazitätsplanung

| Modelltyp | Anwendungsfall | Illustrativer Token-Bedarf | Kostenüberlegungen |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Q&A | 10.000-50.000 TPM | Benchmark-Kosten und Qualität für Ihre Arbeitslast |
| gpt-4.1 | Komplexe Aufgaben | 20.000-100.000 TPM | Qualitätserhöhungen gegen Token-Kosten abwägen |
| text-embedding-3-large | Suche, RAG | 30.000-120.000 TPM | Berücksichtigen Sie sowohl Ingestion als auch Abfrageverkehr |
| Whisper | Sprache-zu-Text | Planen Sie anhand der Audiodauer und Anfrage-Limits | Wenden Sie keine TPM-Kapazitätsformel für Textmodelle an |

TPM bedeutet Tokens pro Minute. Für diese Standard-Text-Bereitstellungen ist ARM `sku.capacity` in **1.000-TPM-Einheiten**, nicht einzelne TPM (Kapazität `10` bedeutet 10.000 TPM). RPM-zu-TPM-Verhältnisse variieren je nach Modell-/Bereitstellungstyp; prüfen Sie beide Limits anhand der [Kontingentdokumentation](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Diese Bereiche sind Beispiele, keine Größensempfehlungen.

## AZD-Konfiguration für KI-Modelle

### Bicep-Vorlagenkonfiguration

Erstellen Sie Modellbereitstellungen durch Bicep-Vorlagen:

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

Dies ist ein ressourcengruppenbezogenes **Entwicklungsinfrastrukturbeispiel**, keine vollständige AZD-Anwendungsvorlage. Das Konto erlaubt öffentlichen Netzwerkzugriff und erfordert Entra ID/RBAC-Authentifizierung (`Cognitive Services OpenAI User` für Aufrufer). Produktionsumgebungen benötigen die im Kapitel 8 beschriebenen private Endpunkte, DNS und Anwendungs-Konnektivität. AZD benötigt auch eine Hauptvorlage/Parameterzuordnung und Anwendungs-Host-Ressourcen; nutzen Sie ein funktionierendes Beispiel für eine vollständige Bereitstellung.

### Umgebungsvariablen

Konfigurieren Sie Ihre Anwendungsumgebung:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Dies sind anwendungsdefinierte Namen; binden Sie sie in Ihre Hostkonfiguration ein. Der von der Health-Check-Funktion unten verwendete Azure OpenAI v1-Endpunkt benötigt den veralteten `api-version` Abfrageparameter nicht; ältere `AzureOpenAI`-Clients jedoch schon, beachten Sie daher die von Ihrer Anwendung verwendete API-Generation.

## Bereitstellungsmuster

### Muster 1: Einzelregion-Bereitstellung

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

Am besten geeignet für:
- Entwicklung und Tests
- Einmarkt-Anwendungen
- Kostenoptimierung

### Muster 2: Mehrregionen-Bereitstellung

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

Die ausgelassenen Konto-Eigenschaften/SKU müssen ergänzt werden; dieses Fragment ist so nicht bereitstellbar. Stellen Sie Modelle in jedem Konto bereit und implementieren Sie Routing/Failover sowie Datenresidenz-Kontrollen separat.

Am besten geeignet für:
- Globale Anwendungen
- Hohe Verfügbarkeitsanforderungen
- Lastverteilung

### Muster 3: Hybride Bereitstellung

Kombinieren Sie Microsoft Foundry-Modelle mit anderen KI-Diensten:

Die folgenden Fragmente setzen voraus, dass Namen und `location` von der umgebenden Vorlage bereitgestellt werden.

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

## Modellverwaltung

### Versionsverwaltung

Verfolgen Sie Modellversionen in der Konfiguration Ihrer Anwendung oder IaC. Dieses JSON ist ein **anwendungsdefiniertes Beispiel**, kein integriertes AZD-Modellschema; eine Fallback-Lösung muss explizit implementiert und bereitgestellt werden:

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

### Modell-Updates

Verwenden Sie einen AZD-Hook für eine schreibgeschützte Verfügbarkeitsprüfung, aktualisieren Sie dann IaC und provisionieren Sie:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Führen Sie `azd up` **außerhalb** des Hooks aus, um geänderte Modelinfrastruktur und Bereitstellungscode anzuwenden. Rufen Sie niemals `azd deploy` von einem `predeploy` Hook auf: es löst rekursiv denselben Hook aus. `azd deploy --timeout 1800` verlängert ein Anwendungsbereitstellungs-Timeout; es aktualisiert keine Bicep-Ressourcen.

### A/B-Tests

Die untenstehende Beispielressource wählt einen Bereitstellungsnamen und Kapazität; sie erstellt **eine** Bereitstellung, keinen A/B-Test. Für ein echtes Experiment stellen Sie zwei unterschiedliche Bereitstellungsressourcen bereit, leiten Sie kontrolliert einen Anteil der Anfragen zu jedem und vergleichen Qualität, Latenz und Kosten. Es wird `openAi` aus dem Konto-Beispiel angenommen:

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

## Produktionsüberlegungen

### Kapazitätsplanung

Berechnen Sie die erforderliche Kapazität basierend auf Nutzungsmustern:

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

Erwartete Ausgabe: `Required capacity: 9100 TPM`. Mit 1.000 TPM-Kapazitätseinheiten auf mindestens `10` aufrunden, dann modell-spezifische RPM- und Service-Ratenlimit-Schätzung überprüfen (einschließlich gewünschtem Ausgabe-Budget). Diese Token-Bedarfs-Schätzung garantiert keinen Schutz vor Drosselung.

### Auto-Skalierungskonfiguration

Konfigurieren Sie Auto-Skalierung für Container Apps:

**Teilressource:** Fügen Sie die `template.scale` Einstellungen in eine vollständige Container App mit Standort, verwalteter Umgebung, Container-Image, Ressourcen und Ingress ein. Das Skalieren der Replikate erhöht nicht das Modellkontingent.

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

### Kostenoptimierung

Implementieren Sie Kostenkontrollen:

**Illustrative Budgetressource:** Definieren Sie `budgetStartDate` als den ersten Tag des aktuellen Monats in UTC (z. B. `2026-11-01T00:00:00Z` für diese Überprüfung) und ersetzen Sie die Kontaktadresse. Der Start muss den aktuellen Datumsbeschränkungen des Dienstes entsprechen. Budgets warnen bei verzögerten Abrechnungsdaten; sie stoppen keine Ausgaben.

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

## Überwachung und Beobachtbarkeit

### Application Insights-Integration

Konfigurieren Sie die Überwachung für KI-Workloads:

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

Das Ressourcenfragment setzt `applicationInsightsName`, `location` und eine bestehende `logAnalyticsWorkspace` voraus. Es stellt Monitoring bereit, instrumentiert die App jedoch nicht und erstellt keine benutzerdefinierten Metriken.

### Benutzerdefinierte Metriken

Verfolgen Sie KI-spezifische Metriken:

Verwenden Sie die unterstützte [Azure Monitor OpenTelemetry-Distribution](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), nicht das veraltete `applicationinsights` Python SDK. Installieren Sie `azure-monitor-opentelemetry`, konfigurieren Sie `APPLICATIONINSIGHTS_CONNECTION_STRING` und initialisieren Sie einmal beim Start:

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

Dies illustriert Attribut-Emission, nicht die tatsächliche Instrumentierung der Modellaufrufe. Umhüllen Sie echte Anfragen mit einem Span, um die Dauer zu messen; überprüfen Sie `dependencies`/`traces` in Application Insights. Senden Sie keine Eingaben, Antworten, Schlüssel oder rohe Ausnahme-Nachrichten mit sensiblen Daten.

### Health Checks

Implementieren Sie die Überwachung des KI-Service-Status:

Installieren Sie `fastapi`, `uvicorn`, `httpx` und `azure-identity`. Legen Sie die Endpunkt-/Bereitstellungsvariablen oben fest und gewähren Sie dem Aufrufer `Cognitive Services OpenAI User`. Diese **Readiness-Probe** verwendet die Azure OpenAI v1-Datenebene mit Entra ID; sie führt einen abrechenbaren Modellaufruf aus. Starten Sie mit `uvicorn health:app` nach Speichern als `health.py`. Verwenden Sie eine separate leichte Liveness-Prüfung, begrenzen/cachen Sie Readiness-Ergebnisse und geben Sie diese Route nicht ohne Zugriffskontrollen öffentlich frei.

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

Erwartet: `GET /health/ai-models` gibt `200 {"status":"healthy"}` zurück, wenn die konfigurierte Chat-Bereitstellung nutzbar ist, oder `503` ohne upstream-Details preiszugeben. Das Auflisten von Bereitstellungen ist eine Operation der Managementebene und keine gültige Health-Probe der Datenebene.

## Nächste Schritte

1. **Überprüfen Sie den [Microsoft Foundry Integrationsleitfaden](microsoft-foundry-integration.md)** für Service-Integrationsmuster
2. **Schließen Sie das [KI Workshop Labor](ai-workshop-lab.md)** für praktische Erfahrung ab
3. **Implementieren Sie [Produktions-KI-Praktiken](../chapter-08-production/production-ai-practices.md)** für Unternehmenseinsätze
4. **Erkunden Sie den [KI-Fehlerbehebungsleitfaden](../chapter-07-troubleshooting/ai-troubleshooting.md)** für häufige Probleme

## Ressourcen

- [Microsoft Foundry Modelle Modellverfügbarkeit](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Skalierung](https://learn.microsoft.com/azure/container-apps/scale-app)
- [KI-Modell Kostenoptimierung](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Kapitelnavigation:**
- **📚 Kursstartseite**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-First-Entwicklung
- **⬅️ Vorheriges**: [KI-Agenten](agents.md)
- **➡️ Nächstes**: [KI-Workshop-Labor](ai-workshop-lab.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->