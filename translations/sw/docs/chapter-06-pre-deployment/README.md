# Sura 6: Mipango na Uhakiki Kabla ya Utoaji

**📚 Kozi**: [AZD Kwa Waanzilishi](../../README.md) | **⏱️ Muda**: 1 saa | **⭐ Ugumu**: Wastani

---

## Muhtasari

Sura hii inashughulikia hatua muhimu za upangaji na uhakiki kabla ya kupeleka programu yako. Jifunze kuepuka makosa yanayogharimu kwa mipango sahihi ya uwezo, uchaguzi wa SKU, na ukaguzi wa awali.

## Malengo ya Kujifunza

Kwa kukamilisha sura hii, utaweza:
- Kutoa ukaguzi wa awali kabla ya utekelezaji
- Kupanga uwezo na kukadiria mahitaji ya rasilimali
- Kuchagua SKUs zinazofaa kwa uboreshaji wa gharama
- Kusanidi Application Insights kwa ufuatiliaji
- Kuelewa mifumo ya uratibu ya timu

---

## 📚 Masomo

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Ukaguzi wa Awali](preflight-checks.md) | Thibitisha usanidi kabla ya utekelezaji | 15 dakika |
| 2 | [Mipango ya Uwezo](capacity-planning.md) | Kadiria mahitaji ya rasilimali | 20 dakika |
| 3 | [Uchaguzi wa SKU](sku-selection.md) | Chagua ngazi za bei zinazofaa | 15 dakika |
| 4 | [Application Insights](application-insights.md) | Sanidi ufuatiliaji | 20 dakika |
| 5 | [Mifumo ya Uratibu](coordination-patterns.md) | Mchakato wa kazi za kupeleka timu | 15 dakika |

---

## 🚀 Anza Haraka

```bash
# Kagua vikomo vya usajili
az vm list-usage --location eastus --output table

# Onyesha awali utekelezaji (hakuna rasilimali zitakazoundwa)
azd provision --preview

# Thibitisha sintaksia ya Bicep
az bicep build --file infra/main.bicep

# Kagua usanidi wa mazingira
azd env get-values
```

---

## ☑️ Orodha ya Ukaguzi Kabla ya Utoaji

### Kabla ya `azd provision`

- [ ] Quota imethibitishwa kwa mkoa
- [ ] SKUs zimetangazwa/ zimechaguliwa ipasavyo
- [ ] Makadirio ya gharama yamekaguliwa
- [ ] Kanuni za majina ziko thabiti
- [ ] Usalama/RBAC umewekwa

### Kabla ya `azd deploy`

- [ ] Vigezo vya mazingira vimewekwa
- [ ] Siri zimehifadhiwa kwenye Key Vault
- [ ] Mitsara ya muunganisho imethibitishwa
- [ ] Ukaguzi wa afya umewekwa

---

## 💰 Mwongozo wa Uchaguzi wa SKU

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Urambazaji

| Direction | Chapter |
|-----------|---------|
| **Iliyopita** | [Sura 5: Wakala Wengi](../chapter-05-multi-agent/README.md) |
| **Ifuatayo** | [Sura 7: Utatuzi wa Matatizo](../chapter-07-troubleshooting/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Mwongozo wa Mipangilio](../chapter-03-configuration/configuration.md)
- [Mwongozo wa Utekelezaji](../chapter-04-infrastructure/deployment-guide.md)
- [Masuala ya kawaida](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tamko la kutokuwa na dhamana**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya utafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri zinazofanywa kwa ajili ya mashine zinaweza kuwa na makosa au kupotoka kwa maana. Nyaraka ya awali kwa lugha yake ya asili inapaswa kuchukuliwa kama chanzo cha kuaminika. Kwa taarifa muhimu, inapendekezwa kutumia utafsiri wa kitaalamu unaofanywa na binadamu. Hatuwajibiki kwa uelewa potofu au tafsiri zisizofaa zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->