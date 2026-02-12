# Chapter 7: Troubleshooting & Debugging

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 1-1.5 tundi | **⭐ Raskusaste**: Kesktase

---

## Ülevaade

See peatükk aitab teil tuvastada ja lahendada levinud probleeme Azure Developer CLI kasutamisel. Alates juurutuse tõrgetest kuni AI-spetsiifiliste probleemideni.

## Õpieesmärgid

Selle peatüki lõpetamisel suudate:
- Diagnoosida tavalisi AZD juurutuse tõrkeid
- Tõrkeotsida autentimise ja õiguste probleeme
- Lahendada AI-teenuste ühenduvuse probleeme
- Kasutada Azure'i portaali ja CLI-d tõrkeotsinguks

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Levinud probleemid](common-issues.md) | Sageli esinevad probleemid | 30 min |
| 2 | [Tõrkeotsingu juhend](debugging.md) | Samm-sammult tõrkeotsingu strateegiad | 45 min |
| 3 | [AI tõrkeotsing](ai-troubleshooting.md) | AI-spetsiifilised probleemid | 30 min |

---

## 🚨 Kiirparandused

### Autentimisprobleemid
```bash
azd auth login
az login
azd auth whoami
```

### Provisionimise tõrked
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

### Kvoodi ületamine
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Veakoodide viide

| Error | Põhjus | Lahendus |
|-------|-------|----------|
| `AuthenticationError` | Pole sisse logitud | `azd auth login` |
| `ResourceNotFound` | Ressurss puudub | Kontrolli ressursi nimesid |
| `QuotaExceeded` | Tellimuse piirangud | Taotle limiidi suurendamist |
| `InvalidTemplate` | Bicep süntaksi viga | `az bicep build` |
| `Conflict` | Ressurss juba olemas | Kasuta uut nime või kustuta olemasolev |
| `Forbidden` | Ebapiisavad õigused | Kontrolli RBAC rolle |

---

## 🔄 Lähtestamine ja taastamine

```bash
# Pehme lähtestus (säilita ressursid, juuruta kood uuesti)
azd deploy --force

# Tugev lähtestus (kustuta kõik, alusta puhtalt)
azd down --force --purge
azd up
```

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [Peatükk 6: Enne juurutamist](../chapter-06-pre-deployment/README.md) |
| **Järgmine** | [Peatükk 8: Tootmine](../chapter-08-production/README.md) |

---

## 📖 Seotud ressursid

- [Eeljuurutamise kontrollid](../chapter-06-pre-deployment/preflight-checks.md)
- [Seadistuse juhend](../chapter-03-configuration/configuration.md)
- [AZD GitHubi probleemid](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastutusest loobumine:
See dokument on tõlgitud tehisintellekti tõlke teenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, pidage palun meeles, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleb pidada autoriteetseks allikaks. Olulise teabe puhul on soovitatav kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste ega vääritõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->