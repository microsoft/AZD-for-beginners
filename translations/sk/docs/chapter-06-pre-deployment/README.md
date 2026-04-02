# Chapter 6: Plánovanie a overovanie pred nasadením

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 1 hodina | **⭐ Zložitosť**: Stredne pokročilý

---

## Prehľad

Táto kapitola pokrýva základné kroky plánovania a overovania pred nasadením vašej aplikácie. Naučte sa vyhnúť nákladným chybám pomocou správneho plánovania kapacity, výberu SKU a predbežných kontrol.

> Overené s `azd 1.23.12` v marci 2026.

## Výukové ciele

Úspešným dokončením tejto kapitoly budete vedieť:
- Spustiť predbežné kontroly pred nasadením
- Plánovať kapacitu a odhadnúť požiadavky na zdroje
- Vybrať vhodné SKU pre optimalizáciu nákladov
- Konfigurovať Application Insights na monitorovanie
- Pochopiť vzorce koordinácie tímu

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Predbežné kontroly](preflight-checks.md) | Overenie konfigurácie pred nasadením | 15 min |
| 2 | [Plánovanie kapacity](capacity-planning.md) | Odhad požiadaviek na zdroje | 20 min |
| 3 | [Výber SKU](sku-selection.md) | Výber vhodných cenových úrovní | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurácia monitorovania | 20 min |
| 5 | [Vzorce koordinácie](coordination-patterns.md) | Pracovné postupy tímového nasadenia | 15 min |

---

## 🚀 Rýchly štart

```bash
# Skontrolujte kvóty predplatného
az vm list-usage --location eastus --output table

# Náhľad nasadenia (neboli vytvorené žiadne zdroje)
azd provision --preview

# Overte syntax Bicep
az bicep build --file infra/main.bicep

# Skontrolujte konfiguráciu prostredia
azd env get-values
```

---

## ☑️ Kontrolný zoznam pred nasadením

### Pred `azd provision`

- [ ] Overená kvóta pre región
- [ ] Vhodne vybrané SKU
- [ ] Preskúmaný odhad nákladov
- [ ] Konzistentná konvencia pomenovania
- [ ] Nastavené zabezpečenie/RBAC

### Pred `azd deploy`

- [ ] Nastavené premenné prostredia
- [ ] Tajomstvá v Key Vault
- [ ] Overené pripojovacie reťazce
- [ ] Nakonfigurované zdravotné kontroly

---

## 💰 Sprievodca výberom SKU

| Zaťaženie | Vývoj | Produkcia |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 5: Viacagentný](../chapter-05-multi-agent/README.md) |
| **Nasledujúca** | [Kapitola 7: Riešenie problémov](../chapter-07-troubleshooting/README.md) |

---

## 📖 Súvisiace zdroje

- [Sprievodca konfiguráciou](../chapter-03-configuration/configuration.md)
- [Sprievodca nasadením](../chapter-04-infrastructure/deployment-guide.md)
- [Bežné problémy](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Upozornenie**:  
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, prosím, majte na pamäti, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nezodpovedáme za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->