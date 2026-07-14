# Kapitola 4: Infrastructure as Code & Nasadenie

**📚 Kurz**: [AZD Pre Začiatočníkov](../../README.md) | **⏱️ Trvanie**: 1-1.5 hodiny | **⭐ Zložitosť**: Stredná

---

## Prehľad

Táto kapitola pokrýva vzory Infrastructure as Code (IaC) s Bicep šablónami, provisioning zdrojov a stratégie nasadenia pomocou Azure Developer CLI.

> Overené na `azd 1.27.1` v júli 2026.

## Učebné ciele

Po dokončení tejto kapitoly budete:
- Rozumieť štruktúre a syntaxe Bicep šablón
- Provisionovať Azure zdroje s `azd provision`
- Nasadzovať aplikácie s `azd deploy`
- Implementovať blue-green a rolling stratégie nasadenia

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Provisionovanie zdrojov](provisioning.md) | Správa Azure zdrojov pomocou AZD | 45 min |
| 2 | [Sprievodca nasadením](deployment-guide.md) | Stratégie nasadenia aplikácií | 45 min |
| 3 | [Vytvorenie vlastnej šablóny](custom-templates.md) | Tvorba a publikovanie znovupoužiteľných azd šablón | 30 min |

---

## 🚀 Rýchly štart

```bash
# Inicializovať z šablóny
azd init --template azure-functions-python-v2-http

# Náhľad toho, čo bude vytvorené
azd provision --preview

# Zaviesť iba infraštruktúru
azd provision

# Nasadiť iba kód
azd deploy

# Alebo oboje spolu
azd up
```

---

## 📁 Štruktúra projektu AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Základné príkazy

| Príkaz | Popis |
|---------|-------------|
| `azd init` | Inicializácia projektu |
| `azd provision` | Vytvorenie Azure zdrojov |
| `azd deploy` | Nasadenie aplikačného kódu |
| `azd up` | provision + nasadenie |
| `azd down` | Odstránenie všetkých zdrojov |

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 3: Konfigurácia](../chapter-03-configuration/README.md) |
| **Nasledujúca** | [Kapitola 5: Multi-agentné riešenia](../chapter-05-multi-agent/README.md) |

---

## 📖 Súvisiace zdroje

- [Pre-nasadenie kontroly](../chapter-06-pre-deployment/README.md)
- [Príklady Container App](../../examples/container-app/README.md)
- [Príklad databázovej aplikácie](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->