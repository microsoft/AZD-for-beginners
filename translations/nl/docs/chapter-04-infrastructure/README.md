# Hoofdstuk 4: Infrastructure as Code & Deployment

**📚 Cursus**: [AZD Voor Beginners](../../README.md) | **⏱️ Duur**: 1-1.5 uur | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk behandelt Infrastructure as Code (IaC) patronen met Bicep-sjablonen, resource provisioning en deploymentstrategieën met behulp van Azure Developer CLI.

> Gecontroleerd met `azd 1.27.1` in juli 2026.

## Leerdoelen

Door dit hoofdstuk te voltooien, zal je:
- De structuur en syntaxis van Bicep-sjablonen begrijpen
- Azure-resources provisionen met `azd provision`
- Applicaties deployen met `azd deploy`
- Blue-green en rolling deploymentstrategieën implementeren

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | Azure resourcebeheer met AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | Deploymentstrategieën voor applicaties | 45 min |
| 3 | [Authoring Your Own Template](custom-templates.md) | Maak en publiceer herbruikbare azd-sjablonen | 30 min |

---

## 🚀 Snelstartgids

```bash
# Initialiseren vanuit sjabloon
azd init --template azure-functions-python-v2-http

# Voorbeeldweergave van wat gemaakt zal worden
azd provision --preview

# Alleen infrastructuur voorzien
azd provision

# Alleen code implementeren
azd deploy

# Of beide samen
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
| `azd deploy` | Applicatiecode deployen |
| `azd up` | provision + deploy |
| `azd down` | Verwijder alle resources |

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 3: Configuratie](../chapter-03-configuration/README.md) |
| **Volgende** | [Hoofdstuk 5: Multi-Agent Oplossingen](../chapter-05-multi-agent/README.md) |

---

## 📖 Gerelateerde Bronnen

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Container App Voorbeelden](../../examples/container-app/README.md)
- [Database App Voorbeeld](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->