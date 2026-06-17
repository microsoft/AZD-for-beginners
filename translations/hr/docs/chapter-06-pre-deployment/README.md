# Poglavlje 6: Planiranje i validacija prije implementacije

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 1 sat | **⭐ Kompleksnost**: Srednja

---

## Pregled

Ovo poglavlje pokriva osnovne korake planiranja i validacije prije implementacije vaše aplikacije. Naučite kako izbjeći skupe pogreške pravilnim planiranjem kapaciteta, odabirom SKU-a i preletnim provjerama.

> Validirano za `azd 1.25.6` u lipnju 2026.

## Ciljevi učenja

Nakon završetka ovog poglavlja moći ćete:
- Pokretati preletne provjere prije implementacije
- Planirati kapacitet i procijeniti zahtjeve za resursima
- Odabrati odgovarajuće SKU-ove za optimizaciju troškova
- Konfigurirati Application Insights za praćenje
- Razumjeti obrasce koordinacije timova

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|---------|-------|---------|
| 1 | [Preletne provjere](preflight-checks.md) | Validacija konfiguracije prije implementacije | 15 min |
| 2 | [Planiranje kapaciteta](capacity-planning.md) | Procjena zahtjeva za resursima | 20 min |
| 3 | [Odabir SKU-a](sku-selection.md) | Izbor prikladnih razina cijena | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfiguracija praćenja | 20 min |
| 5 | [Obrasci koordinacije](coordination-patterns.md) | Radni tokovi implementacije tima | 15 min |

---

## 🚀 Brzi početak

```bash
# Provjeri kvote pretplate
az vm list-usage --location eastus --output table

# Pregled implementacije (nisu stvoreni resursi)
azd provision --preview

# Validiraj Bicep sintaksu
az bicep build --file infra/main.bicep

# Provjeri konfiguraciju okoline
azd env get-values
```

---

## ☑️ Provjerna lista prije implementacije

### Prije `azd provision`

- [ ] Kvota provjerena za regiju
- [ ] SKU-ovi pravilno odabrani
- [ ] Procjena troškova pregledana
- [ ] Pravilo imenovanja dosljedno
- [ ] Sigurnost/RBAC konfigurirano

### Prije `azd deploy`

- [ ] Postavljene varijable okoline
- [ ] Tajne u Key Vault-u
- [ ] Provjerene veze
- [ ] Konfigurirane provjere zdravlja

---

## 💰 Vodič za odabir SKU-a

| Radno opterećenje | Razvoj | Produkcija |
|-------------------|---------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry modeli | Standard | Standard + PTU |
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
- [Česti problemi](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->