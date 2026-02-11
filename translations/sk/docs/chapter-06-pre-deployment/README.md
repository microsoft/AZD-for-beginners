# Kapitola 6: Plánovanie a overovanie pred nasadením

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 1 hodina | **⭐ Náročnosť**: Stredná

---

## Prehľad

Táto kapitola pokrýva základné kroky plánovania a overovania pred nasadením vašej aplikácie. Naučíte sa vyhnúť drahým chybám pomocou správneho plánovania kapacít, výberu SKU a preflight kontrol.

## Ciele učenia

Po dokončení tejto kapitoly budete:
- Vykonať preflight kontroly pred nasadením
- Naplánovať kapacitu a odhadnúť požiadavky na zdroje
- Vybrať vhodné SKU pre optimalizáciu nákladov
- Nakonfigurovať Application Insights pre monitorovanie
- Pochopiť vzory koordinácie tímu

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Overiť konfiguráciu pred nasadením | 15 min |
| 2 | [Plánovanie kapacity](capacity-planning.md) | Odhadnúť požiadavky na zdroje | 20 min |
| 3 | [Výber SKU](sku-selection.md) | Vybrať vhodné cenové úrovne | 15 min |
| 4 | [Application Insights](application-insights.md) | Nakonfigurovať monitorovanie | 20 min |
| 5 | [Koordinačné vzory](coordination-patterns.md) | Tímové pracovné postupy pri nasadení | 15 min |

---

## 🚀 Rýchly štart

```bash
# Skontrolovať kvóty predplatného
az vm list-usage --location eastus --output table

# Náhľad nasadenia (žiadne zdroje nebudú vytvorené)
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
- [ ] Prekontrolovaný odhad nákladov
- [ ] Pomenovacia konvencia konzistentná
- [ ] Nakonfigurované zabezpečenie/RBAC

### Pred `azd deploy`

- [ ] Nastavené premenné prostredia
- [ ] Tajomstvá v Key Vault
- [ ] Overené reťazce pripojenia
- [ ] Nakonfigurované kontroly stavu

---

## 💰 Sprievodca výberom SKU

| Pracovná záťaž | Vývoj | Produkcia |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
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
Vylúčenie zodpovednosti:
Tento dokument bol preložený pomocou AI prekladateľskej služby Co‑op Translator (https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, berte prosím na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho originálnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre dôležité informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo mylné výklady vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->