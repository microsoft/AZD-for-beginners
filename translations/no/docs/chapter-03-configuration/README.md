# Kapittel 3: Konfigurasjon og autentisering

**📚 Kurs**: [AZD For nybegynnere](../../README.md) | **⏱️ Varighet**: 90-150 minutter inkludert integrasjonsøvelse | **⭐ Vanskelighetsgrad**: Middels

---

## Oversikt

Dette kapitlet dekker miljøkonfigurasjon, autentiseringsmønstre og sikkerhetsbeste praksis for Azure Developer CLI-distribusjoner.

> Kommando- og konfigurasjonsgjennomgang mål: `azd 1.37.2` (november 2026). Live Azure-provisjonering ble ikke kjørt under gjennomgang.

## Lære mål

Ved å fullføre dette kapitlet vil du:
- Mestre AZD-konfigurasjonshierarki
- Administrere flere miljøer (dev, staging, prod)
- Implementere sikker autentisering med administrerte identiteter
- Konfigurere miljøspesifikke innstillinger

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Konfigurasjonsveiledning](configuration.md) | Miljøoppsett og administrasjon | 30 min |
| 2 | [Autentisering & sikkerhet](authsecurity.md) | Administrert identitet og RBAC-mønstre | 30 min |

---

## 🚀 Rask start

Kjør fra roten av en **allerede initialisert azd-applikasjon**, ikke kurs-repositoriet. Bruk ubrukte miljønavn hvis disse allerede finnes.

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

`SKU_NAME` er illustrativt: det påvirker kun infrastruktur hvis malen din eksplisitt bruker det. Vanlige `azd env set`-verdier lagres lokalt i klartekst; de er ikke sikker hemmelig lagring.

---

## 🔧 Konfigurasjonshierarki

Hold tre forskjellige konfigurasjonsoverflater adskilt: globale preferanser (`azd config`), prosjektstruktur (`azure.yaml`), og miljøspesifikke verdier (`azd env`). Flagg overstyrer kun innstillingene de faktisk støtter; det finnes ingen universell overlegg av vilkårlige miljøvariabler på `azure.yaml` eller Bicep.

---

## 🔐 Sikkerhetsbeste praksis

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

## 🔗 Navigasjon

| Retning | Kapittel |
|-----------|---------|
| **Forrige** | [Kapittel 2: AI-utvikling](../chapter-02-ai-development/README.md) |
| **Neste** | [Kapittel 4: Infrastruktur](../chapter-04-infrastructure/README.md) |

---

## 📖 Relaterte ressurser

- [Pre-deployment-sjekker](../chapter-06-pre-deployment/README.md)
- [Feilsøking](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->