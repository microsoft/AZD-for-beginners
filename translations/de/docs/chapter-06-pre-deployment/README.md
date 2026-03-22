# Kapitel 6: Planung und Validierung vor der Bereitstellung

**📚 Kurs**: [AZD für Einsteiger](../../README.md) | **⏱️ Dauer**: 1 Stunde | **⭐ Komplexität**: Mittel

---

## Überblick

Dieses Kapitel behandelt wesentliche Planungs- und Validierungsschritte vor der Bereitstellung Ihrer Anwendung. Lernen Sie, kostspielige Fehler zu vermeiden durch richtige Kapazitätsplanung, SKU-Auswahl und Preflight-Prüfungen.

## Lernziele

Nach Abschluss dieses Kapitels werden Sie:
- Preflight-Prüfungen vor der Bereitstellung durchführen
- Kapazität planen und Ressourcenanforderungen schätzen
- Geeignete SKUs zur Kostenoptimierung auswählen
- Application Insights für die Überwachung konfigurieren
- Muster der Teamkoordination verstehen

---

## 📚 Lessons

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Preflight-Prüfungen](preflight-checks.md) | Konfiguration vor der Bereitstellung validieren | 15 min |
| 2 | [Kapazitätsplanung](capacity-planning.md) | Ressourcenanforderungen schätzen | 20 min |
| 3 | [SKU-Auswahl](sku-selection.md) | Geeignete Preisklassen auswählen | 15 min |
| 4 | [Application Insights](application-insights.md) | Überwachung konfigurieren | 20 min |
| 5 | [Koordinationsmuster](coordination-patterns.md) | Workflows für Team-Bereitstellungen | 15 min |

---

## 🚀 Schnellstart

```bash
# Abonnementquoten prüfen
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
- [ ] SKUs angemessen ausgewählt
- [ ] Kostenschätzung geprüft
- [ ] Namenskonvention einheitlich
- [ ] Sicherheit/RBAC konfiguriert

### Vor `azd deploy`

- [ ] Umgebungsvariablen gesetzt
- [ ] Geheimnisse im Key Vault hinterlegt
- [ ] Verbindungszeichenfolgen überprüft
- [ ] Health-Checks konfiguriert

---

## 💰 Leitfaden zur SKU-Auswahl

| Arbeitslast | Entwicklung | Produktiv |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
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
Haftungsausschluss:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache ist als maßgebliche Quelle zu betrachten. Bei kritischen Informationen empfehlen wir eine professionelle menschliche Übersetzung. Wir haften nicht für Missverständnisse oder Fehlinterpretationen, die aus der Nutzung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->