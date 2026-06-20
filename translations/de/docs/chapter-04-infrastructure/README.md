# Kapitel 4: Infrastructure as Code & Bereitstellung

**📚 Kurs**: [AZD für Einsteiger](../../README.md) | **⏱️ Dauer**: 1–1,5 Stunden | **⭐ Komplexität**: Mittel

---

## Überblick

Dieses Kapitel behandelt Infrastructure as Code (IaC)-Muster mit Bicep-Vorlagen, die Bereitstellung von Ressourcen und Bereitstellungsstrategien mit der Azure Developer CLI.

> Validiert gegen `azd 1.25.6` im Juni 2026.

## Lernziele

Nach Abschluss dieses Kapitels werden Sie:
- Die Struktur und Syntax von Bicep-Vorlagen verstehen
- Azure-Ressourcen mit `azd provision` bereitstellen
- Anwendungen mit `azd deploy` bereitstellen
- Blue-Green- und Rolling-Bereitstellungsstrategien implementieren

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Dauer |
|---|--------|-------------|------|
| 1 | [Ressourcen bereitstellen](provisioning.md) | Azure-Ressourcenverwaltung mit AZD | 45 Min |
| 2 | [Bereitstellungsanleitung](deployment-guide.md) | Strategien zur Anwendungsbereitstellung | 45 Min |
| 3 | [Eigene Vorlage erstellen](custom-templates.md) | Erstellen und Veröffentlichen wiederverwendbarer azd-Vorlagen | 30 Min |

---

## 🚀 Schnellstart

```bash
# Aus Vorlage initialisieren
azd init --template azure-functions-python-v2-http

# Vorschau, was erstellt wird
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

- [Checks vor der Bereitstellung](../chapter-06-pre-deployment/README.md)
- [Container-App-Beispiele](../../examples/container-app/README.md)
- [Datenbank-App-Beispiel](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->