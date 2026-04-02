# Kapitola 4: Infraštruktúra ako Kód & Nasadenie

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 1-1,5 hodiny | **⭐ Zložitosť**: Stredne pokročilý

---

## Prehľad

Táto kapitola pokrýva vzory Infraštruktúry ako Kódu (IaC) s Bicep šablónami, provisioning zdrojov a stratégie nasadenia pomocou Azure Developer CLI.

> Overené na `azd 1.23.12` v marci 2026.

## Ciele učenia

Dokončením tejto kapitoly budete:
- Rozumieť štruktúre a syntaxu Bicep šablón
- Provisionovať Azure zdroje pomocou `azd provision`
- Nasadzovať aplikácie pomocou `azd deploy`
- Implementovať stratégie nasadenia blue-green a rolling

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|--------|------|
| 1 | [Provisionovanie zdrojov](provisioning.md) | Správa Azure zdrojov s AZD | 45 min |
| 2 | [Sprievodca nasadením](deployment-guide.md) | Stratégie nasadenia aplikácií | 45 min |

---

## 🚀 Rýchly štart

```bash
# Inicializovať z šablóny
azd init --template azure-functions-python-v2-http

# Zobraziť náhľad toho, čo bude vytvorené
azd provision --preview

# Nasadiť iba infraštruktúru
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
| `azd init` | Inicializovať projekt |
| `azd provision` | Vytvoriť Azure zdroje |
| `azd deploy` | Nasadiť kód aplikácie |
| `azd up` | provision + deploy |
| `azd down` | Odstrániť všetky zdroje |

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 3: Konfigurácia](../chapter-03-configuration/README.md) |
| **Ďalšia** | [Kapitola 5: Multi-agentové riešenia](../chapter-05-multi-agent/README.md) |

---

## 📖 Súvisiace zdroje

- [Kontroly pred nasadením](../chapter-06-pre-deployment/README.md)
- [Príklady Container App](../../examples/container-app/README.md)
- [Príklad databázovej aplikácie](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, berte prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Za akékoľvek nedorozumenia alebo nesprávne výklady vyplývajúce z použitia tohto prekladu nenesieme zodpovednosť.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->