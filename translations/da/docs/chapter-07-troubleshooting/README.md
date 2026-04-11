# Kapitel 7: Fejlfinding & Debugging

**📚 Kursus**: [AZD for begyndere](../../README.md) | **⏱️ Varighed**: 1-1,5 timer | **⭐ Kompleksitet**: Mellem

---

## Oversigt

Dette kapitel hjælper dig med at diagnosticere og løse almindelige problemer, når du arbejder med Azure Developer CLI. Fra implementeringsfejl til AI-specifikke problemer.

> Valideret med `azd 1.23.12` i marts 2026.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Diagnosticere almindelige AZD-implementeringsfejl
- Fejlsøge autentificerings- og tilladelsesproblemer
- Løse AI-tjenestens forbindelsesproblemer
- Brug Azure Portal og CLI til fejlfinding

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Almindelige problemer](common-issues.md) | Hyppigt forekommende problemer | 30 min |
| 2 | [Fejlsøgningsvejledning](debugging.md) | Trin-for-trin fejlsøgningsstrategier | 45 min |
| 3 | [AI-fejlfinding](ai-troubleshooting.md) | AI-specifikke problemer | 30 min |

---

## 🚨 Hurtige rettelser

### Autentificeringsproblemer
```bash
# Påkrævet for AZD-arbejdsgange
azd auth login

# Valgfrit, hvis du også bruger Azure CLI-kommandoer direkte
az login

azd auth status
```

### Provisioneringsfejl
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Ressourcekonflikter
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Kvote overskredet
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Fejlkodehenvisning

| Fejl | Årsag | Løsning |
|-------|-------|----------|
| `AuthenticationError` | Ikke logget ind | `azd auth login` |
| `ResourceNotFound` | Manglende ressource | Kontroller ressourcenavne |
| `QuotaExceeded` | Abonnementsgrænser | Anmod om øget kvote |
| `InvalidTemplate` | Bicep-syntaksfejl | `az bicep build` |
| `Conflict` | Ressourcen findes | Brug nyt navn eller slet |
| `Forbidden` | Utilstrækkelige tilladelser | Kontroller RBAC-roller |

---

## 🔄 Nulstilling og genopretning

```bash
# Blød nulstilling (behold ressourcer, genudrul koden)
azd deploy --force

# Hård nulstilling (slet alt, start forfra)
azd down --force --purge
azd up
```

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Forrige** | [Kapitel 6: Forudgående udrulning](../chapter-06-pre-deployment/README.md) |
| **Næste** | [Kapitel 8: Produktion](../chapter-08-production/README.md) |

---

## 📖 Relaterede ressourcer

- [Kontroller før udrulning](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurationsvejledning](../chapter-03-configuration/configuration.md)
- [AZD GitHub-problemer](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på originalsproget bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->