# Poglavje 6: Načrtovanje in preverjanje pred uvajanjem

**📚 Tečaj**: [AZD For Beginners](../../README.md) | **⏱️ Trajanje**: 1 ura | **⭐ Kompleksnost**: Srednje

---

## Pregled

To poglavje pokriva ključne korake načrtovanja in preverjanja pred uvajanjem vaše aplikacije. Naučite se, kako se izogniti dragim napakam z ustreznim načrtovanjem zmogljivosti, izbiro SKU-jev in predhodnimi preverjanji.

## Cilji učenja

By completing this chapter, you will:
- Izvesti predhodna preverjanja pred uvajanjem
- Načrtovati zmogljivosti in oceniti potrebne vire
- Izbrati ustrezne SKU-je za optimizacijo stroškov
- Konfigurirati Application Insights za spremljanje
- Razumeti vzorce koordinacije ekipe

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Predhodna preverjanja](preflight-checks.md) | Preverite konfiguracijo pred uvajanjem | 15 min |
| 2 | [Načrtovanje zmogljivosti](capacity-planning.md) | Oceniti potrebne vire | 20 min |
| 3 | [Izbira SKU-jev](sku-selection.md) | Izberite ustrezne cenovne stopnje | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurirajte spremljanje | 20 min |
| 5 | [Vzorce koordinacije](coordination-patterns.md) | Delovni procesi uvajanja ekipe | 15 min |

---

## 🚀 Hitri začetek

```bash
# Preveri kvote za naročnino
az vm list-usage --location eastus --output table

# Predogled razmestitve (ne ustvarja virov)
azd provision --preview

# Preveri sintakso Bicep
az bicep build --file infra/main.bicep

# Preveri konfiguracijo okolja
azd env get-values
```

---

## ☑️ Kontrolni seznam pred uvajanjem

### Pred `azd provision`

- [ ] Kvota preverjena za regijo
- [ ] SKU-ji ustrezno izbrani
- [ ] Ocena stroškov pregledana
- [ ] Poimenovalna konvencija skladna
- [ ] Varnost/RBAC konfigurirana

### Pred `azd deploy`

- [ ] Okoljske spremenljivke nastavljene
- [ ] Skrivnosti v Key Vault
- [ ] Nizi povezav preverjeni
- [ ] Health checks konfigurirani

---

## 💰 Vodnik za izbiro SKU-jev

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
Ta dokument je bil preveden s storitvijo za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, prosimo, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku velja za avtoritativni vir. Za ključne informacije priporočamo strokovni človeški prevod. Nismo odgovorni za nobene nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->