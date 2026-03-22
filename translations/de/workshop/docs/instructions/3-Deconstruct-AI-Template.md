# 3. Zerlegen einer Vorlage

!!! tip "AM ENDE DIESES MODULS WERDEN SIE IN DER LAGE SEIN"

    - [ ] Aktivieren Sie GitHub Copilot mit MCP-Servern für Azure-Unterstützung
    - [ ] Verstehen Sie die AZD-Vorlagenordnerstruktur und -komponenten
    - [ ] Erkunden Sie Organisationsmuster für Infrastructure-as-Code (Bicep)
    - [ ] **Lab 3:** Verwenden Sie GitHub Copilot, um die Repository-Architektur zu erkunden und zu verstehen 

---


Mit AZD-Vorlagen und der Azure Developer CLI (`azd`) können wir unsere KI-Entwicklungsreise schnell mit standardisierten Repositories starten, die Beispielcode, Infrastruktur- und Konfigurationsdateien in Form eines einsatzbereiten _Starter_-Projekts bereitstellen.

**Aber jetzt müssen wir die Projektstruktur und den Code verstehen - und in der Lage sein, die AZD-Vorlage anzupassen - ohne vorherige Erfahrung oder Kenntnisse von AZD!**

---

## 1. GitHub Copilot aktivieren

### 1.1 Installieren Sie GitHub Copilot Chat

