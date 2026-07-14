# Bring Your Own App – azd zu einem bestehenden Projekt hinzufügen

**Kapitel-Navigation:**
- **📚 Kursstartseite**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 1 – Grundlagen & Schnellstart
- **⬅️ Vorheriges**: [Dein erstes Projekt](first-project.md)
- **➡️ Nächstes**: [Dev Containers & Codespaces](dev-containers.md)

> Validiert mit `azd 1.27.1` im Juli 2026.

## Einführung

Im [Dein erstes Projekt](first-project.md) hast du eine App bereitgestellt, indem du mit einer Vorlage begonnen hast. Aber meistens hast du schon *eine* App – eine Node.js API, einen Python Flask Service, eine .NET Web-App – in einem Ordner auf deinem Rechner liegen. Diese Lektion zeigt, wie du azd zu diesem bestehenden Code hinzufügst, damit du ihn mit `azd up` bereitstellen kannst, ganz ohne Vorlage.

## Lernziele

Am Ende dieser Lektion wirst du:
- Die drei Möglichkeiten kennen, ein azd-Projekt zu starten
- `azd init` in einem bestehenden Code ausführen können
- Verstehen, welche Rolle `azure.yaml` und der `infra/` Ordner für deine App spielen
- Wissen, wann azd die Infrastruktur generiert und wann du sie selbst schreiben solltest
- Deine bestehende App mit `azd up` in Azure bereitstellen können

## Lerninhalte

Nach Abschluss dieser Lektion wirst du in der Lage sein:
- azd in einem Projekt zu initialisieren, das du bereits hast
- Eine einfache `azure.yaml` Datei zu lesen und zu bearbeiten
- Starter-Infrastruktur mit `azd infra generate` zu erzeugen
- Einen geeigneten Azure-Host für deine App auszuwählen
- Deine eigene Anwendung bereitzustellen und wieder zu entfernen

---

## Drei Wege, ein azd-Projekt zu starten

| Startpunkt | Befehl | Wann verwenden? |
|----------------|---------|-------------|
| **Von einer Vorlage** | `azd init --template <name>` | Zum Lernen oder um eine neue App von einer bewährten Vorlage zu starten |
| **Von deinem bestehenden Code** | `azd init` (im Projektordner) | Du hast schon eine App und möchtest sie bereitstellen |
| **Von einem Git-Repo** | `azd init --from-code` (im geklonten Repo) | azd für ein bestehendes Repository übernehmen |

Du hast bereits die erste Option geübt. Diese Lektion behandelt die zweite – das häufigste Szenario in der Praxis.

---

## Schritt 1: Führe `azd init` in deinem Projekt aus

Öffne ein Terminal **innerhalb deines bestehenden Projektordners** und führe aus:

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

Wähle **"Code im aktuellen Verzeichnis verwenden."** azd durchsucht dann deinen Ordner, erkennt Sprache und Framework und schlägt einen Host vor.

### Was azd erkennt

azd sucht nach Hinweisen wie `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` oder einer `Dockerfile` und schlägt einen passenden Azure-Host vor:

| Deine App | Wahrscheinlich erkannter Host |
|----------|---------------------------|
| Node.js / Python / .NET Web-App | Azure App Service oder Container Apps |
| Containerisierte App (`Dockerfile`) | Azure Container Apps |
| Function App | Azure Functions |
| Statische Seite (React/Vue Build-Ausgabe) | Azure Static Web Apps |

Bestätige den erkannten Dienst/die erkannten Dienste, und azd erzeugt die nötigen Dateien.

---

## Schritt 2: Verstehe, was azd erstellt hat

