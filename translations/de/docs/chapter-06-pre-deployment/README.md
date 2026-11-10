# Kapitel 6: Planung und Validierung vor der Bereitstellung

**📚 Kurs**: [AZD für Anfänger](../../README.md) | **⏱️ Dauer**: 2-4 Stunden Lesen; zusätzliche Zeit für angepasste Labs | **⭐ Komplexität**: Mittel–Fortgeschritten

---

## Überblick

Dieses Kapitel behandelt wesentliche Planungs- und Validierungsschritte vor der Bereitstellung Ihrer Anwendung. Erfahren Sie, wie Sie kostspielige Fehler durch ordnungsgemäße Kapazitätsplanung, SKU-Auswahl und Preflight-Checks vermeiden.

> Befehlsanweisungen wurden anhand der veröffentlichten `azd 1.37.2` Referenz geprüft. Cloud-Bereitstellungen wurden nicht durchgeführt. Die längeren Lektionen enthalten illustrative Fragmente, keine vollständigen lokalen Bereitstellungsprojekte.

## Lernziele

Nach Abschluss dieses Kapitels werden Sie:
- Preflight-Checks vor der Bereitstellung durchführen
- Kapazität planen und Ressourcenbedarf abschätzen
- Geeignete SKUs für Kostenoptimierung auswählen
- Application Insights für das Monitoring konfigurieren
- Muster zur Koordination mehrerer Agenten und deren Bereitstellungsanforderungen verstehen

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|---------|--------------|------|
| 1 | [Preflight-Checks](preflight-checks.md) | Konfiguration vor der Bereitstellung validieren | 15 Min |
| 2 | [Kapazitätsplanung](capacity-planning.md) | Ressourcenbedarf abschätzen | 20 Min |
| 3 | [SKU-Auswahl](sku-selection.md) | Geeignete Preisklassen auswählen | 15 Min |
| 4 | [Application Insights](application-insights.md) | Monitoring konfigurieren | 20 Min |
| 5 | [Koordinationsmuster](coordination-patterns.md) | Fortgeschrittenes Design für Multi-Agent-Orchestrierung | 60-75 Min |

---

## 🚀 Schnellstart

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ Checkliste vor der Bereitstellung

### Vor `azd provision`

- [ ] Kontingent für Region überprüft
- [ ] SKUs passend ausgewählt
- [ ] Kostenschätzung überprüft
- [ ] Namenskonvention konsistent
- [ ] Sicherheit/RBAC konfiguriert

### Vor `azd deploy`

- [ ] Umgebungsvariablen gesetzt
- [ ] Geheimnisse im Key Vault
- [ ] Verbindungszeichenfolgen überprüft
- [ ] Gesundheitsprüfungen konfiguriert

---

## 💰 Anleitung zur SKU-Auswahl

| Arbeitslast | Entwicklung | Produktion |
|-----------|-------------|------------|
| Container-Apps | Consumption | Consumption oder dediziertes Arbeitslastprofil, basierend auf gemessener Last |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI-Modelle | Unterstützter Pay-as-you-go-Bereitstellungstyp | Pay-as-you-go oder bereitgestellte Durchsatzkapazität; modell-/regionsabhängig |
| AI-Suche | Free/Basic innerhalb der Grenzen | Basic- oder Standard-Stufe, bemessen an Index, Replikaten und Abfragelast |

---

## 🔗 Navigation

| Richtung | Kapitel |
|----------|---------|
| **Vorheriges** | [Kapitel 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Nächstes** | [Kapitel 7: Fehlerbehebung](../chapter-07-troubleshooting/README.md) |

---

## 📖 Verwandte Ressourcen

- [Konfigurationsanleitung](../chapter-03-configuration/configuration.md)
- [Bereitstellungsanleitung](../chapter-04-infrastructure/deployment-guide.md)
- [Häufige Probleme](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->