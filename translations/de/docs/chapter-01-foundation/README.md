# Kapitel 1: Grundlagen & Schnellstart

**📚 Kurs**: [AZD für Einsteiger](../../README.md) | **⏱️ Dauer**: 30-45 minutes | **⭐ Komplexität**: Anfänger

---

## Übersicht

Dieses Kapitel führt in die Grundlagen der Azure Developer CLI (azd) ein. Sie lernen die Kernkonzepte kennen, installieren die Werkzeuge und stellen Ihre erste Anwendung in Azure bereit.

> Validiert mit `azd 1.25.6` im Juni 2026.

## Lernziele

Nach Abschluss dieses Kapitels werden Sie:
- Verstehen, was die Azure Developer CLI ist und wie sie sich von der Azure CLI unterscheidet
- AZD auf Ihrer Plattform installieren und konfigurieren
- Mit `azd up` Ihre erste Anwendung nach Azure bereitstellen
- Mit `azd down` Ressourcen bereinigen

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [AZD-Grundlagen](azd-basics.md) | Kernkonzepte, Terminologie und Projektstruktur | 15 min |
| 2 | [Installation & Einrichtung](installation.md) | Plattformspezifische Installationsanleitungen | 10 min |
| 3 | [Ihr erstes Projekt](first-project.md) | Praxis: Eine Webanwendung nach Azure bereitstellen | 20 min |
| 4 | [Bringen Sie Ihre eigene App](bring-your-own-app.md) | azd zu einem vorhandenen Projekt hinzufügen | 15 min |
| 5 | [Dev-Container & Codespaces](dev-containers.md) | Reproduzierbare azd-Umgebungen mit Dev-Containern | 15 min |

---

## ✅ Starten Sie hier: Überprüfen Sie Ihre Umgebung

Bevor Sie beginnen, bestätigen Sie, dass Ihre lokale Maschine für die Kapitel-1-Vorlage bereit ist:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If the script reports missing tools, fix those first and then continue with the chapter.

---

## 🚀 Schnellstart

```bash
# Installation prüfen
azd version

# Für AZD authentifizieren
# Optional: Führen Sie az login aus, wenn Sie Azure-CLI-Befehle direkt ausführen möchten
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
azd version              # Zeigt die installierte Version an
azd init --template todo-nodejs-mongo  # Initialisiert das Projekt
azd up                   # Stellt in Azure bereit
azd show                 # Zeigt die URL der laufenden Anwendung an
azd down --force --purge # Bereinigt Ressourcen
```

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Nächstes** | [Kapitel 2: AI-First-Entwicklung](../chapter-02-ai-development/README.md) |
| **Direkt zu** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |

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