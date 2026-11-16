# Poglavlje 6: Planiranje i validacija prije implementacije

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 2-4 sata čitanja; dodatno vrijeme za prilagođene laboratorije | **⭐ Kompleksnost**: Srednja – Napredna

---

## Pregled

Ovo poglavlje pokriva ključne korake planiranja i validacije prije implementacije vaše aplikacije. Naučite kako izbjeći skupe pogreške pravilnim planiranjem kapaciteta, odabirom SKU-a i provjerama prije izvođenja.

> Upute za naredbe pregledane u odnosu na objavljenu referencu `azd 1.37.2`. Implementacije u oblaku nisu izvršene. Dulje lekcije uključuju ilustrativne fragmente, ne potpune lokalne projekate implementacije.

## Ciljevi učenja

Završetkom ovog poglavlja, moći ćete:
- Izvršavati preflight provjere prije implementacije
- Planirati kapacitet i procijeniti zahtjeve za resursima
- Odabrati odgovarajuće SKU-ove za optimizaciju troškova
- Konfigurirati Application Insights za nadzor
- Razumjeti obrasce koordinacije više agenata i njihove zahtjeve za implementaciju

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Preflight provjere](preflight-checks.md) | Validacija konfiguracije prije implementacije | 15 min |
| 2 | [Planiranje kapaciteta](capacity-planning.md) | Procjena zahtjeva za resursima | 20 min |
| 3 | [Odabir SKU-a](sku-selection.md) | Odabir odgovarajućih cjenovnih razina | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfiguracija nadzora | 20 min |
| 5 | [Obrasci koordinacije](coordination-patterns.md) | Napredno dizajniranje orkestracije više agenata | 60-75 min |

---

## 🚀 Brzi početak

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

## ☑️ Kontrolna lista prije implementacije

### Prije `azd provision`

- [ ] Provjerena kvota za regiju
- [ ] SKU-ovi odabrani prikladno
- [ ] Pregledana procjena troškova
- [ ] Dosljedna konvencija imenovanja
- [ ] Konfigurirana sigurnost/RBAC

### Prije `azd deploy`

- [ ] Postavljene varijable okoline
- [ ] Tajne u Key Vaultu
- [ ] Provjereni connection stringovi
- [ ] Konfigurirane provjere zdravlja

---

## 💰 Vodič za odabir SKU-a

| Radno opterećenje | Razvoj | Produkcija |
|----------|-------------|------------|
| Container Apps | Potrošnja | Potrošnja ili posvećeni profil opterećenja, ovisno o izmjerenom opterećenju |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI modeli | Podržan tip implementacije po potrošnji | Po potrošnji ili s rezerviranom propusnošću; ovisno o modelu/regiji |
| AI Search | Besplatno/Osnovno unutar granica | Osnovna ili Standardna razina dimenzionirana za indeks, replike i opterećenje upita |

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 5: Više agenata](../chapter-05-multi-agent/README.md) |
| **Sljedeće** | [Poglavlje 7: Otklanjanje poteškoća](../chapter-07-troubleshooting/README.md) |

---

## 📖 Povezani resursi

- [Vodič za konfiguraciju](../chapter-03-configuration/configuration.md)
- [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md)
- [Uobičajeni problemi](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->