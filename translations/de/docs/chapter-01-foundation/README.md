# Kapitel 1: Grundlagen & Schnellstart

**📚 Kurs**: [AZD für Anfänger](../../README.md) | **⏱️ Dauer**: 75-120 Minuten inklusive der ersten Bereitstellung; zusätzliche Übungen dauern länger | **⭐ Komplexität**: Anfänger

---

## Übersicht

Dieses Kapitel führt in die Grundlagen der Azure Developer CLI (azd) ein. Sie lernen die Kernkonzepte, installieren die Werkzeuge und deployen Ihre erste Anwendung auf Azure.

> Ziel des Befehls- und Konfigurationsreviews: `azd 1.37.2` (November 2026). Live Azure-Bereitstellung wurde während des Reviews nicht durchgeführt.

## Lernziele

Nach Abschluss dieses Kapitels werden Sie:
- Verstehen, was Azure Developer CLI ist und wie es sich von Azure CLI unterscheidet
- AZD auf Ihrer Plattform installieren und konfigurieren
- Ihre erste Anwendung mit `azd up` auf Azure bereitstellen
- Ressourcen mit `azd down` bereinigen

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [AZD Grundlagen](azd-basics.md) | Kernkonzepte, Terminologie und Projektstruktur | 15 min |
| 2 | [Installation & Einrichtung](installation.md) | Plattform-spezifische Installationsanleitungen | 10 min |
| 3 | [Ihr erstes Projekt](first-project.md) | Praxis: Bereitstellung einer Web-App auf Azure | 20 min |
| 4 | [Bringen Sie Ihre eigene App mit](bring-your-own-app.md) | azd zu einem bestehenden Projekt hinzufügen | 15 min |
| 5 | [Entwicklercontainer & Codespaces](dev-containers.md) | Reproduzierbare azd-Umgebungen mit Entwicklercontainern | 15 min |

---

## ✅ Starten Sie hier: Validieren Sie Ihre Einrichtung

Bevor Sie beginnen, bestätigen Sie, dass Ihr lokaler Rechner für die Vorlage aus Kapitel 1 bereit ist:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Falls das Skript fehlende Werkzeuge meldet, beheben Sie diese zuerst und fahren dann mit dem Kapitel fort.

---

## 🚀 Schnellstart

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Erfolgskriterien

Nach Abschluss dieses Kapitels sollten Sie in der Lage sein:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Nächstes** | [Kapitel 2: KI-Erste Entwicklung](../chapter-02-ai-development/README.md) |
| **Überspringen zu** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |

---

## 📖 Verwandte Ressourcen

- [Befehlsübersicht](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossar](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->