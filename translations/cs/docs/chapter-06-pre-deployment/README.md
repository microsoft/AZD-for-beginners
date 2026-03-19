# Kapitola 6: Plánování a ověřování před nasazením

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 1 hodina | **⭐ Složitost**: Středně pokročilý

---

## Přehled

Tato kapitola pokrývá základní kroky plánování a ověřování před nasazením vaší aplikace. Naučíte se vyhnout drahým chybám díky správnému plánování kapacity, výběru SKU a předběžným kontrolám.

## Cíle učení

Po dokončení této kapitoly budete:
- Spustit předběžné kontroly před nasazením
- Plánovat kapacitu a odhadnout požadavky na zdroje
- Vybrat vhodné SKU pro optimalizaci nákladů
- Nakonfigurovat Application Insights pro monitorování
- Pochopit vzory koordinace týmu

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Předběžné kontroly](preflight-checks.md) | Ověřit konfiguraci před nasazením | 15 min |
| 2 | [Plánování kapacity](capacity-planning.md) | Odhadnout požadavky na zdroje | 20 min |
| 3 | [Výběr SKU](sku-selection.md) | Vybrat vhodné cenové hladiny | 15 min |
| 4 | [Application Insights](application-insights.md) | Nastavit monitorování | 20 min |
| 5 | [Vzory koordinace](coordination-patterns.md) | Týmové pracovní postupy nasazení | 15 min |

---

## 🚀 Rychlý start

```bash
# Zkontrolovat kvóty předplatného
az vm list-usage --location eastus --output table

# Náhled nasazení (nebudou vytvořeny žádné prostředky)
azd provision --preview

# Ověřit syntaxi Bicep
az bicep build --file infra/main.bicep

# Zkontrolovat konfiguraci prostředí
azd env get-values
```

---

## ☑️ Kontrolní seznam před nasazením

### Před `azd provision`

- [ ] Kvóta ověřena pro region
- [ ] SKUs vybrány vhodně
- [ ] Odhad nákladů zkontrolován
- [ ] Konvence pojmenování konzistentní
- [ ] Bezpečnost/RBAC nakonfigurována

### Před `azd deploy`

- [ ] Proměnné prostředí nastaveny
- [ ] Tajná data v Key Vault
- [ ] Řetězce připojení ověřeny
- [ ] Kontroly stavu nakonfigurovány

---

## 💰 Průvodce výběrem SKU

| Zatížení | Vývoj | Produkce |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Předchozí** | [Kapitola 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Další** | [Kapitola 7: Řešení problémů](../chapter-07-troubleshooting/README.md) |

---

## 📖 Související zdroje

- [Průvodce konfigurací](../chapter-03-configuration/configuration.md)
- [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md)
- [Běžné problémy](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tento dokument byl přeložen pomocí služby AI překladu [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za závazný zdroj. Pro kritické informace se doporučuje využít profesionální lidský překlad. Nejsme odpovědní za žádná nedorozumění nebo mylné výklady vzniklé v důsledku použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->