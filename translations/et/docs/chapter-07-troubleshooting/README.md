# 7. peatükk: tõrkeotsing ja silumine

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 1–1,5 tundi | **⭐ Tase**: Kesktase

---

## Ülevaade

See peatükk aitab teil diagnoosida ja lahendada tavalisi probleeme Azure Developer CLI-ga töötades. Alates juurutuse tõrgetest kuni tehisintellekti spetsiifiliste probleemideni.

> Kinnitatud `azd 1.27.1` alusel 2026. aasta juulis.

## Õpieesmärgid

Selle peatüki lõpetamise järel:
- diagnoosite tavalisi AZD juurutuse tõrkeid
- silute autentimise ja õiguste probleeme
- lahendate AI-teenuse ühenduvusprobleeme
- kasutate tõrkeotsinguks Azure portaali ja CLI-d

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Tavalised probleemid](common-issues.md) | Sageli esinevad probleemid | 30 min |
| 2 | [Silumise juhend](debugging.md) | Samm-sammuline silumise strateegia | 45 min |
| 3 | [AI tõrkeotsing](ai-troubleshooting.md) | AI-spetsiifilised probleemid | 30 min |

---

## 🚨 Kiired parandused

### Autentimise probleemid
```bash
# Nõutav AZD töövoogude jaoks
azd auth login

# Valikuline, kui kasutate ka Azure CLI käske otse
az login

azd auth status
```

### Juurutuse tõrked
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

## 📋 Veakoodide viited

| Viga | Põhjus | Lahendus |
|-------|-------|----------|
| `AuthenticationError` | Mitte sisse logitud | `azd auth login` |
| `ResourceNotFound` | Puuduv ressurss | Kontrolli ressursside nimesid |
| `QuotaExceeded` | Tellimuse piirangud | Taotlege kvoodi suurendamist |
| `InvalidTemplate` | Bicepi süntaksiviga | `az bicep build` |
| `Conflict` | Ressurss juba olemas | Kasuta uut nime või kustuta |
| `Forbidden` | Ebapiisavad õigused | Kontrolli RBAC rolle |

---

## 🔄 Lähtestamine ja taastamine

```bash
# Pehme lähtestus (hoia ressursse, paigalda kood uuesti)
azd deploy --force

# Tugev lähtestus (kustuta kõik, alusta uuesti)
azd down --force --purge
azd up
```

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [6. peatükk: Eeljärjestamine](../chapter-06-pre-deployment/README.md) |
| **Järgmine** | [8. peatükk: Tootmine](../chapter-08-production/README.md) |

---

## 📖 Seotud ressursid

- [Eeljärjestamise kontrollid](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfiguratsiooni juhend](../chapter-03-configuration/configuration.md)
- [AZD GitHub probleemid](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->