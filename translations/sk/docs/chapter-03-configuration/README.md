# Kapitola 3: Konfigurácia a autentifikácia

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 45-60 minút | **⭐ Náročnosť**: Stredne pokročilé

---

## Prehľad

Táto kapitola pokrýva konfiguráciu prostredia, vzory overovania a najlepšie bezpečnostné praktiky pre nasadenia pomocou Azure Developer CLI.

## Učebné ciele

Po dokončení tejto kapitoly budete:
- Ovládnete hierarchiu konfigurácie AZD
- Spravovať viacero prostredí (dev, staging, prod)
- Zaviesť bezpečné overovanie pomocou spravovaných identít
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

# Prepnúť medzi prostrediami
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
4. **Argumenty príkazového riadku** (`--location eastus`)

---

## 🔐 Najlepšie bezpečnostné postupy

```bash
# Použite spravovanú identitu (odporúčané)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Skontrolujte stav overenia
azd auth whoami
az account show

# Znovu sa overte, ak je to potrebné
azd auth login
az login
```

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúce** | [Kapitola 2: Vývoj AI](../chapter-02-ai-development/README.md) |
| **Nasledujúce** | [Kapitola 4: Infrastruktúra](../chapter-04-infrastructure/README.md) |

---

## 📖 Súvisiace zdroje

- [Kontroly pred nasadením](../chapter-06-pre-deployment/README.md)
- [Riešenie problémov](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vyhlásenie o vylúčení zodpovednosti:

Tento dokument bol preložený pomocou služby strojového prekladu založenej na umelej inteligencii Co-op Translator (https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by sa mal považovať za rozhodujúci (autoritatívny) zdroj. Pre kritické informácie odporúčame profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia ani nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->