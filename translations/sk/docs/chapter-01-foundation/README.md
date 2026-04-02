# Chapter 1: Základy & Rýchly štart

**📚 Kurz**: [AZD Pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 30-45 minút | **⭐ Náročnosť**: Začiatočník

---

## Prehľad

Táto kapitola predstavuje základy Azure Developer CLI (azd). Naučíte sa základné pojmy, nainštalujete nástroje a nasadíte svoju prvú aplikáciu do Azure.

> Overené na `azd 1.23.12` v marci 2026.

## Ciele učenia

Po dokončení tejto kapitoly budete:
- Rozumieť, čo je Azure Developer CLI a ako sa líši od Azure CLI
- Nainštalovať a nakonfigurovať AZD na vašej platforme
- Nasadiť svoju prvú aplikáciu do Azure pomocou `azd up`
- Vyčistiť zdroje pomocou `azd down`

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|--------|------|
| 1 | [Základy AZD](azd-basics.md) | Základné pojmy, terminológia a štruktúra projektu | 15 min |
| 2 | [Inštalácia & Nastavenie](installation.md) | Platformovo špecifické návody na inštaláciu | 10 min |
| 3 | [Váš prvý projekt](first-project.md) | Prakticky: Nasadenie webovej aplikácie do Azure | 20 min |

---

## ✅ Začnite tu: Overenie nastavenia

Pred začatím si overte, či je váš lokálny stroj pripravený na šablónu Kapitoly 1:

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
# Skontrolovať inštaláciu
azd version

# Overiť autentifikáciu pre AZD
# Voliteľné: az login, ak plánujete spúšťať priamo príkazy Azure CLI
azd auth login

# Nasadiť svoju prvú aplikáciu
azd init --template todo-nodejs-mongo
azd up

# Vyčistiť po dokončení
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
|-------|----------|
| **Ďalej** | [Kapitola 2: AI-First Development](../chapter-02-ai-development/README.md) |
| **Preskočiť na** | [Kapitola 3: Konfigurácia](../chapter-03-configuration/README.md) |

---

## 📖 Súvisiace zdroje

- [Přehľad príkazov](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glosár](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, prosím, majte na pamäti, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nezodpovedáme za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->