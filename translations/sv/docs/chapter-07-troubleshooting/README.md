# Kapitel 7: Felsökning och Debugging

**📚 Kurs**: [AZD För Nybörjare](../../README.md) | **⏱️ Varaktighet**: 1-1,5 timmar | **⭐ Svårighetsgrad**: Mellannivå

---

## Översikt

Detta kapitel hjälper dig att diagnostisera och lösa vanliga problem när du arbetar med Azure Developer CLI. Från distribueringsfel till AI-specifika problem.

> Kommandovägledning granskad mot den publicerade `azd 1.37.2` referensen. Molndistributioner har inte utförts. Byt ut exempelresursnamn och ID:n innan du använder kommandon.

## Inlärningsmål

Genom att slutföra detta kapitel kommer du att:
- Diagnostisera vanliga AZD-distributionsfel
- Debugga autentiserings- och behörighetsproblem
- Lösa anslutningsproblem för AI-tjänster
- Använda Azure Portal och CLI för felsökning

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Vanliga Problem](common-issues.md) | Vanligt förekommande problem | 30 min |
| 2 | [Debugging Guide](debugging.md) | Steg-för-steg felsökningsstrategier | 45 min |
| 3 | [AI Felsökning](ai-troubleshooting.md) | AI-specifika problem | 30 min |

---

## 🚨 Snabba lösningar

### Autentiseringsproblem
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Distributionsfel
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Resurskonflikter
Inspektera den befintliga resursen och distributionsfel först. Ta inte bort en delad eller produktionsmiljö för att lösa en namngivningskonflikt. För en **ny engångsmiljö**, använd ett unikt namn:

```bash
azd env new different-name
azd up
```

### Kvot överskriden
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Att ändra `AZURE_LOCATION` flyttar inte befintliga resurser och kan orsaka konflikt i plats vid ny distribution.

---

## 📋 Felkodsreferens

| Fel | Orsak | Lösning |
|-------|-------|----------|
| `AuthenticationError` | Inte inloggad | `azd auth login` |
| `ResourceNotFound` | Saknad resurs | Kontrollera resursnamn |
| `QuotaExceeded` | Prenumerationsgränser | Begär kvotökning |
| `InvalidTemplate` | Bicep syntaxfel | `az bicep build` |
| `Conflict` | Resurs finns | Använd nytt namn eller ta bort |
| `Forbidden` | Otillräckliga behörigheter | Kontrollera RBAC-roller |

---

## 🔄 Återställning och återhämtning

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Hård återställning raderar data och kan ändra ändpunkter. Säkerhetskopiera först och granska de interaktiva raderingsuppmaningarna. `--force --purge` är endast lämpligt för engångsmiljöer när oåterkallelig radering är avsedd.

---

## 🔗 Navigering

| Riktning | Kapitel |
|-----------|---------|
| **Föregående** | [Kapitel 6: Före distribution](../chapter-06-pre-deployment/README.md) |
| **Nästa** | [Kapitel 8: Produktion](../chapter-08-production/README.md) |

---

## 📖 Relaterade resurser

- [Kontroller före distribution](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurationsguide](../chapter-03-configuration/configuration.md)
- [AZD GitHub-problem](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->