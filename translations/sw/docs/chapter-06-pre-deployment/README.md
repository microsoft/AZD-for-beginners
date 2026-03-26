# Sura 6: Mipango na Uthibitisho Kabla ya Kupeleka

**📚 Kozi**: [AZD Kwa Waanzilishi](../../README.md) | **⏱️ Muda**: 1 saa | **⭐ Ugumu**: Wastani

---

## Muhtasari

Sura hii inashughulikia hatua muhimu za upangaji na uthibitisho kabla ya kupeleka programu yako. Jifunze kuepuka makosa yanayotumia gharama kwa upangaji sahihi wa uwezo, uteuzi wa SKU, na ukaguzi wa awali.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utaweza:
- Endesha ukaguzi wa awali kabla ya kupeleka
- Panga uwezo na kukadiria mahitaji ya rasilimali
- Chagua SKUs zinazofaa kwa kuboresha gharama
- Sanidi Application Insights kwa ajili ya ufuatiliaji
- Elewa mifumo ya uratibu wa timu

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Thibitisha usanidi kabla ya kupeleka | 15 dakika |
| 2 | [Capacity Planning](capacity-planning.md) | Kadiria mahitaji ya rasilimali | 20 dakika |
| 3 | [SKU Selection](sku-selection.md) | Chagua ngazi za bei zinazofaa | 15 dakika |
| 4 | [Application Insights](application-insights.md) | Sanidi ufuatiliaji | 20 dakika |
| 5 | [Coordination Patterns](coordination-patterns.md) | Mifumo ya kazi za timu wakati wa uwasilishaji | 15 dakika |

---

## 🚀 Anza Haraka

```bash
# Angalia vikwazo vya usajili
az vm list-usage --location eastus --output table

# Tazama awali uanzishaji (hakuna rasilimali zitakazotengenezwa)
azd provision --preview

# Thibitisha sintaksia ya Bicep
az bicep build --file infra/main.bicep

# Angalia usanidi wa mazingira
azd env get-values
```

---

## ☑️ Orodha ya Ukaguzi Kabla ya Kupeleka

### Kabla ya `azd provision`

- [ ] Quota imethibitishwa kwa eneo
- [ ] SKUs zimechaguliwa ipasavyo
- [ ] Makadirio ya gharama yamekaguliwa
- [ ] Miongozo ya majina iko thabiti
- [ ] Usalama/RBAC imesanidiwa

### Kabla ya `azd deploy`

- [ ] Vigezo vya mazingira vimewekwa
- [ ] Siri ziko katika Key Vault
- [ ] Connection strings imethibitishwa
- [ ] Health checks imesanidiwa

---

## 💰 Mwongozo wa Uchaguzi wa SKU

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Uelekeo

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Sura 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Ifuatayo** | [Sura 7: Kutatua Matatizo](../chapter-07-troubleshooting/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Mwongozo wa Usanidi](../chapter-03-configuration/configuration.md)
- [Mwongozo wa Upelekaji](../chapter-04-infrastructure/deployment-guide.md)
- [Masuala ya Kawaida](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Angalizo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Hati ya asili katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inapendekezwa kutumia tafsiri ya kitaalamu iliyofanywa na mwanadamu. Hatuwajibiki kwa kutokuelewana au tafsiri potofu zozote zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->