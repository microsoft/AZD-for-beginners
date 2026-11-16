# Kapitel 3: Konfiguration & Autentificering

**📚 Kursus**: [AZD For Begyndere](../../README.md) | **⏱️ Varighed**: 90-150 minutter inklusiv integrationsøvelser | **⭐ Sværhedsgrad**: Mellem

---

## Oversigt

Dette kapitel dækker miljøkonfiguration, autentificeringsmønstre og sikkerheds bedste praksis for Azure Developer CLI-implementeringer.

> Kommando- og konfigurationsgennemgang mål: `azd 1.37.2` (November 2026). Live Azure-provisionering blev ikke kørt under gennemgangen.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Mestre AZD konfigurationshierarkiet
- Administrere flere miljøer (udvikling, staging, produktion)
- Implementere sikker autentificering med administrerede identiteter
- Konfigurere miljøspecifikke indstillinger

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Konfigurationsguide](configuration.md) | Miljøopsætning og administration | 30 min |
| 2 | [Autentificering & Sikkerhed](authsecurity.md) | Administrerede identitets- og RBAC-mønstre | 30 min |

---

## 🚀 Kom hurtigt i gang

Kør fra roden af en **allerede initialiseret azd-applikation**, ikke kursus-repositoriet. Brug ikke-brugte miljønavne, hvis disse allerede findes.

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

`SKU_NAME` er illustrativ: den påvirker kun infrastrukturen, hvis din skabelon eksplicit bruger den. Almindelige `azd env set` værdier gemmes lokalt i klartekst; de er ikke sikker hemmelig opbevaring.

---

## 🔧 Konfigurationshierarki

Hold tre forskellige konfigurationsflader adskilte: globale præferencer (`azd config`), projektstruktur (`azure.yaml`) og værdier per miljø (`azd env`). Flag tilsidesætter kun de indstillinger, de faktisk understøtter; der findes ingen universel overlejring af vilkårlige miljøvariabler på `azure.yaml` eller Bicep.

---

## 🔐 Bedste praksis for sikkerhed

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

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Forrige** | [Kapitel 2: AI Udvikling](../chapter-02-ai-development/README.md) |
| **Næste** | [Kapitel 4: Infrastruktur](../chapter-04-infrastructure/README.md) |

---

## 📖 Relaterede Ressourcer

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Fejlfinding](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->