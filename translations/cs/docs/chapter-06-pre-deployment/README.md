# Kapitola 6: Plánování a ověřování před nasazením

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Délka**: 2-4 hodiny čtení; další čas pro upravené laboratoře | **⭐ Složitost**: Středně pokročilý–pokročilý

---

## Přehled

Tato kapitola pokrývá nezbytné kroky plánování a ověřování před nasazením vaší aplikace. Naučte se vyhnout nákladným chybám správným plánováním kapacity, výběrem SKU a kontrolami před nasazením.

> Příkazová doporučení byla ověřena s vydanou referencí `azd 1.37.2`. Nasazení v cloudu nebyla provedena. Delší lekce obsahují ilustrační úryvky, ne kompletní lokální projekty nasazení.

## Výukové cíle

Po dokončení této kapitoly budete:
- Provádět kontroly před nasazením
- Plánovat kapacitu a odhadovat požadavky na zdroje
- Vybrat vhodné SKU pro optimalizaci nákladů
- Konfigurovat Application Insights pro monitorování
- Pochopit vzory koordinace více agentů a jejich požadavky na nasazení

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Kontroly před nasazením](preflight-checks.md) | Ověření konfigurace před nasazením | 15 min |
| 2 | [Plánování kapacity](capacity-planning.md) | Odhad požadavků na zdroje | 20 min |
| 3 | [Výběr SKU](sku-selection.md) | Výběr vhodných cenových úrovní | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurace monitorování | 20 min |
| 5 | [Vzory koordinace](coordination-patterns.md) | Pokročilý návrh orchestrace více agentů | 60-75 min |

---

## 🚀 Rychlý start

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

## ☑️ Kontrolní seznam před nasazením

### Před `azd provision`

- [ ] Ověřená kvóta pro region
- [ ] Vhodně vybrané SKU
- [ ] Přezkoumaný odhad nákladů
- [ ] Konzistentní pojmenovací konvence
- [ ] Konfigurované zabezpečení/RBAC

### Před `azd deploy`

- [ ] Nastavené proměnné prostředí
- [ ] Tajemství ve Key Vault
- [ ] Ověřené připojovací řetězce
- [ ] Konfigurované kontroly stavu

---

## 💰 Průvodce výběrem SKU

| Zátěž | Vývoj | Produkce |
|----------|-------------|------------|
| Container Apps | Spotřeba | Spotřeba nebo dedikovaný profil zátěže, na základě změřené zátěže |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI modely | Podporovaný typ nasazení pay-as-you-go | Pay-as-you-go nebo rezervovaný průchod; závislé na modelu/regionu |
| AI Search | Zdarma/Základní v rámci limitů | Základní nebo Standardní úroveň velikosti podle indexu, replik a dotazové zátěže |

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Předchozí** | [Kapitola 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Další** | [Kapitola 7: Odstraňování problémů](../chapter-07-troubleshooting/README.md) |

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