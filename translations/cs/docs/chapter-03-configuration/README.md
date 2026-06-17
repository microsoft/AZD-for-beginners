# Kapitola 3: Konfigurace a autentizace

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 45–60 minut | **⭐ Složitost**: Střední

---

## Přehled

Tato kapitola pokrývá konfiguraci prostředí, vzory autentizace a nejlepší postupy zabezpečení pro nasazení pomocí Azure Developer CLI.

> Ověřeno proti `azd 1.25.6` v červnu 2026.

## Cíle

Po dokončení této kapitoly budete:
- Ovládnout hierarchii konfigurace AZD
- Spravovat více prostředí (dev, staging, prod)
- Implementovat bezpečnou autentizaci pomocí spravovaných identit
- Konfigurovat nastavení specifické pro prostředí

---

## 📚 Lekce

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Průvodce konfigurací](configuration.md) | Nastavení a správa prostředí | 30 min |
| 2 | [Autentizace a zabezpečení](authsecurity.md) | Vzory spravovaných identit a RBAC | 30 min |

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

1. **Výchozí hodnoty** (vestavěné do šablon)
2. **azure.yaml** (konfigurace projektu)
3. **Proměnné prostředí** (`azd env set`)
4. **Příznaky příkazového řádku** (`--location eastus`)

---

## 🔐 Nejlepší postupy zabezpečení

```bash
# Použijte spravovanou identitu (doporučeno)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Zkontrolujte stav ověření AZD
azd auth status

# Volitelné: ověřte kontext Azure CLI, pokud plánujete spouštět příkazy az
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
| **Následující** | [Kapitola 4: Infrastruktura](../chapter-04-infrastructure/README.md) |

---

## 📖 Související zdroje

- [Kontroly před nasazením](../chapter-06-pre-deployment/README.md)
- [Řešení problémů](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->