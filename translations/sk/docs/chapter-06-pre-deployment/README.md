# Kapitola 6: Plánovanie a overenie pred nasadením

**📚 Kurz**: [AZD For Beginners](../../README.md) | **⏱️ Dĺžka**: 1 hodina | **⭐ Zložitosť**: Stredná

---

## Prehľad

Táto kapitola pokrýva základné kroky plánovania a overenia pred nasadením vašej aplikácie. Naučíte sa predchádzať nákladným chybám pomocou správneho plánovania kapacity, výberu SKU a prednasadzovacích kontrol.

> Overené proti `azd 1.25.6` v júni 2026.

## Ciele učenia

Po dokončení tejto kapitoly budete:
- Spúšťať prednasadzovacie kontroly pred nasadením
- Plánovať kapacitu a odhadovať požiadavky na zdroje
- Vyberať vhodné SKU na optimalizáciu nákladov
- Konfigurovať Application Insights na monitorovanie
- Pochopiť vzory koordinácie tímu

---

## 📚 Lekcie

| # | Lekcia | Popis | Trvanie |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Overiť konfiguráciu pred nasadením | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Odhadnúť požiadavky na zdroje | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Vybrať vhodné cenové hladiny | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurovať monitorovanie | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Pracovné postupy tímu pri nasadení | 15 min |

---

## 🚀 Rýchly štart

```bash
# Skontrolovať kvóty predplatného
az vm list-usage --location eastus --output table

# Náhľad nasadenia (nebudú vytvorené žiadne zdroje)
azd provision --preview

# Overiť syntax Bicep
az bicep build --file infra/main.bicep

# Skontrolovať konfiguráciu prostredia
azd env get-values
```

---

## ☑️ Kontrolný zoznam pred nasadením

### Pred `azd provision`

- [ ] Kvóta overená pre región
- [ ] SKU správne vybrané
- [ ] Nákladový odhad skontrolovaný
- [ ] Konzistentná konvencia pomenovania
- [ ] Bezpečnosť/RBAC nakonfigurované

### Pred `azd deploy`

- [ ] Nastavené premenné prostredia
- [ ] Tajomstvá v Key Vault
- [ ] Overené connection strings
- [ ] Nakonfigurované health checky

---

## 💰 Sprievodca výberom SKU

| Pracovná záťaž | Vývoj | Produkcia |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Ďalšia** | [Kapitola 7: Riešenie problémov](../chapter-07-troubleshooting/README.md) |

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