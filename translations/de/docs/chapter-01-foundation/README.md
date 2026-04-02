# Kapitel 1: Grundlagen & Schnellstart

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Dauer**: 30-45 Minuten | **⭐ Schwierigkeitsgrad**: Anfänger

---

## Überblick

Dieses Kapitel stellt die Grundlagen der Azure Developer CLI (azd) vor. Sie lernen die Kernkonzepte, installieren die Tools und stellen Ihre erste Anwendung in Azure bereit.

> Validiert gegen `azd 1.23.12` im März 2026.

## Lernziele

Durch das Abschließen dieses Kapitels werden Sie:
- Verstehen, was Azure Developer CLI ist und wie sie sich von der Azure CLI unterscheidet
- AZD auf Ihrer Plattform installieren und konfigurieren
- Ihre erste Anwendung mit `azd up` in Azure bereitstellen
- Ressourcen mit `azd down` bereinigen

---

## 📚 Lektionen

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [AZD-Grundlagen](azd-basics.md) | Kernkonzepte, Terminologie und Projektstruktur | 15 Min. |
| 2 | [Installation & Einrichtung](installation.md) | Plattform-spezifische Installationsanleitungen | 10 Min. |
| 3 | [Ihr erstes Projekt](first-project.md) | Praxis: Eine Webanwendung in Azure bereitstellen | 20 Min. |

---

## ✅ Hier starten: Prüfen Sie Ihre Einrichtung

Bevor Sie beginnen, bestätigen Sie, dass Ihr lokaler Rechner für die Kapitel-1-Vorlage bereit ist:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Wenn das Skript fehlende Tools meldet, beheben Sie diese zuerst und fahren Sie dann mit dem Kapitel fort.

---

## 🚀 Schnellstart

```bash
# Installation überprüfen
azd version

# Für AZD authentifizieren
# Optional: 'az login', wenn Sie vorhaben, Azure-CLI-Befehle direkt auszuführen
azd auth login

# Ihre erste App bereitstellen
azd init --template todo-nodejs-mongo
azd up

# Nach Abschluss aufräumen
azd down --force --purge
```

---

## ✅ Erfolgskriterien

Nach Abschluss dieses Kapitels sollten Sie in der Lage sein:

```bash
azd version              # Zeigt die installierte Version an
azd init --template todo-nodejs-mongo  # Initialisiert das Projekt
azd up                   # Stellt in Azure bereit
azd show                 # Zeigt die URL der laufenden App an
azd down --force --purge # Bereinigt Ressourcen
```

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Weiter** | [Kapitel 2: KI-zentrierte Entwicklung](../chapter-02-ai-development/README.md) |
| **Springen zu** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |

---

## 📖 Verwandte Ressourcen

- [Befehlsübersicht](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossar](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mithilfe des KI-Übersetzungsdienstes [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist als maßgebliche Quelle zu betrachten. Für wichtige Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir haften nicht für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->