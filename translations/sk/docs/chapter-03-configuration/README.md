# Chapter 3: Konfigurácia a autentifikácia

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 45-60 minút | **⭐ Náročnosť**: Stredne pokročilý

---

## Prehľad

Táto kapitola pokrýva konfiguráciu prostredia, vzory autentifikácie a najlepšie bezpečnostné postupy pre nasadenia pomocou Azure Developer CLI.

> Overené s `azd 1.23.12` v marci 2026.

## Ciele učenia

Po dokončení tejto kapitoly budete vedieť:
- Ovládať hierarchiu konfigurácie AZD
- Spravovať viaceré prostredia (dev, staging, prod)
- Implementovať bezpečnú autentifikáciu s managed identities
- Konfigurovať nastavenia špecifické pre prostredie

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Sprievodca konfiguráciou](configuration.md) | Nastavenie a správa prostredia | 30 min |
| 2 | [Autentifikácia a bezpečnosť](authsecurity.md) | Vzory managed identity a RBAC | 30 min |

---

## 🚀 Rýchly štart

```bash
# Vytvoriť viaceré prostredia
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

AZD aplikuje nastavenia v tomto poradí (neskoršie prepíše skoršie):

1. **Predvolené hodnoty** (vstavané v šablónach)
2. **azure.yaml** (konfigurácia projektu)
3. **Premenné prostredia** (`azd env set`)
4. **Príkazové argumenty** (`--location eastus`)

---

## 🔐 Najlepšie bezpečnostné postupy

```bash
# Použite spravovanú identitu (odporúčané)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Skontrolujte stav autentifikácie AZD
azd auth status

# Voliteľné: overte kontext Azure CLI, ak plánujete spustiť príkazy az
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
| **Nasledujúca** | [Kapitola 4: Infrastruktúra](../chapter-04-infrastructure/README.md) |

---

## 📖 Susedné zdroje

- [Kontroly pred nasadením](../chapter-06-pre-deployment/README.md)
- [Riešenie problémov](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Upozornenie**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre dôležité informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne výklady vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->