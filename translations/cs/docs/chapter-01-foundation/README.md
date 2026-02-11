# Kapitola 1: Základy a rychlý start

**📚 Kurz**: [AZD For Beginners](../../README.md) | **⏱️ Doba trvání**: 30-45 minut | **⭐ Složitost**: Začátečník

---

## Přehled

Tato kapitola představuje základy Azure Developer CLI (azd). Naučíte se hlavní koncepty, nainstalujete nástroje a nasadíte svoji první aplikaci do Azure.

## Cíle učení

Po dokončení této kapitoly budete:
- Rozumět tomu, co je Azure Developer CLI a jak se liší od Azure CLI
- Nainstalovat a nakonfigurovat AZD na vaší platformě
- Nasadit svou první aplikaci do Azure pomocí `azd up`
- Odstranit prostředky pomocí `azd down`

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Základy AZD](azd-basics.md) | Základní koncepty, terminologie a struktura projektu | 15 min |
| 2 | [Instalace a nastavení](installation.md) | Návody k instalaci pro konkrétní platformy | 10 min |
| 3 | [Váš první projekt](first-project.md) | Prakticky: Nasazení webové aplikace do Azure | 20 min |

---

## 🚀 Rychlý start

```bash
# Zkontrolujte instalaci
azd version

# Přihlaste se k Azure
azd auth login

# Nasazení vaší první aplikace
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
azd up                   # Nasadí do Azure
azd show                 # Zobrazuje URL spuštěné aplikace
azd down --force --purge # Odstraňuje prostředky
```

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Další** | [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/README.md) |
| **Přejít na** | [Kapitola 3: Konfigurace](../chapter-03-configuration/README.md) |

---

## 📖 Související zdroje

- [Přehled příkazů](../../resources/cheat-sheet.md)
- [Často kladené otázky](../../resources/faq.md)
- [Glosář](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za závazné znění. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakákoli nedorozumění nebo chybné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->