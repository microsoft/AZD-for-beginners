# Kapitel 4: Infrastruktur als Code & Bereitstellung

**📚 Kurs**: [AZD Für Anfänger](../../README.md) | **⏱️ Dauer**: 2-3 Stunden Lesezeit; zusätzliche Zeit für Bereitstellungsübungen einplanen | **⭐ Komplexität**: Mittelstufe

---

## Überblick

Dieses Kapitel behandelt Infrastructure as Code (IaC) Muster mit Bicep-Vorlagen, Ressourcenbereitstellung und Bereitstellungsstrategien mit dem Azure Developer CLI.

> Ziel der Befehls- und Konfigurationsüberprüfung: `azd 1.37.2` (November 2026). Eine Live-Azure-Bereitstellung wurde während der Überprüfung nicht ausgeführt.

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
| 1 | [Ressourcen bereitstellen](provisioning.md) | Azure-Ressourcenverwaltung mit AZD | 45 Min |
| 2 | [Bereitstellungsleitfaden](deployment-guide.md) | Anwendungsbereitstellungsstrategien | 45 Min |
| 3 | [Erstellen Ihrer eigenen Vorlage](custom-templates.md) | Wiederverwendbare azd-Vorlagen erstellen und veröffentlichen | 30 Min |

---

## 🚀 Schnellstart

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
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
| `azd deploy` | Anwendungs-Code bereitstellen |
| `azd up` | bereitstellen + deployen |
| `azd down` | Alle Ressourcen löschen |

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Vorheriges** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |
| **Nächstes** | [Kapitel 5: Multi-Agenten-Lösungen](../chapter-05-multi-agent/README.md) |

---

## 📖 Verwandte Ressourcen

- [Pre-Deployment-Checks](../chapter-06-pre-deployment/README.md)
- [Container-App-Beispiele](../../examples/container-app/README.md)
- [Datenbank-App-Beispiel](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->