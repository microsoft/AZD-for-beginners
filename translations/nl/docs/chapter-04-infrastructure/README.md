# Hoofdstuk 4: Infrastructure as Code & Implementatie

**📚 Cursus**: [AZD Voor Beginners](../../README.md) | **⏱️ Duur**: 2-3 uur lezen; reken extra tijd voor implementatie-oefeningen | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk behandelt Infrastructure as Code (IaC) patronen met Bicep templates, resource provisioning, en implementatiestrategieën met Azure Developer CLI.

> Doel van commando- en configuratiereview: `azd 1.37.2` (november 2026). Live Azure provisioning werd niet uitgevoerd tijdens de review.

## Leerdoelen

Door dit hoofdstuk af te ronden, zul je:
- Begrijpen hoe een Bicep template is opgebouwd en de syntaxis
- Azure resources provisionen met `azd provision`
- Applicaties deployen met `azd deploy`
- Blue-green en rolling deployment strategieën implementeren

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Resources Provisionen](provisioning.md) | Azure resourcebeheer met AZD | 45 min |
| 2 | [Implementatie Gids](deployment-guide.md) | Strategieën voor applicatie-implementatie | 45 min |
| 3 | [Je Eigen Template Schrijven](custom-templates.md) | Opbouwen en publiceren van herbruikbare azd-templates | 30 min |

---

## 🚀 Snelle Start

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

## 📁 AZD Projectstructuur

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

## 🔧 Essentiële Commando's

| Commando | Beschrijving |
|---------|-------------|
| `azd init` | Project initialiseren |
| `azd provision` | Azure resources aanmaken |
| `azd deploy` | Applicatiecode implementeren |
| `azd up` | provision + deploy |
| `azd down` | Alle resources verwijderen |

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 3: Configuratie](../chapter-03-configuration/README.md) |
| **Volgende** | [Hoofdstuk 5: Multi-Agent Oplossingen](../chapter-05-multi-agent/README.md) |

---

## 📖 Gerelateerde Bronnen

- [Pre-Deployment Controles](../chapter-06-pre-deployment/README.md)
- [Container App Voorbeelden](../../examples/container-app/README.md)
- [Database App Voorbeeld](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->