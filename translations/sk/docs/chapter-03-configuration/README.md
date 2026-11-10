# Kapitola 3: Konfigurácia a autentifikácia

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Dĺžka**: 90-150 minút vrátane praktickej integrácie | **⭐ Zložitosť**: Stredne pokročilý

---

## Prehľad

Táto kapitola pokrýva konfiguráciu prostredia, vzory autentifikácie a najlepšie bezpečnostné praktiky pre nasadzovanie Azure Developer CLI.

> Cieľ kontroly príkazov a konfigurácie: `azd 1.37.2` (november 2026). Počas kontroly nebolo spustené živé provisioning v Azure.

## Ciele učenia

Po dokončení tejto kapitoly budete:
- Ovládať hierarchiu konfigurácie AZD
- Spravovať viacero prostredí (vývoj, staging, produkcia)
- Implementovať bezpečnú autentifikáciu pomocou spravovaných identít
- Nakonfigurovať nastavenia špecifické pre prostredie

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Sprievodca konfiguráciou](configuration.md) | Nastavenie a správa prostredia | 30 min |
| 2 | [Autentifikácia a bezpečnosť](authsecurity.md) | Vzory spravovanej identity a RBAC | 30 min |

---

## 🚀 Rýchly štart

Spustite z koreňa **už inicializovanej aplikácie azd**, nie z repozitára kurzu. Použite nepoužité názvy prostredí, ak už existujú.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` je ilustratívny: ovplyvňuje infraštruktúru iba v prípade, že ho váš šablóna explicitne využíva. Bežné hodnoty `azd env set` sa ukladajú lokálne v čitateľnej forme; nie sú to bezpečné úložiská tajomstiev.

---

## 🔧 Hierarchia konfigurácie

Udržujte tri rôzne konfiguračné plochy oddelené: globálne preferencie (`azd config`), štruktúru projektu (`azure.yaml`) a hodnoty pre jednotlivé prostredia (`azd env`). Vlajky prepíšu len tie nastavenia, ktoré naozaj podporujú; neexistuje univerzálne prekrytie ľubovoľných premenných prostredia nad `azure.yaml` alebo Bicep.

---

## 🔐 Najlepšie bezpečnostné praktiky

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 2: Vývoj AI](../chapter-02-ai-development/README.md) |
| **Nasledujúca** | [Kapitola 4: Infraštruktúra](../chapter-04-infrastructure/README.md) |

---

## 📖 Súvisiace zdroje

- [Kontroly pred nasadením](../chapter-06-pre-deployment/README.md)
- [Riešenie problémov](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->