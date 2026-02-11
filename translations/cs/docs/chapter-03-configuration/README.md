# Kapitola 3: Konfigurace & Autentizace

**📚 Kurz**: [AZD For Beginners](../../README.md) | **⏱️ Doba trvání**: 45-60 minut | **⭐ Složitost**: Středně pokročilá

---

## Přehled

Tato kapitola pokrývá konfiguraci prostředí, vzory ověřování a nejlepší bezpečnostní postupy pro nasazení pomocí Azure Developer CLI.

## Cíle učení

Po dokončení této kapitoly budete:
- Osvojit si hierarchii konfigurace AZD
- Spravovat více prostředí (dev, staging, prod)
- Implementovat bezpečné ověřování pomocí spravovaných identit
- Konfigurovat nastavení specifická pro prostředí

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Průvodce konfigurací](configuration.md) | Nastavení a správa prostředí | 30 min |
| 2 | [Autentizace & zabezpečení](authsecurity.md) | Vzorové postupy pro spravované identity a RBAC | 30 min |

---

## 🚀 Rychlý start

```bash
# Vytvořit více prostředí
azd env new dev
azd env new staging
azd env new prod

# Přepnout prostředí
azd env select prod

# Nastavit proměnné prostředí
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Zobrazit konfiguraci
azd env get-values
```

---

## 🔧 Hierarchie konfigurace

AZD uplatňuje nastavení v tomto pořadí (pozdější přepíše dřívější):

1. **Výchozí hodnoty** (vestavěné v šablonách)
2. **azure.yaml** (konfigurace projektu)
3. **Proměnné prostředí** (`azd env set`)
4. **Příznaky příkazového řádku** (`--location eastus`)

---

## 🔐 Nejlepší bezpečnostní postupy

```bash
# Použijte spravovanou identitu (doporučeno)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Zkontrolujte stav ověření
azd auth whoami
az account show

# Znovu se ověřte, pokud je to nutné
azd auth login
az login
```

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Předchozí** | [Kapitola 2: Vývoj AI](../chapter-02-ai-development/README.md) |
| **Další** | [Kapitola 4: Infrastruktura](../chapter-04-infrastructure/README.md) |

---

## 📖 Související zdroje

- [Kontroly před nasazením](../chapter-06-pre-deployment/README.md)
- [Řešení problémů](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí AI překladatelské služby Co-op Translator (https://github.com/Azure/co-op-translator). Ačkoli usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v originálním znění by měl být považován za rozhodující zdroj. Pro zásadní informace doporučujeme využít profesionální lidský překlad. Nejsme odpovědní za případná nedorozumění nebo chybné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->