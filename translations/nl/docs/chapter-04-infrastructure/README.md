# Hoofdstuk 4: Infrastructuur als Code & Implementatie

**📚 Cursus**: [AZD For Beginners](../../README.md) | **⏱️ Duur**: 1-1.5 uur | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk behandelt Infrastructuur als Code (IaC)-patronen met Bicep-templates, de voorziening van resources en implementatiestrategieën met de Azure Developer CLI.

## Leerdoelen

Na het voltooien van dit hoofdstuk zul je:
- Inzicht krijgen in de structuur en syntaxis van Bicep-templates
- Azure-resources voorzien met `azd provision`
- Applicaties implementeren met `azd deploy`
- Implementeer blue-green- en rolling-implementatiestrategieën

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | Beheer van Azure-resources met AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | Strategieën voor applicatie-implementatie | 45 min |

---

## 🚀 Snelstart

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

## 🔧 Essentiële commando's

| Commando | Beschrijving |
|---------|-------------|
| `azd init` | Initialiseer project |
| `azd provision` | Maak Azure-resources aan |
| `azd deploy` | Implementeer applicatiecode |
| `azd up` | voorziening + implementatie |
| `azd down` | Verwijder alle resources |

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 3: Configuratie](../chapter-03-configuration/README.md) |
| **Volgende** | [Hoofdstuk 5: Multi-Agent-oplossingen](../chapter-05-multi-agent/README.md) |

---

## 📖 Gerelateerde bronnen

- [Pre-deployment-controles](../chapter-06-pre-deployment/README.md)
- [Voorbeelden van Container-apps](../../examples/container-app/README.md)
- [Voorbeeld van een database-app](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we naar nauwkeurigheid streven, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal moet als gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->