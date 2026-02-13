# Kapitel 6: Planung und Validierung vor der Bereitstellung

**📚 Kurs**: [AZD für Anfänger](../../README.md) | **⏱️ Dauer**: 1 Stunde | **⭐ Komplexität**: Mittel

---

## Übersicht

Dieses Kapitel behandelt wichtige Planungs- und Validierungsschritte vor der Bereitstellung Ihrer Anwendung. Lernen Sie, kostspielige Fehler mit angemessener Kapazitätsplanung, SKU-Auswahl und Vorabprüfungen zu vermeiden.

## Lernziele

Durch den Abschluss dieses Kapitels werden Sie:
- Vorabprüfungen vor der Bereitstellung durchführen
- Kapazität planen und Ressourcenbedarf schätzen
- Geeignete SKUs zur Kostenoptimierung auswählen
- Application Insights für die Überwachung konfigurieren
- Muster zur Teamkoordination verstehen

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Preflight-Prüfungen](preflight-checks.md) | Konfiguration vor der Bereitstellung validieren | 15 min |
| 2 | [Kapazitätsplanung](capacity-planning.md) | Ressourcenbedarf schätzen | 20 min |
| 3 | [SKU-Auswahl](sku-selection.md) | Geeignete Preisklassen auswählen | 15 min |
| 4 | [Application Insights](application-insights.md) | Überwachung konfigurieren | 20 min |
| 5 | [Koordinationsmuster](coordination-patterns.md) | Workflows für Team-Bereitstellungen | 15 min |

---

## 🚀 Schnellstart

```bash
# Abonnementkontingente überprüfen
az vm list-usage --location eastus --output table

# Bereitstellungsvorschau (keine Ressourcen werden erstellt)
azd provision --preview

# Bicep-Syntax validieren
az bicep build --file infra/main.bicep

# Umgebungskonfiguration überprüfen
azd env get-values
```

---

## ☑️ Checkliste vor der Bereitstellung

### Vor `azd provision`

- [ ] Kontingent für die Region überprüft
- [ ] SKUs angemessen ausgewählt
- [ ] Kostenschätzung überprüft
- [ ] Namenskonvention einheitlich
- [ ] Sicherheit/RBAC konfiguriert

### Vor `azd deploy`

- [ ] Umgebungsvariablen gesetzt
- [ ] Geheimnisse im Key Vault
- [ ] Verbindungszeichenfolgen überprüft
- [ ] Health-Checks konfiguriert

---

## 💰 SKU-Auswahl

| Arbeitslast | Entwicklung | Produktion |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Vorheriges** | [Kapitel 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Nächstes** | [Kapitel 7: Fehlerbehebung](../chapter-07-troubleshooting/README.md) |

---

## 📖 Verwandte Ressourcen

- [Konfigurationsanleitung](../chapter-03-configuration/configuration.md)
- [Bereitstellungsleitfaden](../chapter-04-infrastructure/deployment-guide.md)
- [Häufige Probleme](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mithilfe des KI-Übersetzungsdienstes [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist die maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir haften nicht für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->