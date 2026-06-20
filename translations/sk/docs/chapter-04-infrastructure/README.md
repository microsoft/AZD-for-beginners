# Kapitola 4: Infrastruktúra ako kód a nasadenie

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 1-1,5 hodiny | **⭐ Zložitosť**: Stredná

---

## Prehľad

Táto kapitola pokrýva vzory Infrastructure as Code (IaC) so šablónami Bicep, provisioning zdrojov a stratégie nasadenia pomocou Azure Developer CLI.

> Overené s `azd 1.25.6` v júni 2026.

## Výukové ciele

Po dokončení tejto kapitoly budete:
- Pochopiť štruktúru a syntax šablón Bicep
- Vytvoriť Azure zdroje pomocou `azd provision`
- Nasadiť aplikácie pomocou `azd deploy`
- Implementovať blue-green a rolling stratégie nasadenia

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------|------|
| 1 | [Provisionovanie zdrojov](provisioning.md) | Správa Azure zdrojov pomocou AZD | 45 min |
| 2 | [Sprievodca nasadením](deployment-guide.md) | Stratégie nasadenia aplikácií | 45 min |
| 3 | [Tvorba vlastnej šablóny](custom-templates.md) | Vytvárajte a publikujte znovupoužiteľné azd šablóny | 30 min |

---

## 🚀 Rýchly štart

```bash
# Inicializovať z šablóny
azd init --template azure-functions-python-v2-http

# Náhľad toho, čo bude vytvorené
azd provision --preview

# Iba nasadiť infraštruktúru
azd provision

# Iba nasadiť kód
azd deploy

# Alebo oboje súčasne
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
|--------|-------|
| `azd init` | Inicializovať projekt |
| `azd provision` | Vytvoriť Azure zdroje |
| `azd deploy` | Nasadiť kód aplikácie |
| `azd up` | vytvorenie + nasadenie |
| `azd down` | Odstrániť všetky zdroje |

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 3: Konfigurácia](../chapter-03-configuration/README.md) |
| **Ďalšia** | [Kapitola 5: Riešenia s viacerými agentmi](../chapter-05-multi-agent/README.md) |

---

## 📖 Súvisiace zdroje

- [Kontroly pred nasadením](../chapter-06-pre-deployment/README.md)
- [Príklady aplikácií v kontajneroch](../../examples/container-app/README.md)
- [Príklad databázovej aplikácie](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->