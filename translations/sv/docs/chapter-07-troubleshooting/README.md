# Kapitel 7: Felsökning & Debugging

**📚 Kurs**: [AZD För Nybörjare](../../README.md) | **⏱️ Varaktighet**: 1-1.5 timmar | **⭐ Svårighetsgrad**: Medel

---

## Översikt

Det här kapitlet hjälper dig att diagnostisera och lösa vanliga problem när du arbetar med Azure Developer CLI. Från driftsättningsfel till AI-specifika problem.

> Validerat mot `azd 1.27.1` i juli 2026.

## Lärandemål

Genom att slutföra det här kapitlet kommer du att:
- Diagnostisera vanliga AZD driftsättningsfel
- Felsöka autentisering och behörighetsproblem
- Lösa AI-tjänsters anslutningsproblem
- Använda Azure Portal och CLI för felsökning

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Vanliga Problem](common-issues.md) | Vanligt förekommande problem | 30 min |
| 2 | [Felsökningsguide](debugging.md) | Steg-för-steg felsökningsstrategier | 45 min |
| 3 | [AI Felsökning](ai-troubleshooting.md) | AI-specifika problem | 30 min |

---

## 🚨 Snabba Lösningar

### Autentiseringsproblem
```bash
# Krävs för AZD-arbetsflöden
azd auth login

# Valfritt om du också använder Azure CLI-kommandon direkt
az login

azd auth status
```

### Driftsättningsfel
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Resurskonflikter
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Kvot Överskriden
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Felkod Referens

| Fel | Orsak | Lösning |
|-------|-------|----------|
| `AuthenticationError` | Ej inloggad | `azd auth login` |
| `ResourceNotFound` | Saknad resurs | Kontrollera resursnamn |
| `QuotaExceeded` | Prenumerationsgränser | Begär kvotökning |
| `InvalidTemplate` | Bicep syntaxfel | `az bicep build` |
| `Conflict` | Resurs finns redan | Använd nytt namn eller ta bort |
| `Forbidden` | Otillräckliga behörigheter | Kontrollera RBAC-roller |

---

## 🔄 Återställning och Återhämtning

```bash
# Mjuk återställning (behåll resurser, distribuera om kod)
azd deploy --force

# Hård återställning (ta bort allt, starta om)
azd down --force --purge
azd up
```

---

## 🔗 Navigering

| Riktning | Kapitel |
|-----------|---------|
| **Föregående** | [Kapitel 6: Förberedelse före Driftsättning](../chapter-06-pre-deployment/README.md) |
| **Nästa** | [Kapitel 8: Produktion](../chapter-08-production/README.md) |

---

## 📖 Relaterade Resurser

- [Förberedande Kontroller](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurationsguide](../chapter-03-configuration/configuration.md)
- [AZD GitHub-ärenden](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->