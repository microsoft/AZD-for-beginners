# Kapitel 6: Planung & Validierung vor der Bereitstellung

**📚 Kurs**: [AZD für Anfänger](../../README.md) | **⏱️ Dauer**: 1 Stunde | **⭐ Komplexität**: Mittel

---

## Überblick

Dieses Kapitel behandelt wesentliche Planungs- und Validierungsschritte, bevor Sie Ihre Anwendung bereitstellen. Lernen Sie, teure Fehler mit angemessener Kapazitätsplanung, SKU-Auswahl und Preflight-Prüfungen zu vermeiden.

> Validiert gegen `azd 1.25.6` im Juni 2026.

## Lernziele

Wenn Sie dieses Kapitel abgeschlossen haben, werden Sie:
- Preflight-Prüfungen vor der Bereitstellung durchführen
- Kapazitäten planen und den Ressourcenbedarf schätzen
- Geeignete SKUs zur Kostenoptimierung auswählen
- Application Insights für das Monitoring konfigurieren
- Team-Koordinationsmuster verstehen

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Preflight-Checks](preflight-checks.md) | Konfiguration vor der Bereitstellung validieren | 15 Min. |
| 2 | [Kapazitätsplanung](capacity-planning.md) | Ressourcenbedarf schätzen | 20 Min. |
| 3 | [SKU-Auswahl](sku-selection.md) | Geeignete Preisklassen auswählen | 15 Min. |
| 4 | [Application Insights](application-insights.md) | Überwachung konfigurieren | 20 Min. |
| 5 | [Koordinationsmuster](coordination-patterns.md) | Team-Bereitstellungs-Workflows | 15 Min. |

---

## 🚀 Schnellstart

```bash
# Abonnementkontingente prüfen
az vm list-usage --location eastus --output table

# Bereitstellungsvorschau (keine Ressourcen werden erstellt)
azd provision --preview

# Bicep-Syntax validieren
az bicep build --file infra/main.bicep

# Umgebungskonfiguration prüfen
azd env get-values
```

---

## ☑️ Checkliste vor der Bereitstellung

### Vor `azd provision`

- [ ] Kontingent für die Region überprüft
- [ ] SKUs passend ausgewählt
- [ ] Kostenabschätzung überprüft
- [ ] Namenskonvention einheitlich
- [ ] Sicherheit/RBAC konfiguriert

### Vor `azd deploy`

- [ ] Umgebungsvariablen gesetzt
- [ ] Geheimnisse im Key Vault hinterlegt
- [ ] Verbindungszeichenfolgen überprüft
- [ ] Health-Checks konfiguriert

---

## 💰 SKU-Auswahl-Leitfaden

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Vorherige** | [Kapitel 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Nächste** | [Kapitel 7: Fehlerbehebung](../chapter-07-troubleshooting/README.md) |

---

## 📖 Verwandte Ressourcen

- [Konfigurationsanleitung](../chapter-03-configuration/configuration.md)
- [Bereitstellungsleitfaden](../chapter-04-infrastructure/deployment-guide.md)
- [Häufige Probleme](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->