# Kapitola 3: Konfigurace a autentizace

**📚 Kurz**: [AZD Pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 45-60 minut | **⭐ Náročnost**: Středně pokročilý

---

## Přehled

Tato kapitola pokrývá konfiguraci prostředí, vzory autentizace a nejlepší bezpečnostní postupy pro nasazení pomocí Azure Developer CLI.

> Ověřeno s `azd 1.23.12` v březnu 2026.

## Cíle učení

Po dokončení této kapitoly budete umět:
- Ovládat hierarchii konfigurace AZD
- Spravovat více prostředí (vývoj, testovací, produkční)
- Implementovat zabezpečenou autentizaci s řízenými identitami
- Konfigurovat nastavení specifická pro dané prostředí

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Průvodce konfigurací](configuration.md) | Nastavení a správa prostředí | 30 min |
| 2 | [Autentizace a bezpečnost](authsecurity.md) | Vzory řízených identit a RBAC | 30 min |

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

AZD aplikuje nastavení v tomto pořadí (pozdější přepíše dřívější):

1. **Výchozí hodnoty** (vestavěné v šablonách)
2. **azure.yaml** (konfigurace projektu)
3. **Proměnné prostředí** (`azd env set`)
4. **Přepínače příkazového řádku** (`--location eastus`)

---

## 🔐 Nejlepší bezpečnostní postupy

```bash
# Použijte spravovanou identitu (doporučeno)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Zkontrolujte stav autentizace AZD
azd auth status

# Volitelné: ověřte kontext Azure CLI, pokud plánujete spustit příkazy az
az account show

# Znovu se autentizujte, pokud je to potřeba
azd auth login

# Volitelné: obnovte autentizaci Azure CLI pro příkazy az
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
**Prohlášení o vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí služby AI překladu [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->