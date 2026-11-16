# Kapitel 3: Konfiguration & Autentisering

**📚 Kurs**: [AZD För Nybörjare](../../README.md) | **⏱️ Varaktighet**: 90-150 minuter inklusive integrationsövningar | **⭐ Svårighetsgrad**: Medelnivå

---

## Översikt

Detta kapitel täcker miljökonfiguration, autentiseringsmönster och säkerhetsbästa praxis för distributioner med Azure Developer CLI.

> Mål för granskning av kommandon och konfiguration: `azd 1.37.2` (november 2026). Live Azure-provisionering kördes inte under granskningen.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Bemästra AZD-konfigurationshierarkin
- Hantera flera miljöer (dev, staging, prod)
- Implementera säker autentisering med hanterade identiteter
- Konfigurera miljöspecifika inställningar

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Konfigurationsguide](configuration.md) | Miljöinställning och hantering | 30 min |
| 2 | [Autentisering & Säkerhet](authsecurity.md) | Mönster för hanterade identiteter och RBAC | 30 min |

---

## 🚀 Snabbstart

Kör från roten av en **redan initierad azd-applikation**, inte kursrepositoryt. Använd oanvända miljönamn om dessa redan finns.

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

`SKU_NAME` är illustrativt: det påverkar infrastrukturen endast om din mall uttryckligen använder det. Vanliga `azd env set`-värden sparas lokalt i klartext; de är inte säker hemlagring.

---

## 🔧 Konfigurationshierarki

Håll tre olika konfigurationsytor isär: globala preferenser (`azd config`), projektstruktur (`azure.yaml`), och miljöspecifika värden (`azd env`). Flaggs överstyr endast de inställningar de faktiskt stöder; det finns ingen universell överlagring av godtyckliga miljövariabler på `azure.yaml` eller Bicep.

---

## 🔐 Säkerhetsbästa praxis

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

## 🔗 Navigering

| Riktning | Kapitel |
|-----------|---------|
| **Föregående** | [Kapitel 2: AI-utveckling](../chapter-02-ai-development/README.md) |
| **Nästa** | [Kapitel 4: Infrastruktur](../chapter-04-infrastructure/README.md) |

---

## 📖 Relaterade resurser

- [Förhandskontroller](../chapter-06-pre-deployment/README.md)
- [Felsökning](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->