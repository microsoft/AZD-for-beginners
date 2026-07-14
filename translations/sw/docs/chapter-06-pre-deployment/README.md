# Sura 6: Upangaji na Uthibitishaji Kabla ya Utekelezaji

**📚 Kozi**: [AZD Kwa Anwani](../../README.md) | **⏱️ Muda**: Saa 1 | **⭐ Ugumu**: Kati

---

## Muhtasari

Sura hii inajumuisha hatua muhimu za kupanga na kuthibitisha kabla ya kupeleka programu yako. Jifunze kuepuka makosa ghali kwa upangaji bora wa uwezo, uteuzi wa SKU, na ukaguzi wa awali.

> Imethibitishwa dhidi ya `azd 1.27.1` mwezi Julai 2026.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa umeweza:
- Endesha ukaguzi wa awali kabla ya utekelezaji
- Panga uwezo na kukadiria mahitaji ya rasilimali
- Chagua SKU zinazofaa kwa uboreshaji wa gharama
- Sanidi Application Insights kwa ajili ya ufuatiliaji
- Elewa muundo wa ushirikiano wa timu

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Ukaguzi wa Awali](preflight-checks.md) | Thibitisha usanidi kabla ya utekelezaji | 15 min |
| 2 | [Upangaji Uwezo](capacity-planning.md) | Kadiria mahitaji ya rasilimali | 20 min |
| 3 | [Uteuzi wa SKU](sku-selection.md) | Chagua ngazi za bei zinazofaa | 15 min |
| 4 | [Application Insights](application-insights.md) | Sanidi ufuatiliaji | 20 min |
| 5 | [Mifumo ya Ushirikiano](coordination-patterns.md) | Mipango ya kazi ya timu za utekelezaji | 15 min |

---

## 🚀 Anza Haraka

```bash
# Angalia vikomo vya usajili
az vm list-usage --location eastus --output table

# Tazama mpangilio awali wa uanzishaji (hakuna rasilimali zilizotengenezwa)
azd provision --preview

# Thibitisha sintaksia ya Bicep
az bicep build --file infra/main.bicep

# Angalia usanidi wa mazingira
azd env get-values
```

---

## ☑️ Orodha ya Kukagua Kabla ya Utekelezaji

### Kabla ya `azd provision`

- [ ] Hakikisha nafasi ya rasilimali kwa eneo
- [ ] SKU zimetolewa kwa usahihi
- [ ] Makadirio ya gharama yamekaguliwa
- [ ] Ibada za majina zimeratibiwa
- [ ] Usalama/RBAC umeanzishwa

### Kabla ya `azd deploy`

- [ ] Mabadiliko ya mazingira yamewekwa
- [ ] Siri ziko Key Vault
- [ ] Mifumo ya uunganisho imethibitishwa
- [ ] Ukaguzi wa afya umewekwa

---

## 💰 Mwongozo wa Uteuzi wa SKU

| Kazi | Maendeleo | Uzalishaji |
|----------|-------------|------------|
| Programu za Kontena | Matumizi | D4 ya Kujitolea |
| Huduma za Programu | B1/B2 | P1v3+ |
| Mfano wa Microsoft Foundry | Kawaida | Kawaida + PTU |
| Utafutaji wa AI | Msingi | Kawaida S2+ |

---

## 🔗 Mnavigation

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Sura 5: Mawakala Wengi](../chapter-05-multi-agent/README.md) |
| **Inayofuata** | [Sura 7: Kutatua Matatizo](../chapter-07-troubleshooting/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Mwongozo wa Usanidi](../chapter-03-configuration/configuration.md)
- [Mwongozo wa Utekelezaji](../chapter-04-infrastructure/deployment-guide.md)
- [Matatizo ya Kawaida](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->