Es ist Zeit, [GitHub Copilot mit Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) zu erkunden. Nun können wir natürliche Sprache verwenden, um unsere Aufgabe auf hoher Ebene zu beschreiben und Hilfe bei der Ausführung zu erhalten. Für dieses Lab verwenden wir den [Copilot Free plan](https://github.com/github-copilot/signup), der ein monatliches Limit für Completions und Chat-Interaktionen hat.

Die Erweiterung kann aus dem Marketplace installiert werden, sollte jedoch bereits in Ihrer Codespaces-Umgebung verfügbar sein. _Klicken Sie `Open Chat` im Dropdown des Copilot-Symbols - und geben Sie eine Eingabeaufforderung wie `What can you do?` ein_ - es kann sein, dass Sie aufgefordert werden, sich anzumelden. **GitHub Copilot Chat ist einsatzbereit**.

### 1.2. MCP-Server installieren

Damit der Agent Mode effektiv ist, benötigt er Zugriff auf die richtigen Tools, um Wissen abzurufen oder Aktionen durchzuführen. Hier können MCP-Server helfen. Wir konfigurieren die folgenden Server:

1. [Azure MCP-Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP-Server](../../../../../workshop/docs/instructions)

Um diese zu aktivieren:

1. Erstellen Sie eine Datei namens `.vscode/mcp.json`, falls sie nicht existiert
1. Kopieren Sie das Folgende in diese Datei - und starten Sie die Server!
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "Möglicherweise erhalten Sie einen Fehler, dass `npx` nicht installiert ist (zum Beheben anklicken)"

      Um das zu beheben, öffnen Sie die Datei `.devcontainer/devcontainer.json` und fügen Sie diese Zeile in den Abschnitt features ein. Bauen Sie dann den Container neu. Sie sollten jetzt `npx` installiert haben.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Testen Sie GitHub Copilot Chat

**Verwenden Sie zuerst `az login`, um sich von der VS Code-Befehlszeile bei Azure zu authentifizieren.**

Sie sollten nun in der Lage sein, den Status Ihres Azure-Abonnements abzufragen und Fragen zu bereitgestellten Ressourcen oder Konfigurationen zu stellen. Probieren Sie diese Eingaben aus:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Sie können auch Fragen zur Azure-Dokumentation stellen und Antworten erhalten, die auf dem Microsoft Docs MCP-Server basieren. Probieren Sie diese Eingaben aus:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Oder Sie können nach Code-Snippets fragen, um eine Aufgabe zu erledigen. Probieren Sie diese Eingabe aus.

1. `Give me a Python code example that uses AAD for an interactive chat client`

Im „Ask“-Modus liefert dies Code, den Sie kopieren und ausprobieren können. Im „Agent“-Modus kann dies noch einen Schritt weiter gehen und die relevanten Ressourcen für Sie erstellen – einschließlich Setup-Skripten und Dokumentation – um Ihnen bei der Ausführung dieser Aufgabe zu helfen.

**Sie sind jetzt bereit, das Template-Repository zu erkunden**

---

## 2. Architektur dekodieren

??? prompt "FRAGE: Erklären Sie die Anwendungsarchitektur in docs/images/architecture.png in einem Absatz"

      Diese Anwendung ist eine KI-gestützte Chat-Anwendung, die auf Azure aufgebaut ist und eine moderne, agentenbasierte Architektur demonstriert. Die Lösung zentriert sich um eine Azure Container App, die den Hauptanwendungscode hostet, Eingaben der Benutzer verarbeitet und durch einen KI-Agenten intelligente Antworten erzeugt. 
      
      Die Architektur nutzt Microsoft Foundry Project als Grundlage für KI-Funktionen und verbindet sich mit Azure AI Services, die die zugrunde liegenden Sprachmodelle (wie gpt-4.1-mini) und Agentenfunktionen bereitstellen. Benutzerinteraktionen fließen durch ein React-basiertes Frontend zu einem FastAPI-Backend, das mit dem KI-Agenten-Service kommuniziert, um kontextuelle Antworten zu generieren. 
      
      Das System integriert Wissensabruf-Funktionen entweder über Dateisuche oder den Azure AI Search-Dienst, sodass der Agent auf hochgeladene Dokumente zugreifen und diese zitieren kann. Für operative Exzellenz umfasst die Architektur umfassendes Monitoring über Application Insights und Log Analytics Workspace für Tracing, Logging und Leistungsoptimierung. 
      
      Azure Storage stellt Blob-Speicher für Anwendungsdaten und Datei-Uploads bereit, während Managed Identity den sicheren Zugriff zwischen Azure-Ressourcen ohne Speicherung von Anmeldeinformationen gewährleistet. Die gesamte Lösung ist auf Skalierbarkeit und Wartbarkeit ausgelegt, wobei die containerisierte Anwendung automatisch basierend auf der Nachfrage skaliert und integrierte Sicherheit, Überwachung und CI/CD-Fähigkeiten durch Azures verwaltete Dienste bietet.

![Architektur](../../../../../translated_images/de/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repository-Struktur

!!! prompt "FRAGE: Erklären Sie die Template-Ordnerstruktur. Beginnen Sie mit einem visuellen hierarchischen Diagramm."

??? info "ANTWORT: Visuelles hierarchisches Diagramm"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Azure Developer CLI configuration
      │   ├── docker-compose.yaml           # Lokale Entwicklungscontainer
      │   ├── pyproject.toml                # Python-Projektkonfiguration
      │   ├── requirements-dev.txt          # Entwicklungsabhängigkeiten
      │   └── .devcontainer/                # VS Code Dev-Container-Einrichtung
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # Haupt-Infrastrukturvorlage
      │   ├── api.bicep                     # API-spezifische Ressourcen
      │   ├── main.parameters.json          # Infrastrukturparameter
      │   └── core/                         # Modulare Infrastrukturkomponenten
      │       ├── ai/                       # KI-Dienstkonfigurationen
      │       ├── host/                     # Hosting-Infrastruktur
      │       ├── monitor/                  # Überwachung und Logging
      │       ├── search/                   # Azure AI Search Einrichtung
      │       ├── security/                 # Sicherheit und Identität
      │       └── storage/                  # Storage-Account-Konfigurationen
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # Backend-API
      │   │   ├── main.py                   # FastAPI-Anwendungseinstieg
      │   │   ├── routes.py                 # API-Routendefinitionen
      │   │   ├── search_index_manager.py   # Suchfunktionalität
      │   │   ├── data/                     # API-Datenverarbeitung
      │   │   ├── static/                   # Statische Webassets
      │   │   └── templates/                # HTML-Vorlagen
      │   ├── frontend/                     # React/TypeScript-Frontend
      │   │   ├── package.json              # Node.js-Abhängigkeiten
      │   │   ├── vite.config.ts            # Vite-Build-Konfiguration
      │   │   └── src/                      # Frontend-Quellcode
      │   ├── data/                         # Beispieldateien
      │   │   └── embeddings.csv            # Vorgecompute Embeddings
      │   ├── files/                        # Wissensdatenbank-Dateien
      │   │   ├── customer_info_*.json      # Kundenbeispieldaten
      │   │   └── product_info_*.md         # Produktdokumentation
      │   ├── Dockerfile                    # Container-Konfiguration
      │   └── requirements.txt              # Python-Abhängigkeiten
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Post-Deployment-Einrichtung
      │   ├── setup_credential.sh/.ps1     # Anmeldeinformationskonfiguration
      │   ├── validate_env_vars.sh/.ps1    # Umgebungsvariablen-Validierung
      │   └── resolve_model_quota.sh/.ps1  # Modell-Quota-Verwaltung
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # Unit- und Integrationstests
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agentenbewertungs-Framework
      │   │   ├── evaluate.py               # Bewertungs-Runner
      │   │   ├── eval-queries.json         # Testabfragen
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Entwicklungs-Spielwiese
      │   │   ├── 1-quickstart.py           # Einstiegbeispiele
      │   │   └── aad-interactive-chat.py   # Authentifizierungsbeispiele
      │   └── airedteaming/                 # AI-Sicherheitsbewertung
      │       └── ai_redteaming.py          # Red-Team-Tests
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # Bereitstellungsanleitung
      │   ├── local_development.md          # Lokale Einrichtungshinweise
      │   ├── troubleshooting.md            # Häufige Probleme & Lösungen
      │   ├── azure_account_setup.md        # Azure-Voraussetzungen
      │   └── images/                       # Dokumentations-Assets
      │
      └── 📄 Project Metadata
         ├── README.md                     # Projektübersicht
         ├── CODE_OF_CONDUCT.md           # Verhaltenskodex
         ├── CONTRIBUTING.md              # Beitragshinweise
         ├── LICENSE                      # Lizenzbedingungen
         └── next-steps.md                # Hinweise nach der Bereitstellung
      ```

### 3.1. Kernanwendungsarchitektur

Diese Vorlage folgt einem **Full-Stack-Webanwendungs**-Muster mit:

- **Backend**: Python FastAPI mit Azure AI-Integration
- **Frontend**: TypeScript/React mit Vite-Build-System
- **Infrastruktur**: Azure Bicep-Vorlagen für Cloud-Ressourcen
- **Containerisierung**: Docker für konsistente Bereitstellung

### 3.2 Infra As Code (bicep)

Die Infrastrukturebene verwendet **Azure Bicep**-Vorlagen, die modular organisiert sind:

   - **`main.bicep`**: Orchestriert alle Azure-Ressourcen
   - **`core/` modules**: Wiederverwendbare Komponenten für verschiedene Dienste
      - KI-Dienste (Microsoft Foundry Models, AI Search)
      - Container-Hosting (Azure Container Apps)
      - Überwachung (Application Insights, Log Analytics)
      - Sicherheit (Key Vault, Managed Identity)

### 3.3 Application Source (`src/`)

**Backend-API (`src/api/`)**:

- FastAPI-basierte REST-API
- Foundry Agents-Integration
- Verwaltung von Suchindizes für Wissensabruf
- Datei-Upload- und Verarbeitungsfunktionen

**Frontend (`src/frontend/`)**:

- Moderne React/TypeScript-SPA
- Vite für schnelle Entwicklung und optimierte Builds
- Chat-Oberfläche für Agenten-Interaktionen

**Wissensdatenbank (`src/files/`)**:

- Beispieldaten zu Kunden und Produkten
- Demonstriert dateibasierten Wissensabruf
- JSON- und Markdown-Beispiel-Formate


### 3.4 DevOps & Automatisierung

**Skripte (`scripts/`)**:

- Plattformübergreifende PowerShell- und Bash-Skripte
- Umgebungsvalidierung und Setup
- Post-Deployment-Konfiguration
- Verwaltung von Modellquoten

**Azure Developer CLI-Integration**:

- `azure.yaml` Konfiguration für `azd`-Workflows
- Automatisierte Provisionierung und Bereitstellung
- Verwaltung von Umgebungsvariablen

### 3.5 Test & Qualitätssicherung

**Evaluierungs-Framework (`evals/`)**:

- Bewertung der Agentenleistung
- Qualitätsprüfung von Anfrage-Antwort-Paaren
- Automatisierte Bewertungs-Pipeline

**AI-Sicherheit (`airedteaming/`)**:

- Red-Team-Tests für AI-Sicherheit
- Scannen nach Sicherheitslücken
- Praktiken für verantwortungsvolle KI

---

## 4. Herzlichen Glückwunsch 🏆

Sie haben erfolgreich GitHub Copilot Chat mit MCP-Servern verwendet, um das Repository zu erkunden.

- [X] GitHub Copilot für Azure aktiviert
- [X] Die Anwendungsarchitektur verstanden
- [X] Die AZD-Vorlagenstruktur erkundet

Dies gibt Ihnen einen Eindruck von den _Infrastructure-as-Code_-Ressourcen dieser Vorlage. Als Nächstes schauen wir uns die Konfigurationsdatei für AZD an.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst Co-op Translator (https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, können automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten. Das Originaldokument in seiner Ausgangssprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir haften nicht für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->