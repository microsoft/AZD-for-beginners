# Bring Your Own App – azd zu einem bestehenden Projekt hinzufügen

**Kapitelnavigation:**
- **📚 Kursübersicht**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 – Grundlagen & Schnellstart
- **⬅️ Zurück**: [Dein erstes Projekt](first-project.md)
- **➡️ Weiter**: [Dev Containers & Codespaces](dev-containers.md)

> Ziel der Kommando- und Konfigurationsüberprüfung: `azd 1.37.2` (November 2026). Generierte Dateien sind von der erkannten Anwendung abhängig; eine Azure-Bereitstellung wurde in dieser Überprüfung nicht durchgeführt.

## Einführung

In [Dein erstes Projekt](first-project.md) hast du eine App bereitgestellt, indem du mit einer Vorlage gestartet bist. Aber meistens hast du bereits *eine* App – eine Node.js-API, einen Python Flask-Dienst, eine .NET-Webanwendung – die in einem Ordner auf deinem Rechner liegt. Diese Lektion zeigt dir, wie du azd zu diesem bestehenden Code hinzufügen kannst, damit du ihn mit `azd up` bereitstellen kannst, ganz ohne Vorlage.

## Lernziele

Am Ende dieser Lektion wirst du:
- Die drei Möglichkeiten kennen, ein azd-Projekt zu starten
- `azd init` innerhalb eines bestehenden Codes ausführen können
- Verstehen, was `azure.yaml` und der `infra/`-Ordner für deine App bewirken
- Wissen, wann azd Infrastruktur generieren soll und wann du sie selbst schreiben solltest
- Deine bestehende App mit `azd up` in Azure bereitstellen können

## Lernergebnisse

Nach Abschluss dieser Lektion wirst du in der Lage sein:
- azd in einem bereits vorhandenen Projekt zu initialisieren
- Eine grundlegende `azure.yaml`-Datei zu lesen und zu bearbeiten
- Starter-Infrastruktur mit `azd infra generate` zu generieren
- Einen passenden Azure-Host für deine App auszuwählen
- Deine eigene Anwendung bereitzustellen und zu bereinigen

---

## Drei Wege, ein azd-Projekt zu starten

| Ausgangspunkt | Befehl | Wann nutzen? |
|----------------|---------|-------------|
| **Mit Vorlage** | `azd init --template <name> .` (leeres Verzeichnis) | Lernen oder eine neue App aus einer bewährten Vorlage starten |
| **Mit deinem bestehenden Code** | `azd init` (im Projektordner) | Du hast bereits eine App und möchtest sie bereitstellen |
| **Aus einem Git-Repo** | `azd init --from-code` (in einem geklonten Repo) | azd für ein bestehendes Repository übernehmen |

Du hast die erste Möglichkeit bereits geübt. Diese Lektion behandelt die zweite – das am häufigsten vorkommende Szenario in der Praxis.

---

## Schritt 1: `azd init` in deinem Projekt ausführen

Öffne ein Terminal **in deinem bestehenden Projektordner** und führe aus:

```bash
cd my-existing-app
azd init
```

azd fragt, wie du initialisieren möchtest. Wähle:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Wähle **"Code im aktuellen Verzeichnis verwenden."** azd scannt dann deinen Ordner, erkennt deine Sprache und dein Framework und schlägt einen Host vor.

### Was azd erkennt

azd sucht nach Anzeichen der Anwendung wie `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` oder einer `Dockerfile`. Der From-Code-Fluss ist kein allgemeiner Host-Auswahlassistent für jedes unterstützte Bereitstellungsziel:

| Deine App | Wahrscheinlich erkannter Host |
|----------|----------------------|
| Unterstützte Node.js / Python / .NET-Webanwendung | Typischerweise Azure Container Apps; überprufe die generierte Definition |
| Containerisierte App (`Dockerfile`) | Azure Container Apps |
| Function App oder Static Web Apps-Projekt | Verwende eine passende Vorlage oder erstelle `azure.yaml` und Infrastruktur, wenn From-Code dein Layout nicht unterstützt |

Bestätige den erkannten Dienst/deine erkannten Dienste, und azd erstellt die benötigten Dateien.

---

## Schritt 2: Verstehen, was azd erstellt hat

