# Poglavlje 6: Planiranje i validacija prije implementacije

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 1 sat | **⭐ Složenost**: Srednja

---

## Pregled

Ovo poglavlje pokriva ključne korake planiranja i validacije prije implementacije vaše aplikacije. Naučite kako izbjeći skupe pogreške pravilnim planiranjem kapaciteta, odabirom SKU-ova i preletnim provjerama.

## Ciljevi učenja

Nakon što završite ovo poglavlje, moći ćete:
- Izvoditi preletne provjere prije implementacije
- Planirati kapacitet i procijeniti zahtjeve za resursima
- Odabrati odgovarajuće SKU-ove za optimizaciju troškova
- Konfigurirati Application Insights za nadzor
- Razumjeti obrasce koordinacije tima

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|---------|------|---------|
| 1 | [Preletne provjere](preflight-checks.md) | Validacija konfiguracije prije implementacije | 15 min |
| 2 | [Planiranje kapaciteta](capacity-planning.md) | Procjena zahtjeva za resursima | 20 min |
| 3 | [Odabir SKU-a](sku-selection.md) | Odabir prikladnih cjenovnih razreda | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfiguracija nadzora | 20 min |
| 5 | [Obrasci koordinacije](coordination-patterns.md) | Radni tijekovi tima za implementaciju | 15 min |

---

## 🚀 Brzi početak

```bash
# Provjeri kvote pretplate
az vm list-usage --location eastus --output table

# Pregled implementacije (nema kreiranih resursa)
azd provision --preview

# Validiraj Bicep sintaksu
az bicep build --file infra/main.bicep

# Provjeri konfiguraciju okruženja
azd env get-values
```

---

## ☑️ Kontrolni popis prije implementacije

### Prije `azd provision`

- [ ] Kvota potvrđena za regiju
- [ ] SKU-ovi prikladno odabrani
- [ ] Pregledana procjena troškova
- [ ] Dosljedna konvencija imenovanja
- [ ] Sigurnost/RBAC konfigurirani

### Prije `azd deploy`

- [ ] Postavljene varijable okoline
- [ ] Tajne u Key Vaultu
- [ ] Provjereni nizovi za povezivanje
- [ ] Konfigurirane provjere stanja

---

## 💰 Vodič za odabir SKU-a

| Opterećenje | Razvoj | Proizvodnja |
|-------------|---------|-------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-------|-----------|
| **Prethodno** | [Poglavlje 5: Više agenata](../chapter-05-multi-agent/README.md) |
| **Sljedeće** | [Poglavlje 7: Otklanjanje poteškoća](../chapter-07-troubleshooting/README.md) |

---

## 📖 Povezani resursi

- [Vodič za konfiguraciju](../chapter-03-configuration/configuration.md)
- [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md)
- [Uobičajeni problemi](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument preveden je pomoću AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, molimo imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne odgovaramo za bilo kakve nesporazume ili kriva tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->