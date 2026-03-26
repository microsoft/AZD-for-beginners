# 6 skyrius: Planavimas ir patikra prieš diegimą

**📚 Kursas**: [AZD pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 1 valanda | **⭐ Sudėtingumas**: Vidutinis

---

## Apžvalga

Šiame skyriuje aptariami būtini planavimo ir patikros žingsniai prieš programos diegimą. Sužinokite, kaip išvengti brangių klaidų atliekant tinkamą talpos planavimą, SKU parinkimą ir išankstinius patikrinimus.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Vykdysite išankstinius patikrinimus prieš diegimą
- Planuosite talpą ir įvertinsite išteklių poreikius
- Parinksite tinkamus SKU siekiant optimizuoti kaštus
- Konfigūruosite Application Insights stebėjimui
- Suprasite komandos koordinavimo modelius

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-------------|------|
| 1 | [Išankstiniai patikrinimai](preflight-checks.md) | Patikrinkite konfigūraciją prieš diegimą | 15 min |
| 2 | [Talpos planavimas](capacity-planning.md) | Įvertinkite išteklių poreikius | 20 min |
| 3 | [SKU parinkimas](sku-selection.md) | Pasirinkite tinkamus kainų lygius | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigūruokite stebėjimą | 20 min |
| 5 | [Koordinavimo šablonai](coordination-patterns.md) | Komandos diegimo darbo eiga | 15 min |

---

## 🚀 Greitas pradėjimas

```bash
# Patikrinti prenumeratos kvotas
az vm list-usage --location eastus --output table

# Peržiūrėti diegimą (resursai nebus sukurti)
azd provision --preview

# Patikrinti Bicep sintaksę
az bicep build --file infra/main.bicep

# Patikrinti aplinkos konfigūraciją
azd env get-values
```

---

## ☑️ Patikrinimų sąrašas prieš diegimą

### Prieš `azd provision`

- [ ] Kvota patikrinta regione
- [ ] Tinkamai parinkti SKU
- [ ] Peržiūrėtas sąnaudų įvertinimas
- [ ] Vardų konvencijos atitikimas
- [ ] Sauga/RBAC sukonfigūruota

### Prieš `azd deploy`

- [ ] Aplinkos kintamieji nustatyti
- [ ] Slaptieji duomenys Key Vault
- [ ] Prisijungimo eilutės patikrintos
- [ ] Sveikatos patikros sukonfigūruotos

---

## 💰 SKU parinkimo vadovas

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Naršymas

| Direction | Chapter |
|-----------|---------|
| **Previous** | [5 skyrius: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Next** | [7 skyrius: Trikčių šalinimas](../chapter-07-troubleshooting/README.md) |

---

## 📖 Susiję ištekliai

- [Konfigūracijos vadovas](../chapter-03-configuration/configuration.md)
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md)
- [Dažnos problemos](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl kritinės informacijos rekomenduojamas profesionalus žmogaus vertimas. Mes neprisiimame atsakomybės už bet kokius nesusipratimus ar neteisingus aiškinimus, kylančius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->