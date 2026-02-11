# Kapitola 7: Odstraňování problémů a ladění

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 1-1.5 hours | **⭐ Složitost**: Střední

---

## Přehled

Tato kapitola vám pomůže diagnostikovat a vyřešit běžné problémy při práci s Azure Developer CLI. Od selhání nasazení až po problémy specifické pro AI.

## Cíle učení

Po dokončení této kapitoly budete:
- Diagnostikovat běžné selhání nasazení AZD
- Ladit problémy s ověřováním a oprávněními
- Řešit problémy s připojením AI služeb
- Používat Azure Portal a CLI pro odstraňování problémů

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Běžné problémy](common-issues.md) | Často se vyskytující problémy | 30 min |
| 2 | [Průvodce laděním](debugging.md) | Krok za krokem strategie ladění | 45 min |
| 3 | [Řešení problémů s AI](ai-troubleshooting.md) | Problémy specifické pro AI | 30 min |

---

## 🚨 Rychlá řešení

### Problémy s ověřováním
```bash
azd auth login
az login
azd auth whoami
```

### Selhání při zřizování
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

### Kvóta překročena
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Referenční tabulka chybových kódů

| Chyba | Příčina | Řešení |
|-------|-------|----------|
| `AuthenticationError` | Nepřihlášeno | `azd auth login` |
| `ResourceNotFound` | Chybějící prostředek | Zkontrolujte názvy prostředků |
| `QuotaExceeded` | Omezení předplatného | Požádejte o navýšení kvóty |
| `InvalidTemplate` | Chyba syntaxe Bicep | `az bicep build` |
| `Conflict` | Prostředek existuje | Použijte nový název nebo odstraňte |
| `Forbidden` | Nedostatečná oprávnění | Zkontrolujte role RBAC |

---

## 🔄 Reset a obnova

```bash
# Měkký reset (ponechat prostředky, znovu nasadit kód)
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
| **Další** | [Kapitola 8: Produkce](../chapter-08-production/README.md) |

---

## 📖 Související zdroje

- [Kontroly před nasazením](../chapter-06-pre-deployment/preflight-checks.md)
- [Průvodce konfigurací](../chapter-03-configuration/configuration.md)
- [Problémy AZD na GitHubu](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Prohlášení o vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí překladatelské služby umělé inteligence Co-op Translator (https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Nejsme odpovědni za jakákoli nedorozumění nebo chybné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->