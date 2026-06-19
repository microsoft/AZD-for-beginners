# Kapitel 7: Fejlfinding og fejlretning

**📚 Kursus**: [AZD for begyndere](../../README.md) | **⏱️ Varighed**: 1-1,5 timer | **⭐ Kompleksitet**: Middelniveau

---

## Oversigt

Dette kapitel hjælper dig med at diagnosticere og løse almindelige problemer, når du arbejder med Azure Developer CLI. Fra udrulningsfejl til AI-specifikke problemer.

> Valideret mod `azd 1.25.6` i juni 2026.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Diagnosticere almindelige AZD-udrulningsfejl
- Fejlfinde autentificerings- og tilladelsesproblemer
- Løse AI-tjenesteforbindelsesproblemer
- Bruge Azure Portal og CLI til fejlfinding

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Almindelige problemer](common-issues.md) | Ofte forekommende problemer | 30 min |
| 2 | [Fejlfindingsguide](debugging.md) | Trin-for-trin fejlfindingstrategier | 45 min |
| 3 | [AI-fejlfinding](ai-troubleshooting.md) | AI-specifikke problemer | 30 min |

---

## 🚨 Hurtige løsninger

### Autentificeringsproblemer
```bash
# Påkrævet for AZD-arbejdsgange
azd auth login

# Valgfri, hvis du også bruger Azure CLI-kommandoer direkte
az login

azd auth status
```

### Fejl ved provisionering
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

## 📋 Fejlkodereference

| Fejl | Årsag | Løsning |
|-------|-------|----------|
| `AuthenticationError` | Ikke logget ind | `azd auth login` |
| `ResourceNotFound` | Manglende ressource | Tjek ressourcenavne |
| `QuotaExceeded` | Begrænsninger i abonnementet | Anmod om øget kvote |
| `InvalidTemplate` | Bicep-syntaksfejl | `az bicep build` |
| `Conflict` | Ressourcen findes | Brug nyt navn eller slet |
| `Forbidden` | Utilstrækkelige tilladelser | Tjek RBAC-roller |

---

## 🔄 Nulstilling og gendannelse

```bash
# Blød nulstilling (behold ressourcerne, udrul koden igen)
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

- [Forud-udrulningskontroller](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurationsguide](../chapter-03-configuration/configuration.md)
- [AZD GitHub-issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->