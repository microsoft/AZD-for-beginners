# Eigene azd-Vorlage erstellen

**Kapitelnavigation:**
- **📚 Kursstartseite**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 4 - Infrastruktur als Code & Bereitstellung
- **⬅️ Vorheriges**: [Bereitstellungsanleitung](deployment-guide.md)
- **🚀 Nächstes Kapitel**: [Kapitel 5: Multi-Agent-Lösungen](../chapter-05-multi-agent/README.md)

> Überprüft gegen `azd 1.37.2` (November 2026). Dies ist ein **Erstellungsdurchgang mit Teil-Dateien**, keine vollständige Vorlage: Sie müssen Anwendungscode und `modules/web.bicep` mit seiner Umgebung, Registry, Container App und Ausgaben vor der Bereitstellung bereitstellen. Die Azure-Bereitstellung wurde in dieser Überprüfung nicht ausgeführt.

## Einführung

Bisher hast du *Vorlagen konsumiert* mit `azd init --template <name>`. Sobald ihr aber ein Projektlayout habt, das deinem Team gefällt – zum Beispiel eine Container App mit einer Cosmos DB und dem richtigen Monitoring – möchtest du daraus wahrscheinlich eine wiederverwendbare eigene Vorlage machen. Eine Vorlage ist einfach ein Git-Repository mit einer vorhersehbaren Struktur, die azd lesen kann. Diese Lektion zeigt dir, wie du eine von Grund auf neu erstellst, testest und (optional) in der Community-Galerie veröffentlichst.

## Lernziele

Am Ende dieser Lektion wirst du:
- Verstehen, was einen Ordner zu einer „azd-Vorlage“ macht
- Die erforderlichen Dateien und Ordnerstruktur kennen
- Einen `azure.yaml` und `infra/` hinzufügen, die andere wiederverwenden können
- Deine Vorlage lokal testen, bevor du sie teilst
- Sie veröffentlichen und (optional) in Awesome AZD einreichen

## Lernergebnisse

Nach Abschluss dieser Lektion wirst du in der Lage sein:
- Ein neues Vorlagen-Repository zu scaffolden
- Infrastruktur parametrieren, sodass sie in jedem Abonnement funktioniert
- Eine Vorlage mit `azd init` und `azd up` zu validieren
- Die Metadaten hinzuzufügen, die die Community-Galerie benötigt

---

## Was ist eine Vorlage eigentlich?

Eine azd-Vorlage ist **ein Git-Repository**, das mindestens enthält:

| Datei / Ordner | Zweck | Erforderlich? |
|---------------|---------|-----------|
| `azure.yaml` | Beschreibt Dienste, Hosts und Infrastruktur-Anbieter | ✅ Ja |
| `infra/` | Bicep- oder Terraform-Bereitstellungsdefinitionen | Für dieses explizite IaC-Beispiel erforderlich; generierte Infrastrukturprojekte können es weglassen |
| `src/` (oder dein Code) | Der Anwendungscode, den azd bereitstellt | Für quellbasierte Dienste erforderlich; nicht alle Vorlagen enthalten Anwendungscode |
| `README.md` | Wie man die Vorlage benutzt | ✅ Sehr empfohlen |
| `.azdo/` oder `.github/` | CI/CD-Pipeline-Definitionen | Optional |
| `.devcontainer/` | Reproduzierbare Entwicklerumgebung | Optional |
| `azure.yaml` `metadata` | Vorlagen-Identität / Telemetrieinformationen | Empfohlen; Veröffentlichung eines Git-Repository erfordert dies nicht |

Hier ist nichts Magisches: Wenn du `azd init --template you/your-repo` ausführst, klont azd das Repo und liest `azure.yaml`.

---

## Schritt 1: Scaffold das Repository

Erstelle die Ordnerstruktur von Hand oder starte von einer minimalen Vorlage und bearbeite sie:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Ein typisches fertiges Layout sieht so aus:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## Schritt 2: Schreibe `azure.yaml`

Das ist das Herzstück der Vorlage. Es sagt azd, was bereitgestellt werden soll und wie:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Das Feld `metadata.template` wird von der Galerie-Telemetrie genutzt, um die Nutzung zu zählen. Verwende die `name@version`-Konvention.

---

## Schritt 3: Parameterisiere die Infrastruktur

Die wichtigste Regel für eine *wiederverwendbare* Vorlage: **niemals hartkodierte Namen, Regionen oder abonnementsspezifische Werte verwenden.** Benutze Parameter und das Resource-Token-Muster, damit dieselbe Vorlage in jedem Abonnement funktioniert.

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Zwei Dinge machen diese Vorlage vorlagenfreundlich:

1. **`azd-env-name`-Tag** — azd verwendet ihn, um Ressourcen pro Umgebung zu verfolgen und zu bereinigen.
2. **`uniqueString(...)` Resource-Token** — erzeugt einen stabilen Hash-Suffix zur Reduzierung von Kollisionen; es ist keine Garantie für globale Einzigartigkeit.

