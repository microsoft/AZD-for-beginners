# Erstellen Sie Ihre eigene azd-Vorlage

**Kapitel-Navigation:**
- **📚 Kurs-Startseite**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 4 – Infrastruktur als Code & Bereitstellung
- **⬅️ Vorheriges**: [Bereitstellungsleitfaden](deployment-guide.md)
- **🚀 Nächstes Kapitel**: [Kapitel 5: Multi-Agenten-Lösungen](../chapter-05-multi-agent/README.md)

> Validiert mit `azd 1.27.1` im Juli 2026.

## Einführung

Bisher haben Sie Vorlagen mit `azd init --template <name>` *verwendet*. Aber wenn Sie einmal eine Projektstruktur haben, die Ihrem Team gefällt – zum Beispiel eine Container-App mit Cosmos DB und dem richtigen Monitoring – möchten Sie diese in eine eigene wiederverwendbare Vorlage umwandeln. Eine Vorlage ist einfach ein Git-Repository mit einer vorhersehbaren Struktur, die azd lesen kann. Diese Lektion zeigt Ihnen, wie Sie eine von Grund auf neu erstellen, testen und (optional) in der Community-Galerie veröffentlichen.

## Lernziele

Am Ende dieser Lektion werden Sie:
- Verstehen, was einen Ordner zu einer „azd-Vorlage“ macht
- Die erforderlichen Dateien und Ordnerstruktur kennen
- Eine `azure.yaml` und `infra/` hinzufügen, die andere wiederverwenden können
- Ihre Vorlage lokal testen, bevor Sie sie teilen
- Sie veröffentlichen und (optional) bei Awesome AZD einreichen

## Lernergebnisse

Nach Abschluss dieser Lektion können Sie:
- Ein neues Vorlagen-Repository erstellen
- Infrastruktur parameterisieren, damit sie in jedem Abonnement funktioniert
- Eine Vorlage mit `azd init` und `azd up` validieren
- Die Metadaten hinzufügen, die die Community-Galerie benötigt

---

## Was ist eigentlich eine Vorlage?

Eine azd-Vorlage ist **ein Git-Repository**, das mindestens Folgendes enthält:

| Datei / Ordner | Zweck | Erforderlich? |
|---------------|---------|-----------|
| `azure.yaml` | Beschreibt Dienste, Hosts und Infrastruktur-Anbieter | ✅ Ja |
| `infra/` | Bicep, Terraform oder Pulumi zur Bereitstellung von Ressourcen | ✅ Ja |
| `src/` (oder Ihr Code) | Der Anwendungscode, den azd bereitstellt | ✅ Ja |
| `README.md` | So verwendet man die Vorlage | ✅ Sehr empfohlen |
| `.azdo/` oder `.github/` | CI/CD-Pipeline-Definitionen | Optional |
| `.devcontainer/` | Reproduzierbare Entwicklungsumgebung | Optional |
| `azure.yaml` `metadata` | Galerie- und Telemetriedaten | Optional (zum Veröffentlichen erforderlich) |

Es ist nichts Magisches: Wenn Sie `azd init --template you/your-repo` ausführen, klont azd das Repo und liest die `azure.yaml`.

---

## Schritt 1: Das Repository erstellen

