# Poglavje 6: Načrtovanje in preverjanje pred uvajanjem

**📚 Tečaj**: [AZD For Beginners](../../README.md) | **⏱️ Trajanje**: 1 ura | **⭐ Kompleksnost**: Srednje

---

## Pregled

To poglavje zajema bistvene korake načrtovanja in preverjanja pred uvajanjem vaše aplikacije. Naučite se, kako se izogniti dragim napakam z ustreznim načrtovanjem zmogljivosti, izbiro SKU-jev in predhodnimi (preflight) pregledi.

## Cilji učenja

Po zaključenem poglavju boste:
- Izvesti preflight preglede pred uvajanjem
- Načrtovati zmogljivost in oceniti potrebne vire
- Izbrati ustrezne SKU-je za optimizacijo stroškov
- Konfigurirati Application Insights za spremljanje
- Razumeti vzorce koordinacije ekipe

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Preveriti konfiguracijo pred uvajanjem | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Oceniti potrebe po virih | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Izbrati ustrezne cenovne razrede | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurirati spremljanje | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Delovni tokovi ekipe pri uvajanju | 15 min |

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

## ☑️ Kontrolni seznam pred uvajanjem

### Pred `azd provision`

- [ ] Kvota preverjena za regijo
- [ ] Ustrezno izbrani SKU-ji
- [ ] Ocena stroškov pregledana
- [ ] Dosledna konvencija poimenovanja
- [ ] Varnost/RBAC konfigurirana

### Pred `azd deploy`

- [ ] Okoljske spremenljivke nastavljene
- [ ] Skrivnosti v Key Vaultu
- [ ] Nizi povezav preverjeni
- [ ] Preverjanja zdravja (health checks) konfigurirana

---

## 💰 Vodnik za izbiro SKU-jev

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
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
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo storitve za strojno prevajanje z umetno inteligenco Co-op Translator (https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Za avtoritativni vir velja izvirni dokument v izvirnem jeziku. Za pomembne informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki bi izhajale iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->