Der fehlende `modules/web.bicep` muss `name`, `location` und `tags` akzeptieren, die Container Apps-Umgebung / Registry und App bereitstellen, die App mit `azd-service-name: web` kennzeichnen und `uri` exportieren. Er muss auch Registry-Werte bereitstellen, die vom gewählten Build-/Bereitstellungsablauf benötigt werden (zum Beispiel `AZURE_CONTAINER_REGISTRY_ENDPOINT` aus dem Root-Modul). Eine Endpoint-Ausgabe allein verknüpft nicht Service Discovery, Anwendungseinstellungen oder Registry-Authentifizierung.

Stelle eine passende Parameterdatei bereit, die Werte liest, die azd aus der Umgebung einspritzt:

Speichere Folgendes als `infra/main.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd ersetzt `${AZURE_ENV_NAME}` und `${AZURE_LOCATION}` automatisch aus der aktuellen Umgebung.

---

## Schritt 4: Teste deine Vorlage lokal

Überprüfe vor dem Teilen, dass die Vorlage aus einem sauberen Zustand funktioniert.

**Teste aus dem lokalen Ordner** (kein Git-Push erforderlich):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Dann teste das Aufräumen** – eine gute Vorlage räumt vollständig auf:

```bash
azd down --force --purge
```

Wenn `azd down` Ressourcen zurücklässt, prüfe Umgebungs-/Ressourcengruppenerkennung, externe/geteilte Ressourcen, Berechtigungen, Sperren und Löschschutz. `--purge` löscht keinen lokalen `.azure/`-Status.

> **Tipp:** Nachdem du alle fehlenden Dateien hinzugefügt hast, führe zuerst `azd provision --preview` aus. Prüfe Hooks vor der Vorschau, da sie Nebenwirkungen haben können. Vorschau ist keine Preisschätzung oder Garantie, dass die Bereitstellung erfolgreich sein wird.

---

## Schritt 5: Veröffentliche die Vorlage

Push das Repository zu GitHub (öffentlich, wenn andere es nutzen sollen):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Jeder kann sie nun nutzen:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Schritt 6 (optional): Einreichung bei Awesome AZD

Die [Awesome AZD-Galerie](https://azure.github.io/awesome-azd/) listet Community-Vorlagen. Um aufgenommen zu werden, sollte dein Repo enthalten:

- ✅ Eine klare `README.md` mit Voraussetzungen, Architekturdiagramm und Kostenhinweisen
- ✅ Eine funktionierende `azure.yaml` mit `metadata.template`
- ✅ Infrastruktur, die sauber in einem frischen Abonnement bereitgestellt wird
- ✅ Eine `LICENSE`-Datei
- ✅ (Empfohlen) Eine `.devcontainer/` für Ein-Klick-Codespaces

Reiche ein, indem du einen Pull Request öffnest, der deine Vorlage zur Galeriedaten-Datei hinzufügt, gemäß der Beitragshinweise im [Awesome AZD-Repository](https://github.com/Azure/awesome-azd).

---

## Häufige Fallen

| Falle | Behebung |
|---------|-----|
| Hartkodierte Ressourcennamen | Benutze das `uniqueString()` Resource-Token |
| `azd down` hinterlässt Ressourcen | Markiere jede Ressource (oder die Ressourcengruppe) mit `azd-env-name` |
| Vorlage funktioniert für dich, schlägt für andere fehl | Entferne Abonnement-IDs, Mandanten-IDs und Regionsannahmen |
| Ausgaben sind nicht in die App eingebunden | Passe `azd-service-name`/`resourceName` für die Bereitstellung an und weise Ausgaben explizit den App-Einstellungen zu |
| Galerieneinreichung abgelehnt | Füge `README.md`, `LICENSE`, und `metadata.template` hinzu |

---

## Zusammenfassung

- Eine Vorlage ist einfach ein Git-Repo mit `azure.yaml`, `infra/` und deinem Code.
- Parametriere alles – Namen, Regionen und IDs – damit es überall läuft.
- Markiere Ressourcen immer mit `azd-env-name`, damit `azd down` funktioniert.
- Teste lokal mit `azd init --template <local-path>` bevor du veröffentlichst.
- Füge Metadaten und eine README hinzu, um sie in Awesome AZD einzureichen.

---

## 🔗 Navigation

| Richtung | Ressource |
|-----------|----------|
| **Vorheriges** | [Bereitstellungsanleitung](deployment-guide.md) |
| **Kapitelstart** | [Kapitel 4: Infrastruktur als Code](README.md) |
| **Nächstes Kapitel** | [Kapitel 5: Multi-Agent-Lösungen](../chapter-05-multi-agent/README.md) |

## 📖 Verwandte Ressourcen

- [Ressourcen bereitstellen](provisioning.md)
- [Awesome AZD-Galerie](https://azure.github.io/awesome-azd/)
- [Offizielle azd-Vorlagendokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->