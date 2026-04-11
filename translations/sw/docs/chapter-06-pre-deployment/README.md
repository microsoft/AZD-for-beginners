# Sura 6: Upangaji na Uthibitishaji Kabla ya Utekelezaji

**📚 Kozi**: [AZD Kwa Waanzilishi](../../README.md) | **⏱️ Muda**: 1 saa | **⭐ Ugumu**: Kati

---

## Muhtasari

Sura hii inashughulikia hatua muhimu za upangaji na uthibitisho kabla ya kupeleka programu yako. Jifunze kuepuka makosa ya gharama kubwa kwa upangaji sahihi wa uwezo, uchaguo wa SKU, na ukaguzi wa kabla ya kuendesha.

> Imethibitishwa dhidi ya `azd 1.23.12` mnamo Machi 2026.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa umeweza:
- Endesha ukaguzi wa kabla ya kuanza kabla ya utekelezaji
- Panga uwezo na kukadiria mahitaji ya rasilimali
- Chagua SKU zinazofaa kwa uboreshaji wa gharama
- Sanidi Application Insights kwa ufuatiliaji
- Elewa mifumo ya uratibu wa timu

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Ukaguzi wa Kabla ya Kuanzisha](preflight-checks.md) | Thibitisha usanidi kabla ya utekelezaji | 15 min |
| 2 | [Upangaji wa Uwezo](capacity-planning.md) | Kadiria mahitaji ya rasilimali | 20 min |
| 3 | [Uchaguzi wa SKU](sku-selection.md) | Chagua ngazi za bei zinazofaa | 15 min |
| 4 | [Application Insights](application-insights.md) | Sanidi ufuatiliaji | 20 min |
| 5 | [Mifumo ya Uratibu](coordination-patterns.md) | Mitiririko ya kazi ya timu kwa uanzishaji | 15 min |

---

## 🚀 Anza Haraka

```bash
# Angalia vikwazo vya usajili
az vm list-usage --location eastus --output table

# Angalia awali usambazaji (hakuna rasilimali zitakazoundwa)
azd provision --preview

# Thibitisha sintaksia ya Bicep
az bicep build --file infra/main.bicep

# Angalia usanidi wa mazingira
azd env get-values
```

---

## ☑️ Orodha ya Kukagua Kabla ya Utekelezaji

### Kabla ya `azd provision`

- [ ] Quota imethibitishwa kwa eneo
- [ ] SKUs zimechaguliwa ipasavyo
- [ ] Makadirio ya gharama yamekaguliwa
- [ ] Kanuni za uainishaji zimefuata
- [ ] Usalama/RBAC umetayarishwa

### Kabla ya `azd deploy`

- [ ] Vigezo vya mazingira vimewekwa
- [ ] Siri ziko kwenye Key Vault
- [ ] String za muunganisho zimehakikiwa
- [ ] Ukaguzi wa afya umewekwa

---

## 💰 Mwongozo wa Uchaguzi wa SKU

| Mzigo wa Kazi | Maendeleo | Uzalishaji |
|----------|-------------|------------|
| Programu za Kontena | Matumizi | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| Utafutaji wa AI | Basic | Standard S2+ |

---

## 🔗 Urambazaji

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Sura 5: Wakala Wengi](../chapter-05-multi-agent/README.md) |
| **Ifuatayo** | [Sura 7: Utatuzi wa Matatizo](../chapter-07-troubleshooting/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Mwongozo wa Usanidi](../chapter-03-configuration/configuration.md)
- [Mwongozo wa Utekelezaji](../chapter-04-infrastructure/deployment-guide.md)
- [Matatizo ya Kawaida](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Taarifa ya Kutokuwajibika**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kufikia usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokukamilika. Nyaraka ya asili katika lugha yake inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inashauriwa kutafsiriwa na mtafsiri mtaalamu wa kibinadamu. Hatubebei dhamana kwa kutokuelewana au tafsiri isiyo sahihi inayotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->