# Hoofdstuk 4: Infrastructuur als Code & Implementatie

**📚 Cursus**: [AZD voor beginners](../../README.md) | **⏱️ Duur**: 1-1.5 hours | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk behandelt Infrastructuur als Code (IaC) patronen met Bicep-templates, het provisioneren van resources en implementatiestrategieën met de Azure Developer CLI.

> Gevalideerd met `azd 1.23.12` in maart 2026.

## Leerdoelen

Na het voltooien van dit hoofdstuk:
- Begrijpen van de structuur en syntaxis van Bicep-templates
- Azure-resources provisioneren met `azd provision`
- Applicaties implementeren met `azd deploy`
- Blue-green- en rolling-implementatiestrategieën toepassen

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Provisioning van resources](provisioning.md) | Beheer van Azure-resources met AZD | 45 min |
| 2 | [Implementatiegids](deployment-guide.md) | Strategieën voor applicatie-implementatie | 45 min |

---

## 🚀 Snelle start

```bash
# Initialiseren vanaf sjabloon
azd init --template azure-functions-python-v2-http

# Voorvertoning van wat er gemaakt zal worden
azd provision --preview

# Alleen infrastructuur voorzien
azd provision

# Alleen code implementeren
azd deploy

# Of beide samen
azd up
```

---

## 📁 AZD-projectstructuur

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

## 🔧 Belangrijke opdrachten

| Opdracht | Beschrijving |
|---------|-------------|
| `azd init` | Project initialiseren |
| `azd provision` | Azure-resources aanmaken |
| `azd deploy` | Applicatiecode implementeren |
| `azd up` | provisionen + deployen |
| `azd down` | Alle resources verwijderen |

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 3: Configuratie](../chapter-03-configuration/README.md) |
| **Volgende** | [Hoofdstuk 5: Multi-Agent-oplossingen](../chapter-05-multi-agent/README.md) |

---

## 📖 Gerelateerde bronnen

- [Pre-deploymentcontroles](../chapter-06-pre-deployment/README.md)
- [Container-appvoorbeelden](../../examples/container-app/README.md)
- [Database-appvoorbeeld](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->