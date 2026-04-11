# Hoofdstuk 3: Configuratie & Authenticatie

**📚 Cursus**: [AZD voor Beginners](../../README.md) | **⏱️ Duur**: 45-60 minuten | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk behandelt omgevingsconfiguratie, authenticatiepatronen en beste beveiligingspraktijken voor implementaties met de Azure Developer CLI.

> Gevalideerd met `azd 1.23.12` in maart 2026.

## Leerdoelen

Door dit hoofdstuk te voltooien, zul je:
- Beheers de AZD-configuratiehiërarchie
- Beheer meerdere omgevingen (dev, staging, prod)
- Implementeer veilige authenticatie met beheerde identiteiten
- Configureer omgevingsspecifieke instellingen

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Configuratiegids](configuration.md) | Instellen en beheren van omgevingen | 30 min |
| 2 | [Authenticatie & Beveiliging](authsecurity.md) | Patronen voor beheerde identiteiten en RBAC | 30 min |

---

## 🚀 Snelle start

```bash
# Maak meerdere omgevingen
azd env new dev
azd env new staging
azd env new prod

# Schakel tussen omgevingen
azd env select prod

# Stel omgevingsvariabelen in
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Bekijk configuratie
azd env get-values
```

---

## 🔧 Configuratiehiërarchie

AZD past instellingen in deze volgorde toe (latere instellingen overschrijven eerdere):

1. **Standaardwaarden** (ingebouwd in sjablonen)
2. **azure.yaml** (projectconfiguratie)
3. **Omgevingsvariabelen** (`azd env set`)
4. **Opdrachtregelvlaggen** (`--location eastus`)

---

## 🔐 Beste beveiligingspraktijken

```bash
# Gebruik beheerde identiteit (aanbevolen)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Controleer de AZD-authenticatiestatus
azd auth status

# Optioneel: verifieer de Azure CLI-context als je van plan bent az-commando's uit te voeren
az account show

# Log opnieuw in indien nodig
azd auth login

# Optioneel: vernieuw de Azure CLI-authenticatie voor az-commando's
az login
```

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 2: AI-ontwikkeling](../chapter-02-ai-development/README.md) |
| **Volgende** | [Hoofdstuk 4: Infrastructuur](../chapter-04-infrastructure/README.md) |

---

## 📖 Gerelateerde bronnen

- [Pre-deploymentcontroles](../chapter-06-pre-deployment/README.md)
- [Probleemoplossing](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we naar nauwkeurigheid streven, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal moet als gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->