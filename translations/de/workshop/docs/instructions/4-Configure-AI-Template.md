# 4. Eine Vorlage konfigurieren

!!! tip "AM ENDE DIESES MODULS WERDEN SIE IN DER LAGE SEIN"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Beginnen Sie mit der tatsächlichen Vorlage

Öffnen Sie die [`azure.yaml` in Erste Schritte mit KI-Agenten](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) im Repository, das Sie initialisiert haben. Die Upstream-Vorlage kann sich unabhängig von diesem Workshop ändern. Der folgende **Auszug** wurde am 4. November 2026 geprüft; er ersetzt nicht die komplette Datei:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` identifiziert das AZD-Projekt; `metadata.template` protokolliert die Vorlagen-Version.
- `requiredVersions.azd` ist das Minimum der Vorlage, keine Empfehlung, eine alte CLI-Version zu verwenden. Nutzen Sie eine aktuelle unterstützte AZD-Version.
- `services` definiert die Bereitstellungsziele der Anwendung. Diese Vorlage stellt ihre Python-API und Frontend als einen Container Apps-Dienst bereit.
- `project` ist relativ zu `azure.yaml`.
- `remoteBuild` fordert einen Remote-Container-Build an. Ihre Identität benötigt weiterhin die erforderlichen Azure-Berechtigungen.

Die Bicep-Dateien der Vorlage unter `infra/`, nicht nur die `services`-Liste, deklarieren Ressourcen wie Microsoft Foundry, Modellbereitstellungen, Speicher und optional AI Search.

## 2. Verstehen Sie Lifecycle-Hooks

Untersuchen Sie den `hooks` Abschnitt und seine referenzierten Skripte, bevor Sie die Vorlage ausführen. Die geprüfte Version enthält:

| Hook | Zweck | Wichtiges Verhalten |
|------|---------|--------------------|
| `preup` | Validiert die Umgebungsvariablen der Vorlage vor dem `up` Arbeitsablauf | Plattform-spezifische Shell-Skripte können den Arbeitsablauf bei Fehler abbrechen |
| `postdeploy` | Führen Sie vorlagenspezifische Einrichtung nach der Anwendungsbereitstellung aus | Untersuchen Sie `continueOnError` und die Skriptausgabe; eine erfolgreiche Bereitstellung beweist nicht, dass alle Einrichtungsschritte erfolgreich waren |

Diese Version enthält **nicht** den älteren `postprovision` / `write_env` Hook, der in früherem Workshop-Material gezeigt wurde. Kopieren Sie keine Hook-Verweise auf Skripte, die nicht mehr existieren.

Hook-Schlüssel wählen Lifecycle-Ereignisse aus; `posix` und `windows` wählen Plattformimplementierungen. `shell`, `run`, `interactive`, und `continueOnError` steuern die Ausführung. Dies sind ausführbare Skripte mit Ihren Berechtigungen, prüfen Sie sie also genauso sorgfältig wie Anwendungs-Code.

Siehe die [AZD hooks-Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) für den kompletten Lifecycle.

## 3. Verfolgen Sie Umgebungsvariablen in die Infrastruktur

Führen Sie diese Befehle aus dem initialisierten Beispiel-Repository aus:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Untersuchen Sie `infra/main.parameters.json`, um zu sehen, welche Umgebungsvariablen die Vorlage tatsächlich nutzt. Das Setzen eines beliebigen Namens mit `azd env set` ändert nicht automatisch eine Azure-Ressource.

Geprüfte Standardwerte umfassen:

| Eingabe | Standard / Zweck |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; Quoten-Einheiten hängen vom Modell und Bereitstellungstyp ab |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; deaktiviert lassen, solange Datenverarbeitung nicht überprüft wurde |

Dies sind beispielspezifische Eingaben, keine globalen AZD-Einstellungen. Prüfen Sie die [Modell- und Regionsunterstützung](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) und das Kontingent Ihres Abonnements, bevor Sie ein Modell, SKU, Kapazität oder Standort auswählen. Interpretieren Sie nicht jede Kapazitätseinheit als 1000 Token pro Minute.

Um ein anderes Chatmodell auszuwählen, aktualisieren Sie dessen kompatible **Name, Version, Format, SKU und Kapazität zusammen**, folgen Sie dem [Anleitung zur Anpassung des Beispiels](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Nur den Namen zu ändern, kann eine inkompatible Version oder Bereitstellungsart zurücklassen.

## 4. Labor: optionale Suche und Nachverfolgung aktivieren

!!! warning "Diese Einstellungen können kostenpflichtige Ressourcen hinzufügen"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

Infrastrukturänderungen benötigen eine Provisionierung; `azd deploy` allein stellt nur Anwendungsdienste bereit. Für Indexierung und unterstützte Abrufoptionen folgen Sie dem [AI Search Leitfaden](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Für Monitoring folgen Sie dem [Beobachtbarkeits-Leitfaden](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Aktivieren Sie kein Erfassen von Eingabe-/Antwortinhalten bei echten Kundendaten ohne erforderliche Zustimmung, Zugriffskontrollen, Aufbewahrungsrichtlinien und Schwärzung.

## 5. Bestehende Ressourcen und CI/CD

Um ein Foundry-Projekt wiederzuverwenden, befolgen Sie die [Anweisungen für vorhandene Ressourcen](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) des Beispiels. Das Setzen von `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` ändert den Bereitstellungspfad; in diesem Fall erstellt die Vorlage keine Application Insights oder AI Search für Sie. Überprüfen Sie explizit Abhängigkeiten, Rollenzuweisungen und Modellbereitstellungen.

Der `pipeline.variables` Abschnitt steuert Werte, die an eine generierte Pipeline übergeben werden; er ist kein Geheimnisspeicher und erstellt keine Azure-Ressourcen. Bevorzugen Sie Managed Identity in der App und OIDC für CI/CD. AZD-Umgebungsdateien sind Klartext und sollten nicht eingecheckt werden.

AZD unterstützt das Importieren einer vertrauenswürdigen, lokal vorbereiteten dotenv-Datei:

```bash
azd env set --file .env
```

Überprüfen Sie diese Datei vor dem Import und geben Sie Umgebungsdateien mit Geheimnissen nicht in gemeinsam genutzten Terminals oder CI-Protokollen aus.

## 6. Überprüfen Sie Ihr Verständnis

- Welcher `azure.yaml` Dienst stellt die Anwendung bereit?
- Welcher Infrastrukturparameter nutzt jeden Wert, den Sie geändert haben?
- Welche Änderungen erfordern eine Provisionierung und nicht nur eine Bereitstellung?
- Unterstützten die ausgewählte Region und das Abonnement das Modell und Kontingent?
- Haben alle Setup-Hooks erfolgreich funktioniert und können Sie das Verhalten der bereitgestellten Anwendung überprüfen?

Fahren Sie fort mit [Anpassen einer Vorlage](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->