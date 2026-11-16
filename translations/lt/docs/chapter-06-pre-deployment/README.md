# 6 skyrius: išankstinis diegimo planavimas ir patikrinimas

**📚 Kursas**: [AZD pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 2–4 val. skaitymo; papildomas laikas adaptuotiems laboratoriniams darbams | **⭐ Sudėtingumas**: vidutinis–pažengęs

---

## Apžvalga

Šiame skyriuje apžvelgiami svarbūs planavimo ir patikrinimo žingsniai prieš diegiant jūsų programą. Išmokite išvengti brangių klaidų tinkamai planuodami talpą, pasirinkdami SKU ir atlikdami išankstinius patikrinimus.

> Komandų vadovai patikrinti pagal išleistą `azd 1.37.2` referenciją. Debesies diegimai nebuvo vykdomi. Ilgesnės pamokos apima iliustracinius fragmentus, bet ne pilnus vietinius diegimo projektus.

## Mokymosi tikslai

Baigę šį skyrių jūs:
- Atliksite išankstinius patikrinimus prieš diegimą
- Planuosite talpą ir įvertinsite resursų poreikius
- Pasirinksite tinkamus SKU, kad optimizuotumėte išlaidas
- Konfigūruosite Application Insights stebėjimui
- Suprasite daugiaveiksmo koordinavimo modelius ir jų diegimo reikalavimus

---

## 📚 Pamokos

| Nr. | Pamoka | Aprašas | Trukmė |
|---|--------|-------------|------|
| 1 | [Išankstiniai patikrinimai](preflight-checks.md) | Patikrinkite konfigūraciją prieš diegimą | 15 min |
| 2 | [Talpos planavimas](capacity-planning.md) | Įvertinkite resursų poreikius | 20 min |
| 3 | [SKU pasirinkimas](sku-selection.md) | Pasirinkite tinkamus kainų lygius | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigūruokite stebėjimą | 20 min |
| 5 | [Koordinavimo modeliai](coordination-patterns.md) | Pažangus daugiaveiksmo orkestravimo dizainas | 60–75 min |

---

## 🚀 Greitas pradžia

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

## ☑️ Išankstinis diegimo kontrolinis sąrašas

### Prieš `azd provision`

- [ ] Patikrintas kvotas regione
- [ ] Tinkamai pasirinkti SKU
- [ ] Peržiūrėtas kaštų įvertinimas
- [ ] Nuosekli pavadinimų konvencija
- [ ] Sukonfigūruotas saugumas/RBAC

### Prieš `azd deploy`

- [ ] Nustatyti aplinkos kintamieji
- [ ] Slapti raktai Key Vault
- [ ] Patikrinti jungties eilutės
- [ ] Sukonfigūruoti sveikatos patikrinimai

---

## 💰 SKU pasirinkimo vadovas

| Darbo krūvis | Kūrimas | Produkcija |
|----------|-------------|------------|
| Container Apps | Consumption | Consumption arba specialus darbo krūvio profilis, pagal išmatuotą apkrovą |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI modeliai | Palaikomas mokėkite už naudojimą tipas | Mokėkite už naudojimą arba rezervuotas pralaidumas; priklauso nuo modelio/regiono |
| AI Search | Nemokamas/Pagrindinis su ribomis | Pagrindinis arba standartinis lygis, pritaikytas indeksui, replikoms ir užklausų apkrovai |

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|-----------|---------|
| **Ankstesnis** | [5 skyrius: Daugiaveiksmas](../chapter-05-multi-agent/README.md) |
| **Kitas** | [7 skyrius: Gedimų šalinimas](../chapter-07-troubleshooting/README.md) |

---

## 📖 Susiję šaltiniai

- [Konfigūracijos vadovas](../chapter-03-configuration/configuration.md)
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md)
- [Dažnos problemos](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->