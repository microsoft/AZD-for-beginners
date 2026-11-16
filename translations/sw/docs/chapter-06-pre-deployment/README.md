# Sura ya 6: Mipango na Uhakiki Kabla ya Utekelezaji

**📚 Kozi**: [AZD Kwa Waanzilishi](../../README.md) | **⏱️ Muda**: Masaa 2-4 kusoma; muda wa ziada kwa maabara zilizobadilishwa | **⭐ Ugumu**: Kati–Kiwango cha Juu

---

## Muhtasari

Sura hii inashughulikia hatua muhimu za kupanga na kuthibitisha kabla ya kupeleka programu yako. Jifunze kuepuka makosa ya gharama kubwa kwa kupanga uwezo ipasavyo, kuchagua SKU, na ukaguzi wa awali.

> Mwongozo wa amri umepitiwa kulingana na rejea iliyoachiliwa ya `azd 1.37.2`. Utekelezaji wa wingu haukujumuishwa. Masomo marefu yana vipande vinavyoonyesha, si miradi kamili ya utekelezaji wa ndani.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utaweza:
- Kufanya ukaguzi wa awali kabla ya utekelezaji
- Kupanga uwezo na kukadiria mahitaji ya rasilimali
- Kuchagua SKU zinazofaa kwa uboreshaji wa gharama
- Kusanidi Application Insights kwa ajili ya ufuatiliaji
- Kuelewa mifumo ya uratibu wa mawakala wengi na mahitaji yao ya utekelezaji

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Ukaguzi wa Awali](preflight-checks.md) | Thibitisha usanidi kabla ya utekelezaji | Dakika 15 |
| 2 | [Upangaji Uwezo](capacity-planning.md) | Kadiria mahitaji ya rasilimali | Dakika 20 |
| 3 | [Uchaguzi wa SKU](sku-selection.md) | Chagua ngazi za bei zinazofaa | Dakika 15 |
| 4 | [Application Insights](application-insights.md) | Kusanidi ufuatiliaji | Dakika 20 |
| 5 | [Mifumo ya Uratibu](coordination-patterns.md) | Ubunifu wa uratibu wa mawakala wengi wa hali ya juu | Dakika 60-75 |

---

## 🚀 Anza Haraka

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ Orodha ya Kukagua Kabla ya Utekelezaji

### Kabla ya `azd provision`

- [ ] Kikomo kimehakikiwa kwa eneo
- [ ] SKU zimechaguliwa ipasavyo
- [ ] Makadirio ya gharama yamepitwa
- [ ] Mkataba wa majina umezingatiwa
- [ ] Usalama/RBAC umewekwa

### Kabla ya `azd deploy`

- [ ] Mabadiliko ya mazingira yamewekwa
- [ ] Siri ziko Key Vault
- [ ] Mifumo ya muunganisho imehakikiwa
- [ ] Ukaguzi wa afya umewekwa

---

## 💰 Mwongozo wa Uchaguzi wa SKU

| Mzigo wa Kazi | Maendeleo | Uzalishaji |
|----------|-------------|------------|
| Container Apps | Matumizi | Matumizi au profaili ya mzigo maalum, kulingana na mzigo uliopimwa |
| Huduma ya Programu | B1/B2 | P1v3+ |
| Mifano ya Azure OpenAI | Aina ya utekelezaji inayoendeshwa kwa malipo kwa matumizi | Malipo kwa matumizi au njia ya upitishaji wa kuagizwa; hutegemea mfano/eneo |
| AI Search | Bure/Msingi ndani ya mipaka | Ngazi ya Msingi au Kawaida iliyopimwa kwa ajili ya fahirisi, nakala, na mzigo wa maswali |

---

## 🔗 Uelekezaji

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Sura 5: Mawakala Wengi](../chapter-05-multi-agent/README.md) |
| **Inayofuata** | [Sura 7: Utatuzi wa Matatizo](../chapter-07-troubleshooting/README.md) |

---

## 📖 Vyanzo Vinavyohusiana

- [Mwongozo wa Usanidi](../chapter-03-configuration/configuration.md)
- [Mwongozo wa Utekelezaji](../chapter-04-infrastructure/deployment-guide.md)
- [Matatizo ya Kawaida](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->