# Kapitola 1: Základy a Rýchly štart

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 75-120 minút vrátane prvého nasadenia; doplnkové cvičenia trvajú dlhšie | **⭐ Zložitosť**: Začiatočník

---

## Prehľad

Táto kapitola predstavuje základy Azure Developer CLI (azd). Naučíte sa kľúčové koncepty, nainštalujete nástroje a nasadíte svoju prvú aplikáciu do Azure.

> Cieľ revízie príkazov a konfigurácie: `azd 1.37.2` (november 2026). Pri revízii nebolo spustené živé nasadenie v Azure.

## Ciele učenia

Po dokončení tejto kapitoly budete:
- Rozumieť, čo je Azure Developer CLI a ako sa líši od Azure CLI
- Nainštalovať a nakonfigurovať AZD na vašej platforme
- Nasadiť svoju prvú aplikáciu do Azure pomocou `azd up`
- Odstrániť zdroje pomocou `azd down`

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Základy AZD](azd-basics.md) | Kľúčové koncepty, terminológia a štruktúra projektu | 15 min |
| 2 | [Inštalácia a nastavenie](installation.md) | Návody na inštaláciu podľa platformy | 10 min |
| 3 | [Váš prvý projekt](first-project.md) | Prakticky: Nasadenie webovej aplikácie do Azure | 20 min |
| 4 | [Použite vlastnú aplikáciu](bring-your-own-app.md) | Pridajte azd do existujúceho projektu, ktorý už máte | 15 min |
| 5 | [Vývojové kontajnery a Codespaces](dev-containers.md) | Reprodukovateľné prostredia azd s vývojovými kontajnermi | 15 min |

---

## ✅ Začnite tu: Overte svoje prostredie

Pred začiatkom si overte, či je váš lokálny počítač pripravený pre šablónu Kapitoly 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ak skript hlási chýbajúce nástroje, najskôr ich opravte a potom pokračujte v kapitole.

---

## 🚀 Rýchly štart

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Kritériá úspechu

Po dokončení tejto kapitoly by ste mali vedieť:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Ďalšia** | [Kapitola 2: Vývoj so zameraním na AI](../chapter-02-ai-development/README.md) |
| **Preskočiť na** | [Kapitola 3: Konfigurácia](../chapter-03-configuration/README.md) |

---

## 📖 Súvisiace zdroje

- [Skript príkazov](../../resources/cheat-sheet.md)
- [Často kladené otázky](../../resources/faq.md)
- [Glosár](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->