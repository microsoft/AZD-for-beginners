# Hoofdstuk 3: Configuratie & Authenticatie

**📚 Cursus**: [AZD Voor Beginners](../../README.md) | **⏱️ Duur**: 90-150 minuten inclusief integratiepraktijk | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk behandelt omgevingsconfiguratie, authenticatiepatronen en beveiligingsbest practices voor Azure Developer CLI-implementaties.

> Doel van commando- en configuratiereview: `azd 1.37.2` (november 2026). Live Azure-provisioning is niet uitgevoerd tijdens de review.

## Leerdoelen

Door dit hoofdstuk te voltooien, zul je:
- De AZD-configuratiehiërarchie beheersen
- Meerdere omgevingen beheren (dev, staging, prod)
- Veilige authenticatie implementeren met beheerde identiteiten
- Omgevingsspecifieke instellingen configureren

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Configuratiegids](configuration.md) | Omgevingsopzet en beheer | 30 min |
| 2 | [Authenticatie & Beveiliging](authsecurity.md) | Patronen voor beheerde identiteit en RBAC | 30 min |

---

## 🚀 Snel Starten

Voer uit vanuit de root van een **al geïnitialiseerde azd-applicatie**, niet vanuit de cursusrepository. Gebruik ongebruikte omgevingsnamen als deze al bestaan.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` is illustratief: het beïnvloedt alleen infrastructuur als je sjabloon het expliciet gebruikt. Gewone `azd env set` waarden worden lokaal in platte tekst opgeslagen; ze zijn geen veilige geheime opslag.

---

## 🔧 Configuratiehiërarchie

Houd drie verschillende configuratievlakken gescheiden: globale voorkeuren (`azd config`), projectstructuur (`azure.yaml`), en omgevingsspecifieke waarden (`azd env`). Flags overschrijven alleen de instellingen die ze daadwerkelijk ondersteunen; er is geen universele overlay van willekeurige omgevingsvariabelen op `azure.yaml` of Bicep.

---

## 🔐 Beveiligingsbest practices

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Voorgaand** | [Hoofdstuk 2: AI-ontwikkeling](../chapter-02-ai-development/README.md) |
| **Volgend** | [Hoofdstuk 4: Infrastructuur](../chapter-04-infrastructure/README.md) |

---

## 📖 Gerelateerde Bronnen

- [Pre-deployment Checks](../chapter-06-pre-deployment/README.md)
- [Probleemoplossing](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->