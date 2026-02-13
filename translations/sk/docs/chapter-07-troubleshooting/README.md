# Kapitola 7: Riešenie problémov a ladenie

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 1–1,5 hodiny | **⭐ Zložitosť**: Stredne pokročilý

---

## Prehľad

Táto kapitola vám pomôže diagnostikovať a vyriešiť bežné problémy pri práci s Azure Developer CLI. Od zlyhaní nasadzovania až po problémy špecifické pre AI.

## Ciele učenia

Po dokončení tejto kapitoly budete vedieť:
- Diagnostikovať bežné zlyhania nasadzovania AZD
- Ladenie problémov s overovaním a povoleniami
- Riešiť problémy s konektivitou služieb AI
- Používať Azure Portal a CLI na riešenie problémov

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Bežné problémy](common-issues.md) | Často sa vyskytujúce problémy | 30 min |
| 2 | [Sprievodca ladením](debugging.md) | Krok za krokom stratégie ladenia | 45 min |
| 3 | [Riešenie problémov s AI](ai-troubleshooting.md) | Problémy špecifické pre AI | 30 min |

---

## 🚨 Rýchle opravy

### Problémy s overovaním
```bash
azd auth login
az login
azd auth whoami
```

### Zlyhania pri nasadzovaní
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Konflikty zdrojov
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Prekročená kvóta
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Referencia chybových kódov

| Chyba | Príčina | Riešenie |
|-------|-------|----------|
| `AuthenticationError` | Nie ste prihlásený | `azd auth login` |
| `ResourceNotFound` | Chýba zdroj | Skontrolujte názvy zdrojov |
| `QuotaExceeded` | Limity predplatného | Požiadajte o zvýšenie kvóty |
| `InvalidTemplate` | Chyba syntaxe Bicep | `az bicep build` |
| `Conflict` | Zdroj už existuje | Použite nový názov alebo odstráňte |
| `Forbidden` | Nedostatočné oprávnenia | Skontrolujte RBAC roly |

---

## 🔄 Reset a obnova

```bash
# Mäkký reset (ponechať zdroje, znovu nasadiť kód)
azd deploy --force

# Tvrdý reset (vymazať všetko, začať odznova)
azd down --force --purge
azd up
```

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 6: Pred nasadením](../chapter-06-pre-deployment/README.md) |
| **Nasledujúca** | [Kapitola 8: Produkcia](../chapter-08-production/README.md) |

---

## 📖 Súvisiace zdroje

- [Kontroly pred nasadením](../chapter-06-pre-deployment/preflight-checks.md)
- [Príručka konfigurácie](../chapter-03-configuration/configuration.md)
- [Problémy AZD na GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vylúčenie zodpovednosti**:
Tento dokument bol preložený pomocou služby automatického prekladu založenej na umelej inteligencii [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa usilujeme o presnosť, majte prosím na pamäti, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by sa mal považovať za rozhodujúci zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nezodpovedáme za žiadne nedorozumenia alebo nesprávne výklady vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->