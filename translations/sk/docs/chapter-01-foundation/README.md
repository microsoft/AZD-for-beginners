# Kapitola 1: Základy a Rýchly štart

**📚 Kurz**: [AZD pre Začiatočníkov](../../README.md) | **⏱️ Trvanie**: 30-45 minút | **⭐ Zložitosť**: Začiatočník

---

## Prehľad

Táto kapitola predstavuje základy Azure Developer CLI (azd). Naučíte sa základné koncepty, nainštalujete nástroje a nasadíte svoju prvú aplikáciu do Azure.

> Overené s `azd 1.27.1` v júli 2026.

## Ciele učenia

Po dokončení tejto kapitoly budete:
- Rozumieť, čo je Azure Developer CLI a ako sa líši od Azure CLI
- Nainštalovať a nakonfigurovať AZD na vašej platforme
- Nasadiť svoju prvú aplikáciu do Azure pomocou `azd up`
- Vyčistiť zdroje pomocou `azd down`

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Základy AZD](azd-basics.md) | Základné koncepty, terminológia a štruktúra projektu | 15 min |
| 2 | [Inštalácia a nastavenie](installation.md) | Platformovo špecifické návody na inštaláciu | 10 min |
| 3 | [Váš prvý projekt](first-project.md) | Prakticky: Nasadenie webovej aplikácie do Azure | 20 min |
| 4 | [Použite svoju vlastnú aplikáciu](bring-your-own-app.md) | Pridajte azd do existujúceho projektu, ktorý už máte | 15 min |
| 5 | [Vývojové kontajnery a Codespaces](dev-containers.md) | Reprodukovateľné prostredia azd s vývojovými kontajnermi | 15 min |

---

## ✅ Začnite tu: Overte svoju konfiguráciu

Pred začiatkom si overte, že je váš lokálny počítač pripravený pre šablónu Kapitoly 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ak skript hlási chýbajúce nástroje, najprv ich opravte a potom pokračujte v kapitole.

---

## 🚀 Rýchly štart

```bash
# Skontrolujte inštaláciu
azd version

# Overte sa pre AZD
# Voliteľné: az login, ak plánujete priamo spúšťať príkazy Azure CLI
azd auth login

# Nasadzujte svoju prvú aplikáciu
azd init --template todo-nodejs-mongo
azd up

# Vyčistite po dokončení
azd down --force --purge
```

---

## ✅ Kritériá úspechu

Po dokončení tejto kapitoly by ste mali vedieť:

```bash
azd version              # Zobrazuje nainštalovanú verziu
azd init --template todo-nodejs-mongo  # Inicializuje projekt
azd up                   # Nasadzuje do Azure
azd show                 # Zobrazuje URL bežiacej aplikácie
azd down --force --purge # Čistí zdroje
```

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Ďalšia** | [Kapitola 2: Vývoj so zameraním na AI](../chapter-02-ai-development/README.md) |
| **Preskočiť na** | [Kapitola 3: Konfigurácia](../chapter-03-configuration/README.md) |

---

## 📖 Súvisiace zdroje

- [Prehľad príkazov](../../resources/cheat-sheet.md)
- [Často kladené otázky](../../resources/faq.md)
- [Glosár](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->