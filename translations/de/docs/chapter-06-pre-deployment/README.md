# Kapitel 6: Planung vor der Bereitstellung & Validierung

**📚 Kurs**: [AZD für Einsteiger](../../README.md) | **⏱️ Dauer**: 1 Stunde | **⭐ Komplexität**: Mittel

---

## Überblick

Dieses Kapitel behandelt wesentliche Planungs- und Validierungsschritte vor der Bereitstellung Ihrer Anwendung. Lernen Sie, kostspielige Fehler durch richtige Kapazitätsplanung, SKU-Auswahl und Preflight-Checks zu vermeiden.

> Validiert gegen `azd 1.23.12` im März 2026.

## Lernziele

Nach Abschluss dieses Kapitels werden Sie:
- Preflight-Checks vor der Bereitstellung ausführen
- Kapazität planen und Ressourcenanforderungen abschätzen
- Geeignete SKUs zur Kostenoptimierung auswählen
- Application Insights für die Überwachung konfigurieren
- Muster der Teamkoordination verstehen

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Konfiguration vor der Bereitstellung validieren | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Ressourcenanforderungen abschätzen | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Geeignete Preisklassen auswählen | 15 min |
| 4 | [Application Insights](application-insights.md) | Überwachung konfigurieren | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Team-Deploy-Workflows | 15 min |

---

## 🚀 Schnellstart

```bash
# Abonnementkontingente prüfen
az vm list-usage --location eastus --output table

# Bereitstellung in Vorschau (keine Ressourcen erstellt)
azd provision --preview

# Bicep-Syntax validieren
az bicep build --file infra/main.bicep

# Umgebungskonfiguration prüfen
azd env get-values
```

---

## ☑️ Checkliste vor der Bereitstellung

### Vor `azd provision`

- [ ] Kontingent für Region überprüft
- [ ] SKUs angemessen ausgewählt
- [ ] Kostenabschätzung überprüft
- [ ] Namenskonvention konsistent
- [ ] Sicherheit/RBAC konfiguriert

### Vor `azd deploy`

- [ ] Umgebungsvariablen gesetzt
- [ ] Geheimnisse im Key Vault
- [ ] Verbindungszeichenfolgen überprüft
- [ ] Health Checks konfiguriert

---

## 💰 Leitfaden zur SKU-Auswahl

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Vorherige** | [Kapitel 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Nächste** | [Kapitel 7: Fehlerbehebung](../chapter-07-troubleshooting/README.md) |

---

## 📖 Verwandte Ressourcen

- [Konfigurationshandbuch](../chapter-03-configuration/configuration.md)
- [Bereitstellungsanleitung](../chapter-04-infrastructure/deployment-guide.md)
- [Häufige Probleme](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ausgangssprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->