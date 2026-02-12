# 6 skyrius: Planavimas ir patikrinimas prieš diegimą

**📚 Kursas**: [AZD Pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 1 val. | **⭐ Sudėtingumas**: Vidutinio sudėtingumo

---

## Apžvalga

Šis skyrius apima būtinus planavimo ir patikrinimo žingsnius prieš diegiant jūsų programą. Sužinokite, kaip išvengti brangių klaidų atliekant tinkamą pajėgumų planavimą, SKU parinkimą ir priešdiegiamuosius patikrinimus.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Atlikti priešdiegimo patikras prieš diegimą
- Planuoti pajėgumus ir įvertinti resursų poreikius
- Pasirinkti tinkamus SKU siekiant optimizuoti išlaidas
- Konfigūruoti Application Insights stebėjimui
- Suprasti komandos koordinacijos modelius

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-------------|------|
| 1 | [Priešdiegimo patikros](preflight-checks.md) | Patvirtinti konfigūraciją prieš diegimą | 15 min |
| 2 | [Kapaciteto planavimas](capacity-planning.md) | Įvertinti resursų poreikius | 20 min |
| 3 | [SKU parinkimas](sku-selection.md) | Pasirinkti tinkamus kainų lygius | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigūruoti stebėjimą | 20 min |
| 5 | [Koordinacijos modeliai](coordination-patterns.md) | Komandos diegimo darbo eigos | 15 min |

---

## 🚀 Greitas startas

```bash
# Patikrinti prenumeratos kvotas
az vm list-usage --location eastus --output table

# Peržiūrėti diegimą (ištekliai nebus sukurti)
azd provision --preview

# Patikrinti Bicep sintaksę
az bicep build --file infra/main.bicep

# Patikrinti aplinkos konfigūraciją
azd env get-values
```

---

## ☑️ Patikrinimų sąrašas prieš diegimą

### Prieš `azd provision`

- [ ] Kvota patikrinta pasirinktame regione
- [ ] Tinkamai pasirinkti SKU
- [ ] Peržiūrėtas sąnaudų įvertinimas
- [ ] Vieninga pavadinimų konvencija
- [ ] Saugumas/RBAC sukonfigūruotas

### Prieš `azd deploy`

- [ ] Aplinkos kintamieji nustatyti
- [ ] Slapti duomenys Key Vault'e
- [ ] Prisijungimo eilutės patikrintos
- [ ] Sveikatos patikros sukonfigūruotos

---

## 💰 SKU parinkimo vadovas

| Darbo krūvis | Vystymui | Produkcijai |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Naršymas

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
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą Co-op Translator (https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo pradinėje kalboje turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus, žmogaus atliktas vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kylančius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->