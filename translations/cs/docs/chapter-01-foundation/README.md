# Kapitola 1: Základy a rychlý start

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Délka**: 30-45 minut | **⭐ Složitost**: Začátečník

---

## Přehled

Tato kapitola představuje základy Azure Developer CLI (azd). Naučíte se základní pojmy, nainstalujete nástroje a nasadíte svou první aplikaci do Azure.

> Ověřeno na `azd 1.23.12` v březnu 2026.

## Cíle učení

Po dokončení této kapitoly budete:
- Rozumět tomu, co je Azure Developer CLI a jak se liší od Azure CLI
- Nainstalovat a nakonfigurovat AZD na vaší platformě
- Nasadit svou první aplikaci do Azure pomocí `azd up`
- Vyčistit prostředky pomocí `azd down`

---

## 📚 Lekce

| # | Lekce | Popis | Doba |
|---|--------|-------------|------|
| 1 | [Základy AZD](azd-basics.md) | Základní pojmy, terminologie a struktura projektu | 15 min |
| 2 | [Instalace a nastavení](installation.md) | Platformně specifické návody k instalaci | 10 min |
| 3 | [Váš první projekt](first-project.md) | Prakticky: Nasazení webové aplikace do Azure | 20 min |

---

## ✅ Začněte zde: Ověřte své nastavení

Než začnete, ujistěte se, že váš lokální počítač je připraven pro šablonu kapitoly 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Pokud skript hlásí chybějící nástroje, nejprve je opravte a poté pokračujte v kapitole.

---

## 🚀 Rychlý start

```bash
# Zkontrolujte instalaci
azd version

# Ověřte se pro AZD
# Volitelné: az login, pokud plánujete spouštět příkazy Azure CLI přímo
azd auth login

# Nasazení vaší první aplikace
azd init --template todo-nodejs-mongo
azd up

# Vyčistěte po dokončení
azd down --force --purge
```

---

## ✅ Kritéria úspěchu

Po dokončení této kapitoly byste měli umět:

```bash
azd version              # Zobrazuje nainstalovanou verzi
azd init --template todo-nodejs-mongo  # Inicializuje projekt
azd up                   # Nasazuje na Azure
azd show                 # Zobrazuje URL běžící aplikace
azd down --force --purge # Čistí prostředky
```

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Další** | [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/README.md) |
| **Přeskočit na** | [Kapitola 3: Konfigurace](../chapter-03-configuration/README.md) |

---

## 📖 Související zdroje

- [Rychlý přehled příkazů](../../resources/cheat-sheet.md)
- [Často kladené dotazy](../../resources/faq.md)
- [Glosář](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli usilujeme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->