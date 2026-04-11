# Kapitola 6: Plánování a ověřování před nasazením

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 1 hodina | **⭐ Složitost**: Středně pokročilý

---

## Přehled

Tato kapitola pokrývá základní kroky plánování a ověřování před nasazením vaší aplikace. Naučte se, jak se vyhnout nákladným chybám pomocí správného plánování kapacity, výběru SKU a předběžných kontrol.

> Ověřeno s `azd 1.23.12` v březnu 2026.

## Výukové cíle

Po dokončení této kapitoly budete:
- Provádět předběžné kontroly před nasazením
- Plánovat kapacitu a odhadovat potřeby zdrojů
- Vybrat vhodné SKU pro optimalizaci nákladů
- Konfigurovat Application Insights pro monitorování
- Pochopit vzory koordinace týmu

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Předběžné kontroly](preflight-checks.md) | Ověření konfigurace před nasazením | 15 min |
| 2 | [Plánování kapacity](capacity-planning.md) | Odhad potřebných zdrojů | 20 min |
| 3 | [Výběr SKU](sku-selection.md) | Výběr vhodných cenových úrovní | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurace monitorování | 20 min |
| 5 | [Koordinační vzory](coordination-patterns.md) | Pracovní postupy týmu při nasazení | 15 min |

---

## 🚀 Rychlý start

```bash
# Zkontrolujte kvóty odběru
az vm list-usage --location eastus --output table

# Náhled nasazení (nejsou vytvořeny žádné zdroje)
azd provision --preview

# Ověřte syntaxi Bicep
az bicep build --file infra/main.bicep

# Zkontrolujte konfiguraci prostředí
azd env get-values
```

---

## ☑️ Kontrolní seznam před nasazením

### Před `azd provision`

- [ ] Ověřena kvóta pro oblast
- [ ] Vhodně vybrané SKU
- [ ] Přehodnocen nákladový odhad
- [ ] Konzistentní pojmenovací konvence
- [ ] Konfigurace zabezpečení/RBAC

### Před `azd deploy`

- [ ] Nastavené proměnné prostředí
- [ ] Tajemství v Key Vault
- [ ] Ověřené připojovací řetězce
- [ ] Nastaveny kontroly stavu

---

## 💰 Průvodce výběrem SKU

| Zátěž | Vývoj | Produkce |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Předchozí** | [Kapitola 5: Multi-agent](../chapter-05-multi-agent/README.md) |
| **Další** | [Kapitola 7: Odstraňování problémů](../chapter-07-troubleshooting/README.md) |

---

## 📖 Související zdroje

- [Průvodce konfigurací](../chapter-03-configuration/configuration.md)
- [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md)
- [Běžné problémy](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:  
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte, prosím, na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za závazný zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neneseme odpovědnost za jakékoliv nedorozumění nebo mylné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->