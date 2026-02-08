# Kapitel 1: Grundlagen & Schnellstart

**📚 Kurs**: [AZD für Einsteiger](../../README.md) | **⏱️ Dauer**: 30-45 Minuten | **⭐ Komplexität**: Anfänger

---

## Überblick

Dieses Kapitel führt in die Grundlagen der Azure Developer CLI (azd) ein. Du lernst Kernkonzepte, installierst die Tools und stellst deine erste Anwendung in Azure bereit.

## Lernziele

By completing this chapter, you will:
- Verstehen, was Azure Developer CLI ist und wie es sich von Azure CLI unterscheidet
- AZD auf deiner Plattform installieren und konfigurieren
- Deine erste Anwendung mit `azd up` in Azure bereitstellen
- Ressourcen mit `azd down` bereinigen

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Dauer |
|---|--------|-------------|------|
| 1 | [AZD-Grundlagen](azd-basics.md) | Kernkonzepte, Terminologie und Projektstruktur | 15 Min. |
| 2 | [Installation & Einrichtung](installation.md) | Plattformspezifische Installationsanleitungen | 10 Min. |
| 3 | [Dein erstes Projekt](first-project.md) | Praxis: Eine Webanwendung in Azure bereitstellen | 20 Min. |

---

## 🚀 Schnellstart

```bash
# Installation überprüfen
azd version

# Bei Azure anmelden
azd auth login

# Ihre erste App bereitstellen
azd init --template todo-nodejs-mongo
azd up

# Nach Abschluss aufräumen
azd down --force --purge
```

---

## ✅ Erfolgskriterien

Nach Abschluss dieses Kapitels solltest du in der Lage sein:

```bash
azd version              # Zeigt die installierte Version
azd init --template todo-nodejs-mongo  # Initialisiert das Projekt
azd up                   # Stellt in Azure bereit
azd show                 # Zeigt die URL der laufenden Anwendung an
azd down --force --purge # Bereinigt Ressourcen
```

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Weiter** | [Kapitel 2: KI-fokussierte Entwicklung](../chapter-02-ai-development/README.md) |
| **Springe zu** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |

---

## 📖 Verwandte Ressourcen

- [Befehlsübersicht](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossar](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mithilfe des KI-Übersetzungsdienstes [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->