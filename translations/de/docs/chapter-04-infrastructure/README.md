# Kapitel 4: Infrastruktur als Code & Bereitstellung

**📚 Kurs**: [AZD für Anfänger](../../README.md) | **⏱️ Dauer**: 1-1.5 Stunden | **⭐ Komplexität**: Mittel

---

## Übersicht

Dieses Kapitel behandelt Infrastructure as Code (IaC)-Muster mit Bicep-Vorlagen, Ressourcenbereitstellung und Bereitstellungsstrategien mithilfe der Azure Developer CLI.

## Lernziele

Nach Abschluss dieses Kapitels werden Sie:
- Die Struktur und Syntax von Bicep-Vorlagen verstehen
- Azure-Ressourcen mit `azd provision` bereitstellen
- Anwendungen mit `azd deploy` bereitstellen
- Blue-Green- und Rolling-Bereitstellungsstrategien implementieren

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | Azure-Ressourcenverwaltung mit AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | Anwendungsbereitstellungsstrategien | 45 min |

---

## 🚀 Schnellstart

```bash
# Von einer Vorlage initialisieren
azd init --template azure-functions-python-v2-http

# Vorschau auf das, was erstellt wird
azd provision --preview

# Nur Infrastruktur bereitstellen
azd provision

# Nur Code bereitstellen
azd deploy

# Oder beides zusammen
azd up
```

---

## 📁 AZD-Projektstruktur

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Wichtige Befehle

| Befehl | Beschreibung |
|---------|-------------|
| `azd init` | Projekt initialisieren |
| `azd provision` | Azure-Ressourcen erstellen |
| `azd deploy` | Anwendungscode bereitstellen |
| `azd up` | provision + deploy |
| `azd down` | Alle Ressourcen löschen |

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Vorheriges** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |
| **Nächstes** | [Kapitel 5: Multi-Agent-Lösungen](../chapter-05-multi-agent/README.md) |

---

## 📖 Verwandte Ressourcen

- [Prüfungen vor der Bereitstellung](../chapter-06-pre-deployment/README.md)
- [Beispiele für Container-Apps](../../examples/container-app/README.md)
- [Beispiel für Datenbank-App](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst Co-op Translator (https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ausgangssprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen empfehlen wir eine professionelle menschliche Übersetzung. Wir haften nicht für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->