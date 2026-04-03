# Chapter 7: Troubleshooting & Debugging

**📚 Kozi**: [AZD kwa Waanzilishi](../../README.md) | **⏱️ Muda**: 1-1.5 saa | **⭐ Ugumu**: Kati

---

## Muhtasari

Sura hii inakusaidia kutambua na kutatua masuala ya kawaida unapotumia Azure Developer CLI. Kuanzia kushindwa kwa uanzishaji hadi matatizo maalumu ya AI.

> Imethibitishwa dhidi ya `azd 1.23.12` katika Machi 2026.

## Malengo ya Kujifunza

Kwa kukamilisha sura hii, utajifunza:
- Kubaini makosa ya kawaida ya uanzishaji wa AZD
- Kutafuta na kutatua matatizo ya uthibitishaji na ruhusa
- Kutatua matatizo ya muunganisho wa huduma za AI
- Kutumia Azure Portal na CLI kwa utatuzi wa matatizo

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Common Issues](common-issues.md) | Masuala yanayokutana mara kwa mara | 30 min |
| 2 | [Debugging Guide](debugging.md) | Mikakati ya hatua kwa hatua za kutafuta na kutatua makosa | 45 min |
| 3 | [AI Troubleshooting](ai-troubleshooting.md) | Masuala maalumu ya AI | 30 min |

---

## 🚨 Suluhisho za Haraka

### Masuala ya Uthibitishaji
```bash
# Inahitajika kwa mitiririko ya kazi ya AZD
azd auth login

# Hiari ikiwa pia unatumia amri za Azure CLI moja kwa moja
az login

azd auth status
```

### Makosa ya Upangaji
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Migogoro ya Rasilimali
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Kiasi Kilizidi
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Rejea za Msimbo wa Makosa

| Kosa | Sababu | Suluhisho |
|-------|-------|----------|
| `AuthenticationError` | Hujajiingia | `azd auth login` |
| `ResourceNotFound` | Rasilimali haipo | Angalia majina ya rasilimali |
| `QuotaExceeded` | Mipaka ya usajili | Omba ongezeko la kiasi |
| `InvalidTemplate` | Kosa la sarufi la Bicep | `az bicep build` |
| `Conflict` | Rasilimali ipo | Tumia jina jipya au ifute |
| `Forbidden` | Ruhusa hazitoshi | Angalia majukumu ya RBAC |

---

## 🔄 Weka Upya na Ufufuaji

```bash
# Anzisha upya kwa upole (hifadhi rasilimali, weka tena msimbo)
azd deploy --force

# Anzisha upya kabisa (futa kila kitu, anza kutoka mwanzo)
azd down --force --purge
azd up
```

---

## 🔗 Urambazaji

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Sura 6: Kabla ya Utekelezaji](../chapter-06-pre-deployment/README.md) |
| **Ifuatayo** | [Sura 8: Uzalishaji](../chapter-08-production/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Ukaguzi Kabla ya Utekelezaji](../chapter-06-pre-deployment/preflight-checks.md)
- [Mwongozo wa Usanidi](../chapter-03-configuration/configuration.md)
- [Masuala ya AZD kwenye GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Taarifa ya kutokuwa na dhamana**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya utafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kufikia usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Nyaraka ya awali katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inapendekezwa kutumia utafsiri wa kitaalamu unaofanywa na mtafsiri wa kibinadamu. Hatuwajibiki kwa kutoelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->