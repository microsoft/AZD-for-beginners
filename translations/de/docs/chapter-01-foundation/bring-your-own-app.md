# Bring Your Own App - Add azd to an Existing Project

**Chapter Navigation:**
- **📚 Kurs-Startseite**: [AZD For Beginners](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 - Grundlagen & Schnellstart
- **⬅️ Zurück**: [Ihr erstes Projekt](first-project.md)
- **➡️ Weiter**: [Dev-Container & Codespaces](dev-containers.md)

> Validiert gegen `azd 1.25.6` im Juni 2026.

## Einführung

In [Ihr erstes Projekt](first-project.md) haben Sie eine App bereitgestellt, indem Sie mit einer Vorlage begonnen haben. In den meisten Fällen haben Sie jedoch bereits eine App — eine Node.js-API, einen Python-Flask-Service, eine .NET-Webanwendung — in einem Ordner auf Ihrem Rechner. Diese Lektion zeigt, wie Sie azd zu diesem bestehenden Code hinzufügen, damit Sie ihn mit `azd up` bereitstellen können, ganz ohne Vorlage.

## Lernziele

Am Ende dieser Lektion werden Sie:
- Die drei Möglichkeiten kennen, ein azd-Projekt zu starten
- `azd init` innerhalb eines bestehenden Codebases ausführen
- Verstehen, was `azure.yaml` und der Ordner `infra/` für Ihre App tun
- Wissen, wann azd Infrastruktur generieren soll vs. wann Sie eigene schreiben sollten
- Ihre bestehende App mit `azd up` auf Azure bereitstellen

## Lernergebnisse

Nach Abschluss dieser Lektion sind Sie in der Lage:
- azd in einem Projekt zu initialisieren, das Sie bereits haben
- Eine grundlegende `azure.yaml`-Datei zu lesen und zu bearbeiten
- Starter-Infrastruktur mit `azd infra generate` zu erzeugen
- Einen geeigneten Azure-Host für Ihre App auszuwählen
- Ihre eigene Anwendung bereitzustellen und wieder zu entfernen

---

## Drei Wege, ein azd-Projekt zu starten

| Ausgangspunkt | Befehl | Wann verwenden |
|----------------|---------|-------------|
| **Aus einer Vorlage** | `azd init --template <name>` | Zum Lernen oder wenn Sie eine neue App von einem bewährten Beispiel starten |
| **Aus bestehendem Code** | `azd init` (in Ihrem Projektordner) | Sie haben bereits eine App und möchten sie bereitstellen |
| **Aus einem Git-Repo** | `azd init --from-code` (in einem geklonten Repo) | azd für ein vorhandenes Repository übernehmen |

Sie haben bereits die erste Option geübt. Diese Lektion behandelt die zweite — das häufigste reale Szenario.

---

## Schritt 1: Führen Sie `azd init` in Ihrem Projekt aus

Öffnen Sie ein Terminal **innerhalb Ihres bestehenden Projektordners** und führen Sie aus:

```bash
cd my-existing-app
azd init
```

azd fragt, wie Sie initialisieren möchten. Wählen Sie:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Wählen Sie **"Use code in the current directory."** azd durchsucht dann Ihren Ordner, erkennt Ihre Sprache und Ihr Framework und schlägt einen Host vor.

### Was azd erkennt

azd sucht nach Signalen wie `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` oder einer `Dockerfile` und schlägt einen passenden Azure-Host vor:

| Ihre App | Wahrscheinlicher erkannter Host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service oder Container Apps |
| Containerisierte App (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Statische Seite (React/Vue Build-Ausgabe) | Azure Static Web Apps |

Bestätigen Sie die erkannten Dienste, und azd erstellt die benötigten Dateien.

---

## Schritt 2: Verstehen, was azd erstellt hat

Nach dem Init haben Sie zwei neue Dinge in Ihrem Projekt:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — die Projektdefinition

Dies ist das Herz eines azd-Projekts. Ein minimales sieht so aus:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Der `services`-Block ist der zentrale Teil: Jeder Eintrag ordnet einen Ordner Ihres Codes einem Azure-Host zu. Wenn Ihre App sowohl ein Frontend als auch eine API hat, werden Sie zwei Services haben.

### `infra/` — Ihre Azure-Ressourcen als Code

Der Ordner `infra/` enthält Bicep-Dateien, die die Azure-Ressourcen definieren, die Ihre App benötigt (den App Service, die Datenbank usw.). Sie müssen diese nicht von Hand schreiben — azd generiert einen funktionierenden Ausgangspunkt. Sie *können* sie später bearbeiten, um Ressourcen hinzuzufügen oder die Sicherheit zu erhöhen (behandelt in [Kapitel 4](../chapter-04-infrastructure/README.md)).

> **Tipp:** Möchten Sie die generierte Infrastruktur vor dem Bereitstellen ansehen oder anpassen? Führen Sie `azd infra generate` aus (auch verfügbar als `azd infra synth`), um die IaC auf die Festplatte zu schreiben, damit Sie sie überprüfen und versionieren können.

---

## Schritt 3: Erforderliche Konfiguration festlegen

Wenn Ihre App Einstellungen oder Geheimnisse benötigt (z. B. eine Verbindungszeichenfolge oder einen API-Schlüssel), legen Sie diese nicht fest im Code ab. Verwenden Sie stattdessen Umgebungswerte:

```bash
# Erstelle eine Umgebung
azd env new dev

# Setze einen nicht-geheimen Wert
azd env set API_VERSION 1.0.0
```

Für echte Geheimnisse speichern Sie diese in Key Vault und referenzieren sie aus Ihrer Infrastruktur — siehe [Kapitel 3: Konfiguration & Authentifizierung](../chapter-03-configuration/authsecurity.md).

---

## Schritt 4: Bereitstellen

Verwenden Sie nun denselben Workflow, den Sie bereits kennen:

```bash
# Authentifizieren (erforderlich für azd)
azd auth login

# Vorschau der Ressourcen, die erstellt werden
azd provision --preview

# Infrastruktur bereitstellen und Ihren Code bereitstellen
azd up
```

Wenn es fertig ist, zeigt azd die URL Ihrer App an. Überprüfen Sie diese auf die gleiche Weise wie bei jeder azd-App:

```bash
azd show           # Endpunkte anzeigen
azd monitor --logs # Protokolle bei Bedarf prüfen
```

---

## Häufige Probleme beim ersten Mal

| Symptom | Wahrscheinliche Ursache | Lösung |
|---------|--------------|-----|
| azd hat meine App nicht erkannt | Fehlendes Manifest (z. B. `package.json`) | Fügen Sie das Manifest hinzu oder wählen Sie den Host während `azd init` manuell aus |
| Build schlägt fehl während `azd up` | App benötigt einen Build-Schritt | Fügen Sie `buildCommand`/`outputPath` unter dem Service in `azure.yaml` hinzu |
| App startet, gibt aber Fehler zurück | Fehlende Konfiguration/Geheimnis | Setzen Sie Werte mit `azd env set` oder binden Sie Key Vault ein |
| Falscher Host ausgewählt | Die automatische Erkennung hat geraten | Bearbeiten Sie `host:` in `azure.yaml` und führen Sie `azd up` erneut aus |

Weitere Informationen finden Sie in [Kapitel 7: Fehlerbehebung](../chapter-07-troubleshooting/README.md).

---

## Aufräumen

```bash
azd down --force --purge
```

---

## Zusammenfassung

- `azd init` → **"Use code in the current directory"** fügt azd einer App hinzu, die Sie bereits haben.
- `azure.yaml` ordnet Ihre Code-Ordner Azure-Hosts zu; `infra/` definiert die Ressourcen als Bicep.
- `azd infra generate` ermöglicht es Ihnen, die generierte Infrastruktur zu überprüfen oder anzupassen.
- Nach der Initialisierung verwendet Ihre vorhandene App denselben `azd up` / `azd down`-Workflow wie eine vorlagenbasierte App.

---

## 🔗 Navigation

| Richtung | Lektion |
|-----------|--------|
| **Vorherige** | [Ihr erstes Projekt](first-project.md) |
| **Nächste** | [Dev-Container & Codespaces](dev-containers.md) |

## 📖 Verwandte Ressourcen

- [AZD-Grundlagen](azd-basics.md)
- [Kapitel 4: Infrastruktur als Code](../chapter-04-infrastructure/README.md)
- [Konfiguration & Authentifizierung](../chapter-03-configuration/authsecurity.md)
- [Befehlsübersicht](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->