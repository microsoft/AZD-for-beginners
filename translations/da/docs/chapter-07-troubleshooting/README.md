# Kapitel 7: Fejlfinding & Debugging

**📚 Kursus**: [AZD for Begyndere](../../README.md) | **⏱️ Varighed**: 1-1,5 timer | **⭐ Sværhedsgrad**: Mellem

---

## Oversigt

Dette kapitel hjælper dig med at diagnosticere og løse almindelige problemer, når du arbejder med Azure Developer CLI. Fra implementeringsfejl til AI-specifikke problemer.

> Kommando vejledning gennemgået i forhold til den udgivne `azd 1.37.2` reference. Cloud-implementeringer blev ikke udført. Erstat eksempler på ressource-navne og ID'er før brug af kommandoer.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Diagnosticere almindelige AZD implementeringsfejl
- Debugge godkendelses- og tilladelsesproblemer
- Løse AI service-forbindelsesproblemer
- Bruge Azure Portal og CLI til fejlfinding

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Almindelige Problemer](common-issues.md) | Hyppigt forekommende problemer | 30 min |
| 2 | [Debugging Guide](debugging.md) | Trin-for-trin debugging strategier | 45 min |
| 3 | [AI Fejlfinding](ai-troubleshooting.md) | AI-specifikke problemer | 30 min |

---

## 🚨 Hurtige Løsninger

### Godkendelsesproblemer
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Implementeringsfejl
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Ressourcekonflikter
Undersøg først den eksisterende ressource og implementeringsfejl. Slet ikke et delt eller produktionsmiljø for at løse en navnekonflikt. For et **nyt engangs-miljø**, brug et unikt navn:

```bash
azd env new different-name
azd up
```

### Kvote overskredet
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Ændring af `AZURE_LOCATION` flytter ikke eksisterende ressourcer og kan forårsage lokalitetskonflikter ved genimplementering.

---

## 📋 Fejlkode Reference

| Fejl | Årsag | Løsning |
|-------|-------|----------|
| `AuthenticationError` | Ikke logget ind | `azd auth login` |
| `ResourceNotFound` | Manglende ressource | Tjek ressourcenavne |
| `QuotaExceeded` | Abonnementsgrænser | Anmod om forøgelse af kvote |
| `InvalidTemplate` | Bicep syntaksfejl | `az bicep build` |
| `Conflict` | Ressource eksisterer | Brug nyt navn eller slet |
| `Forbidden` | Utilstrækkelige tilladelser | Tjek RBAC-roller |

---

## 🔄 Nulstilling og Gendannelse

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

En hård nulstilling sletter data og kan ændre endpoints. Lav backup først og gennemgå de interaktive slettemeldinger. `--force --purge` er kun passende for engangs-miljøer, når irreversible sletninger er tilsigtede.

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Forrige** | [Kapitel 6: Forud-implementering](../chapter-06-pre-deployment/README.md) |
| **Næste** | [Kapitel 8: Produktion](../chapter-08-production/README.md) |

---

## 📖 Relaterede Ressourcer

- [Forud-implementeringskontroller](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurationsguide](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->