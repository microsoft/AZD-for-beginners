# Kapitola 4: Infrastruktúra ako kód a nasadenie

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Dĺžka**: 2-3 hodiny čítania; pridajte extra čas na nasadzovacie cvičenia | **⭐ Zložitosť**: Stredne pokročilý

---

## Prehľad

Táto kapitola pokrýva vzory Infrastruktúry ako kódu (IaC) s Bicep šablónami, provisionovanie zdrojov a stratégie nasadenia pomocou Azure Developer CLI.

> Cieľ revízie príkazov a konfigurácie: `azd 1.37.2` (november 2026). Pri revízii sa neuskutočnilo živé provisionovanie Azure.

## Výučbové ciele

Po dokončení tejto kapitoly budete:
- Rozumieť štruktúre a syntaxe Bicep šablón
- Provisionovať Azure zdroje pomocou `azd provision`
- Nasadzovať aplikácie pomocou `azd deploy`
- Implementovať modré-zelené a postupné stratégie nasadenia

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Provisionovanie zdrojov](provisioning.md) | Správa Azure zdrojov pomocou AZD | 45 min |
| 2 | [Sprievodca nasadením](deployment-guide.md) | Stratégie nasadenia aplikácií | 45 min |
| 3 | [Písanie vlastnej šablóny](custom-templates.md) | Vytvárajte a publikujte znovupoužiteľné azd šablóny | 30 min |

---

## 🚀 Rýchly štart

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
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
| `azd deploy` | Nasadiť aplikačný kód |
| `azd up` | provisioning + nasadenie |
| `azd down` | Vymazať všetky zdroje |

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 3: Konfigurácia](../chapter-03-configuration/README.md) |
| **Ďalšia** | [Kapitola 5: Multiónové riešenia](../chapter-05-multi-agent/README.md) |

---

## 📖 Súvisiace zdroje

- [Kontroly pred nasadením](../chapter-06-pre-deployment/README.md)
- [Príklady Container App](../../examples/container-app/README.md)
- [Príklad databázovej aplikácie](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->