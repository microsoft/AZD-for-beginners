# Poglavlje 6: Planiranje i validacija prije implementacije

**📚 Tečaj**: [AZD Za Početnike](../../README.md) | **⏱️ Trajanje**: 1 sat | **⭐ Kompleksnost**: Srednja

---

## Pregled

Ovo poglavlje pokriva ključne korake planiranja i validacije prije implementacije vaše aplikacije. Naučite izbjeći skupe pogreške pravilnim planiranjem kapaciteta, odabirom SKU-a i provjerama prije implementacije.

> Validirano s `azd 1.23.12` u ožujku 2026.

## Ciljevi učenja

Nakon završetka ovog poglavlja, moći ćete:
- Pokrenuti provjere prije implementacije
- Planirati kapacitete i procijeniti potrebne resurse
- Odabrati odgovarajuće SKU-ove za optimizaciju troškova
- Konfigurirati Application Insights za nadzor
- Razumjeti obrasce koordinacije timova

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|---------|------|---------|
| 1 | [Provjere prije implementacije](preflight-checks.md) | Validacija konfiguracije prije implementacije | 15 min |
| 2 | [Planiranje kapaciteta](capacity-planning.md) | Procjena zahtjeva za resursima | 20 min |
| 3 | [Odabir SKU-a](sku-selection.md) | Izbor odgovarajućih cjenovnih razina | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfiguracija nadzora | 20 min |
| 5 | [Obrasci koordinacije](coordination-patterns.md) | Radni tijekovi implementacije u timu | 15 min |

---

## 🚀 Brzi početak

```bash
# Provjeri kvote pretplate
az vm list-usage --location eastus --output table

# Pregled implementacije (bez stvaranja resursa)
azd provision --preview

# Potvrdi sintaksu Bicep-a
az bicep build --file infra/main.bicep

# Provjeri konfiguraciju okruženja
azd env get-values
```

---

## ☑️ Popis za provjeru prije implementacije

### Prije `azd provision`

- [ ] Kvota potvrđena za regiju
- [ ] SKU-ovi odgovarajuće odabrani
- [ ] Pregled procjene troškova
- [ ] Dosljedna konvencija imenovanja
- [ ] Konfigurirana sigurnost/RBAC

### Prije `azd deploy`

- [ ] Postavljene varijable okoline
- [ ] Tajne u Key Vault-u
- [ ] Provjereni connection stringovi
- [ ] Konfigurirane provjere zdravlja

---

## 💰 Vodič za odabir SKU-a

| Radno opterećenje | Razvoj | Produkcija |
|-------------------|--------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-------|-----------|
| **Prethodno** | [Poglavlje 5: Više-agentski](../chapter-05-multi-agent/README.md) |
| **Sljedeće** | [Poglavlje 7: Rješavanje problema](../chapter-07-troubleshooting/README.md) |

---

## 📖 Povezani resursi

- [Vodič za konfiguraciju](../chapter-03-configuration/configuration.md)
- [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md)
- [Česti problemi](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz uporabe ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->