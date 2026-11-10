# 7. peatükk: tõrkeotsing ja silumine

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 1-1,5 tundi | **⭐ Keerukus**: Vahepealne

---

## Ülevaade

See peatükk aitab teil diagnoosida ja lahendada levinumaid probleeme Azure Developer CLI kasutamisel. Alates juurutamise ebaõnnestumistest kuni AI-spetsiifiliste probleemideni.

> Käsujuhised on üle vaadatud välja antud `azd 1.37.2` viite alusel. Pilverakendusi ei ole käivitatud. Asendage käske kasutades näidisressursside nimed ja ID-d.

## Õppe eesmärgid

Selle peatüki lõpetamisel suudate:
- Diagnostiseerida levinumaid AZD juurutamise tõrkeid
- Siluda autentimis- ja õiguste probleeme
- Lahendada AI-teenuste ühenduvusprobleeme
- Kasutada tõrkeotsinguks Azure Portaali ja CLI-d

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Levinumad probleemid](common-issues.md) | Sageli esinevad probleemid | 30 min |
| 2 | [Silumise juhend](debugging.md) | Samm-sammuline silumisstrateegia | 45 min |
| 3 | [AI tõrkeotsing](ai-troubleshooting.md) | AI-spetsiifilised probleemid | 30 min |

---

## 🚨 Kiired parandused

### Autentimise probleemid
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Juurutamise tõrked
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Ressursside konfliktid
Kontrollige esmalt olemasolevaid ressursse ja juurutamise vigu. Ärge kustutage nimikonflikti lahendamiseks jagatud või tootmis keskkonda. Uue lühiajalise keskkonna puhul kasutage unikaalset nime:

```bash
azd env new different-name
azd up
```

### Piirangu ületamine
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

`AZURE_LOCATION` muutmine ei vii olemasolevaid ressursse ja võib põhjustada paiknemiskonflikte uuesti juurutamisel.

---

## 📋 Veakoodide viide

| Viga | Põhjus | Lahendus |
|-------|-------|----------|
| `AuthenticationError` | Pole sisse logitud | `azd auth login` |
| `ResourceNotFound` | Ressurss puudub | Kontrollige ressursi nimesid |
| `QuotaExceeded` | Tellimuse piirangud | Taotlege limiidi suurendamist |
| `InvalidTemplate` | Bicepi süntaksi viga | `az bicep build` |
| `Conflict` | Ressurss juba olemas | Kasutage uut nime või kustutage vana |
| `Forbidden` | Ebapiisavad õigused | Kontrollige RBAC rolle |

---

## 🔄 Lähtesta ja taasta

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Tugev lähtestus kustutab andmed ja võib muuta lõpp-punkte. Tehke enne varukoopia ja jälgige interaktiivseid kustutuskinnitusi. `--force --purge` sobib ainult lühiajaliseks keskkonnaks, kui soovitakse pöördumatut kustutamist.

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [6. peatükk: eeljuurutus](../chapter-06-pre-deployment/README.md) |
| **Järgmine** | [8. peatükk: tootmine](../chapter-08-production/README.md) |

---

## 📖 Seotud materjalid

- [Eeljuurutamise kontrollid](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfiguratsiooni juhend](../chapter-03-configuration/configuration.md)
- [AZD GitHubi probleemid](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->