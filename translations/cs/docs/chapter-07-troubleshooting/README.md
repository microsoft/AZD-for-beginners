# Kapitola 7: Odstraňování problémů a ladění

**📚 Kurz**: [AZD For Beginners](../../README.md) | **⏱️ Doba trvání**: 1-1.5 hodiny | **⭐ Složitost**: Středně pokročilá

---

## Přehled

Tato kapitola vám pomůže diagnostikovat a vyřešit běžné problémy při práci s Azure Developer CLI. Od selhání nasazení až po problémy specifické pro AI.

> Ověřeno s `azd 1.25.6` v červnu 2026.

## Výukové cíle

Po dokončení této kapitoly budete umět:
- Diagnostikovat běžné chyby nasazení AZD
- Ladit problémy s autentizací a oprávněními
- Řešit problémy s konektivitou AI služeb
- Používat Azure Portal a CLI pro odstraňování problémů

---

## 📚 Lekce

| # | Lekce | Popis | Doba |
|---|--------|-------------|------|
| 1 | [Běžné problémy](common-issues.md) | Často se vyskytující problémy | 30 min |
| 2 | [Průvodce laděním](debugging.md) | Strategie ladění krok za krokem | 45 min |
| 3 | [Řešení problémů s AI](ai-troubleshooting.md) | Problémy specifické pro AI | 30 min |

---

## 🚨 Rychlá řešení

### Problémy s autentizací
```bash
# Vyžadováno pro pracovní postupy AZD
azd auth login

# Volitelné, pokud také přímo používáte příkazy Azure CLI
az login

azd auth status
```

### Selhání zřizování
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Konflikty zdrojů
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Překročení kvóty
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Přehled chybových kódů

| Chyba | Příčina | Řešení |
|-------|-------|----------|
| `AuthenticationError` | Nejste přihlášeni | `azd auth login` |
| `ResourceNotFound` | Chybějící zdroj | Zkontrolujte názvy zdrojů |
| `QuotaExceeded` | Limity předplatného | Požádejte o zvýšení kvóty |
| `InvalidTemplate` | Chyba syntaxe Bicep | `az bicep build` |
| `Conflict` | Zdroj existuje | Použijte jiný název nebo odstraňte zdroj |
| `Forbidden` | Nedostatečná oprávnění | Zkontrolujte role RBAC |

---

## 🔄 Reset a obnova

```bash
# Měkký reset (ponechat zdroje, znovu nasadit kód)
azd deploy --force

# Tvrdý reset (smazat vše, začít znovu)
azd down --force --purge
azd up
```

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Předchozí** | [Kapitola 6: Před nasazením](../chapter-06-pre-deployment/README.md) |
| **Další** | [Kapitola 8: Produkční](../chapter-08-production/README.md) |

---

## 📖 Související zdroje

- [Kontroly před nasazením](../chapter-06-pre-deployment/preflight-checks.md)
- [Příručka konfigurace](../chapter-03-configuration/configuration.md)
- [Problémy AZD na GitHubu](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->