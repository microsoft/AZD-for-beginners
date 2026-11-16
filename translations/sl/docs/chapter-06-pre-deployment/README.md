# Poglavje 6: Načrtovanje in preverjanje pred uvajanjem

**📚 Tečaj**: [AZD Za začetnike](../../README.md) | **⏱️ Trajanje**: 2-4 ure branja; dodaten čas za prilagojene vaje | **⭐ Kompleksnost**: Srednja–Napredna

---

## Pregled

To poglavje pokriva ključne korake načrtovanja in preverjanja pred uvajanjem vaše aplikacije. Naučite se, kako se izogniti dragim napakam s pravilnim načrtovanjem zmogljivosti, izbiro SKU-jev in preverjanjem pred izvajanjem.

> Usmeritve za ukaze so preverjene glede na izdani referenčni `azd 1.37.2`. Uvajanja v oblaku niso bila izvedena. Daljše lekcije vsebujejo ilustrativne fragmente, ne popolnih projektov lokalnega uvajanja.

## Cilji učenja

Po zaključku tega poglavja boste:
- Izvajali preverjanja pred uvajanjem
- Načrtovali zmogljivost in ocenili potrebe po virih
- Izbrali ustrezne SKU-je za optimizacijo stroškov
- Konfigurirali Application Insights za nadzor
- Razumeli vzorce koordinacije več agentov in njihove zahteve za uvajanje

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------|-----|
| 1 | [Preverjanja pred izvajanjem](preflight-checks.md) | Preverite konfiguracijo pred uvajanjem | 15 min |
| 2 | [Načrtovanje zmogljivosti](capacity-planning.md) | Ocenite potrebe po virih | 20 min |
| 3 | [Izbira SKU](sku-selection.md) | Izberite ustrezne cenovne razrede | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfiguracija nadzora | 20 min |
| 5 | [Vzorce koordinacije](coordination-patterns.md) | Napredna zasnova orkestracije več agentov | 60-75 min |

---

## 🚀 Hiter začetek

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

## ☑️ Kontrolni seznam pred uvajanjem

### Pred `azd provision`

- [ ] Kvote preverjene za regijo
- [ ] SKU-ji ustrezno izbrani
- [ ] Pregledana ocena stroškov
- [ ] Dosledna poimenovalna konvencija
- [ ] Varnost/RBAC konfiguriran

### Pred `azd deploy`

- [ ] Nastavljene okoljske spremenljivke
- [ ] Skrivnosti v Key Vault
- [ ] Preverjene povezovalne nizi
- [ ] Konfigurirane zdravstvene preverjanja

---

## 💰 Vodnik za izbiro SKU

| Delovna obremenitev | Razvoj | Produkcija |
|--------------------|----------|-----------|
| Container Apps | Poraba | Poraba ali namenski profil obremenitve, glede na izmerjeno obremenitev |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI modeli | Podprt tip uvajanja "plačilo-po-porabi" | Plačilo-po-porabi ali zagotovljena prepustnost; odvisno od modela/regije |
| AI Search | Brezplačno/osnovno v mejah | Osnovni ali standardni razred velikosti za indeks, kopije in obremenitev poizvedb |

---

## 🔗 Navigacija

| Smer | Poglavje |
|------|----------|
| **Prejšnje** | [Poglavje 5: Več agentov](../chapter-05-multi-agent/README.md) |
| **Naslednje** | [Poglavje 7: Odpravljanje težav](../chapter-07-troubleshooting/README.md) |

---

## 📖 Sorodni viri

- [Vodnik za konfiguracijo](../chapter-03-configuration/configuration.md)
- [Vodnik za uvajanje](../chapter-04-infrastructure/deployment-guide.md)
- [Pogoste težave](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->