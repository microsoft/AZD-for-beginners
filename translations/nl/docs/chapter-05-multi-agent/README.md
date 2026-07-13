# Hoofdstuk 5: Multi-Agent AI Oplossingen

**📚 Cursus**: [AZD Voor Beginners](../../README.md) | **⏱️ Duur**: 2-3 uur | **⭐ Complexiteit**: Gevorderd

---

## Overzicht

Dit hoofdstuk behandelt geavanceerde multi-agent architectuurpatronen, agent orchestratie en productieklare AI-implementaties voor complexe scenario's.

> Gevalideerd tegen `azd 1.27.1` in juli 2026.

## Leerdoelen

Na het voltooien van dit hoofdstuk:
- Begrijpt u multi-agent architectuurpatronen
- Zet u gecoördineerde AI-agent systemen in
- Implementeert u agent-naar-agent communicatie
- Bouwt u productieklaar multi-agent oplossingen

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Multi-Agent Basisprincipes](multi-agent-basics.md) | Praktijk: zet een werkende multi-agent app in met `azd up` | 45 min |
| 2 | [Coördinatiepatronen](../chapter-06-pre-deployment/coordination-patterns.md) | Agent orchestratie strategieën (gaat verder in Hoofdstuk 6) | 30 min |
| 3 | [ARM Template Implementatie](../../examples/retail-multiagent-arm-template/README.md) | One-click implementatie voorbeeld | 30 min |

> **Begin met Les 1.** Dit is de enige volledig hands-on, implementeerbare les in dit hoofdstuk. Les 2 staat in Hoofdstuk 6 (gedeeld met pre-implementatie planning), en de [Retail Multi-Agent Oplossing](../../examples/retail-scenario.md) is een architectuursjabloon—een ontwerp referentie, geen one-command template.

---

## 🚀 Snelstart

```bash
# Optie 1: Implementeren vanuit een sjabloon
azd init --template agent-openai-python-prompty
azd up

# Optie 2: Implementeren vanuit een agentmanifest (vereist azure.ai.agents-extensie)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **Welke aanpak?** Gebruik `azd init --template` om te starten vanuit een werkend voorbeeld. Gebruik `azd ai agent init` wanneer u uw eigen agentmanifest hebt. Zie de [AZD AI CLI referentie](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) voor volledige details.

---

## 🤖 Multi-Agent Architectuur

```mermaid
graph TD
    Orchestrator[Orchestrator Agent<br/>Verzoekt routes, beheert workflow] --> Customer[Customer Agent<br/>Gebruikersvragen, voorkeuren]
    Orchestrator --> Inventory[Inventory Agent<br/>Voorraadniveaus, bestellingen]
```

---

## 🎯 Uitgelichte Oplossing: Retail Multi-Agent

De [Retail Multi-Agent Oplossing](../../examples/retail-scenario.md) demonstreert:

- **Klant Agent**: Behandelt gebruikersinteracties en voorkeuren
- **Voorraad Agent**: Beheert voorraad en orderverwerking
- **Orchestrator**: Coördineert tussen agents
- **Gedeeld Geheugen**: Cross-agent contextbeheer

### Gebruikte Services

| Service | Doel |
|---------|---------|
| Microsoft Foundry Modellen | Taalbegrip |
| Azure AI Search | Productcatalogus |
| Cosmos DB | Agent status en geheugen |
| Container Apps | Hosting van agent |
| Application Insights | Monitoring |

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 4: Infrastructuur](../chapter-04-infrastructure/README.md) |
| **Volgende** | [Hoofdstuk 6: Pre-Implementatie](../chapter-06-pre-deployment/README.md) |

---

## 📖 Gerelateerde Bronnen

- [AI Agents Gids](../chapter-02-ai-development/agents.md)
- [Productie AI Praktijken](../chapter-08-production/production-ai-practices.md)
- [AI Probleemoplossing](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->