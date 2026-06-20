# Ein eigenes azd-Template erstellen

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 4 - Infrastruktur als Code & Bereitstellung
- **⬅️ Vorheriges**: [Bereitstellungsleitfaden](deployment-guide.md)
- **🚀 Nächstes Kapitel**: [Kapitel 5: Multi-Agenten-Lösungen](../chapter-05-multi-agent/README.md)

> Validiert gegen `azd 1.25.6` im Juni 2026.

## Einführung

Bisher haben Sie Vorlagen mit `azd init --template <name>` *verwendet*. Sobald Sie jedoch ein Projektlayout haben, das Ihrem Team gefällt — zum Beispiel eine Container App mit einer Cosmos DB und der passenden Überwachung — möchten Sie es zu einer wiederverwendbaren Vorlage machen. Eine Vorlage ist einfach ein Git-Repository mit einer vorhersehbaren Struktur, die azd lesen kann. Diese Lektion zeigt Ihnen, wie Sie eine solche von Grund auf erstellen, testen und (optional) in der Community-Galerie veröffentlichen.

## Lernziele

Bis zum Ende dieser Lektion werden Sie:
- Verstehen, was einen Ordner zu einer „azd“-Vorlage macht
- Die erforderlichen Dateien und die Verzeichnisstruktur kennen
- Ein `azure.yaml` und ein `infra/` hinzufügen, die andere wiederverwenden können
- Ihre Vorlage lokal testen, bevor Sie sie freigeben
- Sie veröffentlichen und (optional) bei Awesome AZD einreichen

## Lernergebnisse

Nach Abschluss dieser Lektion sind Sie in der Lage:
- Ein neues Vorlagen-Repository anzulegen
- Infrastruktur zu parametrisieren, sodass sie in jedem Abonnement funktioniert
- Eine Vorlage mit `azd init` und `azd up` zu validieren
- Die von der Community-Galerie erforderlichen Metadaten hinzuzufügen

---

## Was ist eine Vorlage eigentlich?

Eine azd-Vorlage ist **ein Git-Repository**, das mindestens enthält:

| Datei / Ordner | Zweck | Erforderlich? |
|---------------|---------|-----------|
| `azure.yaml` | Beschreibt Dienste, Hosts und Infra-Provider | ✅ Ja |
| `infra/` | Bicep, Terraform oder Pulumi, das Ressourcen bereitstellt | ✅ Ja |
| `src/` (or your code) | Der Anwendungs-Code, den azd bereitstellt | ✅ Ja |
| `README.md` | Anleitung zur Verwendung der Vorlage | ✅ Dringend empfohlen |
| `.azdo/` oder `.github/` | CI/CD-Pipeline-Definitionen | Optional |
| `.devcontainer/` | Reproduzierbare Entwicklungsumgebung | Optional |
| `azure.yaml` `metadata` | Galerie- und Telemetrieinformationen | Optional (für Veröffentlichung erforderlich) |

Da ist nichts Magisches: Wenn Sie `azd init --template you/your-repo` ausführen, klont azd das Repository und liest `azure.yaml`.

---

## Schritt 1: Das Repository aufsetzen

Erstellen Sie die Ordnerstruktur von Hand oder starten Sie mit einer minimalen Vorlage und bearbeiten Sie diese:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Standardlayout erstellen
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

## Schritt 2: `azure.yaml` schreiben

Das ist das Herzstück der Vorlage. Es sagt azd, was bereitgestellt werden soll und wie:

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

> Das Feld `metadata.template` ist das, was die Galerie-Telemetrie zur Erfassung der Nutzung verwendet. Verwenden Sie die Konvention `name@version`.

---

## Schritt 3: Infrastruktur parametrisieren

Die wichtigste Regel für eine *wiederverwendbare* Vorlage: **Niemals Namen, Regionen oder abonnementspezifische Werte fest codieren.** Verwenden Sie Parameter und das Resource-Token-Muster, damit dieselbe Vorlage in jedem Abonnement funktioniert.

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

Zwei Eigenschaften machen diese Vorlage wiederverwendbar:

