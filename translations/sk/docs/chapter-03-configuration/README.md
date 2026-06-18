# Chapter 3: Configuration & Authentication

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 45-60 minút | **⭐ Náročnosť**: Stredne pokročilá

---

## Prehľad

Táto kapitola pokrýva konfiguráciu prostredia, vzory overovania a najlepšie bezpečnostné postupy pri nasadení pomocou Azure Developer CLI.

> Overené voči `azd 1.25.6` v júni 2026.

## Ciele učenia

Po dokončení tejto kapitoly budete:
- Zvládnuť hierarchiu konfigurácie AZD
- Spravovať viacero prostredí (dev, staging, prod)
- Implementovať bezpečné overovanie s riadenými identitami
- Konfigurovať nastavenia špecifické pre prostredie

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Sprievodca konfiguráciou](configuration.md) | Nastavenie a správa prostredia | 30 min |
| 2 | [Overovanie a bezpečnosť](authsecurity.md) | Vzory spravovaných identít a RBAC | 30 min |

---

## 🚀 Rýchly štart

```bash
# Vytvoriť viacero prostredí
azd env new dev
azd env new staging
azd env new prod

# Prepnúť prostredia
azd env select prod

# Nastaviť premenné prostredia
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Zobraziť konfiguráciu
azd env get-values
```

---

## 🔧 Hierarchia konfigurácie

AZD uplatňuje nastavenia v tomto poradí (neskoršie prepisuje skoršie):

1. **Predvolené hodnoty** (zabudované v šablónach)
2. **azure.yaml** (konfigurácia projektu)
3. **Premenné prostredia** (`azd env set`)
4. **Prepínače príkazového riadku** (`--location eastus`)

---

## 🔐 Najlepšie bezpečnostné postupy

```bash
# Použite spravovanú identitu (odporúčané)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Skontrolujte stav autentifikácie AZD
azd auth status

# Voliteľné: overte kontext Azure CLI, ak plánujete spúšťať príkazy az
az account show

# Znovu sa autentifikujte, ak je to potrebné
azd auth login

# Voliteľné: obnovte autentifikáciu Azure CLI pre príkazy az
az login
```

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 2: Vývoj AI](../chapter-02-ai-development/README.md) |
| **Ďalšia** | [Kapitola 4: Infrastruktúra](../chapter-04-infrastructure/README.md) |

---

## 📖 Súvisiace zdroje

- [Kontroly pred nasadením](../chapter-06-pre-deployment/README.md)
- [Riešenie problémov](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->