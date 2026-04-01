# 6 skyrius: Išankstinis diegimo planavimas ir validavimas

**📚 Kursas**: [AZD Pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 1 valanda | **⭐ Sudėtingumas**: Vidutinis

---

## Apžvalga

Šiame skyriuje aptariami pagrindiniai planavimo ir validavimo žingsniai prieš diegiant jūsų programą. Išmokite išvengti brangių klaidų tinkamai planuojant pajėgumus, pasirenkant SKU ir atliekant išankstines patikras.

> Validuota su `azd 1.23.12` 2026 m. kovo mėn.

## Mokymosi tikslai

Įvykdę šį skyrių, jūs:
- Vykdysite išankstines patikras prieš diegimą
- Planavote pajėgumą ir įvertinsite išteklių reikalavimus
- Pasirinksite tinkamus SKU kainų optimizavimui
- Konfigūruosite Application Insights monitoringui
- Suprasite komandos koordinavimo modelius

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-----------|--------|
| 1 | [Išankstinės patikros](preflight-checks.md) | Validuoti konfigūraciją prieš diegimą | 15 min |
| 2 | [Pajėgumo planavimas](capacity-planning.md) | Įvertinti išteklių reikalavimus | 20 min |
| 3 | [SKU pasirinkimas](sku-selection.md) | Pasirinkti tinkamus kainų lygius | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigūruoti monitoringą | 20 min |
| 5 | [Koordinavimo modeliai](coordination-patterns.md) | Komandos diegimo darbo eiga | 15 min |

---

## 🚀 Greitas pradžios vadovas

```bash
# Patikrinkite prenumeratos kvotas
az vm list-usage --location eastus --output table

# Peržiūrėkite diegimą (nekuria išteklių)
azd provision --preview

# Patvirtinkite Bicep sintaksę
az bicep build --file infra/main.bicep

# Patikrinkite aplinkos konfigūraciją
azd env get-values
```

---

## ☑️ Išankstinis diegimo kontrolinis sąrašas

### Prieš `azd provision`

- [ ] Patikrintas kvotos regionas
- [ ] Tinkamai parinkti SKU
- [ ] Peržiūrėta kaštų sąmata
- [ ] Nuoseklus vardų suteikimo standartas
- [ ] Konfigūruotas saugumas/RBAC

### Prieš `azd deploy`

- [ ] Nustatytos aplinkos kintamieji
- [ ] Slapti duomenys Key Vault
- [ ] Patikrinti jungčių eilutės
- [ ] Konfigūruotos sveikatos patikros

---

## 💰 SKU pasirinkimo gidas

| Darbo krūvis | Kūrimas | Gamyba |
|--------------|---------|---------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|---------|----------|
| **Ankstesnis** | [5 skyrius: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Kitas** | [7 skyrius: Problemų sprendimas](../chapter-07-troubleshooting/README.md) |

---

## 📖 Susijusios ištekliai

- [Konfigūracijos vadovas](../chapter-03-configuration/configuration.md)
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md)
- [Dažnos problemos](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turi būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neatsakome už bet kokius nesusipratimus ar neteisingus aiškinimus, kylančius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->