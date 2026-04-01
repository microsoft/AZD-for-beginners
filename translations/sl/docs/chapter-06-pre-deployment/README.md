# Poglavje 6: Načrtovanje in preverjanje pred uvajanjem

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 1 ura | **⭐ Kompleksnost**: Srednje zahtevno

---

## Pregled

To poglavje zajema ključne korake načrtovanja in preverjanja pred uvajanjem vaše aplikacije. Naučite se, kako se izogniti dragim napakam z ustreznim načrtovanjem zmogljivosti, izborom SKU-jev in preflight preverjanji.

> Preverjeno z `azd 1.23.12` v marcu 2026.

## Cilji učenja

Z zaključkom tega poglavja boste:
- Zagnali preflight preverjanja pred uvajanjem
- Načrtovali zmogljivost in ocenili potrebne vire
- Izbrali ustrezne SKU-je za optimizacijo stroškov
- Konfigurirali Application Insights za spremljanje
- Razumeli vzorce koordinacije ekipe

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Preflight preverjanja](preflight-checks.md) | Preverite konfiguracijo pred uvajanjem | 15 min |
| 2 | [Načrtovanje zmogljivosti](capacity-planning.md) | Ocenite potrebne vire | 20 min |
| 3 | [Izbira SKU-jev](sku-selection.md) | Izberite ustrezne cenovne razrede | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurirajte spremljanje | 20 min |
| 5 | [Koordinacijski vzorci](coordination-patterns.md) | Delovni poteki ekipe pri uvajanju | 15 min |

---

## 🚀 Hiter začetek

```bash
# Preveri kvote naročnine
az vm list-usage --location eastus --output table

# Predogled uvajanja (brez ustvarjenih virov)
azd provision --preview

# Preveri sintakso Bicep
az bicep build --file infra/main.bicep

# Preveri konfiguracijo okolja
azd env get-values
```

---

## ☑️ Seznam za preverjanje pred uvajanjem

### Pred `azd provision`

- [ ] Kvota preverjena za regijo
- [ ] SKU-ji ustrezno izbrani
- [ ] Ocena stroškov pregledana
- [ ] Konvencija poimenovanja usklajena
- [ ] Varnost/RBAC konfigurirana

### Pred `azd deploy`

- [ ] Nastavljene spremenljivke okolja
- [ ] Skrivnosti v Key Vaultu
- [ ] Nizi povezave preverjeni
- [ ] Preverjanja stanja konfigurirana

---

## 💰 Vodič za izbiro SKU-jev

| Delovna obremenitev | Razvoj | Produkcija |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Naslednje** | [Poglavje 7: Odpravljanje težav](../chapter-07-troubleshooting/README.md) |

---

## 📖 Sorodni viri

- [Vodnik za konfiguracijo](../chapter-03-configuration/configuration.md)
- [Vodnik za uvajanje](../chapter-04-infrastructure/deployment-guide.md)
- [Pogoste težave](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku velja za avtoritativni vir. Za kritične informacije priporočamo strokovni človeški prevod. Za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda, ne odgovarjamo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->