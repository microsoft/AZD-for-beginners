# Chapter 7: Tõrkeotsing ja silumine

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 1-1.5 tundi | **⭐ Keerukus**: Kesktase

---

## Ülevaade

See peatükk aitab diagnoosida ja lahendada levinud probleeme Azure Developer CLI kasutamisel. Alates juurutamise ebaõnnestumistest kuni AI-spetsiifiliste probleemideni.

> Kinnitatud versiooniga `azd 1.25.6` juunis 2026.

## Õpieesmärgid

Selle peatüki läbimisega õpid:
- Diagnostiseerima tavalisi AZD juurutamise ebaõnnestumisi
- Siluma autentimiste ja õiguste probleeme
- Lahendama AI teenuste ühenduvusprobleeme
- Kasutama Azure portaali ja CLI-d tõrkeotsinguks

---

## 📚 Õppetunnid

| # | Tund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Levinud probleemid](common-issues.md) | Sageli esinevad probleemid | 30 min |
| 2 | [Silumise juhend](debugging.md) | Samm-sammult silumise strateegiad | 45 min |
| 3 | [AI tõrkeotsing](ai-troubleshooting.md) | AI-spetsiifilised probleemid | 30 min |

---

## 🚨 Kiired lahendused

### Autentimisprobleemid
```bash
# Nõutud AZD töövoogude jaoks
azd auth login

# Valikuline, kui kasutate ka Azure CLI käske otse
az login

azd auth status
```

### Juurutamise ebaõnnestumised
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

### Kvood ületatud
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Veakoodi tähendused

| Viga | Põhjus | Lahendus |
|-------|-------|----------|
| `AuthenticationError` | Mitte sisse logitud | `azd auth login` |
| `ResourceNotFound` | Puuduv ressurss | Kontrolli ressursside nimesid |
| `QuotaExceeded` | Telli piirmäärad | Taotle kvoodi tõstmist |
| `InvalidTemplate` | Bicepsüntaksiviga | `az bicep build` |
| `Conflict` | Ressurss eksisteerib | Kasuta uut nime või kustuta |
| `Forbidden` | Ebapiisavad õigused | Kontrolli RBAC rolle |

---

## 🔄 Lähtestamine ja taastamine

```bash
# Pehme lähtestus (hoia ressursid, uuesti koodi juurutamine)
azd deploy --force

# Tugev lähtestus (kustuta kõik, alusta algusest)
azd down --force --purge
azd up
```

---

## 🔗 Navigatsioon

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [Peatükk 6: Eeljuurutamine](../chapter-06-pre-deployment/README.md) |
| **Järgmine** | [Peatükk 8: Tootmine](../chapter-08-production/README.md) |

---

## 📖 Seotud ressursid

- [Eeljuurutamise kontrollid](../chapter-06-pre-deployment/preflight-checks.md)
- [Seadistamise juhend](../chapter-03-configuration/configuration.md)
- [AZD GitHub probleemid](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->