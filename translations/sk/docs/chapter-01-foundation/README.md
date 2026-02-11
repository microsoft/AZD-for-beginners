# Kapitola 1: Základy a rýchly štart

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Dĺžka**: 30-45 minút | **⭐ Zložitosť**: Začiatočník

---

## Prehľad

Táto kapitola predstavuje základy Azure Developer CLI (azd). Naučíte sa základné koncepty, nainštalujete nástroje a nasadíte svoju prvú aplikáciu do Azure.

## Ciele učenia

Po dokončení tejto kapitoly budete:
- Pochopiť, čo je Azure Developer CLI a ako sa líši od Azure CLI
- Nainštalovať a nakonfigurovať AZD na vašej platforme
- Nasadiť svoju prvú aplikáciu do Azure pomocou `azd up`
- Vyčistiť zdroje pomocou `azd down`

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Základy AZD](azd-basics.md) | Základné koncepty, terminológia a štruktúra projektu | 15 min |
| 2 | [Inštalácia a nastavenie](installation.md) | Platformovo špecifické inštalačné návody | 10 min |
| 3 | [Váš prvý projekt](first-project.md) | Praktická časť: Nasadenie webovej aplikácie do Azure | 20 min |

---

## 🚀 Rýchly štart

```bash
# Skontrolovať inštaláciu
azd version

# Prihlásiť sa do Azure
azd auth login

# Nasadiť svoju prvú aplikáciu
azd init --template todo-nodejs-mongo
azd up

# Vyčistiť po dokončení
azd down --force --purge
```

---

## ✅ Kritériá úspechu

Po dokončení tejto kapitoly by ste mali byť schopní:

```bash
azd version              # Zobrazuje nainštalovanú verziu
azd init --template todo-nodejs-mongo  # Inicializuje projekt
azd up                   # Nasadzuje do Azure
azd show                 # Zobrazuje URL bežiacej aplikácie
azd down --force --purge # Odstraňuje prostriedky
```

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Ďalej** | [Kapitola 2: Vývoj zameraný na AI](../chapter-02-ai-development/README.md) |
| **Preskočiť na** | [Kapitola 3: Konfigurácia](../chapter-03-configuration/README.md) |

---

## 📖 Súvisiace zdroje

- [Prehľad príkazov](../../resources/cheat-sheet.md)
- [Často kladené otázky (FAQ)](../../resources/faq.md)
- [Slovník](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vyhlásenie o vylúčení zodpovednosti:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, majte prosím na pamäti, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho originálnom jazyku by sa mal považovať za rozhodujúci zdroj. Pre dôležité informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne výklady vzniknuté použitím tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->