# Kapitel 1: Grundlagen & Schnellstart

**📚 Kurs**: [AZD Für Einsteiger](../../README.md) | **⏱️ Dauer**: 30-45 Minuten | **⭐ Komplexität**: Anfänger

---

## Überblick

Dieses Kapitel führt in die Grundlagen der Azure Developer CLI (azd) ein. Sie lernen Kernkonzepte, installieren die Tools und stellen Ihre erste Anwendung auf Azure bereit.

> Validiert mit `azd 1.27.1` im Juli 2026.

## Lernziele

Nach Abschluss dieses Kapitels werden Sie:
- Verstehen, was Azure Developer CLI ist und wie sie sich von Azure CLI unterscheidet
- AZD auf Ihrer Plattform installieren und konfigurieren
- Ihre erste Anwendung mit `azd up` auf Azure bereitstellen
- Ressourcen mit `azd down` bereinigen

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [AZD Grundlagen](azd-basics.md) | Kernkonzepte, Terminologie und Projektstruktur | 15 Min |
| 2 | [Installation & Einrichtung](installation.md) | Plattform-spezifische Installationsanleitungen | 10 Min |
| 3 | [Ihr Erstes Projekt](first-project.md) | Praxis: Eine Web-App auf Azure bereitstellen | 20 Min |
| 4 | [Bring Your Own App](bring-your-own-app.md) | azd zu einem vorhandenen Projekt hinzufügen | 15 Min |
| 5 | [Dev-Container & Codespaces](dev-containers.md) | Reproduzierbare azd-Umgebungen mit Dev-Containern | 15 Min |

---

## ✅ Starten Sie hier: Validieren Sie Ihre Einrichtung

Bevor Sie beginnen, stellen Sie sicher, dass Ihr lokaler Rechner für die Kapitel 1 Vorlage bereit ist:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Wenn das Skript fehlende Tools meldet, beheben Sie diese zuerst und fahren dann mit dem Kapitel fort.

---

## 🚀 Schnellstart

```bash
# Installation überprüfen
azd version

# Für AZD authentifizieren
# Optional: az login, wenn Sie planen, Azure CLI-Befehle direkt auszuführen
azd auth login

# Ihre erste App bereitstellen
azd init --template todo-nodejs-mongo
azd up

# Aufräumen, wenn Sie fertig sind
azd down --force --purge
```

---

## ✅ Erfolgskriterien

Nach Abschluss dieses Kapitels sollten Sie in der Lage sein:

```bash
azd version              # Zeigt installierte Version an
azd init --template todo-nodejs-mongo  # Initialisiert Projekt
azd up                   # Stellt in Azure bereit
azd show                 # Zeigt laufende App-URL an
azd down --force --purge # Räumt Ressourcen auf
```

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Nächstes** | [Kapitel 2: KI-First Entwicklung](../chapter-02-ai-development/README.md) |
| **Überspringen zu** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |

---

## 📖 Verwandte Ressourcen

- [Kommando-Spickzettel](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossar](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->