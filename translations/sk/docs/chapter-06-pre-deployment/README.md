# Kapitola 6: Plánovanie a validácia pred nasadením

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Dĺžka**: 1 hour | **⭐ Zložitosť**: Intermediate

---

## Prehľad

Táto kapitola pokrýva základné kroky plánovania a overovania pred nasadením vašej aplikácie. Naučte sa predchádzať nákladným chybám pomocou správneho plánovania kapacity, výberu SKU a prednasadzovacích kontrol.

## Ciele učenia

Po dokončení tejto kapitoly budete:
- Spúšťať prednasadzovacie kontroly pred nasadením
- Plánovať kapacitu a odhadovať požiadavky na zdroje
- Vyberať vhodné SKU pre optimalizáciu nákladov
- Konfigurovať Application Insights na monitorovanie
- Rozumieť vzorom tímovej koordinácie

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Kontroly pred nasadením](preflight-checks.md) | Overiť konfiguráciu pred nasadením | 15 min |
| 2 | [Plánovanie kapacity](capacity-planning.md) | Odhadnúť požiadavky na zdroje | 20 min |
| 3 | [Výber SKU](sku-selection.md) | Vybrať vhodné cenové hladiny | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurovať monitorovanie | 20 min |
| 5 | [Vzory koordinácie](coordination-patterns.md) | Tímové pracovné postupy pri nasadzovaní | 15 min |

---

## 🚀 Rýchly štart

```bash
# Skontrolovať kvóty predplatného
az vm list-usage --location eastus --output table

# Náhľad nasadenia (žiadne prostriedky nebudú vytvorené)
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
- [ ] SKU správne zvolené
- [ ] Skontrolovaný odhad nákladov
- [ ] Konzistentná konvencia pomenovania
- [ ] Zabezpečenie/RBAC nakonfigurované

### Pred `azd deploy`

- [ ] Nastavené premenné prostredia
- [ ] Tajomstvá v Key Vault
- [ ] Reťazce pripojenia overené
- [ ] Nastavené kontroly stavu

---

## 💰 Sprievodca výberom SKU

| Zaťaženie | Vývoj | Produkcia |
|----------|-------------|------------|
| Kontajnerové aplikácie | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Nasledujúca** | [Kapitola 7: Riešenie problémov](../chapter-07-troubleshooting/README.md) |

---

## 📖 Súvisiace zdroje

- [Príručka konfigurácie](../chapter-03-configuration/configuration.md)
- [Príručka nasadenia](../chapter-04-infrastructure/deployment-guide.md)
- [Bežné problémy](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o vylúčení zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by sa mal považovať za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->