Nach der Initialisierung überprüfe `azure.yaml`. Der generierte-Infrastruktur-Flow kann Infrastruktur implizit halten, bis du `azd infra generate` ausführst; gehe nicht davon aus, dass `infra/` bereits existiert:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` – die Projektdefinition

Dies ist das Herzstück eines azd-Projekts. Die folgende **illustrierende App Service-Definition** benötigt eine passende App Service-Infrastruktur; sie ist kein Grund, einen generierten Container Apps-Host ohne Änderung der Infrastruktur zu wechseln:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Der `services`-Abschnitt ist der entscheidende Teil: Jeder Eintrag ordnet einen Ordner deines Codes einem Azure-Host zu. Hat deine App sowohl Frontend als auch API, hast du zwei Services.

### `infra/` – deine Azure-Ressourcen als Code

Der `infra/` Ordner enthält Bicep-Dateien, die die Azure-Ressourcen definieren, die Ihre App benötigt (den App Service, die Datenbank usw.). Sie müssen diese nicht von Hand schreiben – azd erzeugt einen funktionierenden Ausgangspunkt. Sie *können* sie später bearbeiten, um Ressourcen hinzuzufügen oder die Sicherheit zu verbessern (behandelt in [Kapitel 4](../chapter-04-infrastructure/README.md)).

> **Tipp:** Möchten Sie die generierte Infrastruktur vor dem Bereitstellen ansehen oder anpassen? Führen Sie `azd infra generate` aus (auch verfügbar als `azd infra synth`), um die IaC auf die Festplatte zu schreiben, damit Sie sie überprüfen und versionieren können.

---

## Schritt 3: Erforderliche Konfiguration festlegen

Wenn Ihre App Einstellungen oder Geheimnisse benötigt (eine Verbindungszeichenfolge, einen API-Schlüssel), kodieren Sie diese nicht fest. Verwenden Sie Umgebungswerte:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Dies speichert nur einen lokalen Wert. Um die App zu beeinflussen, müssen Sie ihn explizit in Infrastrukturparametern, einer unterstützten Dienstkonfiguration oder einem Hook verwenden; das Setzen einer beliebigen Variablen konfiguriert die bereitgestellte Laufzeitumgebung nicht.

Für echte Geheimnisse speichern Sie diese im Key Vault und referenzieren Sie sie von Ihrer Infrastruktur aus – siehe [Kapitel 3: Konfiguration & Authentifizierung](../chapter-03-configuration/authsecurity.md).

---

## Schritt 4: Bereitstellen

Verwenden Sie nun den gleichen Workflow, den Sie bereits kennen:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Nach Abschluss gibt azd die URL Ihrer App aus. Überprüfen Sie diese wie bei jeder azd-App:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Häufige Probleme beim ersten Mal

| Symptom | Wahrscheinliche Ursache | Lösung |
|---------|-----------------------|--------|
| azd hat meine App nicht erkannt | Fehlendes Manifest (z. B. `package.json`) | Fügen Sie das Manifest hinzu oder wählen Sie den Host manuell während `azd init` aus |
| Build schlägt während `azd up` fehl | App benötigt einen Build-Schritt | Konfigurieren Sie die Paketskripte der App oder den Dienst-`prepackage`-Hook; verwenden Sie `dist` für Bereitstellungsprotokolle, nicht `buildCommand`/`outputPath` |
| App startet, liefert aber Fehler zurück | Fehlende Konfiguration/Geheimnis | Verbinden Sie Werte in Laufzeit-App-Einstellungen oder eine Key Vault-Referenz; `azd env set` alleine reicht nicht aus |
| Falscher Host ausgewählt | Autodetektion entspricht nicht Ihren Anforderungen | Ändern Sie sowohl `host:` als auch die entsprechende Infrastruktur oder wählen Sie eine passende Vorlage |

Für weitere Informationen siehe [Kapitel 7: Fehlerbehebung](../chapter-07-troubleshooting/README.md).

---

## Aufräumen

```bash
azd down --force --purge
```

---

## Zusammenfassung

- `azd init` → **„Verwenden Sie Code im aktuellen Verzeichnis“** fügt azd zu einer vorhandenen App hinzu.
- `azure.yaml` ordnet Ihre Codeordner Azure-Hosts zu; `infra/` definiert die Ressourcen als Bicep.
- `azd infra generate` ermöglicht Ihnen, die generierte Infrastruktur zu überprüfen oder anzupassen.
- Nach der Initialisierung nutzt Ihre bestehende App denselben `azd up` / `azd down`-Workflow wie eine vorlagenbasierte App.

---

## 🔗 Navigation

| Richtung | Lektion |
|----------|---------|
| **Vorherige** | [Ihr erstes Projekt](first-project.md) |
| **Nächste** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Verwandte Ressourcen

- [AZD-Grundlagen](azd-basics.md)
- [Kapitel 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Konfiguration & Authentifizierung](../chapter-03-configuration/authsecurity.md)
- [Befehlsübersicht](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->