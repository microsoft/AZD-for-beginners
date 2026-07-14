# Kapitel 6: Planung & Validierung vor der Bereitstellung

**📚 Kurs**: [AZD für Anfänger](../../README.md) | **⏱️ Dauer**: 1 Stunde | **⭐ Komplexität**: Mittelstufe

---

## Übersicht

Dieses Kapitel behandelt wesentliche Planungs- und Validierungsschritte vor der Bereitstellung Ihrer Anwendung. Lernen Sie, kostspielige Fehler mit ordnungsgemäßer Kapazitätsplanung, SKU-Auswahl und Preflight-Checks zu vermeiden.

> Validiert mit `azd 1.27.1` im Juli 2026.

## Lernziele

Nach Abschluss dieses Kapitels werden Sie:
- Preflight-Checks vor der Bereitstellung durchführen
- Kapazität planen und Ressourcenbedarf schätzen
- Geeignete SKUs für Kostenoptimierung auswählen
- Application Insights zur Überwachung konfigurieren
- Muster der Teamkoordination verstehen

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Preflight-Checks](preflight-checks.md) | Konfiguration vor der Bereitstellung validieren | 15 min |
| 2 | [Kapazitätsplanung](capacity-planning.md) | Ressourcenbedarf schätzen | 20 min |
| 3 | [SKU-Auswahl](sku-selection.md) | Geeignete Preisklassen wählen | 15 min |
| 4 | [Application Insights](application-insights.md) | Überwachung konfigurieren | 20 min |
| 5 | [Koordinationsmuster](coordination-patterns.md) | Team-Bereitstellungsworkflows | 15 min |

---

## 🚀 Schnellstart

```bash
# Überprüfen Sie die Abonnementkontingente
az vm list-usage --location eastus --output table

# Bereitstellungsvorschau (keine Ressourcen erstellt)
azd provision --preview

# Bicep-Syntax validieren
az bicep build --file infra/main.bicep

# Überprüfen der Umgebungs konfiguratio
azd env get-values
```

---

## ☑️ Checkliste vor der Bereitstellung

### Vor `azd provision`

- [ ] Kontingent für Region geprüft
- [ ] SKUs passend ausgewählt
- [ ] Kostenschätzung überprüft
- [ ] Namenskonvention konsistent
- [ ] Sicherheit/RBAC konfiguriert

### Vor `azd deploy`

- [ ] Umgebungsvariablen gesetzt
- [ ] Geheimnisse im Key Vault
- [ ] Verbindungszeichenfolgen geprüft
- [ ] Health Checks konfiguriert

---

## 💰 SKU-Auswahl-Leitfaden

| Arbeitslast | Entwicklung | Produktion |
|----------|-------------|------------|
| Container Apps | Verbrauch | Dedizierte D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Modelle | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Vorheriges** | [Kapitel 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Nächstes** | [Kapitel 7: Fehlerbehebung](../chapter-07-troubleshooting/README.md) |

---

## 📖 Verwandte Ressourcen

- [Konfigurationsleitfaden](../chapter-03-configuration/configuration.md)
- [Bereitstellungsleitfaden](../chapter-04-infrastructure/deployment-guide.md)
- [Häufige Probleme](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->