Erstellen Sie die Ordnerstruktur manuell oder starten Sie mit einer Minimalvorlage und bearbeiten diese:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Erstellen Sie das Standardlayout
mkdir -p src infra
```

Eine typische fertige Struktur sieht so aus:

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

## Schritt 2: Schreiben Sie `azure.yaml`

Das ist das Herzstück der Vorlage. Es sagt azd, was bereitgestellt wird und wie:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Das Feld `metadata.template` wird von der Galerietelements-Telemetrie zur Nutzungszählung verwendet. Verwenden Sie die Konvention `name@version`.

---

## Schritt 3: Infrastruktur parametrieren

Die wichtigste Regel für eine *wiederverwendbare* Vorlage: **Namen, Regionen oder abonnementsspezifische Werte niemals fest codieren.** Verwenden Sie Parameter und das Ressourcentoken-Muster, damit dieselbe Vorlage in jedem Abonnement funktioniert.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Zwei Dinge machen diese Vorlage vorlagenfreundlich:

1. **`azd-env-name`-Tag** — azd verwendet ihn, um Ressourcen pro Umgebung zu verfolgen und aufzuräumen.
2. **`uniqueString(...)`-Ressourcentoken** — erzeugt einen stabilen, global eindeutigen Suffix, damit keine Namenskollisionen entstehen.

Stellen Sie eine passende Parameterdatei bereit, die Werte liest, die azd aus der Umgebung einfügt:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd ersetzt automatisch `${AZURE_ENV_NAME}` und `${AZURE_LOCATION}` aus der aktuellen Umgebung.

---

## Schritt 4: Testen Sie Ihre Vorlage lokal

Bevor Sie teilen, beweisen Sie, dass die Vorlage von einem sauberen Zustand aus funktioniert.

**Testen Sie aus dem lokalen Ordner** (kein Git-Push erforderlich):

```bash
# Von einem leeren Verzeichnis aus mit Ihrem lokalen Vorlagenpfad initialisieren
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Bereitstellen + Ende-zu-Ende-Deployment
azd auth login
azd up
```

**Testen Sie anschließend den Abbau** – eine gute Vorlage räumt vollständig auf:

```bash
azd down --force --purge
```

Wenn `azd down` Ressourcen zurücklässt, haben Sie wahrscheinlich den `azd-env-name`-Tag auf einer Ressource vergessen.

> **Tipp:** Führen Sie zuerst `azd provision --preview` aus. Es führt eine Simulation durch und zeigt Fehler in der Vorlage, bevor Ressourcen erstellt werden.

---

## Schritt 5: Veröffentlichen Sie die Vorlage

Pushen Sie das Repository zu GitHub (öffentlich, wenn andere es verwenden sollen):

```bash
gh repo create my-azd-template --public --source=. --push
```

Jeder kann es jetzt verwenden:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Schritt 6 (Optional): Einreichen bei Awesome AZD

Die [Awesome AZD-Galerie](https://azure.github.io/awesome-azd/) listet Community-Vorlagen. Um aufgeführt zu werden, sollte Ihr Repo enthalten:

- ✅ Ein klares `README.md` mit Voraussetzungen, einem Architekturdiagramm und Kostennoten
- ✅ Eine funktionierende `azure.yaml` mit `metadata.template`
- ✅ Infrastruktur, die sauber in einem frischen Abonnement bereitgestellt wird
- ✅ Eine `LICENSE`-Datei
- ✅ (Empfohlen) Ein `.devcontainer/` für One-Click-Codespaces

Reichen Sie ein, indem Sie einen Pull Request öffnen, der Ihre Vorlage zur Datendatei der Galerie hinzufügt, gemäß der Beitragsanleitung im [Awesome AZD-Repository](https://github.com/Azure/awesome-azd).

---

## Häufige Stolperfallen

| Stolperfallen | Lösung |
|--------------|---------|
| Fest codierte Ressourcennamen | Verwenden Sie das `uniqueString()`-Ressourcentoken |
| `azd down` lässt Ressourcen zurück | Markieren Sie jede Ressource (oder die Ressourcengruppe) mit `azd-env-name` |
| Vorlage funktioniert für Sie, nicht für andere | Entfernen Sie Abonnement-IDs, Mandanten-IDs und Regionsannahmen |
| Ausgaben sind nicht in die App eingebunden | Exportieren Sie `SERVICE_<NAME>_ENDPOINT_URL` und andere `AZURE_*`-Ausgaben |
| Einreichung in der Galerie abgelehnt | Fügen Sie `README.md`, `LICENSE` und `metadata.template` hinzu |

---

## Zusammenfassung

- Eine Vorlage ist einfach ein Git-Repo mit `azure.yaml`, `infra/` und Ihrem Code.
- Parametrieren Sie alles – Namen, Regionen und IDs – damit es überall läuft.
- Markieren Sie Ressourcen immer mit `azd-env-name`, damit `azd down` funktioniert.
- Testen Sie lokal mit `azd init --template <local-path>`, bevor Sie veröffentlichen.
- Fügen Sie Metadaten und ein README hinzu, um bei Awesome AZD einzureichen.

---

## 🔗 Navigation

| Richtung | Ressource |
|----------|----------|
| **Vorheriges** | [Bereitstellungsleitfaden](deployment-guide.md) |
| **Kapitel-Startseite** | [Kapitel 4: Infrastruktur als Code](README.md) |
| **Nächstes Kapitel** | [Kapitel 5: Multi-Agenten-Lösungen](../chapter-05-multi-agent/README.md) |

## 📖 Verwandte Ressourcen

- [Ressourcen bereitstellen](provisioning.md)
- [Awesome AZD Galerie](https://azure.github.io/awesome-azd/)
- [Offizielle azd-Vorlagendokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->