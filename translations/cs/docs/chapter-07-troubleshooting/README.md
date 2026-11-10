# Kapitola 7: Řešení problémů a ladění

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 1-1,5 hodiny | **⭐ Složitost**: Středně pokročilý

---

## Přehled

Tato kapitola vám pomůže diagnostikovat a vyřešit běžné problémy při práci s Azure Developer CLI. Od neúspěšných nasazení až po specifické problémy s AI.

> Příkazy byly ověřeny podle vydané reference `azd 1.37.2`. Nasazení do cloudu nebyla provedena. Před použitím příkazů nahraďte příkladové názvy a ID zdrojů.

## Vzdělávací cíle

Po dokončení této kapitoly budete umět:
- Diagnostikovat běžné chyby nasazení v AZD
- Ladit problémy s autentizací a oprávněními
- Vyřešit problémy s konektivitou AI služeb
- Používat Azure Portal a CLI k řešení problémů

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Běžné problémy](common-issues.md) | Často se vyskytující problémy | 30 min |
| 2 | [Průvodce laděním](debugging.md) | Postupné ladící strategie | 45 min |
| 3 | [Řešení problémů s AI](ai-troubleshooting.md) | Problémy specifické pro AI | 30 min |

---

## 🚨 Rychlé opravy

### Problémy s autentizací
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Neúspěšné vytváření
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Konflikty zdrojů
Nejprve zkontrolujte existující zdroj a chyby při nasazení. Neukládejte sdílené nebo produkční prostředí kvůli vyřešení konfliktu názvů. Pro **nové jednorázové prostředí** použijte unikátní název:

```bash
azd env new different-name
azd up
```

### Překročená kvóta
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Změna `AZURE_LOCATION` nepřesune existující zdroje a může způsobit konflikty umístění při opětovném nasazení.

---

## 📋 Referenční kódy chyb

| Chyba | Příčina | Řešení |
|-------|-------|----------|
| `AuthenticationError` | Neprihlášen | `azd auth login` |
| `ResourceNotFound` | Chybějící zdroj | Zkontrolujte názvy zdrojů |
| `QuotaExceeded` | Limit předplatného | Požádejte o navýšení kvóty |
| `InvalidTemplate` | Chyba syntaxe Bicep | `az bicep build` |
| `Conflict` | Zdroj již existuje | Použijte nový název nebo odstraňte |
| `Forbidden` | Nedostatečná oprávnění | Zkontrolujte RBAC role |

---

## 🔄 Reset a obnovení

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Tvrdý reset smaže data a může změnit koncové body. Nejprve si vytvořte zálohu a přečtěte si interaktivní výzvy při mazání. `--force --purge` je vhodné pouze pro jednorázová prostředí, kdy je zamýšleno nevratné odstranění.

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Předchozí** | [Kapitola 6: Před nasazením](../chapter-06-pre-deployment/README.md) |
| **Další** | [Kapitola 8: Produkce](../chapter-08-production/README.md) |

---

## 📖 Související zdroje

- [Kontroly před nasazením](../chapter-06-pre-deployment/preflight-checks.md)
- [Průvodce konfigurací](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->