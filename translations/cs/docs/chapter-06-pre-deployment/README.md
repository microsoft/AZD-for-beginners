# Kapitola 6: Plánování a validace před nasazením

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 1 hodina | **⭐ Složitost**: Střední

---

## Přehled

Tato kapitola pokrývá nezbytné kroky plánování a ověřování před nasazením vaší aplikace. Naučíte se vyhnout se nákladným chybám pomocí správného plánování kapacit, výběru SKU a předběžných kontrol.

> Ověřeno na `azd 1.25.6` v červnu 2026.

## Výukové cíle

Po dokončení této kapitoly budete:
- Provádět předběžné kontroly před nasazením
- Plánovat kapacity a odhadovat požadavky na zdroje
- Vybrat vhodné SKU pro optimalizaci nákladů
- Konfigurovat Application Insights pro monitorování
- Pochopit vzory koordinace týmu

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Předběžné kontroly](preflight-checks.md) | Ověřit konfiguraci před nasazením | 15 min |
| 2 | [Plánování kapacity](capacity-planning.md) | Odhadnout požadavky na zdroje | 20 min |
| 3 | [Výběr SKU](sku-selection.md) | Vybrat vhodné cenové úrovně | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurovat monitorování | 20 min |
| 5 | [Koordinační vzory](coordination-patterns.md) | Pracovní postupy týmu při nasazení | 15 min |

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

- [ ] Kvóty ověřeny pro region
- [ ] Vybrány vhodné SKU
- [ ] Odhad nákladů zkontrolován
- [ ] Konvence pojmenování konzistentní
- [ ] Zabezpečení/RBAC nakonfigurováno

### Před `azd deploy`

- [ ] Proměnné prostředí nastaveny
- [ ] Tajné údaje v Key Vault
- [ ] Řetězce připojení ověřeny
- [ ] Kontroly stavu nakonfigurovány

---

## 💰 Průvodce výběrem SKU

| Pracovní zátěž | Vývoj | Produkce |
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
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->