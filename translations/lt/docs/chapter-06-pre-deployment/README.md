# Skyrius 6: Išankstinis diegimo planavimas ir patikra

**📚 Kursas**: [AZD pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 1 val. | **⭐ Sudėtingumas**: Vidutinis

---

## Apžvalga

This chapter covers essential planning and validation steps before deploying your application. Learn to avoid costly mistakes with proper capacity planning, SKU selection, and preflight checks.

> Patikrinta su `azd 1.25.6` 2026 m. birželį.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Vykdyti parengiamuosius (preflight) patikrinimus prieš diegimą
- Planuoti pajėgumus ir įvertinti resursų poreikį
- Pasirinkti tinkamus SKU, kad optimizuotumėte išlaidas
- Konfigūruoti Application Insights stebėjimui
- Suprasti komandos koordinavimo modelius

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Trukmė |
|---|--------|-------------|------|
| 1 | [Parengiamieji patikrinimai](preflight-checks.md) | Patikrinti konfigūraciją prieš diegimą | 15 min |
| 2 | [Pajėgumų planavimas](capacity-planning.md) | Įvertinti resursų poreikius | 20 min |
| 3 | [SKU pasirinkimas](sku-selection.md) | Pasirinkti tinkamus kainų lygius | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigūruoti stebėjimą | 20 min |
| 5 | [Koordinavimo modeliai](coordination-patterns.md) | Komandos diegimo darbo srautai | 15 min |

---

## 🚀 Greitas startas

```bash
# Patikrinti prenumeratos kvotas
az vm list-usage --location eastus --output table

# Peržiūrėti diegimą (išteklių nesukuriama)
azd provision --preview

# Patikrinti Bicep sintaksę
az bicep build --file infra/main.bicep

# Patikrinti aplinkos konfigūraciją
azd env get-values
```

---

## ☑️ Prieš diegimą — kontrolinis sąrašas

### Prieš `azd provision`

- [ ] Kvota patikrinta regione
- [ ] SKU tinkamai pasirinkti
- [ ] Išlaidų sąmata peržiūrėta
- [ ] Pavadinimų konvencija nuosekli
- [ ] Sauga/RBAC sukonfigūruoti

### Prieš `azd deploy`

- [ ] Aplinkos kintamieji nustatyti
- [ ] Slaptažodžiai saugomi Key Vault
- [ ] Prisijungimo eilutės patikrintos
- [ ] Sveikatos patikros sukonfigūruotos

---

## 💰 SKU pasirinkimo vadovas

| Workload | Vystymas | Gamybinė |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Naršymas

| Kryptis | Skyrius |
|-----------|---------|
| **Ankstesnis** | [Skyrius 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Kitas** | [Skyrius 7: Trikčių šalinimas](../chapter-07-troubleshooting/README.md) |

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