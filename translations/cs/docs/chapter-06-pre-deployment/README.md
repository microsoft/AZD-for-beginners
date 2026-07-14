# Kapitola 6: Plánování a ověřování před nasazením

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Délka**: 1 hodina | **⭐ Složitost**: Středně pokročilý

---

## Přehled

Tato kapitola pokrývá zásadní kroky plánování a ověřování před nasazením vaší aplikace. Naučte se vyhnout nákladným chybám správným plánováním kapacity, výběrem SKU a kontrolami před nasazením.

> Ověřeno proti `azd 1.27.1` v červenci 2026.

## Cíle učení

Po dokončení této kapitoly budete:
- Provádět kontroly před nasazením
- Plánovat kapacitu a odhadovat požadavky na prostředky
- Vybrat vhodné SKU pro optimalizaci nákladů
- Konfigurovat Application Insights pro monitorování
- Rozumět vzorům koordinace v týmu

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Kontroly před nasazením](preflight-checks.md) | Ověření konfigurace před nasazením | 15 min |
| 2 | [Plánování kapacity](capacity-planning.md) | Odhad požadavků na prostředky | 20 min |
| 3 | [Výběr SKU](sku-selection.md) | Výběr vhodných cenových úrovní | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurace monitorování | 20 min |
| 5 | [Vzor koordinace](coordination-patterns.md) | Pracovní postupy nasazení týmu | 15 min |

---

## 🚀 Rychlý start

```bash
# Zkontrolovat limity předplatného
az vm list-usage --location eastus --output table

# Náhled nasazení (žádné zdroje nejsou vytvořeny)
azd provision --preview

# Ověřit syntaxi Bicep
az bicep build --file infra/main.bicep

# Zkontrolovat konfiguraci prostředí
azd env get-values
```

---

## ☑️ Kontrolní seznam před nasazením

### Před `azd provision`

- [ ] Kvóta ověřena pro daný region
- [ ] Vhodný výběr SKU
- [ ] Přehled odhadu nákladů
- [ ] Konzistentní pojmenování
- [ ] Nastavení zabezpečení/RBAC

### Před `azd deploy`

- [ ] Nastavené proměnné prostředí
- [ ] Tajemství v Key Vault
- [ ] Ověřené připojovací řetězce
- [ ] Konfigurované kontrolní sondy stavu

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
| **Předchozí** | [Kapitola 5: Více agentů](../chapter-05-multi-agent/README.md) |
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