Nach der Initialisierung findest du zwei neue Dinge in deinem Projekt:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` – die Projektdefinition

Dies ist das Herzstück eines azd-Projekts. Eine minimale Version sieht so aus:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Der Block `services` ist der wichtige Teil: jeder Eintrag ordnet einen Ordner deines Codes einem Azure-Host zu. Hat deine App Frontend und API, gibt es zwei Services.

### `infra/` – deine Azure-Ressourcen als Code

Im Ordner `infra/` findest du Bicep-Dateien, die die Azure-Ressourcen definieren, die deine App braucht (App Service, Datenbank usw.). Du musst diese nicht von Hand schreiben – azd erzeugt einen funktionierenden Startpunkt. Du *kannst* sie später bearbeiten, um Ressourcen hinzuzufügen oder die Sicherheit zu verbessern (genauer in [Kapitel 4](../chapter-04-infrastructure/README.md)).

> **Tipp:** Möchtest du die generierte Infrastruktur vor der Bereitstellung sehen oder anpassen? Führe `azd infra generate` aus (auch als `azd infra synth` verfügbar), um die IaC auf die Festplatte zu schreiben, damit du sie prüfen und versionieren kannst.

---

## Schritt 3: Erforderliche Konfiguration festlegen

Braucht deine App Einstellungen oder Geheimnisse (z. B. eine Verbindungszeichenfolge, einen API-Schlüssel), solltest du diese nicht hartkodieren. Nutze Umgebungswerte:

```bash
# Eine Umgebung erstellen
azd env new dev

# Einen nicht-geheimen Wert setzen
azd env set API_VERSION 1.0.0
```

Für echte Geheimnisse speichere sie in Key Vault und verweise aus deiner Infrastruktur darauf – siehe [Kapitel 3: Konfiguration & Authentifizierung](../chapter-03-configuration/authsecurity.md).

---

## Schritt 4: Bereitstellen

Nutze nun den dir vertrauten Workflow:

```bash
# Authentifizieren (erforderlich für azd)
azd auth login

# Vorschau der Ressourcen, die erstellt werden
azd provision --preview

# Infrastruktur bereitstellen und Ihren Code deployen
azd up
```

Nach Abschluss zeigt dir azd die URL deiner App an. Prüfe diese wie bei jeder azd-App:

```bash
azd show           # Endpunkte anzeigen
azd monitor --logs # Überprüfen Sie bei Bedarf die Protokolle
```

---

## Häufige Probleme beim ersten Mal

| Symptom | Wahrscheinliche Ursache | Lösung |
|---------|----------------------|--------|
| azd erkannte meine App nicht | Fehlendes Manifest (z. B. `package.json`) | Füge das Manifest hinzu oder wähle den Host manuell beim `azd init` |
| Build schlägt während `azd up` fehl | App braucht einen Build-Schritt | Füge `buildCommand`/`outputPath` unter dem Service in `azure.yaml` hinzu |
| App startet, liefert aber Fehler | Fehlende Konfiguration/Geheimnis | Werte mit `azd env set` setzen oder Key Vault einrichten |
| Falscher Host ausgewählt | Automatische Erkennung lag falsch | Bearbeite `host:` in `azure.yaml` und führe `azd up` erneut aus |

Mehr dazu findest du in [Kapitel 7: Fehlerbehebung](../chapter-07-troubleshooting/README.md).

---

## Aufräumen

```bash
azd down --force --purge
```

---

## Zusammenfassung

- `azd init` → **"Code im aktuellen Verzeichnis verwenden"** fügt azd zu einer vorhandenen App hinzu.
- `azure.yaml` ordnet deine Code-Ordner Azure-Hosts zu; `infra/` definiert die Ressourcen als Bicep.
- `azd infra generate` erlaubt es dir, die generierte Infrastruktur zu prüfen oder anzupassen.
- Nach der Initialisierung nutzt deine bestehende App den exakt gleichen `azd up` / `azd down` Workflow wie eine vorlagenbasierte App.

---

## 🔗 Navigation

| Richtung | Lektion |
|----------|---------|
| **Vorheriges** | [Dein erstes Projekt](first-project.md) |
| **Nächstes** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Verwandte Ressourcen

- [AZD Grundlagen](azd-basics.md)
- [Kapitel 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Konfiguration & Authentifizierung](../chapter-03-configuration/authsecurity.md)
- [Kommando-Spickzettel](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->