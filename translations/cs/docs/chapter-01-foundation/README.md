# Kapitola 1: Základy a rychlý start

**📚 Kurz**: [AZD Pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 30-45 minut | **⭐ Složitost**: Začátečník

---

## Přehled

Tato kapitola představuje základy Azure Developer CLI (azd). Naučíte se hlavní koncepty, nainstalujete nástroje a nasadíte svou první aplikaci do Azure.

> Ověřeno s `azd 1.27.1` v červenci 2026.

## Cíle učení

Po dokončení této kapitoly budete:
- Rozumět tomu, co je Azure Developer CLI a jak se liší od Azure CLI
- Nainstalovat a nakonfigurovat AZD na vaší platformě
- Nasadit svou první aplikaci do Azure pomocí `azd up`
- Vyčistit zdroje pomocí `azd down`

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Základy AZD](azd-basics.md) | Hlavní koncepty, terminologie a struktura projektu | 15 min |
| 2 | [Instalace a nastavení](installation.md) | Platformově specifické instalační průvodce | 10 min |
| 3 | [Váš první projekt](first-project.md) | Prakticky: Nasazení webové aplikace do Azure | 20 min |
| 4 | [Použijte vlastní aplikaci](bring-your-own-app.md) | Přidání azd do již existujícího projektu | 15 min |
| 5 | [Vývojové kontejnery a Codespaces](dev-containers.md) | Reprodukovatelné azd prostředí s dev kontejnery | 15 min |

---

## ✅ Začněte zde: Ověřte své nastavení

Než začnete, ujistěte se, že váš lokální počítač je připraven pro šablonu Kapitoly 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Pokud skript hlásí chybějící nástroje, nejprve je opravte a pak pokračujte v kapitole.

---

## 🚀 Rychlý start

```bash
# Zkontrolujte instalaci
azd version

# Ověřte se pro AZD
# Volitelné: az login, pokud plánujete spouštět příkazy Azure CLI přímo
azd auth login

# Nasadit svou první aplikaci
azd init --template todo-nodejs-mongo
azd up

# Vyčistěte po dokončení
azd down --force --purge
```

---

## ✅ Kritéria úspěchu

Po dokončení této kapitoly byste měli být schopni:

```bash
azd version              # Zobrazuje nainstalovanou verzi
azd init --template todo-nodejs-mongo  # Inicializuje projekt
azd up                   # Nasazuje do Azure
azd show                 # Zobrazuje URL spuštěné aplikace
azd down --force --purge # Čistí prostředky
```

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Další** | [Kapitola 2: Vývoj s AI na prvním místě](../chapter-02-ai-development/README.md) |
| **Přeskočit na** | [Kapitola 3: Konfigurace](../chapter-03-configuration/README.md) |

---

## 📖 Související zdroje

- [Přehled příkazů](../../resources/cheat-sheet.md)
- [Často kladené otázky](../../resources/faq.md)
- [Glosář](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->