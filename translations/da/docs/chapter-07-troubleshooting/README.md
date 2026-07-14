# Kapitel 7: Fejlfinding & Debugging

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Varighed**: 1-1.5 timer | **⭐ Kompleksitet**: Mellem

---

## Oversigt

Dette kapitel hjælper dig med at diagnosticere og løse almindelige problemer ved arbejde med Azure Developer CLI. Fra udrulningsfejl til AI-specifikke problemer.

> Valideret mod `azd 1.27.1` i juli 2026.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Diagnosticere almindelige AZD udrulningsfejl
- Debugge autentificerings- og tilladelsesproblemer
- Løse AI-tjenesteforbindelsesproblemer
- Bruge Azure Portal og CLI til fejlfinding

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|---------|-------------|-----|
| 1 | [Almindelige Problemer](common-issues.md) | Hyppigt forekommende problemer | 30 min |
| 2 | [Debugging Guide](debugging.md) | Trin-for-trin debugging-strategier | 45 min |
| 3 | [AI Fejlfinding](ai-troubleshooting.md) | AI-specifikke problemer | 30 min |

---

## 🚨 Hurtige Løsninger

### Autentificeringsproblemer
```bash
# Påkrævet for AZD arbejdsgange
azd auth login

# Valgfrit hvis du også bruger Azure CLI-kommandoer direkte
az login

azd auth status
```

### Udrulningsfejl
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

### Kvotebegrænsning Overskredet
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Fejlkode Reference

| Fejl | Årsag | Løsning |
|-------|-------|---------|
| `AuthenticationError` | Ikke logget ind | `azd auth login` |
| `ResourceNotFound` | Manglende ressource | Tjek ressourcenavne |
| `QuotaExceeded` | Abonnementsgrænser | Anmod om kvote-forhøjelse |
| `InvalidTemplate` | Bicep syntaksfejl | `az bicep build` |
| `Conflict` | Ressource findes | Brug nyt navn eller slet |
| `Forbidden` | Utilstrækkelige tilladelser | Tjek RBAC-roller |

---

## 🔄 Nulstilling og Genopretning

```bash
# Blød nulstilling (bevar ressourcer, genudrul kode)
azd deploy --force

# Hård nulstilling (slet alt, start forfra)
azd down --force --purge
azd up
```

---

## 🔗 Navigation

| Retning | Kapitel |
|---------|---------|
| **Forrige** | [Kapitel 6: Forud for Udrulning](../chapter-06-pre-deployment/README.md) |
| **Næste** | [Kapitel 8: Produktion](../chapter-08-production/README.md) |

---

## 📖 Relaterede Ressourcer

- [Forud for Udrulningschecks](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurationsvejledning](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->