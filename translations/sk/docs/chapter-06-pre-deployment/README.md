# Kapitola 6: Plánovanie a overenie pred nasadením

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 1 hodina | **⭐ Zložitosť**: Stredne pokročilý

---

## Prehľad

Táto kapitola zahŕňa základné kroky plánovania a overenia pred nasadením vašej aplikácie. Naučte sa vyhnúť nákladným chybám správnym plánovaním kapacity, výberom SKU a kontrolami pred letom.

> Overené na `azd 1.27.1` v júli 2026.

## Ciele učenia

Po dokončení tejto kapitoly budete vedieť:
- Spustiť kontroly pred nasadením
- Plánovať kapacitu a odhadnúť požiadavky na zdroje
- Vybrať vhodné SKU pre optimalizáciu nákladov
- Nastaviť Application Insights na monitorovanie
- Pochopiť vzorce koordinácie tímu

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Kontroly pred nasadením](preflight-checks.md) | Overenie konfigurácie pred nasadením | 15 min |
| 2 | [Plánovanie kapacity](capacity-planning.md) | Odhad požiadaviek na zdroje | 20 min |
| 3 | [Výber SKU](sku-selection.md) | Výber vhodných cenových úrovní | 15 min |
| 4 | [Application Insights](application-insights.md) | Nastavenie monitorovania | 20 min |
| 5 | [Vzorce koordinácie](coordination-patterns.md) | Pracovné postupy tímového nasadenia | 15 min |

---

## 🚀 Rýchly začiatok

```bash
# Skontrolujte kvóty predplatného
az vm list-usage --location eastus --output table

# Náhľad nasadenia (nevytvárajú sa žiadne zdroje)
azd provision --preview

# Overte syntax Bicep
az bicep build --file infra/main.bicep

# Skontrolujte konfiguráciu prostredia
azd env get-values
```

---

## ☑️ Kontrolný zoznam pred nasadením

### Pred spustením `azd provision`

- [ ] Overená kvóta pre región
- [ ] Správny výber SKU
- [ ] Preskúmaný odhad nákladov
- [ ] Dodržanie konvencie názvov
- [ ] Nastavené zabezpečenie/RBAC

### Pred spustením `azd deploy`

- [ ] Nastavené premenné prostredia
- [ ] Tajomstvá v Key Vault
- [ ] Overené reťazce pripojení
- [ ] Nastavené kontroly zdravotného stavu

---

## 💰 Sprievodca výberom SKU

| Pracovná záťaž | Vývoj | Produkcia |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Štandardný | Štandardný + PTU |
| AI Search | Základný | Štandardný S2+ |

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 5: Multi-agent](../chapter-05-multi-agent/README.md) |
| **Nasledujúca** | [Kapitola 7: Riešenie problémov](../chapter-07-troubleshooting/README.md) |

---

## 📖 Súvisiace zdroje

- [Sprievodca konfiguráciou](../chapter-03-configuration/configuration.md)
- [Sprievodca nasadením](../chapter-04-infrastructure/deployment-guide.md)
- [Bežné problémy](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->