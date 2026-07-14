# Hoofdstuk 3: Configuratie & Authenticatie

**📚 Cursus**: [AZD Voor Beginners](../../README.md) | **⏱️ Duur**: 45-60 minuten | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk behandelt omgevingconfiguratie, authenticatiepatronen en beste beveiligingspraktijken voor Azure Developer CLI-implementaties.

> Gevalideerd met `azd 1.27.1` in juli 2026.

## Leerdoelen

Door dit hoofdstuk te voltooien, zul je:
- Meesterschap krijgen over de AZD-configuratiehiërarchie
- Meerdere omgevingen beheren (dev, staging, prod)
- Veilige authenticatie implementeren met beheerde identiteiten
- Omgevingsspecifieke instellingen configureren

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Configuratie Gids](configuration.md) | Omgevingsinstelling en beheer | 30 min |
| 2 | [Authenticatie & Beveiliging](authsecurity.md) | Beheerde identiteit en RBAC-patronen | 30 min |

---

## 🚀 Snel Starten

```bash
# Meerdere omgevingen maken
azd env new dev
azd env new staging
azd env new prod

# Omgevingen wisselen
azd env select prod

# Omgevingsvariabelen instellen
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Configuratie bekijken
azd env get-values
```

---

## 🔧 Configuratiehiërarchie

AZD past instellingen toe in deze volgorde (latere overschrijft eerdere):

1. **Standaardwaarden** (ingebouwd in sjablonen)
2. **azure.yaml** (projectconfiguratie)
3. **Omgevingsvariabelen** (`azd env set`)
4. **Opdrachtregel-vlaggen** (`--location eastus`)

---

## 🔐 Beste Beveiligingspraktijken

```bash
# Gebruik beheerde identiteit (aanbevolen)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Controleer AZD-authenticatiestatus
azd auth status

# Optioneel: verifieer Azure CLI-context als je van plan bent az-opdrachten uit te voeren
az account show

# Herauthenticeer indien nodig
azd auth login

# Optioneel: vernieuw Azure CLI-authenticatie voor az-opdrachten
az login
```

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 2: AI Ontwikkeling](../chapter-02-ai-development/README.md) |
| **Volgende** | [Hoofdstuk 4: Infrastructuur](../chapter-04-infrastructure/README.md) |

---

## 📖 Gerelateerde Bronnen

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Probleemoplossing](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->