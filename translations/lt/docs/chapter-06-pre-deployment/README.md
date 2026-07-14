# 6 skyrius: Išankstinis diegimo planavimas ir patikra

**📚 Kursas**: [AZD Pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 1 valanda | **⭐ Sudėtingumas**: Vidutinis

---

## Apžvalga

Šiame skyriuje aptariami esminiai planavimo ir patikros žingsniai prieš diegiant jūsų programą. Išmokite išvengti brangių klaidų tinkamai planuojant pajėgumus, pasirenkant SKU ir atliekant priešdiegimo patikras.

> Patikrinta su `azd 1.27.1` 2026 metų liepos mėn.

## Mokymosi tikslai

Baigę šį skyrių jūs:
- Atliksite priešdiegimo patikras
- Planuosite pajėgumus ir įvertinsite išteklių poreikį
- Pasirinksite tinkamus SKU kainų optimizavimui
- Konfigūruosite Application Insights stebėjimui
- Suprasite komandos koordinavimo modelius

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-------------|------|
| 1 | [Priešdiegimo patikros](preflight-checks.md) | Patikrinkite konfigūraciją prieš diegdami | 15 min |
| 2 | [Pajėgumų planavimas](capacity-planning.md) | Įvertinkite išteklių poreikį | 20 min |
| 3 | [SKU pasirinkimas](sku-selection.md) | Pasirinkite tinkamus kainų lygius | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigūruokite stebėjimą | 20 min |
| 5 | [Koordinavimo modeliai](coordination-patterns.md) | Komandos diegimo darbo eiga | 15 min |

---

## 🚀 Greitas pradžios vadovas

```bash
# Patikrinti prenumeratos kvotas
az vm list-usage --location eastus --output table

# Peržiūrėti diegimą (nesukuriant išteklių)
azd provision --preview

# Patikrinti Bicep sintaksę
az bicep build --file infra/main.bicep

# Patikrinti aplinkos konfigūraciją
azd env get-values
```

---

## ☑️ Priešdiegimo kontrolinis sąrašas

### Prieš `azd provision`

- [ ] Regiono kvota patikrinta
- [ ] SKU pasirinkti tinkamai
- [ ] Kainos įvertinimas peržiūrėtas
- [ ] Pavadinimų konvencija nuosekli
- [ ] Saugumas/RBAC sukonfigūruotas

### Prieš `azd deploy`

- [ ] Aplinkos kintamieji nustatyti
- [ ] Slaptažodžiai Key Vault
- [ ] Ryšio eilutės patikrintos
- [ ] Sveikatos patikros sukonfigūruotos

---

## 💰 SKU pasirinkimo vadovas

| Darbo krūvis | Kūrimas | Gamyba |
|----------|-------------|------------|
| Container Apps | Sąnaudų modelis | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standartinis | Standartinis + PTU |
| AI Search | Pagrindinis | Standartinis S2+ |

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|-----------|---------|
| **Ankstesnis** | [5 skyrius: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Kitas** | [7 skyrius: Gedimų šalinimas](../chapter-07-troubleshooting/README.md) |

---

## 📖 Susiję ištekliai

- [Konfigūracijos vadovas](../chapter-03-configuration/configuration.md)
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md)
- [Dažnos problemos](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->