1. **`azd-env-name`-Tag** — azd verwendet ihn, um Ressourcen pro Umgebung zu verfolgen und aufzuräumen.
2. **`uniqueString(...)` Resource-Token** — erzeugt einen stabilen, global eindeutigen Suffix, damit Namen nicht kollidieren.

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

Bevor Sie sie freigeben, stellen Sie sicher, dass die Vorlage aus einem sauberen Zustand funktioniert.

**Testen Sie aus dem lokalen Ordner** (kein Git-Push erforderlich):

```bash
# Von einem leeren Verzeichnis aus mit deinem lokalen Vorlagenpfad initialisieren
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisionieren und von Anfang bis Ende bereitstellen
azd auth login
azd up
```

**Testen Sie dann das Aufräumen**—eine gute Vorlage räumt vollständig auf:

```bash
azd down --force --purge
```

Wenn `azd down` Ressourcen zurücklässt, haben Sie wahrscheinlich das `azd-env-name`-Tag an einer Ressource vergessen.

> **Tipp:** Führen Sie zuerst `azd provision --preview` aus. Es führt ein what-if aus und zeigt Template-Fehler an, bevor Ressourcen erstellt werden.

---

## Schritt 5: Die Vorlage veröffentlichen

Pushen Sie das Repository zu GitHub (öffentlich, wenn andere es verwenden sollen):

```bash
gh repo create my-azd-template --public --source=. --push
```

Jeder kann es jetzt verwenden:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Schritt 6 (Optional): Bei Awesome AZD einreichen

Die [Awesome AZD gallery](https://azure.github.io/awesome-azd/) listet Community-Vorlagen auf. Damit Ihr Repo aufgenommen wird, sollte es Folgendes enthalten:

- ✅ Eine klare `README.md` mit Voraussetzungen, einem Architekturdiagramm und Angaben zu Kosten
- ✅ Ein funktionierendes `azure.yaml` mit `metadata.template`
- ✅ Infrastruktur, die in einem frischen Abonnement sauber bereitgestellt werden kann
- ✅ Eine `LICENSE`-Datei
- ✅ (Empfohlen) Ein `.devcontainer/` für One-Click-Codespaces

Reichen Sie einen Pull Request ein, der Ihre Vorlage zur Datendatei der Galerie hinzufügt, und folgen Sie dabei der Beitragsanleitung im [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Häufige Fehlerquellen

| Fehlerquelle | Lösung |
|---------|-----|
| Fest codierte Ressourcennamen | Verwenden Sie das `uniqueString()` Resource-Token |
| `azd down` lässt Ressourcen zurück | Taggen Sie jede Ressource (oder die Ressourcengruppe) mit `azd-env-name` |
| Vorlage funktioniert für Sie, aber nicht für andere | Entfernen Sie Abonnement-IDs, Mandanten-IDs und regionsspezifische Annahmen |
| Ausgaben nicht in die App integriert | Exportieren Sie `SERVICE_<NAME>_ENDPOINT_URL` und andere `AZURE_*`-Ausgaben |
| Galerieeinreichung abgelehnt | Fügen Sie `README.md`, `LICENSE` und `metadata.template` hinzu |

---

## Zusammenfassung

- Eine Vorlage ist einfach ein Git-Repository mit `azure.yaml`, `infra/` und Ihrem Code.
- Parametrisieren Sie alles — Namen, Regionen und IDs — damit es überall läuft.
- Versehen Sie Ressourcen stets mit `azd-env-name`, damit `azd down` funktioniert.
- Testen Sie lokal mit `azd init --template <local-path>`, bevor Sie veröffentlichen.
- Fügen Sie Metadaten und ein README hinzu, um sich bei Awesome AZD einzureichen.

---

## 🔗 Navigation

| Richtung | Ressource |
|-----------|----------|
| **Vorheriges** | [Bereitstellungsleitfaden](deployment-guide.md) |
| **Kapitel-Startseite** | [Kapitel 4: Infrastruktur als Code](README.md) |
| **Nächstes Kapitel** | [Kapitel 5: Multi-Agenten-Lösungen](../chapter-05-multi-agent/README.md) |

## 📖 Verwandte Ressourcen

- [Ressourcen bereitstellen](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Offizielle azd-Template-Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->