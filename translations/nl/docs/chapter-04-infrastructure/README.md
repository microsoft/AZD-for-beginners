# Hoofdstuk 4: Infrastructuur als Code & Implementatie

**📚 Cursus**: [AZD For Beginners](../../README.md) | **⏱️ Duur**: 1-1.5 uur | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk behandelt Infrastructure as Code (IaC)-patronen met Bicep-templates, het provisioneren van resources en implementatiestrategieën met de Azure Developer CLI.

> Gevalideerd tegen `azd 1.25.6` in juni 2026.

## Leerdoelen

By completing this chapter, you will:
- Begrijp de structuur en syntaxis van Bicep-templates
- Maak Azure-resources aan met `azd provision`
- Implementeer applicaties met `azd deploy`
- Implementeer blue-green- en rolling-implementatiestrategieën

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Resources provisioneren](provisioning.md) | Azure resourcebeheer met AZD | 45 min |
| 2 | [Implementatiegids](deployment-guide.md) | Strategieën voor applicatie-implementatie | 45 min |
| 3 | [Je eigen template maken](custom-templates.md) | Bouw en publiceer herbruikbare azd-templates | 30 min |

---

## 🚀 Snelle Start

```bash
# Initialiseren vanaf sjabloon
azd init --template azure-functions-python-v2-http

# Voorbeeld van wat er gemaakt zal worden
azd provision --preview

# Alleen infrastructuur inrichten
azd provision

# Alleen code uitrollen
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

## 🔧 Essentiële opdrachten

| Commando | Beschrijving |
|---------|-------------|
| `azd init` | Initialiseer project |
| `azd provision` | Maak Azure-resources aan |
| `azd deploy` | Implementeer applicatiecode |
| `azd up` | provision + deploy |
| `azd down` | Verwijder alle resources |

---

## 🔗 Navigatie

| Direction | Chapter |
|-----------|---------|
| **Vorige** | [Hoofdstuk 3: Configuratie](../chapter-03-configuration/README.md) |
| **Volgende** | [Hoofdstuk 5: Multi-agentoplossingen](../chapter-05-multi-agent/README.md) |

---

## 📖 Gerelateerde bronnen

- [Pre-implementatiecontroles](../chapter-06-pre-deployment/README.md)
- [Container-appvoorbeelden](../../examples/container-app/README.md)
- [Database-appvoorbeeld](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->