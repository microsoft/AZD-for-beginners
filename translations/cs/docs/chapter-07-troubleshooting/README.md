# Kapitola 7: Řešení potíží a ladění chyb

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 1-1,5 hodiny | **⭐ Složitost**: Střední

---

## Přehled

Tato kapitola vám pomůže diagnostikovat a vyřešit běžné problémy při práci s Azure Developer CLI. Od selhání nasazení až po problémy specifické pro AI.

> Ověřeno s `azd 1.23.12` v březnu 2026.

## Výukové cíle

Dokončením této kapitoly budete umět:
- Diagnostikovat běžná selhání nasazení AZD
- Ladit problémy s autentizací a oprávněními
- Řešit problémy s připojením AI služeb
- Používat Azure Portal a CLI pro řešení potíží

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Běžné problémy](common-issues.md) | Často se vyskytující problémy | 30 min |
| 2 | [Průvodce laděním](debugging.md) | Krok za krokem strategie ladění | 45 min |
| 3 | [Řešení potíží AI](ai-troubleshooting.md) | Problémy specifické pro AI | 30 min |

---

## 🚨 Rychlá oprava

### Problémy s autentizací
```bash
# Požadováno pro AZD pracovní postupy
azd auth login

# Volitelné, pokud používáte přímo také příkazy Azure CLI
az login

azd auth status
```

### Selhání při poskytování prostředků
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Konflikty prostředků
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
|-------|---------|---------|
| `AuthenticationError` | Nejsou přihlášeni | `azd auth login` |
| `ResourceNotFound` | Chybějící prostředek | Zkontrolujte názvy prostředků |
| `QuotaExceeded` | Limity předplatného | Požádejte o zvýšení kvóty |
| `InvalidTemplate` | Chyba syntaxe Bicep | `az bicep build` |
| `Conflict` | Prostředek již existuje | Použijte nový název nebo odstraňte |
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
| **Předchozí** | [Kapitola 6: Předešlé nasazení](../chapter-06-pre-deployment/README.md) |
| **Další** | [Kapitola 8: Produkce](../chapter-08-production/README.md) |

---

## 📖 Související zdroje

- [Kontroly před nasazením](../chapter-06-pre-deployment/preflight-checks.md)
- [Průvodce konfigurací](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:  
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->