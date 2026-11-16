# Kapitola 7: Riešenie problémov a ladenie

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Dĺžka**: 1-1,5 hodiny | **⭐ Zložitosť**: Stredná

---

## Prehľad

Táto kapitola vám pomôže diagnostikovať a vyriešiť bežné problémy pri práci s Azure Developer CLI. Od zlyhaní nasadenia až po problémy špecifické pre AI.

> Návod na príkazy overený voči vydanému referenčnému `azd 1.37.2`. Nasadenia do cloudu neboli vykonané. Pred použitím príkazov nahraďte príkladové názvy zdrojov a ID.

## Ciele učenia

Po dokončení tejto kapitoly budete:
- Diagnostikovať bežné zlyhania nasadenia AZD
- Ladiť problémy s overovaním a povoleniami
- Riešiť problémy s konektivitou služieb AI
- Používať Azure Portal a CLI na riešenie problémov

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Bežné problémy](common-issues.md) | Často sa vyskytujúce problémy | 30 min |
| 2 | [Sprievodca ladením](debugging.md) | Postupné stratégie ladenia | 45 min |
| 3 | [Riešenie problémov AI](ai-troubleshooting.md) | Problémy špecifické pre AI | 30 min |

---

## 🚨 Rýchle opravy

### Problémy s overovaním
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Zlyhania pri poskytovaní
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Konflikty zdrojov
Najprv skontrolujte existujúci zdroj a chyby nasadenia. Neodstraňujte zdieľané alebo produkčné prostredie na vyriešenie konfliktu názvov. Pre **nové jednorazové prostredie** použite jedinečný názov:

```bash
azd env new different-name
azd up
```

### Prekročenie kvóty
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Zmena `AZURE_LOCATION` nepremiestni existujúce zdroje a môže spôsobiť konflikty miest na opätovnom nasadení.

---

## 📋 Referencia kódu chyby

| Chyba | Príčina | Riešenie |
|-------|-------|----------|
| `AuthenticationError` | Nie ste prihlásený | `azd auth login` |
| `ResourceNotFound` | Chýbajúci zdroj | Skontrolujte názvy zdrojov |
| `QuotaExceeded` | Limity predplatného | Požiadajte o zvýšenie kvóty |
| `InvalidTemplate` | Syntaxová chyba Bicep | `az bicep build` |
| `Conflict` | Zdroj existuje | Použite nový názov alebo odstráňte |
| `Forbidden` | Nedostatočné povolenia | Skontrolujte RBAC roly |

---

## 🔄 Reset a obnovenie

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Tvrdý reset vymaže dáta a môže zmeniť koncové body. Najskôr si zálohujte a prečítajte si interaktívne výzvy na odstránenie. `--force --purge` je vhodný iba pre jednorazové prostredia, keď je zamýšľané nevratné vymazanie.

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 6: Pred-Deployment](../chapter-06-pre-deployment/README.md) |
| **Nasledujúca** | [Kapitola 8: Produkcia](../chapter-08-production/README.md) |

---

## 📖 Súvisiace zdroje

- [Kontroly pred nasadením](../chapter-06-pre-deployment/preflight-checks.md)
- [Sprievodca konfiguráciou](../chapter-03-configuration/configuration.md)
- [Problémy AZD na GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->