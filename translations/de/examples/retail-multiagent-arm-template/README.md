# Einzelhandels-Multi-Agent Infrastruktur-Gerüst

**Fortgeschrittenes Architekturbeispiel – keine funktionierende Multi-Agent Anwendung.**

[Kursstartseite](../../README.md) ·
[Kapitel 5](../../docs/chapter-05-multi-agent/README.md) ·
[Architektur-Blueprint](../retail-scenario.md)

## Was hier bereitgestellt wird

Dieses Verzeichnis enthält eine ARM-Vorlage, Parameter und ein Bash-Bereitstellungsskript.
Es gibt **keinen `azure.yaml` oder Quellcode der Einzelhandelsanwendung**.

| Ressource | Tatsächlicher Zustand nach Bereitstellung |
|---|---|
| Primäres Azure OpenAI Konto | `gpt-4.1-chat` Bereitstellung mit `gpt-4.1` Version `2025-04-14`, `GlobalStandard` |
| Sekundäres OpenAI Konto (optional) | `gpt-4.1-mini-inventory`, Modell `gpt-4.1-mini` Version `2025-04-14`, `GlobalStandard` |
| Embeddings-Konto (optional) | `text-embedding-ada-002` Version `2`, `Standard`; keine Indexierungspipeline |
| Grader OpenAI Konto | `gpt-4.1-grader`, Modell `gpt-4.1` Version `2025-04-14`, `GlobalStandard`; kein Evaluator |
| KI-Suche | Leerer Dienst; kein Index oder Dokumente |
| Speicher | Leere `documents` und `uploads` Blob-Container |
| Cosmos DB | Serverloses Konto, `chathistory` Datenbank, `conversations` Container partitioniert nach `/userId`, 30-Tage-Item-TTL |
| Container Apps | Router und Frontend laufen beide mit `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` auf Port 80 |
| Key Vault (optional) | Leerer RBAC-aktivierter Tresor; **keine Geheimnisse oder Rollenzuweisungen** |
| Application Insights / Log Analytics (optional) | Ressourcen- und Umgebungsprotokollsammlung; keine benutzerdefinierte App-Instrumentierung, Warnungen oder Dashboards |
| Document Intelligence | S0-Konto; kein Dokumentverarbeitungs-Workflow |

Legacy Bing Search v7 wurde am 11. August 2025 eingestellt und wird **nicht bereitgestellt**.
Es wurde keine Ersatz-Integration zur Web-Verankerung implementiert.

**Nicht enthalten:** Kunden-/Inventaragenten, Router-`/chat` API, Frontend-Chat-Oberfläche,
Suchschema oder Ingestionsskripte, Azure Container Registry, private Endpunkte,
verwaltete Identities, RBAC-Zuweisungen, automatische Failover, Front Door, Red-Team
Scanner, Evaluierungs-CLI, Authentifizierung oder CI/CD.

Eine ARM-Erfolgsmeldung bestätigt nur die Ressourcenbereitstellung. Sie garantiert nicht
Anwendungsfunktionalität, Sicherheit, Verfügbarkeit oder Produktionsreife.

## Voraussetzungen und Kosten

