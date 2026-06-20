# Sura 6: Upangaji kabla ya Utoaji & Uthibitisho

**📚 Kozi**: [AZD Kwa Waanzilishi](../../README.md) | **⏱️ Muda**: 1 saa | **⭐ Ugumu**: Kati

---

## Muhtasari

Sura hii inashughulikia hatua muhimu za upangaji na uthibitisho kabla ya kutoa programu yako. Jifunze kuepuka makosa ghali kwa upangaji sahihi wa uwezo, uchaguzi wa SKU, na ukaguzi wa preflight.

> Imethibitishwa dhidi ya `azd 1.25.6` mwezi Juni 2026.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utaweza:
- Endesha ukaguzi wa preflight kabla ya utoaji
- Panga uwezo na kukadiria mahitaji ya rasilimali
- Chagua SKU zinazofaa kwa uboreshaji wa gharama
- Sanidi Application Insights kwa ufuatiliaji
- Elewa mifumo ya uratibu wa timu

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Ukaguzi wa Preflight](preflight-checks.md) | Thibitisha usanidi kabla ya utoaji | 15 dakika |
| 2 | [Upangaji wa Uwezo](capacity-planning.md) | Kadiria mahitaji ya rasilimali | 20 dakika |
| 3 | [Uchaguzi wa SKU](sku-selection.md) | Chagua ngazi za bei zinazofaa | 15 dakika |
| 4 | [Application Insights](application-insights.md) | Sanidi ufuatiliaji | 20 dakika |
| 5 | [Mifumo ya Uratibu](coordination-patterns.md) | Taratibu za kazi za timu wakati wa utoaji | 15 dakika |

---

## 🚀 Anza Haraka

```bash
# Angalia vikwazo vya usajili
az vm list-usage --location eastus --output table

# Onyesha awali ya uanzishaji (hazitaundwa rasilimali)
azd provision --preview

# Thibitisha sarufi ya Bicep
az bicep build --file infra/main.bicep

# Angalia usanidi wa mazingira
azd env get-values
```

---

## ☑️ Orodha ya Ukaguzi Kabla ya Utoaji

### Kabla ya `azd provision`

- [ ] Quota imethibitishwa kwa mkoa
- [ ] SKUs zimechaguliwa ipasavyo
- [ ] Makadirio ya gharama yamepitwa
- [ ] Kanuni za kutunga majina zimezingatiwa
- [ ] Usalama/RBAC umewekwa

### Kabla ya `azd deploy`

- [ ] Vigezo vya mazingira vimewekwa
- [ ] Siri zimeshifadhiwa kwenye Key Vault
- [ ] Connection strings imethibitishwa
- [ ] Ukaguzi wa afya umewekwa

---

## 💰 Mwongozo wa Uchaguzi wa SKU

| Mzigo wa Kazi | Maendeleo | Uzalishaji |
|----------|-------------|------------|
| Container Apps | Matumizi | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Uvinjari

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Sura 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Ifuatayo** | [Sura 7: Kutatua Matatizo](../chapter-07-troubleshooting/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Mwongozo wa Usanidi](../chapter-03-configuration/configuration.md)
- [Mwongozo wa Utoaji](../chapter-04-infrastructure/deployment-guide.md)
- [Masuala ya Kawaida](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->