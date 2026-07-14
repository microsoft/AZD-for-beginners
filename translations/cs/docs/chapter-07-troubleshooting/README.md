# Kapitola 7: Řešení problémů a ladění

**📚 Kurz**: [AZD Pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 1-1,5 hodiny | **⭐ Složitost**: Středně pokročilý

---

## Přehled

Tato kapitola vám pomůže diagnostikovat a vyřešit běžné problémy při práci s Azure Developer CLI. Od neúspěšných nasazení až po problémy specifické pro AI.

> Ověřeno s `azd 1.27.1` v červenci 2026.

## Výukové cíle

Po dokončení této kapitoly budete umět:
- Diagnostikovat běžné chyby nasazení AZD
- Ladit problémy s ověřováním a oprávněními
- Řešit problémy s konektivitou služeb AI
- Používat Azure Portal a CLI pro řešení problémů

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Běžné problémy](common-issues.md) | Často se vyskytující problémy | 30 min |
| 2 | [Průvodce laděním](debugging.md) | Postupy ladění krok za krokem | 45 min |
| 3 | [Řešení problémů AI](ai-troubleshooting.md) | Problémy specifické pro AI | 30 min |

---

## 🚨 Rychlé opravy

### Problémy s ověřováním
```bash
# Požadováno pro pracovní postupy AZD
azd auth login

# Volitelné, pokud také přímo používáte příkazy Azure CLI
az login

azd auth status
```

### Selhání nasazení
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

### Překročený limit kvóty
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Referenční seznam chybových kódů

| Chyba | Příčina | Řešení |
|-------|-------|----------|
| `AuthenticationError` | Nejsou přihlášeni | `azd auth login` |
| `ResourceNotFound` | Chybějící zdroj | Zkontrolujte názvy zdrojů |
| `QuotaExceeded` | Omezení předplatného | Požádejte o navýšení kvóty |
| `InvalidTemplate` | Chyba syntaxe Bicep | `az bicep build` |
| `Conflict` | Zdroj již existuje | Použijte nový název nebo vymažte existující |
| `Forbidden` | Nedostatečná oprávnění | Zkontrolujte role RBAC |

---

## 🔄 Resetování a zotavení

```bash
# Měkký reset (ponechat zdroje, znovu nasadit kód)
azd deploy --force

# Tvrdý reset (smazat vše, začít od začátku)
azd down --force --purge
azd up
```

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Předchozí** | [Kapitola 6: Předsazení](../chapter-06-pre-deployment/README.md) |
| **Další** | [Kapitola 8: Produkce](../chapter-08-production/README.md) |

---

## 📖 Související zdroje

- [Předsazení - kontroly](../chapter-06-pre-deployment/preflight-checks.md)
- [Průvodce konfigurací](../chapter-03-configuration/configuration.md)
- [AZD GitHub problémy](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->