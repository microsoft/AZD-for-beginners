# Kapitel 8: Produktions- & Unternehmensmuster

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Dauer**: 2-3 Stunden | **⭐ Schwierigkeit**: Fortgeschritten

---

## Übersicht

Dieses Kapitel behandelt unternehmensgerechte Bereitstellungsmuster, Absicherung, Monitoring und Kostenoptimierung für produktive KI-Workloads.

## Lernziele

Nach Abschluss dieses Kapitels können Sie:
- Mehrregionale resiliente Anwendungen bereitstellen
- Unternehmenssicherheitsmuster implementieren
- Umfassendes Monitoring konfigurieren
- Kosten im großen Maßstab optimieren
- CI/CD-Pipelines mit AZD einrichten

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Dauer |
|---|--------|-------------|------|
| 1 | [Produktive KI-Praktiken](production-ai-practices.md) | Bereitstellungsmuster für Unternehmen | 90 min |

---

## 🚀 Produktions-Checkliste

- [ ] Mehrregionale Bereitstellung für Ausfallsicherheit
- [ ] Verwaltete Identität für Authentifizierung (keine Schlüssel)
- [ ] Application Insights für Monitoring
- [ ] Kostenbudgets und Warnungen konfiguriert
- [ ] Sicherheitsscans aktiviert
- [ ] CI/CD-Pipeline-Integration
- [ ] Notfallwiederherstellungsplan

---

## 🏗️ Architekturmuster

### Muster 1: Microservices-KI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   API Gateway   │───▶│   AI Service    │───▶│   Azure OpenAI  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                      │
         ▼                      ▼
┌─────────────────┐    ┌─────────────────┐
│   Auth Service  │    │   Data Store    │
└─────────────────┘    └─────────────────┘
```

### Muster 2: Ereignisgesteuerte KI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Beste Sicherheitspraktiken

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 Kostenoptimierung

| Strategie | Einsparungen |
|----------|---------|
| Auf null skalieren (Container Apps) | 60-80% |
| Verbrauchsbasierte Tarife für Entwicklung verwenden | 50-70% |
| Geplante Skalierung | 30-50% |
| Reservierte Kapazität | 20-40% |

```bash
# Budgetwarnungen festlegen
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Monitoring-Einrichtung

```bash
# Protokolle streamen
azd monitor --logs

# Application Insights überprüfen
azd monitor

# Metriken anzeigen
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Vorheriges** | [Kapitel 7: Fehlerbehebung](../chapter-07-troubleshooting/README.md) |
| **Kurs abgeschlossen** | [Kurs-Startseite](../../README.md) |

---

## 📖 Verwandte Ressourcen

- [Leitfaden zu KI-Agenten](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Multi-Agenten-Lösungen](../chapter-05-multi-agent/README.md)
- [Microservices-Beispiel](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mithilfe des KI-Übersetzungsdienstes Co-op Translator (https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist als maßgebliche Quelle zu betrachten. Bei wichtigen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->