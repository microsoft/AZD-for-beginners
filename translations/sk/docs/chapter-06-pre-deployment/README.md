# Kapitola 6: Plánovanie a validácia pred nasadením

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Dĺžka**: 2-4 hodiny čítania; ďalší čas na prispôsobené laboratóriá | **⭐ Náročnosť**: Stredne pokročilý–pokročilý

---

## Prehľad

Táto kapitola pokrýva základné kroky plánovania a validácie pred nasadením vašej aplikácie. Naučte sa vyhnúť nákladným chybám správnym plánovaním kapacity, výberom SKU a preletovými kontrolami.

> Pokyny k príkazom sú overené podľa vydanej referencie `azd 1.37.2`. Nasadenia v cloude neboli vykonané. Dlhšie lekcie obsahujú ilustračné fragmenty, nie kompletné lokálne projekty nasadenia.

## Ciele učenia

Po dokončení tejto kapitoly budete:
- Vykonávať preletové kontroly pred nasadením
- Plánovať kapacitu a odhadovať požiadavky na zdroje
- Vybrať vhodné SKU pre optimalizáciu nákladov
- Konfigurovať Application Insights pre monitorovanie
- Pochopiť vzory koordinácie multi-agentov a ich požiadavky na nasadenie

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Preletové kontroly](preflight-checks.md) | Overenie konfigurácie pred nasadením | 15 min |
| 2 | [Plánovanie kapacity](capacity-planning.md) | Odhad požiadaviek na zdroje | 20 min |
| 3 | [Výber SKU](sku-selection.md) | Výber vhodných cenových úrovní | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurácia monitorovania | 20 min |
| 5 | [Vzory koordinácie](coordination-patterns.md) | Pokročilý dizajn orchestrácie multi-agentov | 60-75 min |

---

## 🚀 Rýchly štart

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

## ☑️ Kontrolný zoznam pred nasadením

### Pred `azd provision`

- [ ] Overená kvóta pre región
- [ ] Vhodne vybraté SKU
- [ ] Prekontrolovaný odhad nákladov
- [ ] Konzistentné pomenovanie
- [ ] Konfigurácia zabezpečenia/RBAC

### Pred `azd deploy`

- [ ] Nastavené premenné prostredia
- [ ] Tajomstvá v Key Vault
- [ ] Overené pripojovacie reťazce
- [ ] Konfigurované zdravotné kontroly

---

## 💰 Sprievodca výberom SKU

| Zaťaženie | Vývoj | Produkcia |
|----------|-------------|------------|
| Container Apps | Spotreba | Spotreba alebo vyhradený profil zaťaženia, podľa nameraného zaťaženia |
| App Service | B1/B2 | P1v3+ |
| Modely Azure OpenAI | Podporovaný typ nasadenia pay-as-you-go | Pay-as-you-go alebo provisioned throughput; závisí od modelu/regiónu |
| AI Search | Bezplatné/Základné v rámci limitov | Základný alebo štandardný stupeň veľkosti podľa indexu, replík a zaťaženia dotazov |

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 5: Multi-agent](../chapter-05-multi-agent/README.md) |
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