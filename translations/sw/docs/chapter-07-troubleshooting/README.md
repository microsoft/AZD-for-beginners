# Sura 7: Utatuzi wa Matatizo na Urekebishaji

**📚 Kozi**: [AZD Kwa Waanzilishi](../../README.md) | **⏱️ Muda**: 1-1.5 masaa | **⭐ Ugumu**: Kiwango cha kati

---

## Muhtasari

Sura hii inakusaidia kuchunguza na kutatua matatizo ya kawaida unapotumia Azure Developer CLI. Kutoka kwa kushindwa kwa utekelezaji hadi matatizo maalum ya AI.

> Imehakikishwa dhidi ya `azd 1.25.6` mnamo Juni 2026.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa na uwezo wa:
- Kuchunguza kushindwa kwa utekelezaji wa AZD
- Kurekebisha matatizo ya uthibitishaji na ruhusa
- Kutatua matatizo ya muunganisho wa huduma za AI
- Kutumia Azure Portal na CLI kwa ajili ya utatuzi wa matatizo

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Matatizo ya Kawaida](common-issues.md) | Matatizo yanayokutana mara kwa mara | 30 min |
| 2 | [Mwongozo wa Urekebishaji](debugging.md) | Mikakati ya hatua kwa hatua ya urekebishaji | 45 min |
| 3 | [Utatuzi wa AI](ai-troubleshooting.md) | Matatizo maalum ya AI | 30 min |

---

## 🚨 Marekebisho ya Haraka

### Matatizo ya Uthibitishaji
```bash
# Inahitajika kwa mtiririko wa kazi wa AZD
azd auth login

# Hiari ikiwa pia unatumia amri za Azure CLI moja kwa moja
az login

azd auth status
```

### Kushindwa kwa Utoaji
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

## 📋 Marejeo ya Msimbo wa Makosa

| Hitilafu | Sababu | Suluhisho |
|-------|-------|----------|
| `AuthenticationError` | Haujaingia | `azd auth login` |
| `ResourceNotFound` | Rasilimali haipo | Kagua majina ya rasilimali |
| `QuotaExceeded` | Mikopo ya usajili imekwisha | Omba ongezeko la kiasi |
| `InvalidTemplate` | Hitilafu ya sintaksia ya Bicep | `az bicep build` |
| `Conflict` | Rasilimali tayari ipo | Tumia jina jipya au futa |
| `Forbidden` | Ruhusa hazitoshi | Angalia majukumu ya RBAC |

---

## 🔄 Upya na Ufufuo

```bash
# Weka upya laini (hifadhi rasilimali, sambaza tena msimbo)
azd deploy --force

# Weka upya kali (futa kila kitu, anza upya kutoka mwanzo)
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

- [Ukaguzi wa Kabla ya Utekelezaji](../chapter-06-pre-deployment/preflight-checks.md)
- [Mwongozo wa Mipangilio](../chapter-03-configuration/configuration.md)
- [Masuala ya AZD kwenye GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->