# Chapter 7: Tõrkeotsing & Silumine

**📚 Kursus**: [AZD Algajatele](../../README.md) | **⏱️ Kestus**: 1-1.5 tundi | **⭐ Tase**: Kesktase

---

## Ülevaade

See peatükk aitab sul diagnoosida ja lahendada tavalisi probleeme Azure Developer CLI-ga töötamisel. Alates juurutuse ebaõnnestumistest kuni tehisintellekti spetsiifiliste probleemideni.

> Testitud versiooniga `azd 1.23.12` märtsis 2026.

## Õpieesmärgid

Selle peatüki läbimisel sa:
- Diagnoosid tavalisi AZD juurutuse ebaõnnestumisi
- Silud autentimis- ja õigustega seotud probleeme
- Lahendad tehisintellekti teenuste ühenduse probleeme
- Kasutad tõrkeotsinguks Azure Portaali ja CLI-d

---

## 📚 Tunnid

| # | Tund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Tavalised probleemid](common-issues.md) | Sageli esinevad vead | 30 min |
| 2 | [Silumise juhend](debugging.md) | Samm-sammult silumisstrateegiad | 45 min |
| 3 | [Tehisintellekti tõrkeotsing](ai-troubleshooting.md) | Tehisintellekti spetsiifilised probleemid | 30 min |

---

## 🚨 Kiired parandused

### Autentimisprobleemid
```bash
# Nõutav AZD töövoogude jaoks
azd auth login

# Valikuline, kui kasutate ka Azure CLI käske otse
az login

azd auth status
```

### Provisioneerimise ebaõnnestumised
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Ressursside konfliktid
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Kvoot ületatud
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Veakoodide reference

| Viga | Põhjus | Lahendus |
|-------|-------|----------|
| `AuthenticationError` | Pole sisselogitud | `azd auth login` |
| `ResourceNotFound` | Puuduv ressurss | Kontrolli ressursi nimesid |
| `QuotaExceeded` | Tellimuse piirangud | Palu kvoodi tõstmist |
| `InvalidTemplate` | Bicep süntaksi viga | `az bicep build` |
| `Conflict` | Ressurss juba olemas | Kasuta uut nime või kustuta |
| `Forbidden` | Puuduvad õigused | Kontrolli RBAC rolle |

---

## 🔄 Lähtesta ja taasta

```bash
# Pehme lähtestus (säilita ressursid, paigalda kood uuesti)
azd deploy --force

# Tugev lähtestus (kustuta kõik, alusta uuesti)
azd down --force --purge
azd up
```

---

## 🔗 Navigatsioon

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [Peatükk 6: Enne juurutust](../chapter-06-pre-deployment/README.md) |
| **Järgmine** | [Peatükk 8: Tootmine](../chapter-08-production/README.md) |

---

## 📖 Seotud ressursid

- [Enne juurutust kontrollimine](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfiguratsiooni juhend](../chapter-03-configuration/configuration.md)
- [AZD GitHub probleemid](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüame täpsust, tuleb arvestada, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Kriitilise info puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta tõlgendamisvigade ega arusaamatuste eest, mis tulenevad selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->