- Bash (Git Bash/WSL unter Windows) und
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Ein Abonnement mit Berechtigungen zum Erstellen aller aufgeführten Ressourcen.
- Überprüfen Sie die Verfügbarkeit von **jedem Modell/Version/SKU in jeder ausgewählten Region** und
  das Kontingent für Ihr Abonnement. Die Standardwerte sind Beispiele, keine Garantien.
  Konsultieren Sie [Modellverfügbarkeit](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Wählen Sie eine dedizierte Ressourcengruppe, die Sie nach dem Testen löschen können.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Standard-Standorte: primär `eastus2`, sekundär `westus2`, Embeddings `francecentral`;
der Grader verwendet standardmäßig die primäre Region, es sei denn `graderLocation` wird angegeben.
`--no-multi-region` überspringt sekundäre und Embeddings-Konten; der
Grader-Konto wird nicht übersprungen.

Die Suche wird während der Bereitstellung berechnet, auch wenn sie leer ist. Mindestanzahl der Container-Replikate,
Speicherredundanz, Cosmos DB Anfragen/Speicher, Modell-Token, Document Intelligence
Aufrufe und Protokolleinspeicherung/-speicher können Kosten verursachen. Es gibt **keinen festen oder validierten
monatlichen Gesamtbetrag**. Schätzen Sie die genauen SKUs im
[Azure Preisrechner](https://azure.microsoft.com/pricing/calculator/) und
legen Sie vor der Bereitstellung ein Budget fest.

### Bereitstellungsmodi

Diese Einstellungen sind Ressourcengrößen, **keine Produktions- oder SLA-Zertifizierungen**:

| Modus | Chat / mini / Embedding / Grader Kapazitätseinheiten | Router-Replikate | Frontend-Replikate | Suchstufe | Speicher |
|---|---|---|---|---|---|
| minimal | 10 / 10 / 20 / 5 | 0–3 | 1–2 | basic, 1 Replikat | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 Replikat | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 Replikate | Standard_GRS |

Modelkapazitätseinheiten sind modell-/SKU-spezifisch; summieren Sie sie nicht als universelle TPM
Garantie. Premium aktiviert keine zonenredundanten Container Apps: dazu ist
ein zusätzliches Netzwerkdesign erforderlich. Basic Search unterstützt Vektorsuche, unterliegt aber
Dienstlimits; es ist nicht grundsätzlich unvereinbar mit Vektoren.

## 🚀 Schnelle Bereitstellung

Lesen Sie zuerst `azuredeploy.json` und `azuredeploy.parameters.json`. Die untenstehenden Befehle
erstellen **abrechenbare Azure-Ressourcen**; es sind keine Offline-Checks.

Aus dem Repository-Stammverzeichnis:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Das Skript verwendet Pfade relativ zu seinem eigenen Verzeichnis, überprüft Anmeldung/Werkzeuge/Argumente,
erstellt die Ressourcengruppe bei Abwesenheit, validiert die Bereitstellung, stellt bereit und
zeigt nicht-geheime Ausgaben an. Es ist keine `jq`, Datenbefüllung, Geheimnisbeschaffung oder
Anwendungseinrichtung nach der Bereitstellung erforderlich oder erfolgt.

Die Standardbefehlszeilenwerte des Skripts überschreiben entsprechende Werte in der
Parameterdatei. Bearbeiten Sie die Parameterdatei für Einstellungen wie sekundäre/tertiäre
Regionen; verwenden Sie direkte CLI-Bereitstellung, wenn Sie beliebige Parameterüberschreibungen benötigen:

```bash
az group create --name retail-learning-rg --location eastus2
az deployment group create \
  --resource-group retail-learning-rg \
  --name retail-learning \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --parameters projectName=retail environmentName=dev \
    deploymentMode=minimal enableMultiRegion=false
```

Die Bereitstellung kann 15–45 Minuten oder länger dauern und aufgrund regionaler Kontingente oder
Modellspezifischer Lebenszyklusbeschränkungen fehlschlagen. Versuchen Sie nicht blind neu: lesen Sie zuerst die fehlgeschlagene Operation.

## Konfigurationsoptionen

| Parameter | Standard in Vorlage | Bedeutung |
|---|---|---|
| `projectName` | Erforderlich (`retail` in Parameterdatei) | 3–10 Kleinbuchstaben/Ziffern |
| `location` | Standort der Ressourcengruppe | Primäre Region (`eastus2` in Parameterdatei) |
| `secondaryLocation` | `westus2` | Mini-Modell-Kontoregion |
| `tertiaryLocation` | `francecentral` | Embeddings-Kontoregion |
| `graderLocation` | Primäre Region | Unabhängige Grader-Kontoregion |
| `environmentName` | `dev` | `dev`, `staging` oder `prod`; nur Name, kein Härtungsschalter |
| `deploymentMode` | `standard` | SKU/Kapazitätsauswahl |
| `enableMultiRegion` | `true` | Sekundäre und Embeddings-Konten hinzufügen |
| `enableMonitoring` | `true` | Insights/Workspace und Umgebungsprotokollsammlung hinzufügen |
| `enableSecurity` | `true` | Nur einen leeren RBAC-aktivierten Tresor erstellen |

Der irreführende `openAiApiVersion` Parameter wurde entfernt: eine Daten-Ebene API-Version
steuert nicht ARM-Ressourcen-Versionen oder Modellversionen. Modellname/-versionspaare
sind in `variables.modelDeployments`; prüfen Sie diese zusammen mit der Bereitstellungs-SKU.

## Bereitstellung überprüfen

Verwenden Sie den Bereitstellungsnamen aus der Skriptausgabe oder `az deployment group list`.
Für die direkte Bereitstellung oben:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Erwartet: Bereitstellungsstatus `Succeeded`. Bei einem Fehler prüfen Sie die Fehlermeldung der Operation.
Die Ausgabe der Ressourcenliste allein ist keine verlässliche Überprüfung des Bereitstellungsstatus.

Testen Sie den Platzhalter **root**, nicht einen nicht vorhandenen Agent-Endpunkt:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Erwartet: HTTP 200 Hello-World-Seite, **keine Chat-Antwort**. Ein HTTP-Fehler zählt
nicht als erfolgreiche Verifizierung.

Um die tatsächliche Primärmodell-Analyse zu testen (abrechenbar):

```bash
OPENAI_ENDPOINT=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.openAiEndpointPrimary.value -o tsv)
OPENAI_NAME=$(az cognitiveservices account list -g "$RG" \
  --query "[?kind=='OpenAI' && contains(name, '-openai-primary-')].name | [0]" -o tsv)
OPENAI_KEY=$(az cognitiveservices account keys list -g "$RG" -n "$OPENAI_NAME" \
  --query key1 -o tsv)
curl --fail-with-body \
  "${OPENAI_ENDPOINT%/}/openai/deployments/gpt-4.1-chat/chat/completions?api-version=2024-10-21" \
  -H "Content-Type: application/json" -H "api-key: $OPENAI_KEY" \
  -d '{"messages":[{"role":"user","content":"Say hello"}],"max_tokens":20}'
unset OPENAI_KEY
```

Erwartet: JSON mit `choices` und `usage`. Der Bereitstellungsname ist
`gpt-4.1-chat`, nicht der zugrunde liegende Modellname `gpt-4.1`.

## 🔧 Nach der Bereitstellung: Nächste Schritte

Dies ist ein **Entwicklungs-Backlog**, keine fertige Übung:

1. Implementieren Sie authentifizierte Kunden-/Inventaragenten und den Router-Vertrag.
2. Implementieren Sie das Frontend und validieren Sie dessen Konfiguration.
3. Erstellen und befüllen Sie einen Suchindex mit einer Dimension/Profile passend zu Ihrem
   Einbettungsmodell, und behandeln Sie Dokumentenfehler und -aktualisierungen.
4. Erstellen Sie ein Registry und konfigurieren Sie Image-Pull-Identität/Berechtigungen.
5. Erstellen und pushen Sie echte Images. Ändern Sie Container-App-Ingress-Ports und Probes,
   um diese Images vor dem Testen anzupassen; Port 80 gehört hier zu den Platzhaltern.
6. Konfigurieren Sie Geheimnisse oder verwaltete Identitäten und bereichsbezogene Data-Plane-Rollen.
   Verweisen Sie nicht auf imaginäre Geheimnisnamen: Diese Vorlage erstellt keine Anwendungsgeheimnisse.
7. Instrumentieren Sie Anwendungen, konfigurieren Sie Warnmeldungen, testen Sie Fehler/Erholung und
   bewerten Sie die Ergebnisse mit repräsentativem Ground Truth und menschlicher Überprüfung.

Siehe den [Architektur-Blueprint](../retail-scenario.md) für Entwurfsgrenzen.

## Fehlerbehebung und Sicherheitsgrenzen

- **Modell nicht verfügbar:** Überprüfen Sie Modell/Version/SKU, Region und Abonnementkontingent;
  das Skript überprüft Modellkataloge nicht vorab.
- **Überwachung deaktiviert:** Das Ziel des Umgebungsprotokolls ist `none` und nicht eine
  ungültige leere Log Analytics-Konfiguration.
- **Nur Platzhalter:** `/chat`, Agentenauswertung und Datei-Einspeisung existieren nicht.
- **Netzwerk/Identität:** Öffentliche Endpunkte und lokale Authentifizierung sind aktiviert.
  Das bloße Aktivieren von Key Vault RBAC erstellt keine Rollenzuweisungen oder Identitäten.
- **Produktiv:** Fügen Sie Authentifizierung, Bereichsidentitäten, Geheimnisverwaltung,
  privates Netzwerk wo nötig, Verfügbarkeitsdesign und Betriebstests hinzu.
  Multiregionale Modellkonten allein bieten kein Failover.

## Bereinigung

Es gibt hier kein AZD-Projekt; `azd down` ist nicht der Bereinigungsbefehl.
Nachdem Sie geprüft haben, dass die Gruppe nur Ihre Lernressourcen enthält:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Erwartet nach Abschluss der Löschung: `false`. Soft-gelöschte Ressourcen von Key Vault und Cognitive Services
können Namen behalten; das Bereinigen erfordert entsprechende Berechtigungen.
Überprüfen Sie Kostenmanagement auf verzögerte Nutzungsgebühren.

[Ein Problem melden](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->