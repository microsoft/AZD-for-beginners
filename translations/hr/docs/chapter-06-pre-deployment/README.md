# Poglavlje 6: Planiranje i validacija prije implementacije

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 1 sat | **⭐ Složenost**: Srednja

---

## Pregled

Ovo poglavlje obuhvaća ključne korake planiranja i provjere prije implementacije vaše aplikacije. Naučite kako izbjeći skupe pogreške pravilnim planiranjem kapaciteta, odabirom SKU-ova i preflight provjerama.

## Ciljevi učenja

Dovršetkom ovog poglavlja, moći ćete:
- Pokrenuti preflight provjere prije implementacije
- Planirati kapacitet i procijeniti potrebe za resursima
- Odabrati odgovarajuće SKU-ove za optimizaciju troškova
- Konfigurirati Application Insights za praćenje
- Razumjeti obrasce koordinacije tima

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Preflight provjere](preflight-checks.md) | Provjerite konfiguraciju prije implementacije | 15 min |
| 2 | [Planiranje kapaciteta](capacity-planning.md) | Procijenite potrebe za resursima | 20 min |
| 3 | [Odabir SKU-a](sku-selection.md) | Odaberite odgovarajuće razine cijena | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurirajte praćenje | 20 min |
| 5 | [Uzorci koordinacije](coordination-patterns.md) | Radni tokovi timske implementacije | 15 min |

---

## 🚀 Brzi početak

```bash
# Provjeri kvote pretplate
az vm list-usage --location eastus --output table

# Pregled implementacije (ne stvaraju se resursi)
azd provision --preview

# Provjeri Bicep sintaksu
az bicep build --file infra/main.bicep

# Provjeri konfiguraciju okruženja
azd env get-values
```

---

## ☑️ Kontrolni popis prije implementacije

### Prije `azd provision`

- [ ] Kvota provjerena za regiju
- [ ] Odabrani odgovarajući SKU-ovi
- [ ] Procjena troškova pregledana
- [ ] Konvencija imenovanja dosljedna
- [ ] Sigurnost/RBAC konfigurirano

### Prije `azd deploy`

- [ ] Varijable okruženja postavljene
- [ ] Tajne u Key Vaultu
- [ ] Nizovi za povezivanje provjereni
- [ ] Provjere stanja konfigurirane

---

## 💰 Vodič za odabir SKU-a

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 5: Više agenata](../chapter-05-multi-agent/README.md) |
| **Sljedeće** | [Poglavlje 7: Rješavanje problema](../chapter-07-troubleshooting/README.md) |

---

## 📖 Povezani resursi

- [Vodič za konfiguraciju](../chapter-03-configuration/configuration.md)
- [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md)
- [Uobičajeni problemi](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Odricanje odgovornosti:
Ovaj je dokument preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo biti točni, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni prijevod od strane ljudskog prevoditelja. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja proizašla iz upotrebe ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->