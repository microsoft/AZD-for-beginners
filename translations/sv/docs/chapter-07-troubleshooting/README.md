# Kapitel 7: Felsökning & Debugging

**📚 Kurs**: [AZD för nybörjare](../../README.md) | **⏱️ Varaktighet**: 1-1.5 timmar | **⭐ Svårighetsgrad**: Medel

---

## Översikt

Detta kapitel hjälper dig att diagnostisera och åtgärda vanliga problem när du arbetar med Azure Developer CLI. Från distributionsfel till AI-specifika problem.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Diagnosticera vanliga AZD-distributionsfel
- Felsöka autentiserings- och behörighetsproblem
- Åtgärda AI-tjänsters anslutningsproblem
- Använda Azure Portal och CLI för felsökning

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Vanliga problem](common-issues.md) | Vanligt förekommande problem | 30 min |
| 2 | [Felsökningsguide](debugging.md) | Steg-för-steg felsökningsstrategier | 45 min |
| 3 | [AI-felsökning](ai-troubleshooting.md) | AI-specifika problem | 30 min |

---

## 🚨 Snabba lösningar

### Autentiseringsproblem
```bash
azd auth login
az login
azd auth whoami
```

### Provisioneringsfel
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

### Kvot överskriden
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Felkodreferens

| Fel | Orsak | Lösning |
|-------|-------|----------|
| `AuthenticationError` | Inte inloggad | `azd auth login` |
| `ResourceNotFound` | Saknad resurs | Kontrollera resursnamn |
| `QuotaExceeded` | Prenumerationsgränser | Begär ökad kvot |
| `InvalidTemplate` | Bicep-syntaxfel | `az bicep build` |
| `Conflict` | Resurs finns | Använd nytt namn eller ta bort |
| `Forbidden` | Otillräckliga behörigheter | Kontrollera RBAC-roller |

---

## 🔄 Återställning och återhämtning

```bash
# Mjuk återställning (behåll resurserna, distribuera om koden)
azd deploy --force

# Hård återställning (radera allt, börja om från början)
azd down --force --purge
azd up
```

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
- [AZD GitHub-ärenden](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten Co-op Translator (https://github.com/Azure/co-op-translator). Trots att vi strävar efter noggrannhet bör du vara medveten om att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess originalspråk bör anses vara den auktoritativa källan. För kritisk information rekommenderas en professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->