# Chapter 7: Riešenie problémov a ladenie

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 1-1.5 hodiny | **⭐ Náročnosť**: Stredná

---

## Prehľad

Táto kapitola vám pomôže diagnostikovať a vyriešiť bežné problémy pri práci s Azure Developer CLI. Od zlyhaní nasadenia až po špecifické problémy s AI.

> Overené proti `azd 1.23.12` v marci 2026.

## Ciele učenia

Po dokončení tejto kapitoly budete:
- Diagnostikovať bežné zlyhania nasadenia AZD
- Ladiť problémy s autentifikáciou a oprávneniami
- Riešiť problémy s konektivitou služieb AI
- Používať Azure Portal a CLI na riešenie problémov

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Bežné problémy](common-issues.md) | Často sa vyskytujúce problémy | 30 min |
| 2 | [Sprievodca ladením](debugging.md) | Stratégie krok za krokom | 45 min |
| 3 | [Riešenie problémov AI](ai-troubleshooting.md) | Problémy špecifické pre AI | 30 min |

---

## 🚨 Rýchle opravy

### Problémy s autentifikáciou
```bash
# Vyžaduje sa pre pracovné postupy AZD
azd auth login

# Nepovinné, ak používate aj príkazy Azure CLI priamo
az login

azd auth status
```

### Zlyhania pri poskytovaní zdrojov
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

### Prekročenie kvóty
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Referencia kódov chýb

| Chyba | Príčina | Riešenie |
|-------|---------|----------|
| `AuthenticationError` | Nie ste prihlásený | `azd auth login` |
| `ResourceNotFound` | Chýbajúci zdroj | Skontrolujte názvy zdrojov |
| `QuotaExceeded` | Limity predplatného | Požiadajte o zvýšenie kvóty |
| `InvalidTemplate` | Syntaktická chyba Bicep | `az bicep build` |
| `Conflict` | Zdroj existuje | Použite nový názov alebo vymažte |
| `Forbidden` | Nedostatočné oprávnenia | Skontrolujte RBAC role |

---

## 🔄 Resetovanie a obnova

```bash
# Mäkký reset (zachovať zdroje, znovu nasadiť kód)
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
- [Sprievodca konfiguráciou](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Upozornenie**:  
Tento dokument bol preložený pomocou AI prekladovej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, buďte prosím upozornení, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->