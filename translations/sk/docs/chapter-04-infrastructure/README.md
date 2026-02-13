# Kapitola 4: Infrastruktúra ako kód a nasadenie

**📚 Kurz**: [AZD For Beginners](../../README.md) | **⏱️ Trvanie**: 1–1,5 hodiny | **⭐ Zložitosť**: Stredná

---

## Prehľad

Táto kapitola pokrýva vzory Infrastruktúry ako kód (IaC) s Bicep šablónami, poskytovanie zdrojov a stratégie nasadenia pomocou Azure Developer CLI.

## Ciele učenia

Po absolvovaní tejto kapitoly budete:
- Pochopiť štruktúru a syntax Bicep šablón
- Zabezpečiť Azure zdroje pomocou `azd provision`
- Nasadiť aplikácie pomocou `azd deploy`
- Implementovať stratégie nasadenia blue-green a postupného (rolling) nasadenia

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | Správa Azure zdrojov pomocou AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | Stratégie nasadenia aplikácií | 45 min |

---

## 🚀 Rýchly štart

```bash
# Inicializovať z šablóny
azd init --template azure-functions-python-v2-http

# Náhľad toho, čo bude vytvorené
azd provision --preview

# Iba zriadiť infraštruktúru
azd provision

# Iba nasadiť kód
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
| `azd up` | poskytovanie + nasadenie |
| `azd down` | Odstrániť všetky zdroje |

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 3: Konfigurácia](../chapter-03-configuration/README.md) |
| **Nasledujúca** | [Kapitola 5: Riešenia s viacerými agentmi](../chapter-05-multi-agent/README.md) |

---

## 📖 Súvisiace zdroje

- [Kontroly pred nasadením](../chapter-06-pre-deployment/README.md)
- [Príklady aplikácií v kontajneroch](../../examples/container-app/README.md)
- [Príklad databázovej aplikácie](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Upozornenie:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite, prosím, na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho originálnom jazyku by sa mal považovať za autoritatívny zdroj. Pre kritické informácie odporúčame profesionálny ľudský preklad. Nepreberáme zodpovednosť za žiadne nedorozumenia ani nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->