# Sura ya 7: Utatuzi wa Matatizo & Kurekebisha Hitilafu

**📚 Kozi**: [AZD Kwa Komo](../../README.md) | **⏱️ Muda**: Saa 1-1.5 | **⭐ Ugumu**: Kiwiliwili

---

## Muhtasari

Sura hii inakusaidia kugundua na kutatua matatizo yanayojitokeza mara kwa mara wakati wa kutumia Azure Developer CLI. Kuanzia kwa kushindwa kwa uenezaji hadi matatizo maalum ya AI.

> Imethibitishwa dhidi ya `azd 1.27.1` mwezi Julai 2026.

## Malengo ya Kujifunza

Kwa kukamilisha sura hii, utakuwa na uwezo wa:
- Kugundua kushindwa kwa uenezaji wa AZD mara kwa mara
- Kurekebisha matatizo ya uthibitishaji na ruhusa
- Kutatua matatizo ya muunganisho wa huduma za AI
- Kutumia Azure Portal na CLI kwa ajili ya utatuzi wa matatizo

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Matatizo ya Kawaida](common-issues.md) | Matatizo yanayotokea mara kwa mara | Dakika 30 |
| 2 | [Mwongozo wa Kurekebisha Hitilafu](debugging.md) | Mikakati ya hatua kwa hatua ya kurekebisha hitilafu | Dakika 45 |
| 3 | [Utatuzi wa AI](ai-troubleshooting.md) | Matatizo maalum ya AI | Dakika 30 |

---

## 🚨 Marekebisho ya Haraka

### Matatizo ya Uthibitishaji
```bash
# Inahitajika kwa mzunguko wa kazi za AZD
azd auth login

# Hiari ikiwa pia unatumia amri za Azure CLI moja kwa moja
az login

azd auth status
```

### Kushindwa kwa Upatanisho
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

### Kiwango cha Mpaka Kilizidiwa
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Marejeleo ya Msimbo wa Hitilafu

| Hitilafu | Sababu | Suluhisho |
|-------|-------|----------|
| `AuthenticationError` | Hujasajiliwa | `azd auth login` |
| `ResourceNotFound` | Rasilimali haipo | Angalia majina ya rasilimali |
| `QuotaExceeded` | Mipaka ya usajili | Omba ongezeko la kiwango |
| `InvalidTemplate` | Makosa ya sintaksi ya Bicep | `az bicep build` |
| `Conflict` | Rasilimali ipo tayari | Tumia jina jipya au futa |
| `Forbidden` | Ruhusa hazitoshi | Angalia majukumu ya RBAC |

---

## 🔄 Weka Upya na Ufufuzi

```bash
# Weka upya kwa upole (hifadhi rasilimali, tengeneza tena msimbo)
azd deploy --force

# Weka upya kwa nguvu (futa kila kitu, anza upya)
azd down --force --purge
azd up
```

---

## 🔗 Utabanano

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyotangulia** | [Sura ya 6: Kabla ya Uenezaji](../chapter-06-pre-deployment/README.md) |
| **Inayofuata** | [Sura ya 8: Uzalishaji](../chapter-08-production/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Ukaguzi Kabla ya Uenezaji](../chapter-06-pre-deployment/preflight-checks.md)
- [Mwongozo wa Usanidi](../chapter-03-configuration/configuration.md)
- [Masuala ya AZD GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->