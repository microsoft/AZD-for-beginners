# Kapitola 6: Plánování a ověření před nasazením

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 1 hodina | **⭐ Náročnost**: Střední

---

## Přehled

Tato kapitola pokrývá základní kroky plánování a ověření před nasazením vaší aplikace. Naučte se vyhnout nákladným chybám pomocí správného plánování kapacity, výběru SKU a předběžných kontrol.

## Výukové cíle

Po dokončení této kapitoly budete:
- Spouštět předběžné kontroly před nasazením
- Plánovat kapacitu a odhadovat požadavky na zdroje
- Vybrat vhodné SKU pro optimalizaci nákladů
- Nakonfigurovat Application Insights pro monitorování
- Pochopit vzory týmové koordinace

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Kontroly před nasazením](preflight-checks.md) | Ověřte konfiguraci před nasazením | 15 min |
| 2 | [Plánování kapacity](capacity-planning.md) | Odhadněte požadavky na zdroje | 20 min |
| 3 | [Výběr SKU](sku-selection.md) | Vyberte vhodné cenové úrovně | 15 min |
| 4 | [Application Insights](application-insights.md) | Nakonfigurujte monitorování | 20 min |
| 5 | [Vzory koordinace](coordination-patterns.md) | Pracovní postupy týmu při nasazování | 15 min |

---

## 🚀 Rychlý start

```bash
# Zkontrolujte kvóty předplatného
az vm list-usage --location eastus --output table

# Náhled nasazení (nebudou vytvořeny žádné prostředky)
azd provision --preview

# Ověřte syntaxi Bicep
az bicep build --file infra/main.bicep

# Zkontrolujte konfiguraci prostředí
azd env get-values
```

---

## ☑️ Kontrolní seznam před nasazením

### Před `azd provision`

- [ ] Kvóta ověřena pro region
- [ ] SKUs vybrány vhodně
- [ ] Odhad nákladů zkontrolován
- [ ] Konzistentní konvence pojmenování
- [ ] Bezpečnost/RBAC nakonfigurováno

### Před `azd deploy`

- [ ] Proměnné prostředí nastaveny
- [ ] Tajné hodnoty v Key Vault
- [ ] Řetězce připojení ověřeny
- [ ] Kontroly stavu nakonfigurovány

---

## 💰 Průvodce výběrem SKU

| Pracovní zátěž | Vývoj | Produkce |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
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
Prohlášení o vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí AI překladatelské služby Co-op Translator (https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za rozhodující zdroj. U kritických informací se doporučuje profesionální lidský překlad. Za případná nedorozumění nebo nesprávné výklady vyplývající z použití tohoto překladu neneseme odpovědnost.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->