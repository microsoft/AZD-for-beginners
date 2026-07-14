# Poglavje 6: Načrtovanje pred uvajanjem in preverjanje

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 1 ura | **⭐ Kompleksnost**: Srednje zahtevno

---

## Pregled

To poglavje zajema bistvene korake načrtovanja in preverjanja pred uvajanjem vaše aplikacije. Naučite se izogniti dragim napakam z ustreznim načrtovanjem zmogljivosti, izbiro SKU-jev in predhodnimi preverjanji.

> Preverjeno z `azd 1.27.1` julija 2026.

## Cilji učenja

Z dokončanjem tega poglavja boste:
- Izvedli predhodna preverjanja pred uvajanjem
- Načrtovali zmogljivost in ocenili zahteve po virih
- Izbrali ustrezne SKU-je za optimizacijo stroškov
- Konfigurirali Application Insights za nadzor
- Razumeli vzorce usklajevanja ekipe

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Predhodna preverjanja](preflight-checks.md) | Preverite konfiguracijo pred uvajanjem | 15 min |
| 2 | [Načrtovanje zmogljivosti](capacity-planning.md) | Ocenite zahteve virov | 20 min |
| 3 | [Izbira SKU](sku-selection.md) | Izberite ustrezne cenovne razrede | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfiguracija nadzora | 20 min |
| 5 | [Vzorce usklajevanja](coordination-patterns.md) | Delovni tokovi uvajanja ekipe | 15 min |

---

## 🚀 Hiter začetek

```bash
# Preveri kvote naročnine
az vm list-usage --location eastus --output table

# Predogled namestitve (ne ustvarja virov)
azd provision --preview

# Preveri skladnost sintakse Bicep
az bicep build --file infra/main.bicep

# Preveri konfiguracijo okolja
azd env get-values
```

---

## ☑️ Kontrolni seznam pred uvajanjem

### Pred `azd provision`

- [ ] Preverjena kvota za regijo
- [ ] Ustrezno izbrani SKU-ji
- [ ] Pregledana ocena stroškov
- [ ] Konsistentna konvencija poimenovanja
- [ ] Konfigurirana varnost/RBAC

### Pred `azd deploy`

- [ ] Nastavljene okoljske spremenljivke
- [ ] Gesla v Key Vault
- [ ] Preverjene povezovalne nizi
- [ ] Konfigurirani zdravstveni pregledi

---

## 💰 Vodič za izbiro SKU

| Delovno breme | Razvoj | Produkcija |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigacija

| Usmeritev | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 5: Večagentno](../chapter-05-multi-agent/README.md) |
| **Naslednje** | [Poglavje 7: Odpravljanje napak](../chapter-07-troubleshooting/README.md) |

---

## 📖 Sorodni viri

- [Vodič za konfiguracijo](../chapter-03-configuration/configuration.md)
- [Vodič za uvajanje](../chapter-04-infrastructure/deployment-guide.md)
- [Pogoste težave](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->