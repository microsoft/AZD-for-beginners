# Poglavje 6: Načrtovanje in preverjanje pred uvajanjem

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 1 ura | **⭐ Zahtevnost**: Srednja

---

## Pregled

To poglavje zajema bistvene korake načrtovanja in preverjanja pred uvajanjem vaše aplikacije. Naučite se, kako se izogniti dragim napakam z ustreznim načrtovanjem zmogljivosti, izbiro SKU-jev in predhodnimi pregledi.

> Preverjeno z `azd 1.25.6` v juniju 2026.

## Cilji učenja

Z zaključkom tega poglavja boste:
- Izvedli predhodna preverjanja pred uvajanjem
- Načrtovali zmogljivost in ocenili zahteve po virih
- Izbrali ustrezne SKU-je za optimizacijo stroškov
- Konfigurirali Application Insights za spremljanje
- Razumeli vzorce koordinacije ekipe

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Predhodna preverjanja](preflight-checks.md) | Preverite konfiguracijo pred uvajanjem | 15 min |
| 2 | [Načrtovanje zmogljivosti](capacity-planning.md) | Ocenite zahteve po virih | 20 min |
| 3 | [Izbira SKU-jev](sku-selection.md) | Izberite ustrezne cenovne stopnje | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurirajte spremljanje | 20 min |
| 5 | [Vzorce koordinacije](coordination-patterns.md) | Delovni poteki ekipe pri uvajanju | 15 min |

---

## 🚀 Hitri začetek

```bash
# Preveri kvote naročnine
az vm list-usage --location eastus --output table

# Predogled uvajanja (ne bodo ustvarjeni viri)
azd provision --preview

# Preveri sintakso Bicepa
az bicep build --file infra/main.bicep

# Preveri konfiguracijo okolja
azd env get-values
```

---

## ☑️ Seznam za preverjanje pred uvajanjem

### Pred `azd provision`

- [ ] Kvote preverjene za regijo
- [ ] SKU-ji ustrezno izbrani
- [ ] Ocena stroškov pregledana
- [ ] Poimenovalna konvencija dosledna
- [ ] Varnost/RBAC konfigurirana

### Pred `azd deploy`

- [ ] Spremenljivke okolja nastavljene
- [ ] Skrivnosti v Key Vault
- [ ] Nizi za povezavo preverjeni
- [ ] Preverjanja stanja konfigurirana

---

## 💰 Vodnik za izbiro SKU-jev

| Delovna obremenitev | Razvoj | Produkcija |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Modeli Microsoft Foundry | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 5: Večagentni](../chapter-05-multi-agent/README.md) |
| **Naslednje** | [Poglavje 7: Odpravljanje težav](../chapter-07-troubleshooting/README.md) |

---

## 📖 Povezani viri

- [Vodnik za konfiguracijo](../chapter-03-configuration/configuration.md)
- [Vodnik za uvajanje](../chapter-04-infrastructure/deployment-guide.md)
- [Pogoste težave](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->