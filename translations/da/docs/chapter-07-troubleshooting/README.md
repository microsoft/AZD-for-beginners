# Kapitel 7: Fejlfinding og fejlsøgning

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Varighed**: 1-1,5 timer | **⭐ Kompleksitet**: Mellemniveau

---

## Oversigt

Dette kapitel hjælper dig med at diagnosticere og løse almindelige problemer, når du arbejder med Azure Developer CLI. Fra udrulningsfejl til AI-specifikke problemer.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Diagnosticere almindelige AZD-udrulningsfejl
- Fejlfinde autentificerings- og tilladelsesproblemer
- Løse AI-tjenesteforbindelsesproblemer
- Bruge Azure Portal og CLI til fejlfinding

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Almindelige problemer](common-issues.md) | Ofte forekommende problemer | 30 min |
| 2 | [Fejlsøgningsguide](debugging.md) | Trin-for-trin fejlsøgningsstrategier | 45 min |
| 3 | [AI-fejlfinding](ai-troubleshooting.md) | AI-specifikke problemer | 30 min |

---

## 🚨 Hurtige løsninger

### Godkendelsesproblemer
```bash
azd auth login
az login
azd auth whoami
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

## 📋 Fejlkode-reference

| Fejl | Årsag | Løsning |
|-------|-------|----------|
| `AuthenticationError` | Ikke logget ind | `azd auth login` |
| `ResourceNotFound` | Manglende ressource | Kontroller ressourcenavne |
| `QuotaExceeded` | Abonnementsgrænser | Anmod om forøgelse af kvoten |
| `InvalidTemplate` | Syntaksfejl i Bicep | `az bicep build` |
| `Conflict` | Ressource findes | Brug nyt navn eller slet |
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

| Direction | Chapter |
|-----------|---------|
| **Forrige** | [Kapitel 6: Før udrulning](../chapter-06-pre-deployment/README.md) |
| **Næste** | [Kapitel 8: Produktion](../chapter-08-production/README.md) |

---

## 📖 Relaterede ressourcer

- [Kontroller før udrulning](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurationsguide](../chapter-03-configuration/configuration.md)
- [AZD GitHub-issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på originalsproget bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->