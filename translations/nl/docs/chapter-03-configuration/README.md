# Hoofdstuk 3: Configuratie & Authenticatie

**📚 Cursus**: [AZD For Beginners](../../README.md) | **⏱️ Duur**: 45-60 minuten | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk behandelt omgevingsconfiguratie, authenticatiepatronen en beveiligingsbest practices voor Azure Developer CLI-implementaties.

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
| 1 | [Configuratiegids](configuration.md) | Omgevingsconfiguratie en beheer | 30 min |
| 2 | [Authenticatie & Beveiliging](authsecurity.md) | Beheerde identiteit en RBAC-patronen | 30 min |

---

## 🚀 Snelstart

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

AZD past instellingen in deze volgorde toe (later overschrijft eerder):

1. **Standaardwaarden** (ingebouwd in sjablonen)
2. **azure.yaml** (projectconfiguratie)
3. **Omgevingsvariabelen** (`azd env set`)
4. **Opdrachtregelvlaggen** (`--location eastus`)

---

## 🔐 Beste beveiligingspraktijken

```bash
# Gebruik beheerde identiteit (aanbevolen)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Controleer authenticatiestatus
azd auth whoami
az account show

# Zo nodig opnieuw authenticeren
azd auth login
az login
```

---

## 🔗 Navigatie

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Hoofdstuk 2: AI-ontwikkeling](../chapter-02-ai-development/README.md) |
| **Next** | [Hoofdstuk 4: Infrastructuur](../chapter-04-infrastructure/README.md) |

---

## 📖 Gerelateerde bronnen

- [Controles vóór implementatie](../chapter-06-pre-deployment/README.md)
- [Probleemoplossing](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel wij streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor kritische informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor enige misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->