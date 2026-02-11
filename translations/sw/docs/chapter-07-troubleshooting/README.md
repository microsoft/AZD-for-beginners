# Sura 7: Utatuzi wa Matatizo na Utafutaji Wadudu

**📚 Kozi**: [AZD For Beginners](../../README.md) | **⏱️ Muda**: 1-1.5 saa | **⭐ Ugumu**: Wastani

---

## Muhtasari

Sura hii inakusaidia kutambua na kutatua matatizo yanayojirudia unapotumia Azure Developer CLI. Kuanzia kushindwa kwa utekelezaji hadi matatizo maalum ya AI.

## Malengo ya Kujifunza

Kwa kukamilisha sura hii, utakuwa umeweza:
- Kubaini kushindikana kwa utekelezaji wa AZD
- Kurekebisha matatizo ya uthibitishaji na ruhusa
- Kutatua matatizo ya muunganisho ya huduma za AI
- Kutumia Azure Portal na CLI kwa utatuzi wa matatizo

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Masuala ya Kawaida](common-issues.md) | Matatizo yanayokumbukwa mara kwa mara | 30 dak. |
| 2 | [Mwongozo wa Utafutaji Wadudu](debugging.md) | Mikakati ya hatua kwa hatua ya utafutaji wadudu | 45 dak. |
| 3 | [Utatuzi wa AI](ai-troubleshooting.md) | Masuala maalum ya AI | 30 dak. |

---

## 🚨 Suluhisho za Haraka

### Masuala ya Uthibitishaji
```bash
azd auth login
az login
azd auth whoami
```

### Kushindwa kwa Ugawaji
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Migongano ya Rasilimali
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Kiasi Cha Rasilimali Kimezidi
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Marejeleo ya Msimbo wa Hitilafu

| Hitilafu | Sababu | Suluhisho |
|-------|-------|----------|
| `AuthenticationError` | Haujaingia | `azd auth login` |
| `ResourceNotFound` | Rasilimali haipo | Angalia majina ya rasilimali |
| `QuotaExceeded` | Mikopo ya usajili imefikiwa | Omba ongezeko la kikomo |
| `InvalidTemplate` | Hitilafu ya sintaksia ya Bicep | `az bicep build` |
| `Conflict` | Rasilimali tayari ipo | Tumia jina jipya au futa |
| `Forbidden` | Ruhusa hazitoshi | Angalia majukumu ya RBAC |

---

## 🔄 Weka Upya na Urejeshaji

```bash
# Upya mpole (hifadhi rasilimali, weke tena msimbo)
azd deploy --force

# Upya gumu (futa kila kitu, anza upya kwa hali safi)
azd down --force --purge
azd up
```

---

## 🔗 Urambazaji

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Sura 6: Kabla ya Utekelezaji](../chapter-06-pre-deployment/README.md) |
| **Inayofuata** | [Sura 8: Uzalishaji](../chapter-08-production/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Ukaguzi wa Kabla ya Utekelezaji](../chapter-06-pre-deployment/preflight-checks.md)
- [Mwongozo wa Mipangilio](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Taarifa ya kutokuwajibika:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI Co-op Translator (https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Nyaraka ya awali kwa lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inapendekezwa kutumia huduma ya mtafsiri mtaalamu wa kibinadamu. Hatuwajibiki kwa kutoelewana au tafsiri potofu zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->